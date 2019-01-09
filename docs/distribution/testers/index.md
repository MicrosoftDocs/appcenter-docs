---
title: Getting Started for Testers
description: Guide to get started as an App Center tester
keywords: distribution
author: Zakeelm
ms.author: Zakeelm 
ms.date: 11/05/2018
ms.topic: article
ms.assetid: 691fe32c-2b42-47a9-9722-ee4204f86268
ms.service: vs-appcenter
ms.custom: distribute
---

# Getting started for testers

Navigating through any new tool can be pretty overwhelming as a tester. There's often so many different elements and hurdles associated with getting builds on your devices, which can ultimately make testing apps a frustrating experience. Due to this, we have created a very simple workflow in App Center for testers. In addition, we've created this guide to aid in any parts of testing in App Center that may seem unclear. We know that testing is an integral part of the app development process so we aim to ensure a smooth and successful experience.

## What is App Center?

App Center is a continuous integration, delivery, and learning solution for Android, iOS, macOS, and Windows apps. App Center enables developers to ship apps faster and with more confidence by automating the development life cycle.

App Center offers many different services, but the most relevant for testing is our Distribution service. App Center offers functionality that allows developers to release their application binaries to you, a tester, via download link, the App Center install portal, or our native app (android only).  

This page assumes that you're attempting to get started as a tester and have been invited to test an App Center app. If so, you're in the right place!

> [!VIDEO https://www.youtube.com/embed/RDluKlJneZA]

## First Steps

Whenever you're first invited to test an app by a developer, you should receive an email notifying you of this. This email includes a button that enables you to create an App Center account if you don't currently have one. If you have an account you can login and view your apps. After logging in, the steps for installing your apps are slightly different depending on the OS you are testing on.

You can create an account before a developer officially invites you to test an application, you can sign up on the [App Center website](https://appcenter.ms/signup)

To get started with installing the app you've been invited to test, please select one of the following:

- [Testing Android Apps](./testing-android.md)
- [Testing iOS Apps](./testing-ios.md)
- [Testing macOS Apps](./testing-macos.md)

## Stop Testing

In addition to testing your apps, we also allow you to stop testing an app and remove yourself from all distribution groups for that app. By doing so, you will no longer receive notification associated with that app and you will no longer have access to the app in both the developer portal and the install portal. In order to remove yourself from an app, the following conditions must be true:

- You are not an app collaborator for the app
- You are not part of a shared group for the app
- You are not part of an AAD group for the app

If the above conditions apply to you, you will be able to remove yourself as a tester for an app. In order to do so, execute the following steps:

1. Navigate to the [App Center Install Portal](https://install.appcenter.ms/) on your mobile device.
2. Select the Aap you would like to stop testing.
3. Located on the top right of the screen, click the 3 dots menu item.
4. Click the **Stop testing app** button.

After successfully completing these 3 steps, you will no longer be a tester of the app.