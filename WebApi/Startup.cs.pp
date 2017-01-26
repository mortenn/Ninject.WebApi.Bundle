using System.Web.Http;
using Ninject.Web.Common.OwinHost;
using Ninject.Web.WebApi.OwinHost;
using Owin;

namespace $rootnamespace$.WebApi
{
	public class Startup
	{
		public void Configuration(IAppBuilder app)
		{
			HttpConfiguration config = new HttpConfiguration();
			config.MapHttpAttributeRoutes();
			config.Routes.MapHttpRoute("Example API", "api/{controller}");

			app.UseNinjectMiddleware(your_kernel_here);
			app.UseNinjectWebApi(config);
		}
	}
}
