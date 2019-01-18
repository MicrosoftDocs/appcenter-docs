---
title: App Center Product Roadmap
description: App Center roadmap for future features/updates
keywords: roadmap
author: jwargo
ms.author: jowargo
ms.date: 01/17/2019
ms.topic: article
ms.assetid: 4866fa6c-ba1b-4656-89b0-5276c11a5a28
ms.service: vs-appcenter
---

# App Center Product Roadmap

This document provides a peek into what's next for [Visual Studio App Center](https://appcenter.ms), and lists the features we are currently committed to delivering. It is not a comprehensive list of all new features, but is intended to provide some visibility into our key investments. Due to the nature of the software development process and the resources we have available to work on these features, we're unable to guarantee delivery dates for these features, but know that we're working hard to make App Center better every day.

As features ship, we'll mark them as [SHIPPED] here for a few weeks before removing them from the roadmap. As soon as we mark them as shipped here, we'll add them to the [App Center Changelog](~/general/changelog.md).

## Portal UI

* Update the App Center Portal UI to render properly on mobile browsers. The App Center portal was originally designed for desktop browsers; to accommodate mobile browsers, we’ll deliver a series of updates to create a mobile-friendly experience for our customers. It won’t come at once, but will get better over time.
* [SHIPPED] Upload app icon – Allows App Center users to upload an app icon visible in the App Center portal and notification emails. The uploaded app icon overrides the icon extracted from an uploaded build. This gives customers a more customizable product and an easier way to distinguish apps in the landing page.

## Build

* [SHIPPED] iOS App Extension Support - Configure, build, and sign an iOS app with app extensions. Build and ship robust iOS apps with various app extensions. Supports Swift, Objective-C and React Native apps today.

## Diagnostics

* Full crash reporting capabilities for WPF Windows apps
* Full crash reporting capabilities for UWP Windows apps
* Search by User ID – Ability to search for crashes for a specific user ID.
* User Identification – Attach a user identifier to all diagnostics logs (crashes and errors), expose it in the UI. This will allow you to know what user is affected by each crash or error instance.
* [SHIPPED] Search – Add the ability to search crashes by specific fields (e.g. method name, reason, etc.). This allows developers to find their crashes of interest in a much faster way.
* [SHIPPED] Diagnostics to General Availability:
  + Diagnostics is becoming Generally Available very soon. This means that Diagnostics will be ready for your production apps, with a much more stable and performant offering.
* [SHIPPED] Diagnostics UI Improvements:
  + Merged view for crashes and errors for Xamarin apps. This provides a more intuitive visualization, allowing developers to prioritize the most crucial issues in their apps, whether these are errors or crashes.
  + Improved experience for the symbol upload process. This allows developers to quickly identify and upload their missing symbols.
* [SHIPPED] NDK – Improve the support for Android NDK. This enables developers to track their native Android crashes in App Center.
* [SHIPPED] ProGuard – Improve the support for ProGuard in App Center.

## Distribution

* Improved tester experience - Combine the install page with the App Center portal for a faster and better distribution experience.
* Specific download page for releases - Share single releases with anyone that has access to the link.
* Sparkle - Support to use [Sparkle](https://sparkle-project.org) for macOS beta distribution.
* Notify testers optional - Choose whether or not to notify testers when releasing a new versions to a distribution group.
* Expose Fastlane logs - Download Fastlane logs when debugging a failed TestFlight or App Store release.
* [SHIPPED] Android Native App Experience – View and install apps via a dedicated native app experience.

## SDK

* Carthage support - Ability to add App Center frameworks to your iOS and macOS application using Carthage.
* [SHIPPED] Pause and Resume data transmission – Adding APIs that let you control when to send data and can be called by application code to signal the SDK to pause/resume transmission. When the transmission is paused, the SDK continues to collect the Analytics data, it just doesn’t send the data to App Center backend until the operation is resumed.	* Carthage support - Ability to add App Center frameworks to your iOS and macOS application using Carthage.
* [SHIPPED] Set SDK storage size – This API will let you configure the size of SDK storage for scenarios where developers need the ability to store as many logs as possible when the device is offline, or when they want to send the data only few times a day. In those cases, you can configure the storage size according to your needs.

## Test

* Add support for Apple iPhone XS, iPhone XS Max, iPhone XR to the App Center device lab.
* Add support for Appium 1.9.X.
* Add support for iOS 12.1 (XCUITest, Xamarin.UITest)
* [SHIPPED] Add support for running Xamarin.UITest iOS tests locally on iOS 12 devices and simulators.
* [SHIPPED] Add support for running iOS UI automation frameworks (Appium, XCUITest, Xamarin.UITest) in the App Center device lab.
* [SHIPPED] Add devices running iOS 12 to the App Center device lab.

## Push

* [SHIPPED] Support sending Push notifications with Unity applications.
