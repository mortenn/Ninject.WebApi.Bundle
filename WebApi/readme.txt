Please change Startup.cs to fit your application, then call WebApp.Start to launch the API.
Some code of this nature would do the trick;

WebApp.Start<WepApi.Startup>("http://+:8080");

Please note that you will have to pull the kernel into Startup some way if you want to use ninject in the API.

This can be done by storing the kernel as a static field on your application entrypoint.