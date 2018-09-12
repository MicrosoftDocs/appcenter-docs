---
title: App Center Product Roadmap
description: App Center roadmap for future features/updates
keywords: roadmap
author: jwargo
ms.author: jowargo
ms.date: 09/12/2018
ms.topic: article
ms.assetid: 4866fa6c-ba1b-4656-89b0-5276c11a5a28
ms.service: vs-appcenter
---

# App Center Product Roadmap

This document provides a peek into what's next for [Visual Studio App Center](https://appcenter.ms), and lists the features we are currently committed to delivering. It is not a comprehensive list of all new features, but is intended to provide some visibility into our key investments. Due to the nature of the software development process and the resources we have available to work on these features, we're unable to guarantee delivery dates for these features, but know that we're working hard to make App Center better every day.

## Portal UI

* Update the App Center Portal UI to render properly on mobile browsers.  The App Center portal was originally designed for desktop browsers; to accommodate mobile browsers, we’ll deliver a series of updates to create a mobile-friendly experience for our customers. It won’t come at once, but will get better over time.

## Diagnostics

* Manual bug tracker support - Add support for manually adding a crash group as a bug in a third-party bug tracking tool (e.g. VSTS, Azure DevOps, Jira, GitHub). This enables developers to track work items outside of App Center.
* Search – Add the ability to search crashes by specific fields (e.g. method name, reason, etc.). This allows developers to find their crashes of interest in a much faster way.
* UI Improvements:
  + Merged view for crashes and errors for Xamarin apps. This provides a more intuitive visualization, allowing developers to prioritize the most crucial issues in their apps, whether these are errors or crashes. 
  + Improved experience for the symbol upload process. This allows developers to quickly identify and upload their missing symbols.

## Distribution

* iOS Native App Experience - View and install apps via a dedicated native app experience
* Publishing MAM wrapped iOS apps to the Intune store. Wrap your internal apps with [Microsoft Intune Mobile Application Management (MAM)](https://www.microsoft.com/en-us/cloud-platform/microsoft-intune-apps). All apps published to an Intune connection in your organization will be made MAM aware for better data protection. Your Intune administrator can apply policies from the Intune portal, and no steps are needed when publishing your apps.
* Two-factor authentication for Apple App Store – connect to the Apple App Store with Apple IDs that have two-factor authentication enabled.
* [SHIPPED] Android Native App Experience – View and install apps via a dedicated native app experience
* [SHIPPED] Azure Active Directory (AAD) support – Reuse existing Active Directory Groups to grant access to applications in App Center.
* [SHIPPED] Auto-Provisioning – iOS developers no longer need to know the UDIDs of tester devices. App Center automatically registers the new device, adds it to the app’s provisioning profile, re-signs the binary with the updated profile, and creates a new release that is ready for testers to install.
* [SHIPPED] Distribution Statistics - User metrics for distribution groups that give improved insight into tester engagement.
* [SHIPPED] Shared Groups – share a distribution group across multiple apps in an organization.
* [SHIPPED] Redesigned Tester Experience – complete overhaul of the user experience and visual design for our tester install portal.
* [SHIPPED] Mandatory App Updates – ensure testers update to the latest version of your app by marking the release as mandatory.
* [SHIPPED] Resend Tester Notifications – resend app invites and new release notifications to increase tester engagement in your app.
* [SHIPPED] Build Information in the Install Portal – When distributing a release using the App Center Build service, you can now see the branch name, commit hash, and commit message in addition to the release notes.

## SDK

* Add support for the [Unity](https://unity3d.com/) cross-platform game engine. This feature includes supporting Unity apps in the App Center portal and shipping the App Center SDK for Unity.  SDK will support App Center Analytics, Distribution, and Diagnostics at launch.

## Test

* Add support for running Xamarin.UITest iOS tests locally on iOS 12 devices and simulators.
* Add support for running iOS UI automation frameworks (Appium, XCUITest, Xamarin.UITest) in the App Center device lab.
* Add devices running iOS 12 to the App Center device lab.
* Add support for Apple's latest devices [announcement expected in September, 2018] to the App Center device lab.
