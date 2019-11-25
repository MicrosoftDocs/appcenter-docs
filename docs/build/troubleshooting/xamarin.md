---
title: App Center Build Frequently Asked Questions
description: Code signing apps built with App Center
keywords: build, faq
author: siminapasat
ms.author: siminap
ms.date: 08/08/2018
ms.topic: article
ms.assetid: 7365bb27-d7c1-4fe1-91b4-346359c705ea
ms.service: vs-appcenter
ms.custom: build
---


# Xamarin

## <a name="solution-file"/>My Xamarin.iOS builds build from solution file (.sln) instead of project file (.csproj)

When your Xamarin.iOS builds run from solution file (.sln), there are several things you might want to check. 

You should ensure Android and UWP projects are disabled in your code for build configurations that are intended for iOS builds. Go into the solution's configuration mappings, and for all mappings that target iPhone and iPhoneSimulator, uncheck all the projects that target different platforms. This will ensure when the .sln begins building, it will not attempt to build other projects. 

## <a name="fail-signing"/>My Xamarin.iOS builds fail claiming I need to provide signing information
If your Xamarin.iOS builds are set up without signing but if build process requires you to provide signing information, it is probably because you have selected Sign builds: Off in the App Center branch configuration and your build log contains 

```Javascript
RequireProvisioningProfile: True. 
```
It means that your project itself is configured for signing and will try to apply signing despite the App Center configuration. 

To fix it, open Project Options > Build > iOS Bundle Signing in your IDE and make sure that your project configuration (e.g., Debug|iPhoneSimulator) does not contain any signing information other than Automatic.

## <a name="build-scripts"/>Configuring Build scripts

You can add up to three custom build steps that run at pre-defined stages during build time. 

To configure build scripts, place the scripts with the respective format next to the project-level (.xcodeproj, build.gradle, .csproj, .sln or package.json) file that you've selected in the build configuration and we will run them as custom build steps. For iOS and Android apps, we support Bash scripts, for UWP apps we support PowerShell scripts.

Once you do this, the pre and post build jobs are located on the App Center portal, and here are the steps to find it:

1. Navigate to https://appcenter.ms
2. Navigate to your app
3. On the left hand panel, click onBuild
4. Hover your mouse over your branch you’d like to configure, on the extreme right hand corner of the row, click on the gear icon
5. Under the header Build app, click on More options
6. Under Build scripts, you will see the scripts 
 

## <a name="no-apk"/>My Xamarin.Android build failed with **Error: No APK files found**. What can be done?

One common reason for a build failing during **Xamarin Android Postprocess** task can be an incorrect value in the `<OutputPath>` property in Xamarin.Android project file. To check it, go to **YourXamarin.Android > Project Options > Build > Output** and verify that for your build configuration (Debug/Release) it points to the default location. Usually, it should be `YourProjectDir/bin/$(Configuration)`.

## <a name="signing-info-failed"/>I set up my Xamarin.iOS app branch to build without signing but my build failed claiming I need to provide the signing information, why is that?

If you selected **Sign builds: Off** in the App Center branch configuration and your build log contains `RequireProvisioningProfile: True`, it means that your project itself is configured for signing and will try to apply signing despite the App Center configuration. To fix it open **Project Options > Build > iOS Bundle Signing** in your IDE and make sure that your project configuration (e.g., **Debug|iPhoneSimulator**) does not contain any signing information other than **Automatic**.

![Disable signing for Debug configuration in Xamarin.iOS application](~/build/images/xamarin-ios-empty-codesigning.png "Disable signing for Debug configuration in Xamarin.iOS application")

[xamarin-ios-empty-codesigning]: images/xamarin-ios-empty-codesigning.png "Disable signing for Debug configuration in Xamarin.iOS application"

## <a name="sim-fails"/>My Xamarin.iOS simulator build fails to install into iOS Simulator with **Failed to chmod ... /Appname.iOS.app/Appname.iOS : No such file or directory** error. How do I fix that?

When you create Xamarin.iOS project in Visual Studio the default configuration for iPhoneSimulator has **i386 + x86_64** supported architectures. The **.app** file that builds from such configuration will fail to upload into a simulator. Open **Project Options > Build > iOS Build** and for iPhoneSimulator configuration change **Supported architectures** to just **i386** or **x86\_64**.

![Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application](~/build/images/xamarin-ios-iphonesimulator-supported-architecture.png "Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application")

