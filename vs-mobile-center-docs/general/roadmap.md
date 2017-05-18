---
title: Mobile Center Roadmap
description: Mobile Center roadmap for future features/updates
keywords: roadmap
author: piyushjo
ms.author: piyushjo
ms.date: 04/23/2017
ms.topic: article
ms.assetid: 4866fa6c-ba1b-4656-89b0-5276c11a5a28
ms.service: mobile-center
---

# Product Roadmap

The list below presents the tentative roadmap for Mobile Center for the next 3-6 months.

## New Mobile Center services

* Push Notifications
    * Send notifications to:
        * Broadcast
        * Custom device list
        * Audiences
    * Create segments of users based on a set of custom and device properties.

* [CodePush](https://microsoft.github.io/code-push/) 
* Fast track distribution for React Native apps
* Users, Apps, Deployments and Releases from existing CodePush apps available in Mobile Center dashboard

## General

* Apps & data from HockeyApp visible in Mobile Center
* Apps & data from Xamarin Test Cloud visible in Mobile Center
* Organizations/Teams setup
* Ability to create organizations
* Ability to create teams with similar permissions

## SDK & CLI

* Universal Windows Platform (UWP) SDK support for Analytics and Crashes services
* Full CLI support for all Mobile Center services to enable automation

## Build service

* Support for customizing your build definitions: secret variables, auto-incrementing of version number and build scripts
* Carthage dependency manager support for iOS Objective C / Swift apps
* Support for C#7 and new Visual Studio 2017 project types by moving from xbuild to msbuild for Xamarin apps
* Improved code signing options for iOS apps, including automatic signing
* Ability to automate running UI tests in the Test service after each successful build

## Test service

* Full feature parity with Xamarin Test Cloud
* Support for Espresso & XCUITest

## Distribution service

* UDID (iOS device id) collection. Help with iOS app provisioning by automatically collecting UDID from all tester devices.
* Re-release builds. You will be able to select a release, and re-release it to an additional distribution group, without needing to download or re-upload the binary package. 

## Analytics service

* Continuous Export to Blob Storage
* Export to Applications Insights
* Export to SQL Database

## Crashes service

* Display of attachments sent from the Crashes SDK, in the portal
* Show the events that happened before a crash
* Missing Symbols experience to know which symbols need to be uploaded
