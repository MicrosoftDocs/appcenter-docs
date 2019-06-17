---
title: App Center Changelog
description: History of updates to the product
keywords: update,history
author: jwargo
ms.author: jowargo
ms.date: 06/04/2019
ms.topic: article
ms.assetid: 2168c052-73a5-43eb-a144-00c63d44d7a1
ms.service: vs-appcenter
---

# App Center Changelog

This document lists new features as they're added to [Visual Studio App Center](https://appcenter.ms). These features will also live for a while, marked as [SHIPPED], in the [App Center Roadmap](~/general/roadmap.md).

### **June 4, 2019**
- **Node.js switching support**
    - Node.js version can be specified in the app's branch configuration.  
The following versions are available for use in App Center Build: 6, 8, 10, 12.  
Also there is way to [specify](~/build/react-native/nodejs.md) custom version of Node.js.

### **May 20, 2019**
- **Build support for Xcode 10.2.1**
    - Now React Native developers can select legacy or modern Xcode build system for their iOS branch configuration. See our [docs](~/build/react-native/iOS/index.md#xcode-version).

### **April 26, 2019**
- **Build support for Xcode 10.2.1**
    - Added support for building your apps with Xcode 10.2.1. The Xcode 10.2.1 IDE is available for native iOS, native macOS, Xamarin.iOS and React Native iOS apps.

### **April 17, 2019**
- **Updated Visual Studio for Mac:**
    - Visual Studio for Mac 8.0.2.23
- **Updated Xamarin SDKs: Build your Xamarin apps with Mono 5.18 and fresh versions of the Xamarin SDKs:**
    - Mono 5.18.1, Xamarin.iOS 12.6.0.25
    - Mono 5.18.1, Xamarin.iOS 12.8.0.0
    - Mono 5.18.1, Xamarin.Android 9.2.0-5
- **Xcode 10.2 is available for Xamarin.iOS 12.6 and 12.8**

### **April 11, 2019**
- **Build support for Xcode 10.2**
    - Added support for building your apps with Xcode 10.2. The Xcode 10.2 is available for native iOS, native macOS and RN.iOS apps

### **January 24th, 2019**

- **Added SDK support for User ID in Diagnostics data:**
     - Added the ability to attach a user ID to Diagnostics logs. This allows developers to visualize the user ID for each crash or error instance.
- **Search crashes by User ID:**
    - Added the ability to search crashes by User ID. This allows developers to find their crashes for a specific user.

### **January 8, 2019**

- **Updated Xamarin SDKs: Build your Xamarin apps with Mono 5.16 and fresh versions of the Xamarin SDKs:**
    - Mono 5.16.0.221
    - Xamarin.Android 9.1.4.2
- **Updated Visual Studio for Mac:**
    - Visual Studio for Mac 7.7.2.21

### **December 18, 2018**

- **Added support for Push notifications with Unity apps:**
  - Unity developers can now send Push Notifications to Android, iOS and Windows built Unity apps similar to the other supported platforms.
  
### **December 17, 2018**

- **Search for Crashes in Diagnostics:**
   – Added the ability to search crashes by specific fields such as method, class or reason. This allows developers to find their crashes of interest in a much faster way.

### **December 14, 2018**

- **Xcode 8.0-8.3.2 deprecation in App Center build:**
  - The following Xcode versions (and related simulators) were deprecated: 8.0, 8.1, 8.2, 8.2.1, 8.3.1 and 8.3.2.
  - Build configurations that used deprecated versions were forcibly migrated to Xcode 8.3.3

### **December 11, 2018**

- **Added build support for Xamarin.iOS 12.2**:
  Build your Xamarin apps with [Xamarin.iOS 12.2](https://developer.xamarin.com/releases/ios/xamarin.ios_12/xamarin.ios_12.2/)
  - Xamarin.iOS 12.2.1.11

### **November 30, 2018**

- **CLI version 1.1.9 released**:
  - Updated the CLI with the correct internal URLs.

### **November 26, 2018**

- **CLI version 1.1.8 released**:
  - Changed the `event-stream` module in the npm package to v3.3.4.
  - Added the functionality to support `appcenter apps set-current` for the `appcenter test wizard` command.

### **November 19, 2018**

- **Build support for iOS App Extensions.** Configure, build, and sign an iOS app with app extensions. Build and ship robust iOS apps with various app extensions. Support Swift, Objective-C and React Native apps today.

### **November 15, 2018**

- **Diagnostics to General Availability**:

Diagnostics is becoming Generally Available very soon. This means that Diagnostics will be ready for your production apps, with a much more stable and performant offering.

- **Diagnostics UI Improvements**:
  - Merged view for crashes and errors for Xamarin apps. This provides a more intuitive visualization, allowing developers to prioritize the most crucial issues in their apps, whether these are errors or crashes.
  - Improved experience for the symbol upload process. This allows developers to quickly identify and upload their missing symbols.

### **November 13, 2018**

- **Ship Unity Extension Editor**:
  Shipped a plugin editor for managing the App Center Unity SDK directly within Unity. Now users can directly install, remove and update packages without leaving the Unity editor.
  
### **November 12, 2018**

- **Build support for Xcode 10.1**:
  Added support for building your apps with Xcode 10.1 (10B61).

### **November 6, 2018**

- **CLI version 1.1.7 released**:
  Added support for Node.js v10.0.0.
  *Note: CLI v1.1.6 was an unintended empty release, hence the latest version is v1.1.7.*
  
### **October 31, 2018**

- **Close App Center Account**: Added the ability to close an App Center account (and associated orgs) on App Center.

### **October 24, 2018**

- **Build support for Xcode 10.1 beta 3**:
  Added support for building your apps with Xcode 10.1 beta 3.
- **Add support for running Xamarin.UITest iOS tests locally on iOS 12 devices and simulators.**
- **Add support for running iOS UI automation frameworks (Appium, XCUITest, Xamarin.UITest) in the App Center device lab.**
- **Add devices running iOS 12 to the App Center device lab.**

### **October 23, 2018**

- **Add support for the [Unity](https://unity3d.com/) platform.** This feature includes supporting Unity apps in the App Center portal and shipping the App Center SDK for Unity. The SDK supports App Center Analytics, Distribution, and Diagnostics.

### **October 17, 2018**

- **Added crash symbolication support for the new arm64e architecture in iPhone XS and XS Max**: This allows developers to view symbolicated crash reports for the iPhone XS and iPhone XS Max.

### **October 16, 2018**

- **CLI version 1.1.5 released**:
  - Added metadata, install metrics, and deployment keys information for `appcenter codepush deployment list`
  - Added metadata and install metrics information for `appcenter codepush deployment history`

### **October 10, 2018**

- **Added support for Proguard and Kotlin in App Center Diagnostics**: This allows developers to view de-obfuscated stack traces in App Center.
- **Added support for NDK in Diagnostics**: This allows developers to process crashes caused by native code.

### **October 4, 2018**

- **Added Xcode 10.0 support for React Native apps**:
  Build your React Native iOS apps with Xcode 10.0 (only available for React Native 0.56+)
  - The build process uses the Xcode legacy build system as described in this [github issue](https://github.com/facebook/react-native/issues/19573). Currently React Native doesn't have full support of new build system that was added in Xcode 10.0

- **Two-factor authentication for Apple App Store**
  Add app-specific password to your Apple IDs for two-factor authentication support when publishing apps to App Store and TestFlight. [Adding an app-specific password](~/distribution/stores/apple.md#adding-two-factor-authentication) is only required for App Store connection. Services like [automatically manage devices](~/distribution/auto-provisioning.md) only needs the six-digit code.

### **October 3, 2018**

- **CLI version 1.1.4 released**:
  Added bug fixes for editing distribution group names, tab completion, Xamarin.UITest Android sign-info option, and improved error handling for generating a launch test.
  *Note: CLI v1.1.3 was an unintended empty release, hence the latest version is v1.1.4.*

### **October 8, 2018**

- **Diagnostics UI Improvements**
  - Merged the view for crashes and errors for Xamarin apps. This provides a more intuitive visualization, allowing developers to prioritize the most crucial issues in their apps, whether these are errors or crashes. 
  - Improved the symbol upload experience. This allows developers to quickly identify and upload their missing symbols.

### **September 26, 2018**

- **Added build support for Xamarin.iOS 12.0**:
  Build your Xamarin apps with [Xamarin.iOS 12.0](https://releases.xamarin.com/stable-release-xcode-10/) and Xcode 10.0 support
  - Xamarin.iOS 12.0.0.15
  - Visual Studio For Mac 7.6.6.17

### **September 19, 2018**

- **Build support for final Xcode 10.0**:
  Added support for building your apps with Xcode 10.0 (10A255)

### **September 13, 2018**

- **Intune app protection policies**
  Publish [managed iOS line-of-business apps](https://docs.microsoft.com/en-us/intune/app-protection-policy) to the Intune store

### **September 11, 2018**

- **Added Xamarin iOS Preview**
  Build your Xamarin iOS apps with [Xamarin.iOS Preview](https://releases.xamarin.com/preview-release-xcode-10-beta-6/) and Xcode 10 beta 6 support
  - Xamarin.iOS 11.99
  - Visual Studio For Mac 7.6.1.9

### **September 3, 2018**

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with SDK release 15.8.
  - Xamarin Mono 5.12.0
  - Xamarin.iOS 11.14.0.13
  - Xamarin.Android 9.0.0.18
  - Visual Studio For Mac 7.6.0.2188

### **August 31, 2018**

- **Build support for Xcode 10 beta 6**:
  Added support for building your apps with Xcode 10 beta 6.

### **August 23, 2018**

- **CLI version 1.1.2 released**:
  In CLI version 1.1.2, we
  - Added a verification error when the user runs the `--include` parameter on Appium and XCUITest test frameworks for `appcenter test run` command.
  - Updated launch tests command with the latest UITest version so that it downloads the latest NuGet package.
  - Fixed an access token error for CodePush, and updated npm package dependencies.

### **August 22, 2018**

- **Support for Android Pie**:
  We have added support to allow you build apps targeting Android Pie.

### **August 20, 2018**

- **Build support for Xcode 10 beta 5**:
  Added support for building your apps with Xcode 10 beta 5.

### **August 8, 2018**

- **Daily Digest notifications for Distribution**:
  Users can choose to receive a daily email of all the new releases of their app.

### **August 6, 2018**

- **Added support ReactNative 0.56.x**:
  Build your React Native apps with [React Native 0.56.0](https://github.com/facebook/react-native/releases/tag/v0.56.0).

### **July 31, 2018**

- **CLI version 1.1.1 released**:
  Added misc. bug fixes for Test, including enabling the `--test-output-dir` switch only when you're using the UITest or Appium test frameworks.

### **July 2, 2018**

- **CLI version 1.1.0 released**:
  In CLI version 1.1.0, the CLI now informs you if a newer version is available. We've also added the appcenter test wizard command for interactively creating and running test runs, with prompts for each required parameter, and updated to Typescript 2.8.3.

  Bug fixes:

  - NUnit report download intermittent failure
  - validate uploaded .dll.config files to avoid UITest stalls
  - better error messages when app name is wrong 
  - fixed encoding error for generated test urls

### **June 29, 2018**

- **Improved app transfer**:
  Ability to [transfer applications between organization.](~/dashboard/creating-and-managing-apps.md#transferring-an-app)

### **June 26, 2018**

- **Test run notifications**:
  Per popular request, all app collaborators will receive email notifications when a test run is completed. The behavior can be configured in app settings.

### **June 20, 2018**

- **Build support for Xcode 9.4.1**:
  Build your apps using Xcode 9.4.1.

### **June 14, 2018**

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with [SDK release 15.7.3](https://releases.xamarin.com/servicing-update-15-7-3/) including support for Xcode 9.4.

### **June 6, 2018**

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with [SDK release 15.7](https://releases.xamarin.com/release-15-7/) including Mono 5.10.1.
- **Build support for Xcode 9.4**:
  Build your apps using Xcode 9.4.

### **May 17, 2018**

- **Build support for Xcode 9.3.1**:
  Build your apps using Xcode 9.3.1.

### **May 16, 2018**

- **CLI version 1.0.17 released**: 
  Added functionality to configure Travis CI for pull request checks. Misc. bug fixes to codepush, test, crashes, and help commands.

### **May 2, 2018**

- **Export Diagnostics data (Crashes and Errors)**:
  Ability to export Crashes and Errors as part of our Continuous Export feature to Azure Blob Storage.

### **April 27, 2018**

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with [SDK release 15.6.5](https://releases.xamarin.com/service-release-15-6-5/) including support for Xcode 9.3 and [SDK release 15.6.3](https://releases.xamarin.com/service-release-15-6-3/) including Mono 5.8.1.

### **April 26, 2018**

- **Signing improvements for iOS and macOS builds**:
  Apps are signed with the provided assets regardless of the project settings.

### **April 25, 2018**

- **Increased number of property keys**:
  Increased the number of property keys from five to twenty for both errors and custom events.
- **Increased number of characters allowed in property keys and values**:
  Increased the number of characters allowed in custom event and error property keys and values.

### **April 16, 2018**

- **Build status notifications**:
  Receive email and webhook notifications for build success or failure.

### **April 13, 2018**

- **CLI version 1.0.16 released**:
  Added functionality to enable the use of app archives on all platforms, to download test report artifacts and to be called in `--async` mode.

### **April 9, 2018**

- **Build support for Xcode 9.3**:
  Build your iOS and macOS apps using Xcode 9.3.

### **April 6, 2018**

- **CLI version 1.0.15 released**:
  Added bug fixes for JsZip in Test.

### **April 2, 2018**

- **CLI version 1.0.14 released**:
  Added `--test-output-dir` and `--merge-nunit-xml` options to appcenter test run commands.
  Misc. fixes to `codepush` commands.

### **March 22, 2018**

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with [SDK release 15.6](https://releases.xamarin.com/release-15-6/) including Mono 5.8.
- **Handled Errors preview released**:
  Added support for Errors for Xamarin iOS and Xamarin Android. This allows you to track your handled exceptions and report them in App Center Diagnostics.

### **March 06, 2018**

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with [SDK release 15.5.5](https://releases.xamarin.com/service-release-15-5-5/).

### **December 21, 2017**

- **Cordova platform preview released**:
  Visual Studio App Center now offers preview support for Cordova apps with our Test, Distribute, Analytics, Crash and Push Notifications services.

### **December 16, 2017**

- **Build support for Xcode 9.2**:
  Build your iOS and macOS apps using Xcode 9.2.

- **Updated Xamarin SDKs**:
  Build your Xamarin apps with [SDK releases 15.5](https://releases.xamarin.com/release-15-5/) and [SDK release 15.5.1](https://releases.xamarin.com/service-release-15-5-1/) (including Xcode 9.2 support for Xamarin.iOS).

### **November 17, 2017**

- **Added support for re-releasing builds for distribution**:
  You will be able to select a release, and re-release it to an additional distribution group, without needing to download or re-upload the binary package.

- **Shipped support for publishing directly to the Apple Store and Testflight**:
  You can create new stores that target release to the production Apple Store or beta TestFlight service.

- **Build support for custom environment variables**:
  You now have the ability to create variables for sensitive information to include in your build process without including it in your repository.

- **UWP Crash preview released**:
  Visual Studio App Center now offers a preview of our support for getting Crash data from your UWP apps.

- **macOS preview released**:
  Visual Studio App Center now offers preview support for macOS apps with our Build, Distribute, Analytics, Crash and Push Notifications services.

- **HockeyApp side by side enabled**:
  We have now enabled a HockeyApp and App Center side by side experience for all HockeyApp customers. To view the side by side experience, just login to App Center using your HockeyApp credentials. Your app data has already been synced - allowing you to explore App Center while continuing to use HockeyApp as normal.

### **November 15, 2017**

- **Visual Studio App Center launches!**:
  Visual Studio App Center is made [generally available](https://blogs.msdn.microsoft.com/vsappcenter/introducing-visual-studio-app-center/) to everyone and is officially re-branded from Visual Studio Mobile Center to Visual Studio App Center.

### **October 20, 2017**

- **Improved Xamarin iOS Mono/SDK mapping and Xcode version handling**:
  We have improved the automatic mapping between your iOS SDK versions with Mono and Xcode to ensure a smoother and more consistent build experience out of the box.

- **Support for Android Oreo & iOS 11**:
  We have added support to allow you build and test apps targeting iOS 11 and Android Oreo.

- **Named Device Sets in Test**:
  You are now able to save device/OS combinations into named device sets to allow for reuse in future test runs.

- **Export your data to Blob Storage and Application Insights**:
  You are now able to export your analytics data to either Blob Storage or Application Insights on Azure. This gives you more control over your data to do what you want with it. See our [docs](~/analytics/export.md) to help you connect your Azure subscription and get started.

- **Crash Results now include Events leading up to a Crash (Breadcrumbs)**:
  Events leading up to a crash are now listed, helping you diagnose issues more easily.

- **Added Webhooks and VSTS bug tracker integration**:
  
Notify 3rd party applications and Azure DevOps (formerly known as VSTS) when events like crash groups are created or a new version of your app is released. Check out our docs for more details for configuring [Webhooks](~/dashboard/webhooks/index.md) and [Azure DevOps integration](~/dashboard/bugtracker/index.md)

- **Published App Center Slack Bot**:
  Get App Center notifications and updates directly in your existing Slack channels.

- **Display of attachments sent from Crashes SDK**:
  Attachments from the a crash can now be viewed within the portal

- **Missing Symbols experience improved**:
  Know of which symbols need to be uploaded to get symbolicated crash reports

### **August, 23 2017**

- **Advanced build customization options**:
  You can now [configure](~/build/custom/scripts/index.md) your build to run custom scripts at pre-defined stages of the build process.

- **Use popular command line tools straight from your build**:
  The build VMs come now with Fastlane and the App Center CLI pre-installed, so you can take the customization of your builds even a step further.

- **Better UDID management**:
  Register the UDID of testers’ iOS devices with Apple and download the new provisioning profile straight from App Center.

### **July, 2017**

- **Carthage support for your iOS builds**:
  If you use Carthage to manage your dependencies for iOS apps written in Objective C/Swift, App Center will automatically detect this and resolve the dependencies as part of the build process.

- **Faster builds**:
  Xamarin and UWP builds which rely on restoring NuGet packages and iOS builds using Cocoapods are now faster.

- **Public Distribution Groups**:
  You can now mark distribution groups as public. These groups will no longer require an account login to download and install apps. You can publish the URL through any mechanism and allow any number of users to install the app without the need for an App Center account.

- **Distribute your iOS and Android apps to Intune**:
  You can now setup a new distribution store targeting Intune cloud. If you use Intune for rich device and application management you can now streamline the release of new application packages to Intune via App Center.

### **June, 22 2017**

- **Engage with your users using Push Notifications:**
  App Center Push allows you to engage your users by sending them push notifications. You can target these notifications to a specific set of users defined by a combination of device and custom properties.

- **Now Build apps with C# 7:**
  Now you can execute builds for Xamarin C#7 apps. Learn more about getting started with Xamarin Apps in App Center here.

- **Auto-increment build number for builds:**
  Automatically increment the build number of your builds with a specific format. Choose the continuous App Center build ID or other predefined formats. If there is a format you would like to use which is not there yet, just let us know.

### **June 8, 2017**

- **Get deeper insights by attaching your own logs to crashes:**
  The App Center SDKs now provide new options to add your own log data (text or binary) to each crash report. This allows you to get even more insights on what is happening before a crash.

- **Annotate your findings to crash groups:**
  It is now possible to document your findings, ideas, or thoughts about the root causes of crash groups right in App Centers using the new Crash Group annotation feature.

- **Use CodePush in App Center:**
  Distribute content updates and fixes to your React Native apps quickly using CodePush without having to rebuild binaries. Manage your releases in the App Center across multiple deployments. Keep an eye out for more features and improvements here!

- **Updates in CLI:**
  With the new CLI version  – 0.9.1, you can now upload missing symbol files for crashes and run analytics commands to get information about your app audience, session and events. We also support browser login, so you can easily login to CLI with your GitHub or Microsoft account.

### **May 18, 2017**

- **UWP support:**
  We now support Build, distribute and Analytics for Universal Windows Platform (UWP) apps.

- **Streamlined UX for configuring Builds:**
  It’s easier to configure your build for continuous integration with a new and improved user experience. As always, you have options to tweak your build configuration; sign your app; and automatically queue successful builds for Distribution.

- **Fastlane plugin for uploading your releases:**
  Automate uploading your releases and symbol files to App Center through the App Center fastlane plugin.

- **Latest tools for your iOS builds:**
  All iOS apps written in Swift, Objective-C and React Native now use the latest tooling as recommended by Apple.

- **Sign in with Google & Facebook:**
  Register and sign into App Center using your Google or Facebook credentials.

- **Manage email notifications for Crashes and Distribution:**
  You can now instantly get notified via email when a new crash group gets created and manage these notifications in App Center.

### **Apr 27, 2017**
- **Avoid failures when your testers install your distributed app**
  App Center now supports the capture and reporting of tester UDIDs for your distributed iOS app so you can easily create a valid ad-hoc provisioning profile including all your testers. This makes sure that there are no failures when your testers try to use your distributed app.

- **Automatically verify that your app launches successfully**
  After each successful build, verify that your app is launching on a real device hosted in our device center. You can configure this in your build settings.

- **Manage API tokens in App Center portal**
  You can now easily create an API token for use with App Center REST APIs right from App Center portal by going to Settings -> API Tokens.

- **Build apps using latest Xcode versions and tooling**
  You can now build iOS apps built with Xcode 8.3.1 and Xcode 8.3.2 on App Center. Additionally, new builds will now be run using `xcodebuild`.

### **Apr 13, 2017**

- **Build your apps hosted from a VSTS repository**:
  In addition to previously supported GitHub and Bitbucket, you can now connect to your git source code repositories in Visual Studio Team Services (VSTS) to build your mobile apps.

- **XCUITest now available for testing iOS apps**:
  Use Apple's native test automation framework to test the behavior of your iOS apps. To access this framework, simply select this option in the "new test run" dialog.

- **Get the latest build from distribution with in-app updates**:
  Notify testers of the latest releases from inside your distributed application. Simply integrate the latest App Center SDK to automatically enable in-app update notifications each time you push a new release.

- **Auto-detect missing symbols in your Crash reports**:
  If you forget to upload symbols for your iOS app, App Center will remind you so your crash reports always include rich, helpful detail – making it easier for your developers to troubleshoot problems.

- **Distribute your app via the CLI**:
  Create & manage your distribution groups, upload your release and distribute it using the new CLI version 0.8.0.

### **Mar 30, 2017**
- Organizations: Share apps among your team members by creating and grouping them within an Organization. Find them under Settings.
- Bitbucket: Connect to source code repositories using GitHub... and now Bitbucket, too! VSTS support coming soon.
- New Build commands in the CLI: Trigger a new build for pre-configured branches, view the build status of a branch, download logs for a build and get a list of branches for your app using CLI v0.7.0.
- Build React Native apps with Yarn: Use the popular JavaScript package manager, Yarn, when building React Native apps. Dependency installs are now also faster and deterministic.
- Release notes from your commits: When building, release notes now auto-populate with the corresponding commit message.
- Xamarin Cycle 9: Build apps using Xamarin Cycle 9 (Service Release 0) and use NuGet URL v3. See the full list of cloud build machines.
- New iOS test devices: Choose iOS 10.3 devices to run tests using App Center Test service.

### **Mar 16, 2017**
- Choose and easily distribute your successfully signed build right from the Build service. This gives you greater control of which build you want your testers to validate. 
- Remove events from Analytics that you don’t want to see. You can easily get rid of events sent during testing & validation or even the ones you sent incorrectly.
- When you receive an email to install a build, you can now also sign-in with a different set of credentials and App Center will update your access automatically.  App Center now also displays the account you are using to login to install the build so there is no more confusion about it.

### **Mar 02, 2017**

- Upload symbol files and get symbolicated crash reports using the latest CLI, v0.6.0.
- Gain deeper insight into user engagement with up to 10 Analytics custom event properties
- Run automated UI tests for iOS 10 and Android 7 with Appium 1.6.3
- FIXED: Analytics events appear correctly even if you have an adblocker in the browser

### **Feb 14, 2017**

**Stack traces for failed Test service tests**

- Stack traces are now available for failed test steps in Test service, making it easy to identify the root cause of a failure. You'll find the stack trace in the **logs** section of the test report device view.

**Run Jest based tests for React Native apps**

- For React Native apps, you can now run Jest based unit tests during the build process. Enable unit tests during build setup and the snapshots of the app you checked in get compared to the test runs.

### **Jan 31, 2017**

**Espresso testing for Android apps**

- You can now run Espresso tests for Android apps using the Test service.

### **Jan 24, 2017**

**Build Android apps created using React Native**

- You can now use the Build service for Android apps created using React Native framework!

**Add testers for Distribution much easily now**

- You can now invite any tester to a distribution group through their email, without having them first join App Center.
- You can also delete distributed releases now

**Crash metrics now available**

- Get better insights of your apps with graphs about crashes per day, crash-free users and device distribution

We also updated our build machines to support the latest Xcode, Android, ProGuard and Node.js tooling

### **Dec 15, 2016**

* **Build support for Xamarin Android apps.**
  You can now set up builds for building Xamarin Android apps by going to the [Build](~/build/android/index.md) section.
* **Username made editable now!**
  You can now edit your user name from the use settings page.
* **CLI version 0.3.0:**
  This new version includes commands to create and manage your apps and API tokens.
* **iOS 10.2 support for crashes and test**
* **Xcode 8.2 support for building iOS apps**

### **Dec 8, 2016**

* **Events for Analytics.**
  Going beyond understanding how many and who your users are, you can now learn about your users' actions.
  Find "Events" under the Analytics section to get detailed data about your events and their properties.
  Read the [doc](~/analytics/event-metrics.md) and check out how to start learning from these events.
* **Build Support for Native Android Apps.**
  You can now set up builds for building native Android apps by going to the [Build](~/build/android/index.md) section.

### **Dec 1, 2016**

* **React Native has arrived.**
  You can build, capture crash reports and see analytics data for your iOS app. Read the [docs](~/sdk/getting-started/react-native.md) or start by connecting any React Native repository.
* **Xamarin developers can build for iOS.**
* **Auto-distribute from CI builds.**
  You can select a distribution group to automatically create a release from every CI build on a branch.
