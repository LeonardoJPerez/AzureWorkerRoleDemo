using Hangfire;
using Hangfire.Mongo;
using Owin;
using System.Configuration;
using Microsoft.WindowsAzure.ServiceRuntime;

namespace HangfireDashboardRole
{
    internal class StartUp
    {
        public void Configuration(IAppBuilder app)
        {
            // Change `Back to site` link URL
            var endpoint = RoleEnvironment.CurrentRoleInstance.InstanceEndpoints["Endpoint1"];
            string baseUri = $"{endpoint.Protocol}://{endpoint.IPEndpoint}";
            var options = new DashboardOptions { AppPath = baseUri };

            var hangFireConnectionString = ConfigurationManager.ConnectionStrings["Hangfire.MongoDB"].ConnectionString;
            var hangFiredatabase = ConfigurationManager.AppSettings["Hangfire.MongoDb.DatabaseName"];

            var mongoStorage = new MongoStorage(hangFireConnectionString, hangFiredatabase);
            app.UseHangfireDashboard("/hangfire", options, mongoStorage);
        }
    }
}