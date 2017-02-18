---
title: Mobile Center Changelog
description: History of updates to the product
keywords: update,history
author: piyushjo
ms.author: piyushjo
ms.date: 02/16/2017
ms.topic: article
ms.assetid: 2168c052-73a5-43eb-a144-00c63d44d7a1
ms.service: mobile-center
---

# Changelog

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
