---
title: Mobile Center Roadmap
description: Mobile Center roadmap for future features/updates
keywords: roadmap
author: piyushjo
ms.author: piyushjo
ms.date: 02/21/2017
ms.topic: article
ms.assetid: 4866fa6c-ba1b-4656-89b0-5276c11a5a28
ms.service: mobile-center
---

# Product Roadmap

The list below presents the tentative roadmap for Mobile Center for the next 3-6 months.

## New Mobile Center services

* Push Notifications
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

* Universal Windows Platform (UWP) support
* Full CLI support for Mobile Center operations to enable automation
* In-app update feature for Distribution service

## Build service

* Support for Visual Studio Team Services & Bitbucket as source code repositories
* Ability to distribute a single build to an existing distribution group
* Ability to automate running UI tests in the Test service after each successful build
* Support for customizing your build definitions: secret variables, auto-incrementing of version number and build scripts

## Test service

* Full feature parity with Xamarin Test Cloud
* Support for Espresso & XCUITest

## Distribution service

* In-app updates. New releases to a distribution group will trigger an in-app update for all installed versions.
* UDID (iOS device id) collection. Help with iOS app provisioning by automatically collecting UDID from all tester devices.
* Allow login with a different email account from the email address the notification was originally sent to.
* Re-release builds. You will be able to select a release, and re-release it to an additional distribution group, without needing to download or re-upload the binary package. 

## Analytics service

* Ability to remove events (useful for removing events sent during test from Analytics visualization)

## Crashes service

* Display of attachments sent from the Crashes SDK, in the portal
* Missing Symbols experience to know which symbols need to be uploaded
