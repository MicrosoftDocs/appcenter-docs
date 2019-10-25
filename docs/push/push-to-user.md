---
title: Push to User
description: Instructions on how to send push notifications to users.
keywords: app center, push, user
author: jwargo
ms.author: jowargo
ms.date: 10/24/2019
ms.topic: article
ms.assetid: df3187de-0295-475e-9be2-4f46034cdcbe
ms.service: vs-appcenter
ms.custom: push
---

# Push to User

Along with sending notifications to devices directly or via Audiences, App Center Push enables customers to send notification messages to all of the devices associated with one or more users. App Center's ability to do this is controlled by the developer setting the user's identity directly through the App Center SDK or configuring the application to use the App Center Auth service.  The app user's identity must be set using one of these options to send notifications to users.

> [!NOTE]
> The Push to User feature currently supports sending notifications to devices running Android and iOS.

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

### Setting user identity using App Center Auth

The App Center Auth service delivers an easy way for apps to authenticate users using a variety of third-party identity providers (like Facebook, Google, Microsoft). Auth handles signing in users and assigns a unique Account ID for the user. Refer to the App Center Auth documentation for additional information about this service.

## Sending Notifications to Users

Since App Center supports setting user identity two different ways (as described in the previous sections), the approach a developer uses to send a notification to one or more users through the App Center portal varies depending on how App Center obtained the target user's identity.

> [!NOTE]
> The two supported methods for sending notifications to users are mutually exclusive; you can only work with one approach at a time. If an app is configured for App Center Auth *and* sets user identity manually using the SDK, you can use this UI (or the App Center Push API) to send notifications to users via App Center Auth or the SDK set identity, but not both. If you want to use both, you must submit separate notification requests for each.

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

On the next page, select **User list** as the target for the notification. This is where the UI will change based on the app's configuration in App Center:

+ If App Center Auth is configured for the app, the Push Wizard will display a search field used to search for users and add them to the target user list.
+ If App Center Auth is not configured for the app, the Push Wizard will display an input field to populate with a comma separated list of user identities set through the SDK.

The following sections will describe how to use each of the user identity input options.

> [!NOTE]
> App Center tries to offer the best option first (based on the app's configuration), but don't worry, you can easily switch between the input modes with a single click. You'll see how in a minute.

### App Center Auth set identity

The App Center portal option for sending notifications to users through App Center Auth assumes you have the user's name or email address to search on. When sending to the same users through the App Center API, you'll use the user's Account ID (as described in the [App Center Push API documentation](~/push/rest-api.md#user-identity-set-using-auth)) as the API won't search for users.

In the user input field, type the user's first name, last name, or email address; App Center will search the App Center Auth user database for this app for users that match the search criteria. When you find a match, select the matching user and the user will be added to the list.

![App Center Push Account ID Search](~/push/images/account-id-search.png)

If you want to send to user identities defined using the App Center SDK, click the **Switch to User ID input** link.

Repeat the search until you've added all of the users to the list.

![App Center Push user list](~/push/images/account-id-search-finished.png)

When all of the targeted users are in the list, click the **Next>** button to complete the wizard and send the notification.

> [!NOTE]
> The Push to User feature limits notifications to 100 users and up to a maximum of 1,000 target devices.

If you're using the Push to User feature and see the error message listed in the following figure, this indicates that your App Center user account doesn't have **Read** access to the Azure AD B2C tenant configured in App Center Auth. If you believe that your App Center account does have the correct access, log out of the App Center portal and log back in and try it again. For information about how to configure access, please refer to the App Center Auth documentation.

![App Center Push Authorization Error](~/push/images/push-to-user-access-error.png)

### SDK set identity

To send a notification to one or more users, the app must set the User ID through the SDK, and keep a copy of the identity later in order to identify target users for notifications. Developers typically store the ID in the app's backend system for reference later. Collect up to 100 user identifiers, build them into a comma-separated list, and paste them into the input field shown in the following figure.

If you want to send to user identities defined using App Center Auth, click the **Switch to user search** link.

![App Center Push User ID input](~/push/images/user-id-input.png)

> [!NOTE]
> The user's identity set through the SDK can be whatever the developer wants it to be: the user's name, email address, phone number, or some other unique identifier.

When all of the targeted users are in the list, click the **Next>** button to complete the wizard and send the notification.

> [!NOTE]
> The Push to User feature limits notifications to 100 users and up to a maximum of 1,000 target devices.
