---
title: Push to User
description: Instructions on how to send push notifications to users.
keywords: app center, push, user
author: jwargo
ms.author: jowargo
ms.date: 12/20/2019
ms.topic: article
ms.assetid: df3187de-0295-475e-9be2-4f46034cdcbe
ms.service: vs-appcenter
ms.custom: push
---

# Push to User

Along with sending notifications to devices directly or via Audiences, App Center Push enables customers to send notification messages to all of the devices associated with one or more users. App Center's ability to do this is controlled by the developer setting the user's identity directly through the App Center SDK. The app user's identity must be set using this option to send notifications to users.

> [!NOTE]
> The Push to User feature currently supports sending notifications to devices running Android, iOS, and Windows (for UWP apps).

## Setting user identity

The following sections briefly describe how to set an app user's identity using App Center.

### Setting user identity using the SDK

Many apps use proprietary methods or third-party services to authenticate users in the app. To accommodate this use case, the App Center SDK offers a method the app uses to set the captured user identifier and pass it to App Center. With this approach, the app executes whatever process is wants to identify the user, once the app has a unique identifer for the user, it sets the user identity in App Center through the SDK.

To set an app user's identity using the App Center SDK, refer to the following articles based on the target platform:

+ [Android SDK](~/sdk/other-apis/android.md#identify-users)
+ [iOS SDK](~/sdk/other-apis/ios.md#identify-users)
+ [macOS SDK](~/sdk/other-apis/macOS.md#identify-users)
+ [React Native SDK](~/sdk/other-apis/react-native.md#identify-users)
+ [Unity SDK](~/sdk/other-apis/unity.md#identify-users)
+ [UWP SDK](~/sdk/other-apis/uwp.md#identify-users)
+ [Xamarin SDK](~/sdk/other-apis/xamarin.md#identify-users)

> [!NOTE]
> The user's identity set through the SDK can be whatever the developer wants it to be: the user's name, email address, phone number, or some other unique identifier.

## Sending Notifications to Users

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the user account or the organization where the app project is defined, then select the app project from the list that appears.
3. In the project navigator that opens, select **Push**.
4. In the upper-right corner of the page, click the **Send notification** button.

At this point, App Center opens the **Send notification** wizard to walk you through the process of creating a campaign and sending the notification. The first step in the process is to define the internal name for the campaign, and the content that's sent to target devices by App Center.

![App Center Push Campaign Compose page](~/push/images/campaign-compose.png)

1. Populate the **Campaign Name** field with a descriptive name for the campaign. The value you provide will display in the App Center campaign list page.
2. (optional) Populate the **Title** field with an optional title for the notification sent to target devices.
3. Populate the **Message** field with the content for the notification message. Message content is limited to 4,000 characters.
4. Use the **Custom data** area of the form to define up to 20 key/value data pairs that you want included with the message. Click the **+** button to add a key/value pair. Click the **-** button to remove a key/value pair from the message.

> [!TIP]
> Custom data values enable campaigns to pass data into an application or trigger one or more actions within your client application. You can pass data directly to the app through a campaign, or send a URL the app uses to retrieve data. Applications can also use data values to set configuration options with in the application, changing app behavior through the campaign. For an implementation example, refer to [A/B Test All the Things: React Native Experiments with App Center](https://blogs.msdn.microsoft.com/vsappcenter/ab-test-all-the-things-react-native-experiments-with-app-center/).

When you're done populating the form, click the **Next >** button to continue.

On the next page, select **User list** as the target for the notification.

### SDK set identity

To send a notification to one or more users, the app must set the User ID through the SDK, and keep a copy of the identity later in order to identify target users for notifications. Developers typically store the ID in the app's backend system for reference later. Collect up to 100 user identifiers, build them into a comma-separated list, and paste them into the input field shown in the following figure.

![App Center Push User ID input](~/push/images/user-id-input.png)

> [!NOTE]
> The user's identity set through the SDK can be whatever the developer wants it to be: the user's name, email address, phone number, or some other unique identifier.

When all of the targeted users are in the list, click the **Next>** button to complete the wizard and send the notification.

> [!NOTE]
> The Push to User feature limits notifications to 100 users and up to a maximum of 1,000 target devices.
