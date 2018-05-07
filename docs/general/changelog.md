---
title: App Center Changelog
description: History of updates to the product
keywords: update,history
author: jwhitedev
ms.author: jawh
ms.date: 05/02/2018
ms.topic: article
ms.assetid: 2168c052-73a5-43eb-a144-00c63d44d7a1
ms.service: vs-appcenter
---
# Changelog

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

### **April 9, 2018**
- **Build support for Xcode 9.3**:
Build your iOS and macOS apps using Xcode 9.3.

### **April 6, 2018**
- **CLI version 1.0.15 released**:
Added bug fixes for JsZip in Test Cloud.

### **April 2, 2018**
- **CLI version 1.0.14 released**:
Added --test-output-dir and --merge-nunit-xml options to appcenter test run commands.
Misc. fixes to codepush commands.

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
You now have the ability to create variables for sensitive infromation to include in your build process without including it in your repository.

- **UWP Crash preview released**:
Visual Studio App Center now offers a preview of our support for getting Crash data from your UWP apps.

- **macOS preview released**:
Visual Studio App Center now offers preview support for macOS apps with our Build, Distribute, Analytics, Crash and Push Notifications services.

- **HockeyApp side by side enabled**:
We have now enabled a HockeyApp and App Center side by side experience for all HockeyApp customers. To view the side by side experience, just login to App Center using your HockeyApp credentials. Your app data has already been synced - allowing you to explore App Center while continuing to use HockeyApp as normal.

### **November 15, 2017**
- **Visual Studio App Center launches!**:
Visual Studio App Center is made [generally available](https://blogs.msdn.microsoft.com/vsappcenter/introducing-visual-studio-app-center/) to everyone and is officially rebranded from Visual Studio Mobile Center to Visual Studio App Center.

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
Notify 3rd party applications and VSTS when events like crash groups are created or a new version of your app is released. Check out our docs for more details for configuring [Webhooks](~/dashboard/webhooks/index.md) and [VSTS integration](~/dashboard/bugtracker/index.md)

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
The build VMs come now with fastlane and the App Center CLI pre-installed, so you can take the customization of your builds even a step further.

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
You can now build iOS apps built with Xcode 8.3.1 and Xcode 8.3.2 on App Center. Additionally, new builds will now be run using xcodebuild.

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

-   You can now run Espresso tests for Android apps using the Test service.

### **Jan 24, 2017**

**Build Android apps created using React Native**

-   You can now use the Build service for Android apps created using React Native framework!

**Add testers for Distribution much easily now**

-   You can now invite any tester to a distribution group through their email, without having them first join App Center.
-   You can also delete distributed releases now

**Crash metrics now available**

-   Get better insights of your apps with graphs about crashes per day, crash-free users and device distribution

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
