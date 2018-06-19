---
title: App Center Build Frequently Asked Questions
description: Code signing apps built with App Center
keywords: build, faq
author: siminapasat
ms.author: siminap
ms.date: 06/15/2018
ms.topic: article
ms.assetid: 090e12fa-c788-4cd3-8178-c8c0769195af
ms.service: vs-appcenter
ms.custom: build
---

# Build FAQ

## General
### Why did my build fail?
There are various reasons why your build could have failed. The best way to find out what happened is to go to the build details page and download the logs. Check the logs for each of the steps to understand what happened and where exactly the build failed. If you cannot understand why the build failed or you think there is an issue on our side, feel free to contact us via Intercom right from within App Center.

### Why is the build in App Center taking longer than my local build?
There are many reasons why build duration can be higher when using a build service:
* When running your build locally, many things are cached (e.g. NuGet packages, pods, dependencies); In App Center, we always perform a clean build and re-download everything required.
* For Xamarin builds, when running your build locally, you are most likely running a simulator build; In App Center you can run a device build (signed), which takes much longer to run.
* Most likely the CPU power of your development machine is higher than the CPU of our VMs.

We are always working on improving build times. If you consider the build duration for your app is too long compared to your expectations, please reach out to us via the in-app chat (Intercom) or with a comment here.

### Why do I get an extended build time when "Run launch test on a device" is enabled?
We run the test as part of the build operation, which gives the added build time. What happens is that while App Center Test is validating your app is ready to run on real devices, several things can happen here like: signing, checking permissions, etc. After that it's time to wait for a device. Third, it's running the app on a phone, which takes very little time. And lastly, we move test logs, screenshots into the cloud.

Expect an additional **10 minutes of build time**.

## Source repository

### The repository I want to connect to is not listed in the Connect to Repository step
* Only Git repositories are supported at this point. If you're trying to link to another type of repositories (e.g. Mercurial, TFVC, etc), it will not show up in the repository list.
* If connecting to a repository that belongs to an organization on GitHub or team on Bitbucket, first request admin access to the repository.
In order to use a repository for building apps with App Center, you must have admin rights to that repository. Admin rights are required because App Center will register a webhook on your repository coming from the appcenter.ms domain.
For GitHub repositories, depending on your organization's configuration, the first time when a member requests App Center access to that organization, an organization member with owner privileges might need to approve that request. See the [GitHub-specific instructions on how to approve third party applications for your organization](https://help.github.com/articles/approving-third-party-applications-for-your-organization/). It can take up to a few minutes until repositories from that organization will show up in App Center.
* If connecting to a repository owned by a user, you must be the owner of the repository. If you are not the owner, you can still onboard the app to App Center build by inviting the repository owner as a collaborator to the app in App Center. Then, the owner can connect the repository as a source to the App Center build service.

### What can I do if am using Team Foundation Version Control (TFVC)?

