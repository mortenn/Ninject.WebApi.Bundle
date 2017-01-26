using System;
using System.Web.Http;

namespace $rootnamespace$.WebApi.Controllers
{
	public class ExampleService : ApiController
	{
		public DateTime Get() { return DateTime.Now; }
	}
}
