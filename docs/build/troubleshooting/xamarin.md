---
title: App Center Build FAQs – Xamarin
description: Troubleshooting guides for Xamarin apps
keywords: build, faq
author: lucen-ms
ms.author: lucen
ms.date: 06/08/2020
ms.topic: article
ms.assetid: 7365bb27-d7c1-4fe1-91b4-346359c705ea
ms.service: vs-appcenter
ms.custom: build
---


# Xamarin
## My Xamarin.iOS builds build from solution file (.sln) instead of project file (.csproj)

When your Xamarin.iOS builds run from solution file (.sln), there are several things you might want to check. 

Android and UWP projects should be disabled in your code for build configurations that are intended for iOS builds. Go into the solution's configuration mappings, and for all mappings that target iPhone and iPhoneSimulator, uncheck all the projects that target different platforms. This configuration ensures when the `.sln` begins building, it won't attempt to build other projects. 

## My Xamarin.iOS builds fail claiming I need to provide signing information
If your Xamarin.iOS builds aren't signed, but the build process requires signing, it's probably because you've selected `Sign builds: Off` in the App Center branch configuration. 

If your build log contains: 
```Javascript
RequireProvisioningProfile: True. 
```
It means that your project itself is configured for signing and applies signing despite the App Center configuration. 

To fix it, open **Project Options > Build > iOS Bundle Signing** in your IDE and make sure that your project configuration (for example, Debug|iPhoneSimulator) doesn't contain any signing information other than **Automatic**.

## My Xamarin.Android build failed with **Error: No APK files found**.
One common reason for a build failing during **Xamarin Android Postprocess** task is an incorrect value in the `<OutputPath>` property in the Android project file. To check it, go to **Xamarin.Android > Project Options > Build > Output** and verify that your build configuration (Debug/Release) points to the default location. Usually, it should be `YourProjectDir/bin/$(Configuration)`.

## I set up my Xamarin.iOS app branch to build without signing but my build failed claiming I need to provide the signing information
If you selected `Sign builds: Off` in the App Center branch configuration, and your build log contains `RequireProvisioningProfile: True`, it means that your project itself is configured for signing and will try to apply signing despite the App Center configuration. To fix it open **Project Options > Build > iOS Bundle Signing** in your IDE and make sure that your project configuration (for example, **Debug|iPhoneSimulator**) doesn't contain any signing information other than **Automatic**.

![Disable signing for Debug configuration in Xamarin.iOS application](~/build/images/xamarin-ios-empty-codesigning.png "Disable signing for Debug configuration in Xamarin.iOS application")

[xamarin-ios-empty-codesigning]: images/xamarin-ios-empty-codesigning.png "Disable signing for Debug configuration in Xamarin.iOS application"

## My Xamarin.iOS simulator build fails to install into iOS Simulator with "Failed to chmod ... /Appname.iOS.app/Appname.iOS : No such file or directory" error. 
When you create a Xamarin.iOS project in Visual Studio, the default configuration for iPhoneSimulator has **i386 + x86_64** supported architectures. The **.app** file that builds from such configuration will fail to upload into a simulator. Open **Project Options > Build > iOS Build** and for iPhoneSimulator configuration change **Supported architectures** to **i386** or **x86_64**.

![Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application](~/build/images/xamarin-ios-iphonesimulator-supported-architecture.png "Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application")

[xamarin-ios-iphonesimulator-supported-architecture]: images/xamarin-ios-iphonesimulator-supported-architecture.png "Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application"

## My Xamarin build fails with error MSB4018: The "WriteRestoreGraphTask" task failed unexpectedly.
Looks like your solution contains PCL or older .NET Standard projects together with newer .NET Standard projects. That means they may contain both `PackageTargetFallback` and `AssetTargetFallback` references in `.csproj` files. Your build logs will also contain messages like this:

```NA
error MSB4018: NuGet.Commands.RestoreCommandException: PackageTargetFallback and AssetTargetFallback cannot be used together. Remove PackageTargetFallback(deprecated) references from the project environment.
```

To resolve this issue, either remove PackageTargetFallback (tends to be in older PCL `.csproj` files) or rename it to AssetTargetFallback? The solution is also described in [this StackOverflow thread](https://stackoverflow.com/questions/45569378/upgrading-to-net-core-2-0-packagetargetfallback-and-assettargetfallback-cannot).

## My Xamarin build fails with error: This project references NuGet package(s) that are missing on this computer.
Looks like not all packages were restored to build your application. Your build logs will also contain messages like these:

```NA
warning MSB3245: Could not resolve this reference. Could not locate the assembly "ASSEMBLY_NAME". Check to make sure the assembly exists on disk. If this reference is required by your code, you may get compilation errors.
error CS0246: The type or namespace name 'TYPE_OR_NAMESPACE_NAME' could not be found (are you missing a using directive or an assembly reference?)
```

To resolve this issue, you can use [pre-build script](~/build/custom/scripts/index.md#pre-build) `appcenter-pre-build.sh` with the following commands, which restores all packages for each solution in your repository:

```bash
#!/bin/bash
find $APPCENTER_SOURCE_DIRECTORY -name '*.sln' -print0 | xargs -0 -n1 nuget restore -DisableParallelProcessing
```

## I want to run unit tests for my Xamarin application
To run unit tests in your Xamarin builds, use a [post-build script](~/build/custom/scripts/index.md#post-build). For example when your NUnit based project has *Test* in the name, you can use the following script to build, run, and display the results:

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

## I get an error: No projects found and No configurations found for Xamarin builds
It could be a problem of the repository depth that the `.csproj` and `.sln` are located in. There's a limitation in current analyzer because of performance reasons.

For `.csproj` files, it shouldn't be lower than four directories deep including the repository root.

For `.sln` files, it shouldn't be lower than two directories deep including the repository root.

## How do I restore a private NuGet feed?
If the **NuGet.Config** file is checked-in into the repository and sitting next to the **.sln** or at the root level of your repository, App Center restores your private NuGet feeds when they're added as shown in the example below. Credentials can be added safely using [environment variables](~/build/custom/scripts/index.md).

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

For Windows build machines, refer to [UWP C#](~/build/uwp/index.md).

If you have complex configurations and need more information, you can refer to [Configuring NuGet behavior](/nuget/consume-packages/configuring-nuget-behavior).

## Builds stuck at _CompileToNative_
If the build experiences similar symptoms as described [in this GitHub issue](https://github.com/xamarin/xamarin-macios/issues/6818), try to build only for ARM64 by adding the following argument, as suggested in the issue:

```xml
<MtouchArch>ARM64</MtouchArch>
```

## Build failed with error: target "_IsProjectRestoreSupported" does not exist in the project.

You may experience build issues if you have UWP project in the solution where during the restore its errors were silently ignored in the old version of NuGet. 
Removing or fixing such UWP project in the solution may resolve the issue. Plese see the details [in this GitHub issue](https://github.com/mono/mono/issues/21180).