[xamarin-ios-iphonesimulator-supported-architecture]: images/xamarin-ios-iphonesimulator-supported-architecture.png "Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application"

## <a name="task-fails"/>My Xamarin build fails with error MSB4018: The "WriteRestoreGraphTask" task failed unexpectedly. What can be done?

Looks like your solution contains PCL or older .NET Standard projects together with newer .NET Standard projects. That means they may contain both `PackageTargetFallback` and `AssetTargetFallback` references in .csproj files. Your build logs will also contain messages like this:

```NA
error MSB4018: NuGet.Commands.RestoreCommandException: PackageTargetFallback and AssetTargetFallback cannot be used together. Remove PackageTargetFallback(deprecated) references from the project environment.
```

To resolve this issue, either remove PackageTargetFallback (tends to be in older PCL .csproj files) or rename it to AssetTargetFallback? The solution is also described in [this StackOverflow thread](https://stackoverflow.com/questions/45569378/upgrading-to-net-core-2-0-packagetargetfallback-and-assettargetfallback-cannot).

## <a name="nuget-missing"/>My Xamarin build fails with error: This project references NuGet package(s) that are missing on this computer. What can be done?

Looks like not all packages were restored to build your application. Your build logs will also contain messages like these:

```NA
warning MSB3245: Could not resolve this reference. Could not locate the assembly "ASSEMBLY_NAME". Check to make sure the assembly exists on disk. If this reference is required by your code, you may get compilation errors.
error CS0246: The type or namespace name 'TYPE_OR_NAMESPACE_NAME' could not be found (are you missing a using directive or an assembly reference?)
```

To resolve this issue you can use [pre-build script](https://docs.microsoft.com/appcenter/build/custom/scripts/#pre-build) `appcenter-pre-build.sh` with the following script which will restore all packages for each solution in your repository:

```bash
#!/bin/bash
find $APPCENTER_SOURCE_DIRECTORY -name '*.sln' -print0 | xargs -0 -n1 nuget restore -DisableParallelProcessing
CODE_SECTION
```

## <a name="unit-tests"/>I want to run unit tests for my Xamarin application, how can I do that?

To run unit tests in your Xamarin builds you have to use a [post-build script](~/build/custom/scripts/index.md#post-build). For example when your NUnit based project has *Test* in the name, you can use the following script to build, run and display the results:

```bash
echo "Found NUnit test projects:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*Test.*\.csproj' -exec echo {} \;
echo
echo "Building NUnit test projects:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*Test.*\.csproj' -exec msbuild {} \;
echo
echo "Compiled projects to run NUnit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*Test.*\.dll' -exec echo {} \;
echo
echo "Running NUnit tests:"
find $APPCENTER_SOURCE_DIRECTORY -regex '.*bin.*Test.*\.dll' -exec nunit3-console {} \;
echo
echo "NUnit tests result:"
find . -name 'TestResult.xml' -exec cat {} \;
```

## <a name="no-projects"/>I get an error: No projects found and No configurations found for Xamarin builds

It could be a problem of repository depth .csproj and .sln are located in. There is a limitation in current analyzer due to performance reasons.

For .csproj file, it should not be lower than 4 directories deep including the repository root.

For .sln file, it should not be lower than 2 directories deep including the repository root.

## <a name="nuget-feed"/>How do I restore a private NuGet feed?

If the **NuGet.config** file is checked-in into the repository and sitting next to the **.sln** or at the root level of your repository, App Center restores your private NuGet feeds when they are added as shown in the example below. Credentials can be added safely by using [environment variables](~/build/custom/scripts/index.md).

For Mac build machines:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget" value="https://api.nuget.org/v3/index.json" />
    <add key="MyGet" value="https://www.myget.org/F/MyUsername/api/v2/index.json" />
    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
  </packageSources>
  <activePackageSource>
    <add key="All" value="(Aggregate source)" />
  </activePackageSource>
  <packageSourceCredentials>
    <MyAuthNuget>
      <add key="Username" value="%USER_VARIABLE%" />
      <add key="ClearTextPassword" value="%PASSWORD_VARIABLE%" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration>
```

For Windows build machines, please refer to [UWP C#](~/build/windows/uwp/first-build.md).

If you have complex configurations and need more information, you can refer to [Configuring NuGet behavior](https://docs.microsoft.com/nuget/consume-packages/configuring-nuget-behavior).
