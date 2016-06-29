using Microsoft.Owin.Hosting;
using Microsoft.WindowsAzure.ServiceRuntime;
using System;
using System.Diagnostics;
using System.Net;
using System.Threading;

namespace HangfireDashboardRole
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly ManualResetEvent _runCompleteEvent = new ManualResetEvent(false);
        private IDisposable _app = null;

        public override void Run()
        {
            Trace.TraceInformation("HangfireDashboardRole is running");

            try
            {
                while (true)
                {
                    Thread.Sleep(10000);
                    Trace.TraceInformation("Working");
                }
            }
            finally
            {
                this._runCompleteEvent.Set();
            }
        }

        public override bool OnStart()
        {
            ServicePointManager.DefaultConnectionLimit = 12;

            // New code:
            var endpoint = RoleEnvironment.CurrentRoleInstance.InstanceEndpoints["Endpoint1"];
            string baseUri = $"{endpoint.Protocol}://{endpoint.IPEndpoint}";

            Trace.TraceInformation($"Starting HangfireDashboardRole at {baseUri}", "Information");
            _app = WebApp.Start<StartUp>(new StartOptions(url: baseUri));
            return base.OnStart();
        }

        public override void OnStop()
        {
            Trace.TraceInformation("HangfireDashboardRole is stopping");

            _app?.Dispose();
            base.OnStop();

            Trace.TraceInformation("HangfireDashboardRole has stopped");
        }
    }
}