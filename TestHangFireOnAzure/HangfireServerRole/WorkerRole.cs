using Hangfire;
using Hangfire.Mongo;
using Microsoft.WindowsAzure.ServiceRuntime;
using System;
using System.Configuration;
using System.Diagnostics;
using System.Net;
using System.Threading;
using System.Threading.Tasks;

namespace HangfireServerRole
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly CancellationTokenSource _cancellationTokenSource = new CancellationTokenSource();
        private readonly ManualResetEvent _runCompleteEvent = new ManualResetEvent(false);
        private BackgroundJobServer _server;

        public override void Run()
        {
            Trace.TraceInformation("HangfireServerRole is running");

            try
            {
                this.RunAsync(this._cancellationTokenSource.Token).Wait();
            }
            finally
            {
                this._runCompleteEvent.Set();
            }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections
            ServicePointManager.DefaultConnectionLimit = 12;

            // For information on handling configuration changes
            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.

            var result = base.OnStart();

            var hangFireConnectionString = ConfigurationManager.ConnectionStrings["Hangfire.MongoDB"].ConnectionString;
            var hangFiredatabase = ConfigurationManager.AppSettings["Hangfire.MongoDb.DatabaseName"];
            GlobalConfiguration.Configuration.UseMongoStorage(hangFireConnectionString, hangFiredatabase);

            _server = new BackgroundJobServer();

            // Injecting service dependencies.

            Trace.TraceInformation("HangfireServerRole has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("HangfireServerRole is stopping");

            this._cancellationTokenSource.Cancel();
            this._runCompleteEvent.WaitOne();
            _server.Dispose();

            base.OnStop();

            Trace.TraceInformation("HangfireServerRole has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            while (!cancellationToken.IsCancellationRequested)
            {
                Trace.TraceInformation("Working");
                //await Task.Delay(1000, cancellationToken);

                RecurringJob.AddOrUpdate(() => Console.WriteLine($"Process ran successfulle at {DateTime.Now}"), Cron.Minutely, queue: "critical");
            }
        }
    }
}