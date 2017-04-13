---
title: Mobile Center Changelog
description: History of updates to the product
keywords: update,history
author: piyushjo
ms.author: piyushjo
ms.date: 04/13/2017
ms.topic: article
ms.assetid: 2168c052-73a5-43eb-a144-00c63d44d7a1
ms.service: mobile-center
---

# Changelog

### **Apr 13, 2017**
- **Build your apps hosted from a VSTS repository**: 
In addition to previously supported GitHub and Bitbucket, you can now connect to your git source code repositories in Visual Studio Team Services (VSTS) to build your mobile apps. 

- **XCUITest now available for testing iOS apps**:
Use Apple's native test automation framework to test the behavior of your iOS apps. To access this framework, simply select this option in the "new test run" dialog.

- **Get the latest build from distribution with in-app updates**:
Notify testers of the latest releases from inside your distributed application. Simply integrate the latest Mobile Center SDK to automatically enable in-app update notifications each time you push a new release. 

- **Auto-detect missing symbols in your Crash reports**: 
If you forget to upload symbols for your iOS app, Mobile Center will remind you so your crash reports always include rich, helpful detail – making it easier for your developers to troubleshoot problems.

- **Distribute your app via the CLI**:
Create & manage your distribution groups, upload your release and distribute it using the new CLI version 0.8.0. 

### **Mar 30, 2017**
- Organizations: Share apps among your team members by creating and grouping them within an Organization. Find them under Settings.
- Bitbucket: Connect to source code repositories using GitHub... and now BitBucket, too! VSTS support coming soon.  
- New Build commands in the CLI: Trigger a new build for pre-configured branches, view the build status of a branch, download logs for a build and get a list of branches for your app using CLI v0.7.0.
- Build React Native apps with Yarn: Use the popular JavaScript package manager, Yarn, when building React Native apps. Dependency installs are now also faster and deterministic.
- Release notes from your commits: When building, release notes now auto-populate with the corresponding commit message.  
- Xamarin Cycle 9: Build apps using Xamarin Cycle 9 (Service Release 0) and use NuGet URL v3. See the full list of cloud build machines.
- New iOS test devices: Choose iOS 10.3 devices to run tests using Mobile Center Test service.

### **Mar 16, 2017**
- Choose and easily distribute your successfully signed build right from the Build service. This gives you greater control of which build you want your testers to validate. 
- Remove events from Analytics that you don’t want to see. You can easily get rid of events sent during testing & validation or even the ones you sent incorrectly.   
- When you receive an email to install a build, you can now also sign-in with a different set of credentials and Mobile Center will update your access automatically.  Mobile Center now also displays the account you are using to login to install the build so there is no more confusion about it.  

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

-   You can now invite any tester to a distribution group through their email, without having them first join Mobile Center.
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
Read the [doc](~/analytics/understand-events.md) and check out how to start learning from these events.
* **Build Support for Native Android Apps.**
You can now set up builds for building native Android apps by going to the [Build](~/build/android/index.md) section.

### **Dec 1, 2016**
* **React Native has arrived.**
You can build, capture crash reports and see analytics data for your iOS app. Read the [docs](~/sdk/getting-started/react-native.md) or start by connecting any React Native repository.
* **Xamarin developers can build for iOS.**
* **Auto-distribute from CI builds.**
You can select a distribution group to automatically create a release from every CI build on a branch.
