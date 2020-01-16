---
title: Sending Push Notifications
description: Instructions on how to send push notifications using the App Center portal.
keywords: app center, push
author: jwargo
ms.author: jowargo
ms.date: 04/30/2019
ms.topic: article
ms.assetid: 4db077ee-b9bf-4dc7-ac21-e8ecc8ee840e
ms.service: vs-appcenter
ms.custom: push
---

# Sending Push Notifications

The Visual Studio App Center Push (ACP) service offers two ways to send notifications to registered devices:

+ Using the App Center Portal (described in this document)
+ Using the [App Center Push API](~/push/rest-api.md)

## Create a notification

To create a notification using ACP, complete the following steps:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account or the organization where the app project is defined, then select the app project from the list that appears.
3. In the project navigator that opens, select **Push**.
4. If you've already configured ACP, then App Center opens the app project's Push **Notifications** section and lists the existing **Campaigns** for the selected app. If App Center opens the Push getting started page, then you've not configured the service; complete the App Center Push configuration as described in [Configuring the Push Service](~/push/service-config.md) before returning here.
5. In the upper-right corner of the page, click the **Send notification** button.

At this point, App Center opens the **Send notification** wizard and walks you through the process of creating a campaign and sending the notification. The process consists of the following steps:

1. **Compose**: Define your internal name for the campaign, the title and content for the message, and any custom data (key/value pairs) you want included with the message.
2. **Target**: Specify the target audience for the campaign.
3. **Review**: Review the campaign settings one last time.
4. **Send**: Send the notification to the target audience.

The following sections describe each step in the process in greater detail.

### Compose

The first step in the process is to define the internal name for the campaign, and the content that's sent to target devices by App Center.

![App Center Push Campaign Compose page](~/push/images/campaign-compose.png)

1. Populate the **Campaign Name** field with a descriptive name for the campaign. The value you provide will display in the App Center campaign list page.
2. (optional) Populate the **Title** field with an optional title for the notification sent to target devices. The value you provide here will be #####
3. Populate the **Message** field with the content for the notification message. Message content is limited to 4,000 characters.
4. Use the **Custom data** area of the form to define up to 20 key/value data pairs that you want included with the message. Click the **+** button to add a key/value pair. Click the **-** button to remove a key/value pair from the message.

