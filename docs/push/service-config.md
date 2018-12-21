---
title: Configuring the Push Service
description: Instructions for how to configure the App Center Push service for target platform push services.
keywords: app center, push
author: jwargo
ms.author: jowargo
ms.date: 12/21/2018
ms.topic: article
ms.assetid: ada98c59-08ce-4ae6-a5bf-3084f0dc6203
ms.service: vs-appcenter
ms.custom: push
---

# Configuring the Push service

The target platforms for your app (Apple iOS, Google Android, and Microsoft Windows for example) provide special services for delivering push notifications to devices on each platform. For example:

- Apple iOS devices use the [Apple Push Notification service (APNs)](https://developer.apple.com/notifications/) to deliver notifications.
- Google Android devices use the [Firebase Cloud Messaging (FCM)](https://firebase.google.com/docs/cloud-messaging/) service to deliver notifications.
- Windows devices use the [Windows Notifications Services (WNS)](https://docs.microsoft.com/en-us/windows/uwp/design/shell/tiles-and-notifications/windows-push-notification-services--wns--overview) to deliver notifications.

The App Center Push service (ACPs) abstracts away the complexities of dealing with multiple vendor services, and gives you a single interface for sending notifications to devices running your app, and single SDK to use in your apps to process notifications. However, before the ACPs can send notifications to your app's registered devices, you must provide configuration details for the third-party notification service your app's target platform uses.

## App project initial configuration

When you created your app project in App Center, you selected a target platform for your app, so App Center already knows what information it needs to send notifications to your app's users, now you simply have to provide it using the following instructions:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account, or an organization where the app project is defined, then select the app from the list that appears.
3. In the project navigator that opens, select **Push**.
4. At this point, App Center displays a **Getting Started** page describing how to add the App Center SDK to your project. Take a moment to follow these instructions, as this page will not appear again once you configure the app's push settings. Bookmark the documentation page linked here, just in case you need it again later. The page also displays your project's **App Secret**, but there are other ways to get that value later (it's displayed on the project overview page, just click **Overview** in the project navigator).
5. Click the **Next** button to continue (there may be several pages to view before you get to the configuration settings) page.
6. At this point, App Center displays a page with instructions for how to configure App Center to use the app's target platform notification service. Follow the instructions to complete the Push configuration.
7. Click the **Done** button when you're done with the configuration.

> [!NOTE]
> The settings you need here are provided by the vendor service, so you'll have to open up a separate browser or browser window, log into the platform vendor's service, and copy settings between the two browser tabs. As much as we'd like to automate all of this, or provide you with detailed, step-by-step instructions for completing this configuration, we can't. The vendors generally don't expose APIs for collecting the settings we need, and they regularly move things around in their admin UIs as they add new features. We'll provide the best instructions we can in the App Center portal and send you off to collect the data we need.

## Changing your project's Push configuration

The Push configuration UI described in the previous section only displays until you've completed the configuration. After that, there's a different process for accessing Push configuration settings:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account, or an organization where the app project is defined, then select the app from the list that appears.
3. In the project navigator that opens, select **Push**.
4. In the upper-right corner of the Push page that opens, click the wrench icon. App Center opens a configuration panel displaying the third-party push service settings.