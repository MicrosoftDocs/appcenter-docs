---
title: "Visual Studio Mobile Center | Getting Started & Documentation"
description: "Setup your app to distribute to your beta testers on every commit, see live user data, and test your app on 1000’s of real devices."
keywords: mobile center
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: landing-page
ms.assetid: de216172-7d5b-4cb8-9818-6c8b0b9d6c9a
ms.service: mobile-center
---

# Welcome to Mobile Center

[Mobile Center](https://mobile.azure.com) brings together multiple services, commonly used by mobile developers, into a single, integrated product. You can build, test, distribute, and monitor your mobile apps and easily add backend cloud services to scale your app to millions of users on demand.

You can choose from the following set of services as is appropriate for your mobile app:

## Lifecycle services

For shipping your mobile apps faster, [Mobile Center](https://mobile.azure.com) offers three key lifecycle services:

###Build
With Build, you can manage your source code in a Git repository and create an installable app package automatically with every commit or push. Best of all, you don't need to provision any agents or external machines that run macOS to build your iOS apps. Mobile Center takes care of this and will compile your iOS and Android app right from the source code with no manual setup on your side. Right now, Mobile Center only supports GitHub repositories. Bitbucket and VSTS integration is on the roadmap.

###Test
Once the build process is finished, you want to run your tests on real devices. Test Cloud offers more than 2000 real devices in 400 unique device configurations to validate your mobile app's behavior. Tests can be written for your iOS and Android apps in C# (UITest), Ruby (Calabash), or Java (Appium). This service is backed by Xamarin Test Cloud.

###Distribute
When all tests are green, your mobile app needs to get into the hand of testers which is exactly what the Distribute feature offers. Enter a set of e-mails called Distribution Groups and your users can install the app directly on their phones, much as they'd download an app from the app store. This service is backed by the HockeyApp's distribution feature.

Mobile Center Build, Test and Distribute work together seamlessly, so each of your code commits gets the maximum level of validation. None of these features require any modification of your code.

## Monitoring services

Once your app is deployed via Mobile Center or the app stores, you can monitor it with the following services:

###Crashes
You don't want your app to crash, but it happens. And when it does, you need to have fast and precise info about what went wrong and why. Once you integrate the Crashes module of the Mobile Center SDK, you will be able to collect crashes from all devices, prioritize them based on the number of users seeing the crash, and get the full stack traces to help you fix them. This service is backed by the HockeyApp's crash reporting feature.

###Analytics
You want to know how many users are launching your app, where they are located, which language they speak, and how they are using your app? Once you integrate the Analytics module of the Mobile Center SDK, you will be able to get information about the number of daily, weekly, and monthly users, session duration, the top devices and OS versions, your app's world map, and a list of most used languages. Once you also add our event tracking, you can collect rich behavioral analytics data to understand which feature is used most often, which screens are never seen, or how your app users find in-app purchases.

## Mobile backend services

You can use any of the Mobile Center backend services for authentication, data sync, and push notifications while implementing your app. These features require you to integrate the Mobile Services SDK and to connect with a Microsoft Azure subscription:

###Identity
The Identity service offers an easy and quick way to authenticate your mobile app's users with their Google, Facebook, Twitter or Microsoft account.

###Tables
The Tables service lets you build a cloud store for viewing, adding or modifying app data even when there's no network connection. You can create and manage your database tables right from Mobile Center, and with a few lines of code enable offline syncing of your data between the mobile device and the backend.

###Push notifications (Coming Soon)
Push notification service will enable you to easily send targeted push notifications to your mobile app users.

## Are you a HockeyApp, Xamarin Test Cloud, Xamarin Insights, or Azure Mobile Engagement user?

Make sure to read this [guidance document](general/guidance.md).

## Pricing

Mobile Center is free during the preview. Read about our [pricing plans](general/pricing.md) and give us your feedback.

## Mobile Center Roadmap

Mobile Center is updated with new features on a weekly basis. Read through our [product roadmap](general/roadmap.md) for the next 3-6 months and give us your feedback.
