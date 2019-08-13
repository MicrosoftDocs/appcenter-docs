---
title: Distribute Your Apps with App Center
description: "How to distribute your Android, iOS, macOS, and UWP app builds to your end users in App Center."
keywords: distribution
author: gaknoll
ms.author: gaknoll
ms.date: 08/01/2019
ms.topic: article
ms.assetid: dda0e037-9f42-4e63-8ef8-e645d3e8fbda
ms.service: vs-appcenter
ms.custom: distribute
---

# Distribute

App Center Distribute is a tool for developers to quickly release builds to end user devices. Distribute supports Android, iOS, macOS, UWP, WPF and WinForms apps, allowing you to manage app distribution across multiple platforms all in one place. With a complete [install portal experience](~/distribution/testers/index.md), Distribute is not only a powerful solution for beta app tester distribution but also a convenient alternative to distribution through the public app stores. Automate your distribution workflow even further with our [App Center Build](~/build/index.md) and [public app store integrations](~/distribution/stores/index.md). Upon the completion of a successful build, automatically submit your app release to TestFlight, Apple App Store, Google Play, and Intune. 

## Getting Started

Distributing with App Center is quick and easy, and does not require the App Center SDK to get started. 

1. [Add collaborators to your app](~/dashboard/creating-and-managing-apps.md) to collaborate and grant access to all releases.
2. [Create Distribution Groups](~/distribution/groups.md) to organize your testers and manage access.
3. [Upload](~/distribution/uploading.md) a new application build and select the desired users and distribution groups for the release. 
   - After you have distributed a new release, App Center sends an email to the chosen users notifying them that a new build is available for them to download. 
   - Integrate the App Center SDK and enable [In-App Updates](~/distribution/inappupdates.md) to help your users stay always on the latest release.
4. [Install the release](~/distribution/installation.md) onto your device by clicking on the link in the email. 

If you are distributing an iOS build, learn more about how we assist with the [collection of device UDIDs](~/distribution/auto-provisioning.md) for device provisioning or enable you to [automate the whole process with auto-provisioning](~/distribution/auto-provisioning.md).  

## Roadmap

Do you not see your feature or are you curious about what new features are coming soon? We invite you to help shape the future of App Center by [sharing your feedback on our monthly public roadmap](https://github.com/Microsoft/appcenter/wiki/Iteration-Plans) or by [submitting and upvoting feature requests](https://github.com/Microsoft/appcenter/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+sort%3Areactions-%2B1-desc+label%3A%22feature+request%22+).
