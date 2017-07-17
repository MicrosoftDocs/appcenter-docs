---
title: Mobile Center Build Frequently Asked Questions
description: Code signing apps built with Mobile Center
keywords: build, faq
author: siminapasat
ms.author: siminap
ms.date: 06/26/2017
ms.topic: article
ms.assetid: 090e12fa-c788-4cd3-8178-c8c0769195af
ms.service: mobile-center
ms.custom: build
---

# Build FAQ

## The repository I want to connect to is not listed in the Connect to Repository step
* Only Git repositories are supported at this point. If you're trying to link to another type of repositories (e.g. Mercurial, TFSVC, etc), it will not show up in the repository list.
* If connecting to a repository that belongs to an organization on GitHub or team on Bitbucket, first request admin access to the repository.
In order to use a repository for building apps with Mobile Center, you need to have admin rights to that repository. Admin rights are required because Mobile Center will register a webhook on your repository coming from the [mobile.azure.com](https://mobile.azure.com) domain.
For GitHub repositories, depending on your organization's configuration, the first time when a member requests Mobile Center access to that organization, an organization member with owner privileges might need to approve that request. See the [GitHub-specific instructions here](https://help.github.com/articles/approving-third-party-applications-for-your-organization/). It can take up to a few minutes until repositories from that organization will show up in Mobile Center.
* If connecting to a repository owned by a user, you need to be the owner of the repository. If you are not the owner, you can still onboard the app to Mobile Center build by inviting the repository owner as a collaborator to the app in Mobile Center. Then, the owner can connect the repository as a source to the Mobile Center build service.


## No Xcode scheme is found
In order to build a xcworkspace or a xcproject, a shared Xcode scheme is required. Xcode schemes are saved locally so that Xcode has access to them, but by default they are not shared with others and they are not included in source control.

To share a scheme, click on "Manage schemes" in Xcode and make sure that the scheme used for building your xcproject/xcworkspace is marked as shared. The scheme's container needs to be set to the Xcode project or workspace you want to build. Then make sure the added xcscheme file is added to source control and pushed to your remote repository - which Mobile Center accesses.

![Mark scheme as shared][xcode-share-scheme]

## Why did my build fail?
There are various reasons why your build could have failed. The best way to find out what happened is to go to the build details page and download the logs. Check the logs for each of the steps to understand what happened and where exactly the build failed. If you cannot understand why the build failed or you think there is an issue on our side, feel free to contact us via Intercom right from within Mobile Center.

## Is my source code secure?
Mobile Center uses virtual machines to build your code. There is a clean virtual machine provisioned especially for your build which gets discarded once the build finishes.
The files uploaded for code signing and the password for the certificate are also stored securely on our servers.

## A code signed build cannot be installed on an iOS device
There are many reasons why a build cannot be installed on a user's device. A common case is that the provisioning profile does not contain the UDID of the user's device, in case of a development or ad-hoc distribution build. In the case of development provisioning profiles and ad-hoc distribution, you have to manually include the UDID of your users' devices in the provisioning profile in the Apple Developer Center, re-download the provisioning profile and upload it to the Mobile Center build configuration. If you use enterprise distribution, you do not need to worry about collecting UDIDs.

[xcode-share-scheme]: ~/build/ios/first-build/images/xcode-share-scheme.png "Marking a scheme as shared in Xcode"

## Why is the build in Mobile Center taking longer then my local build?
There are many reasons why build duration can be higher when using a build service:
* When running your build locally, many things are cached (e.g. NuGet packages, pods, dependencies); In Mobile Center, we always perform a clean build and re-download everything required.
* For Xamarin builds, when running your build locally, you are most likely running a simulator build; In Mobile Center you can run a device build (signed), which takes much longer to run.
* Most likely the CPU power of your development machine is higher than the CPU of our VMs.

We are always working on improving build times. If you consider the build duration for your app is too long compared to your expectations, please reach out to us via the in-app chat (Intercom) or with a comment here.

## Why do I get an extended build time when "Run launch test on a device" is enabled
We run the test as part of the build operation, which gives the added build time. What happens is that while Mobile Center Test is validating your app is ready to run on real devices, several things can happen here like: signing, checking permissions, etc. After that it's time to wait for a device. Third, it's running the app on a phone, which takes very little time. And lastly, we move test logs, screenshots into the cloud.

Expect an additional **10 minutes of build time**.

## Are Git submodules supported?
For repositories hosted on GitHub, only Git submodules over HTTPS are supported.
For repositories hosted on Bitbucket or VSTS, only un-authenticated Git submodules are supported for now.

## How to restore a private NuGet feed?
To restore private NuGet feeds, you include the credentials in the **NuGet.config** file:

```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget" value="https://api.nuget.org/v2/index.json" />
    <add key="MyGet" value="https://www.myget.org/F/MyUsername/api/v2/index.json" />
    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
  </packageSources>
  <activePackageSource>
    <add key="All" value="(Aggregate source)" />
  </activePackageSource>
  <packageSourceCredentials>
    <MyAuthNuget>
      <add key="Username" value="myusername" />
      <add key="ClearTextPassword" value="password" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration>
```
## Where is my .ipa file?
If you have [resaved your branch settings](~/build/ios/xcodebuild.md), your build is no longer using xcrun to generate an .ipa file; it uses xcodebuild instead. Xcodebuild, unlike xcrun, doesn't allow generating an .ipa file if the build is not signed-unsigned builds produce an .xcarchive instead.
If you wish to generate an .ipa file with the artifacts of an unsigned build, you can use the .xcarchive file to do so.

![Export xcarchive file using xcode][export-xcode–xcarchive-organizer]

[export-xcode–xcarchive-organizer]: images/export-xcode–xcarchive-organizer.png "Exporting an Xcarchive file using Xcode Archives organizer"


## I didn't change anything but my build started to fail, why is that?

Starting May 17th, all builds of iOS apps written in Objective-C, Swift or React Native run with the build tool [xcodebuild](~/build/ios/xcodebuild.md) intead of xcrun and it is stricter. All builds kicked off after this date will use [xcodebuild](~/build/ios/xcodebuild.md).
* If you are using CocoaPods, you might encounter the error - `error: Invalid bitcode version (Producer: '802.0.38.0_0' Reader: '800.0.42.1_0')`
  This error means that you are using a lib or pod that was built by a newer version of Xcode than the Xcode version currently used to build your project.
  You can update your build configuration in Mobile Center to use a newer version of Xcode or switch to an alternate, older version of the problematic library which is compiled with a matching version of Xcode.
* Build configuration has changed - with the move to xcodebuild, we changed the build action to `clean archive`, which by default is set to the release          configuration. This may be a different configuration from the `build` action that was used with xcrun.

## Since I have upgraded my project to Xcode 8 My iOS app fails to run a test, how can I fix this?
One common reason for test to fail is related to `Apple Mach-O Linker`, if this is the case of your failure, you will see the following error - <br />
 ```
 ld: directory not found for option iPhoneSimulator10.3.sdk/Developer/Library/Frameworks <br />
  ❌ ld: embedded dylibs/frameworks are only supported on iOS 8.0 and later (@rpath/XCTest.framework/XCTest) for architecture x86_64 <br />
  ❌ clang: error: linker command failed with exit code 1 (use -v to see invocation)  <br />
  ```

It means that the linking type to `Apple Mach-O Linker` is different from `static library`.
In order to successfully build and test your app, make sure that the linking type of `Apple Mach-O Linker` in your **test target** is set to `static library`.

![Apple Mach-O Linker][mach-o-apple-linkage]

[mach-o-apple-linkage]: images/mach-o-apple-linkage.png "Set Apple Mach-O Linker to static library"

## My Xamarin.Android build failed with **Error: No APK files found**, what can be done?
One common reason for a build failing during **Xamarin Android Postprocess** task can be an incorrect value in the `<OutputPath>` property in Xamarin.Android project file. To check it, go to **YourXamarin.Android > Project Options > Build > Output** and verify that for your build configuration (Debug/Release) it points to the default location. Usually, it should be `YourProjectDir/bin/$(Configuration)`.
