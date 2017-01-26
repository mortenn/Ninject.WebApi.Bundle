#Ninject WebApi Bundle 
This is a simple nuget package to quickly get all the random bits you need in order to successfully self-host a WebApi in any process.

## Usage
Once installed, this package will create a project folder `WebApi`, containing a Startup for WebApp, an example service, and a short readme.

## Deploying with an application
If you are bundling a WebApi with an application that will run unprivileged, such as a windows service, you may need to modify windows acl.
Should you build an MSI using Windows Installer XML, you can use the these fragments kindly provided by Geoff.
[http://geoffwebbercross.blogspot.no/2011/08/wix-3-netsh-customaction.html]

```XML
<Wix>
	<Fragment>
		<CustomAction
			Id="ListenerServiceAddReservation"
			Directory="INSTALLLOCATION"
			ExeCommand="[SystemFolder]netsh.exe http add urlacl url=http://+:8888/ServiceNamespace/TestService/ sddl=D:(A;;GX;;;WD)"
			Return="asyncWait" />

		<CustomAction
			Id="ListenerServiceDeleteReservation"
			Directory="INSTALLLOCATION"
			ExeCommand="[SystemFolder]netsh.exe http delete urlacl url=http://+:8888/ ServiceNamespace/TestService/"
			Return="asyncWait" />
  
		<InstallExecuteSequence>       
			<Custom Action="ListenerServiceDeleteReservation" Before="InstallFinalize">Installed</Custom>
			<Custom Action="ListenerServiceAddReservation" Before="InstallFinalize">NOT Installed</Custom>
		</InstallExecuteSequence>
	</Fragment>
</Wix>
```

## License
Ninject is intended to be used in both open-source and commercial environments. To allow its use in as many
situations as possible, Ninject is dual-licensed. You may choose to use Ninject under either the Apache License,
Version 2.0, or the Microsoft Public License (Ms-PL). These licenses are essentially identical, but you are
encouraged to evaluate both to determine which best fits your intended use.

This bundle is released under the same terms as Ninject.