> [!TIP]
> Custom data values enable campaigns to pass data into an application or trigger one or more actions within your client application. You can pass data directly to the app through a campaign, or send a URL the app uses to retrieve data. Applications can also use data values to set configuration options with in the application, changing app behavior through the campaign. For an implementation example, refer to [A/B Test All the Things: React Native Experiments with App Center](https://blogs.msdn.microsoft.com/vsappcenter/ab-test-all-the-things-react-native-experiments-with-app-center/).

When you're done populating the form, click the **Next >** button to continue.

### Target

When sending notifications through ACP, you can target destination devices (notification recipients) in the following ways:

+ **All registered devices**: Sends notifications to all registered devices. Depending on the size of your target audience, this could take a long time to complete.
+ **Audiences**: Sends notifications to a segment of your app's registered device audience based on a set of device and custom properties. See [Audiences](#audiences) below for additional information.
+ **Device list**: Sends notifications to up to 20 devices (using the install IDs for the target devices). When you select this option, populate the input field with a list of the Install IDs for the devices you want to send the notification to, separating IDs with commas.
+ **User**: Send notifications to all of the registered devices for up to 100 users. The user identity value used can be set using the App Center SDK or the App Center Auth service.

In the wizard's **Target** panel, make the selection that makes the most sense for your campaign.

> [!NOTE]
> The only way to get the Install ID for a particular device is through the [App Center SDK](https://docs.microsoft.com/appcenter/sdk/other-apis/android#identify-installations). Your app must call the appropriate SDK method depending on the target platform (Android, iOS, Windows, etc.) to collect the ID, then share it with you (perhaps storing it in a server-based database) for use later.

![App Center Push Campaign Target page](~/push/images/campaign-target-device-list.png)

### Review and send the message

In the wizard's last pane, App Center summarizes the settings for the Campaign. To send the notification, click the **Send notification** button. To change the campaign before committing, click the **< Back** button.

When you're done, App Center returns to the Campaigns list; select (click on) the campaign to check delivery progress.

## Audiences

Audiences allow App Center users to define a segment of an app's user base using a set of properties (both pre-defined and custom) and send them targeted notifications. App Center allows customers to create multiple audiences in an app project (up to 200 audiences per app with a maximum of 1,000 devices per audience) and stores them for easy reuse.

There are two types of properties you can use to define audiences:

+ Device properties
+ Custom properties

### Device properties

The App Center SDK collects device properties automatically, retrieving them from the client application and exposing them through App Center for your use when defining audiences. The available properties are:

+ API Level (example: `2`)
+ App Version (example: `1.0.0`)
+ Country (example: `Spain`)
+ Device Model (example: `Pixel 2 XL`)
+ Language (example: `DE`)
+ Mobile Carrier (example: `AT&T`)
+ OEM (Original Equipment Manufacturer) (example: `Samsung`)
+ Screen Size (example: `1024X768`)

### Custom properties

Custom properties are custom key-value pairs defined by the developer and set in the application. They allow you to segment your app's user population based on something from your app (user settings, interests, tags, etc.). You can define a maximum of 60 custom properties per app project.

Some examples of possible custom properties are:

| Key              | Value      |
| ---------------- | ---------- |
| Type             | premium    |
| FavoriteSport    | soccer     |
| MusicPreference  | electronic |

Developers set these custom properties in an app using the SDK methods for each target platform:

+ [Android](~/sdk/other-apis/android.md#use-custom-properties)
+ [iOS](~/sdk/other-apis/ios.md#use-custom-properties)
+ [macOS](~/sdk/other-apis/macos.md#use-custom-properties)
+ [React Native](~/sdk/other-apis/react-native.md#use-custom-properties)
+ [UWP](~/sdk/other-apis/uwp.md#use-custom-properties)
+ [Xamarin](~/sdk/other-apis/xamarin.md#use-custom-properties)

### Create an Audience

App Center users can create Push Audiences two ways:

+ From the Audiences Page in the App Center portal
+ While creating a Push Campaign

To create an Audience from the Audiences page:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account or the organization where the app project is defined, then select the app project from the list that appears.
3. In the project navigator that opens, select **Push**.
4. From the sub-menu that opens, select **Audiences**.
5. Click the **New audience** button.

To create an Audience from the Campaign Wizard

1. Create a Campaign using the instructions provided in [Create a notification](#create-a-notification).
2. Navigate to the Campaign's **Target** page

When defining an audience:

+ Add one or more rules until you've defined the proper selection criteria for your Audience.
+ Click the **Add rule** button to add a new rule to your Audience
+ Click the **-** button next to a rule to remove it from your Audience definition.

When defining a Rule:

+ Select an available property from the property list (App Center shows all device properties and any custom properties you defined in your app)
+ Select the **is** or **is not** conditional from the list of options, or the mathematical operator (`>`, `<`, `>=`, `<=`, etc.)
+ Select a value from the list of options that appear (for keyword properties like country) or enter a string or numeric value (depending on the property type)

As you add rules, App Center calculates the audience size for your current selection, showing percentage of your total population and an estimate for the number of devices targeted by the Audience.

When you're done making changes to the Audience, click the **Save** button to save the Audience.

> [!NOTE]
> Only devices that have successfully registered for notifications are matched in audiences.

### Edit an Audience

To edit an Audience:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account or the organization where the app project is defined, then select the app project from the list that appears.
3. In the project navigator that opens, select **Push**.
4. From the sub-menu that opens, select **Audiences**.
5. Select the Audience you want to edit.
6. When the Audience opens, click the pencil icon in the upper-right corner of the page to edit the Audience.

### Delete an Audience

To delete an Audience:

1. Log into [App Center](https://appcenter.ms).
2. Using the project navigator on the left side of the page, select the your user account or the organization where the app project is defined, then select the app project from the list that appears.
3. In the project navigator that opens, select **Push**.
4. From the sub-menu that opens, select **Audiences**.
5. Select the checkbox next to the Audience you want to delete.
6. In the upper-right corner of the panel, click the **Delete** button.

You can also open the Audience for editing, then in the upper-right corner of the page, click the three vertical dots and select **Delete audience** from the menu that appears.

## Send to user

To send notifications to specific users, follow the instructions in [Push to User](~/push/push-to-user.md).

## Limitations

+ App Center limits Audiences to a maximum of 1,000 devices. If you create an audience targeting more than 1,000 devices, App Center Push sends notifications to the first 1,000 devices that match the audience criteria, and skip all remaining devices (failing silently).
+ The Push to User feature limits notifications to 100 users.
+ The maximum number of Audiences for any App Center app project is 200.
+ You can define a maximum of 60 custom properties per app project.
+ Audiences match only devices that have a valid push registrations. For that reason, testing Audiences on an iOS simulator will fail.
+ The maximum number of characters per custom data value is 100.