App Center Build only supports Git repositories. For projects using a TFVC repository, unless you want to [convert them to Git](https://docs.microsoft.com/vsts/git/import-from-tfvc), you can use Visual Studio Team Services for continuous integration, and take advantage of the [Hosted macOS Preview](https://docs.microsoft.com/vsts/build-release/apps/mobile/xcode-ios?tabs=vsts) agents as well as build tasks for App Center Distribution and Test.

### Is my source code secure?
App Center uses virtual machines to build your code. There is a clean virtual machine provisioned especially for your build which gets discarded once the build finishes.
The files uploaded for code signing and the password for the certificate are also stored securely on our servers.

### Are Git submodules supported?
For repositories hosted on GitHub, only Git submodules over HTTPS are supported.
For repositories hosted on Bitbucket or VSTS, only un-authenticated Git submodules are supported for now.

## Android

### Why was my app not found? Why does a build step fail to find my app build results?
In order to scan and analyze your Android (Java & React Native) app in your repository, App Center identifies the Gradle wrappers in your repository. Both platforms use the Gradle build system on Android. The default Gradle project directory structure looks like the following:

```
MyProject
├── app
│   ├── build.gradle
│   ├── build
│   ├── src
├── build.gradle
├── gradle
│   └── wrapper
├── gradle.properties
├── gradlew
└── settings.gradle
```

While not all files in this listing are required – it is important to understand, that App Center repository analysis expects the `gradlew` file at the root of your project directory. All the other Gradle project components modules are based relative to the Gradle wrapper location.
In this case, your project would have a module named `app` (because of the `build.gradle` file in the `app` directory). The output of the build (e.g. the APK) is then scanned in the `app/build` directory.

If a step in your build fails, because it can't find build results, this might mean that the `gradlew` file was not found in the expected directory and you might want to consider changing the project layout so it fits the standard Gradle project layout.

## iOS
### No Xcode scheme is found
In order to build a xcworkspace or a xcproject, a shared Xcode scheme is required. Xcode schemes are saved locally so that Xcode has access to them, but by default they are not shared with others and they are not included in source control.

To share a scheme, click on "Manage schemes" in Xcode and make sure that the scheme used for building your xcproject/xcworkspace is marked as shared. The scheme's container needs to be set to the Xcode project or workspace you want to build. Then make sure the added `.xcscheme` file is added to source control and pushed to your remote repository - which App Center accesses.

![Mark scheme as shared][xcode-share-scheme]

[xcode-share-scheme]: ../build/ios/images/xcode-share-scheme.png "Marking a scheme as shared in Xcode"


### A code signed build cannot be installed on an iOS device
There are many reasons why a build cannot be installed on a user's device. A common case is that the provisioning profile does not contain the UDID of the user's device, in case of a development or ad-hoc distribution build. In the case of development provisioning profiles and ad-hoc distribution, you have to manually include the UDID of your users' devices in the provisioning profile in the Apple Developer Center, re-download the provisioning profile and upload it to the App Center build configuration. If you use enterprise distribution, you do not need to worry about collecting UDIDs.


### Where is my .ipa file?
Xcodebuild, unlike xcrun, doesn't allow generating an .ipa file if the build is not signed. Unsigned builds produce an .xcarchive instead. If you wish to generate an .ipa file with the artifacts of an unsigned build, you can use the .xcarchive file to do so.

![Export xcarchive file using xcode][export-xcode-xcarchive-organizer]

[export-xcode-xcarchive-organizer]: images/export-xcode-xcarchive-organizer.png "Exporting an Xcarchive file using Xcode Archives organizer"


### My iOS app using Xcode fails with Invalid bitcode version error, why is that?

If your builds fail with `error: Invalid bitcode version (Producer: '802.0.38.0_0' Reader: '800.0.42.1_0')`, this error means that you are using a library or pod that was built by a newer version of Xcode than the Xcode version currently used in your project. You can either update your project and the build configuration in App Center to use a newer version of Xcode or switch to an alternate, older version of the problematic library which is compiled with a matching version of Xcode.


### My iOS app fails to run a test, how can I fix this?
A common reason for tests to fail is where the linker commands fail with an error similar to the following:
 ```
 ld: directory not found for option iPhoneSimulator10.3.sdk/Developer/Library/Frameworks 
  ❌ ld: embedded dylibs/frameworks are only supported on iOS 8.0 and later (@rpath/XCTest.framework/XCTest) for architecture x86_64 
  ❌ clang: error: linker command failed with exit code 1 (use -v to see invocation)  
  ```

The likely cause of this error is the linking type of **Apple Mach-O Linker** is not set to **static library**. 
In order to successfully build and test your app,  ensure the linking type of **Apple Mach-O Linker** in your **test target** is set to **static library**.

![Apple Mach-O Linker][mach-o-apple-linkage]

[mach-o-apple-linkage]: images/mach-o-apple-linkage.png "Set Apple Mach-O Linker to static library"

### My iOS builds using CocoaPods on Xcode 9 keep failing, what should I do?

It might be because the signing configuration in you Pods project differs from the one in your Main project. Are your Pods checked-in into your repository? If yes, you must go to your Pods project and ensure it is set to use the same signing method as your Main project. If you set both Pods project and Main project to have the same singing configuration, this should resolve the issue. 
If your Pods are not checked-in into your repository, it might be different issues and there are few workarounds you can use with [pre-build script](~/build/custom/scripts/index.md#pre-build) in this [link](https://github.com/CocoaPods/CocoaPods/pull/6964).

### Since I have upgraded my project to Xcode 10 beta my app fails to build with the error **Cycle in dependencies between targets**, why is that? 

Xcode 10's new build system detects dependency cycles in your build and fails your build if there are any.

For more information on how to fix the build, please refer to [Apple's documentation on resolving common types of dependency cycles](https://help.apple.com/xcode/mac/current/#/dev621201fb0).

## Xamarin
### My Xamarin.Android build failed with **Error: No APK files found**. What can be done?
One common reason for a build failing during **Xamarin Android Postprocess** task can be an incorrect value in the `<OutputPath>` property in Xamarin.Android project file. To check it, go to **YourXamarin.Android > Project Options > Build > Output** and verify that for your build configuration (Debug/Release) it points to the default location. Usually, it should be `YourProjectDir/bin/$(Configuration)`.

### I set up my Xamarin.iOS app branch to build without signing but my build failed claiming I need to provide the signing information, why is that?
If you selected **Sign builds: Off** in the App Center branch configuration and your build log contains `RequireProvisioningProfile: True`, it means that your project itself is configured for signing and will try to apply signing despite the App Center configuration. To fix it open **Project Options > Build > iOS Bundle Signing** in your IDE and make sure that your project configuration (e.g., **Debug|iPhoneSimulator**) does not contain any signing information other than **Automatic**.

![Disable signing for Debug configuration in Xamarin.iOS application][xamarin-ios-empty-codesigning]

[xamarin-ios-empty-codesigning]: images/xamarin-ios-empty-codesigning.png "Disable signing for Debug configuration in Xamarin.iOS application"

### My Xamarin.iOS simulator build fails to install into iOS Simulator with **Failed to chmod ... /Appname.iOS.app/Appname.iOS : No such file or directory** error. How do I fix that?
When you create Xamarin.iOS project in Visual Studio the default configuration for iPhoneSimulator has **i386 + x86_64** supported architectures. The **.app** file that builds from such configuration will fail to upload into a simulator. Open **Project Options > Build > iOS Build** and for iPhoneSimulator configuration change **Supported architectures** to just **i386** or **x86\_64**.

![Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application][xamarin-ios-iphonesimulator-supported-architecture]

[xamarin-ios-iphonesimulator-supported-architecture]: images/xamarin-ios-iphonesimulator-supported-architecture.png "Set x86_64 in Supported Architectures for iPhoneSimulator configuration in Xamarin.iOS application"

### My Xamarin build fails with error MSB4018: The "WriteRestoreGraphTask" task failed unexpectedly. What can be done?

Looks like your solution contains PCL or older .NET Standard projects together with newer .NET Standard projects. That means they may contain both `PackageTargetFallback` and `AssetTargetFallback` references in .csproj files. Your build logs will also contain messages like this:
```
error MSB4018: NuGet.Commands.RestoreCommandException: PackageTargetFallback and AssetTargetFallback cannot be used together. Remove PackageTargetFallback(deprecated) references from the project environment.
```

To resolve this issue, either remove PackageTargetFallback (tends to be in older PCL .csproj files) or rename it to AssetTargetFallback? The solution is also described in [this StackOverflow thread](https://stackoverflow.com/questions/45569378/upgrading-to-net-core-2-0-packagetargetfallback-and-assettargetfallback-cannot).

### My Xamarin build fails with error: This project references NuGet package(s) that are missing on this computer. What can be done?
Looks like not all packages were restored to build your application. Your build logs will also contain messages like these:
```
warning MSB3245: Could not resolve this reference. Could not locate the assembly "ASSEMBLY_NAME". Check to make sure the assembly exists on disk. If this reference is required by your code, you may get compilation errors.
error CS0246: The type or namespace name 'TYPE_OR_NAMESPACE_NAME' could not be found (are you missing a using directive or an assembly reference?)
```
To resolve this issue you can use [pre-build script](https://docs.microsoft.com/en-us/appcenter/build/custom/scripts/#pre-build) `appcenter-pre-build.sh` with the following script which will restore all packages for each solution in your repository:
```
#!/bin/bash
find $APPCENTER_SOURCE_DIRECTORY -name '*.sln' -print0 | xargs -0 -n1 nuget restore -DisableParallelProcessing
CODE_SECTION
```

### I want to run unit tests for my Xamarin application, how can I do that?

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

### How do I restore a private NuGet feed?
If the **NuGet.config** file is checked-in into the repository and sitting next to the **.sln** or at the root level of your repository, App Center restores your private NuGet feeds when they are added as shown in the example below. Credentials can be added safely by using [environment variables](~/build/custom/scripts/index.md).

For Mac build machines:
```
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
