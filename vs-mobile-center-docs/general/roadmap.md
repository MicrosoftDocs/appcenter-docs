---
title: Mobile Center Roadmap
description: Mobile Center roadmap for future features/updates
keywords: roadmap
author: joemellin
ms.author: joemel
ms.date: 06/02/2017
ms.topic: article
ms.assetid: 4866fa6c-ba1b-4656-89b0-5276c11a5a28
ms.service: mobile-center
---

# Product Roadmap

The list below presents the tentative roadmap for Mobile Center for the next 3-6 months.

## New Mobile Center services

* [CodePush](https://microsoft.github.io/code-push/) 
	* Fast track distribution for React Native apps
	* Users, Apps, Deployments and Releases from existing CodePush apps available in Mobile Center dashboard


## General

* Apps & data from HockeyApp visible in Mobile Center
* Apps & data from Xamarin Test Cloud visible in Mobile Center
* Organizations/Teams setup
	* Ability to create organizations
	* Ability to create teams with similar permissions
* Email, Webhooks & Slack notifications 
* Issue tracker integration
	
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

* Re-release builds. You will be able to select a release, and re-release it to an additional distribution group, without needing to download or re-upload the binary package.
* Public distribution groups. Public distribution groups all release via a URL with no user login / account creation needed.
* Installation of previous version. You will be able to install not just the latest version, but any previous version you have had access to.
* Support for release to InTune cloud. You can create new stores that target release to InTune cloud.
* Support for release to Apple Store. You can create new stores that target release to the production Apple Store.
* Support for release to Windows Store. You can create new stores that target release to the production Windows Store.
* Native Apps. You will be able to view and install apps via a dedicated native app experience.
* Markdown release notes. You will be able to write release notes that include markdown styling. 


## CodePush service

* Apache Cordova support
* Bundle signing 


## Crashes service

* Display of attachments sent from the Crashes SDK, in the portal
* Show the events that happened before a crash
* Missing Symbols experience to know which symbols need to be uploaded


## Analytics service

* Continuous Export to Blob Storage
* Export to Applications Insights


## Push Notifications

* React Native:
    * Custom Properties
    * Push Callbacks

