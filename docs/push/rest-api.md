---
title: Using the Push API
description: Instructions on how to send push notifications using the App Center REST API.
keywords: app center, push, audiences, API
author: jwargo
ms.author: jowargo
ms.date: 04/30/2019
ms.topic: article
ms.assetid: AE53841A-B5EF-4A41-BEBD-8210908CD1BA
ms.service: vs-appcenter
ms.custom: push
---

# Using the Push API

The Visual Studio App Center Push (ACP) service offers two ways to send notifications to registered devices:

+ Using the [App Center Portal](~/push/send-notification.md)
+ Using the App Center Push API (described in this document)

When sending notifications through App Center, you can target destination devices (notification recipients) in the following ways:

+ **All registered devices**: Send notifications to all registered devices.
+ **Audiences**: Send notifications to a segment of your app's registered device audience. Build audiences based on a set of device and custom properties either using the App Center Portal or through the REST API
+ **Device list**: Send notifications to up to 100 devices (using the install IDs for the target devices).
+ **User list**: Send notifications to up to 100 users using a list of unique user identifiers provided to App Center through the App Center SDK ([Android SDK example](~/sdk/other-apis/android.md#identify-installations)) or the App Center Auth service.

> [!NOTE]
> All notifications sent using the App Center Push API are limited to a target audience of 1,000 devices.

Before jumping in to the Push API, spend a few minutes reviewing the [App Center API documentation](~/api-docs/index.md), it contains useful information like how to obtain the API token you need to use the Push API and how to authenticate to the service when consuming the APIs. Next, refer to the [App Center Push API (Swagger)](https://openapi.appcenter.ms#push) for the complete list of Push APIs (shown in the following figure); those APIs are covered in this document.

![App Center Push Swagger screenshot](~/push/images/push-swagger.png)

> [!NOTE]
> In the Push API calls, the `owner_name` property is either the app owner's user id, or the name of the org the app falls under in App Center.

## Requirements

### App Requirements

To send notifications to a device, you must first build and deploy the client application designated to receive and process the notifications you send to the device. To do this, follow the Push SDK documentation for each target platform:

+ [Android Push SDK](~/sdk/push/android.md)
+ [iOS Push SDK](~/sdk/push/ios.md)
+ [macOS Push SDK](~/sdk/push/macOS.md)
+ [React Native Android Push SDK](~/sdk/push/react-native-android.md)
+ [React Native iOS Push SDK](~/sdk/push/react-native-ios.md)
+ [Unity Android Push SDK](~/sdk/push/unity-android.md)
+ [Unity iOS Push SDK](~/sdk/push/unity-ios.md)
+ [Unity UWP Push SDK](~/sdk/push/unity-windows.md)
+ [UWP Push SDK](~/sdk/push/uwp.md)
+ [Xamarin Android Push SDK](~/sdk/push/xamarin-android.md)
+ [Xamarin iOS Push SDK](~/sdk/push/xamarin-ios.md)
+ [Xamarin Forms Push SDK](~/sdk/push/xamarin-forms.md)

### Request Requirements

Every App Center API request must include the appropriate API token in the request header. You'll create API tokens in the [App Center Account settings dialog](https://appcenter.ms/settings/apitokens) as shown in the following figure. For information about how to generate and use an API token in an App Center API request, refer to the [App Center API Introduction](~/api-docs/index.md).

![Push API Token](~/push/images/API-tokens.png)

The URL used to invoke any App Center API uses your App Center app project's app and owner names. The easiest way to retrieve these values is through the URL used to access the application in the App Center Portal. Open a browser window and navigate to [https://appcenter.ms](https://appcenter.ms). Login to your account, then select the app with Push enabled. Take a look at the URL App Center uses when it opens the app project, it will look something like this if the app belongs to your user account:

```text
https://appcenter.ms/users/{owner_name}/apps/{app_name}
```

If the app belongs to an organization, the URL will look like this:

```text
https://appcenter.ms/orgs/{owner_name}/apps/{app_name}
```

For either example URL, the portion of the URL represented by `{owner_name}` in the example is the account or organization name. The portion of the URL represented by `{app_name}` is the app project name.

You can also use the App Center API to retrieve an account's user name; just open a browser window and navigate to [https://openapi.appcenter.ms/#/account/users_get](https://openapi.appcenter.ms/#/account/users_get). Once you've authorized access using an API token, when you execute the API the successful result body the account name in the `name` property.

If the app belongs to an org, you can use the [https://openapi.appcenter.ms/#/account/apps_listForOrg](https://openapi.appcenter.ms/#/account/apps_listForOrg) API to retrieve the app name. Once you've authorized access using an API token, populate the **Organization** field with the organization name and execute the API. The successful result body contains an array of apps for the organization, you'll find the account name for each app in the array in the item's `name` property.

## API endpoint

The App Center API endpoint is:

```text
https://appcenter.ms/api/v0.1/
```

The App Center Push API endpoint generally looks like the following (there are some APIs Push users will use that are published under a different service):

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push
```

Where, as described in the previous section, the portion of the URL represented by `{owner_name}` in the example is the account or organization name, and the portion of the URL represented by `{app_name}` is the app project name.

To invoke the API to send notifications, you would build an API endpoint similar to the following:

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

Here's a complete example, invoked to send notifications to users of the `mycoolapp` app in the `joedev` App Center account:

```text
https://appcenter.ms/api/v0.1/apps/joedev/mycoolapp/push/notifications
```

You'll see a full example for consuming this API later in the document.

## Sending notifications

The following sections illustrate how to use the App Center Push API to send notifications using the available notification options.

### Notification body

Each notification sent by App Center Push must include the `notification_content` object; this object contains the data delivered to the target device by the platform's push notification service (PNS).

```JSON
{
  "notification_content": {
    "name": "First Push From App Center",
    "title": "Push From App Center",
    "body": "Hello! Isn't this an amazing notification message?",
    "custom_data": {"key1": "val1", "key2": "val2"}
  }
}
```

What the target device does with the data depends on the target platform and the content of the `notification_content` object. Some platforms support silent notifications, where the notification is automatically passed to the target application and the app decides what to do with the data. Most notifications trigger an alert on the device and some way to view the pushed message content.

In this example:

+ `name`: Defines the name for the notification message.
+ `title`: Defines the title for the notification message. On target platforms where the notification is displayed in a notification area, this value displays in the title area of the notification.
+ `body`: Defines the notification content displayed with the message.
+ `custom_data`: Defines additional data values (formatted as a JSON object) passed to the target application running on the device. The application retrieves this data from the message and uses it in some app-appropriate way.

### Send a notification to all registered devices (broadcast)

To send a notification message, use the [`push/notifications`](https://openapi.appcenter.ms/#/push/Push_Send) API. To target all registered devices, an application submits an HTTP POST request using the following URL:

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

Send the body of the request in JSON format (using the `application/json` content type), and include the `notification_content` and `notification_target` data values shown in the example below:

```JSON
{
  "notification_content": {
    "name": "First Push From App Center",
    "title": "Push From App Center",
    "body": "Hello! Isn't this an amazing notification message?",
    "custom_data": {"key1": "val1", "key2": "val2"}
  },
  "notification_target": null
}
```

**Note**: Available `notification_target` options are: `[ audiences_target, devices_target, user_ids_target, account_ids_target ]`. There is no `notification_target` option for broadcast, so the application simply passes in the `null` value, or omits the property all together.

In this example:

+ `name`: Defines the name for the notification message.
+ `title`: Defines the title for the notification message. On target platforms where the notification is displayed in a notification area, this value displays in the title area of the notification.
+ `body`: Defines the notification content displayed with the message.
+ `custom_data`: Defines additional data values (delivered as a JSON object) passed to the target application running on the device. The application retrieves this data from the message and uses it in some app-appropriate way.

### Send a notification to an Audience

[Audiences](~/push/send-notification.md#audiences) allow App Center users to define a segment of an app's user base using a set of properties (both pre-defined and custom) and send them targeted notifications. App Center allows customers to create multiple audiences in an app project (up to 200 audiences per app with a maximum of 1,000 devices per audience) and stores them for easy reuse. Developers create and manage Audiences through the [App Center Portal](~/push/send-notification.md#audiences) or the [App Center Analytics API](https://openapi.appcenter.ms/#/analytics), some examples of the APIs used are:

+ Create/update an Audience: [`PUT https://appcenter.ms/api//v0.1/apps/{owner_name}/{app_name}/analytics/audiences/{audience_name}`](https://openapi.appcenter.ms/#/analytics/Analytics_CreateOrUpdateAudience)
+ Delete an Audience: [`DELETE https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/analytics/audiences/{audience_name}`](https://openapi.appcenter.ms/#/analytics/Analytics_DeleteAudience)
+ Get Audiences list: [`GET https://appcenter.ms/api/v0.1//v0.1/apps/{owner_name}/{app_name}/analytics/audiences`](https://openapi.appcenter.ms/#/analytics/Analytics_ListAudiences)

You can create groups (audiences) based on the device properties and custom properties. When defining audiences, use the following symbols to target devices using properties:

| Definition                | Symbol    | Equivalent   |
| ------------------------- | --------- | ------------ |
| equals                    |    `=`    |     `eq`     |
| not equals                |    `!=`   |     `ne`     |
| less than                 |    `<`    |     `lt`     |
| greater than              |    `>`    |     `gt`     |
| less than or equal to     |    `<=`   |     `le`     |
| greater than or equal to  |    `>=`   |     `ge`     |

The App Center SDK captures the following device properties:

+ Application Version (`appVersion`)
+ Country (`carrierCountry`)
+ Device OS version (`deviceOsVersion`) - populates with API level for Android using `osApiLevel`, and `osVersion` on iOS
+ DeviceModel (`model`)
+ Language (`locale`)
+ OEM (`oemName`)
+ Screen Size (`screenSize`)

Refer to the App Center Analytics console to values collected for these properties.

Here is an example of an audience based on a device property where country is `United States`:

```JSON
{
  "definition": "carrierCountry eq 'US'",
  "description": "Users in the United States"
}
```

Apps set custom properties for a registered device using the App Center SDK for each target platform:

+ [Setting custom properties using the Android SDK](~/sdk/other-apis/android.md#use-custom-properties)
+ [Setting custom properties using the iOS SDK](~/sdk/other-apis/ios.md)
+ [Setting custom properties using the macOS SDK](~/sdk/other-apis/macOS.md#use-custom-properties)
+ [Setting custom properties using the React Native SDK](~/sdk/other-apis/react-native.md#use-custom-properties)
+ [Setting custom properties using the Unity SDK](~/sdk/other-apis/unity.md#use-custom-properties)
+ [Setting custom properties using the UWP SDK](~/sdk/other-apis/uwp.md#use-custom-properties)
+ [Setting custom properties using the Xamarin SDK](~/sdk/other-apis/xamarin.md#use-custom-properties)

Here is an example for an audiences based two custom properties (boolean and string properties):

```JSON
{
  "definition": "dog-lover eq true and dog-breed eq 'Golden Retriever'",
  "custom_properties": {
    "dog-lover": "boolean",
    "dog-breed": "string"
  }
}
```

The JSON object uses the `definition` string to define the Audience selection criteria and the `custom_properties` object to define the property types used in the `definition`.

To send a notification message, use the [`push/notifications`](https://openapi.appcenter.ms/#/push/Push_Send) API. To target a specific audience, an application submits an HTTP POST request using the following URL:

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

Send the body of the request in JSON format (using the `application/json` content type), and include the `notification_content` and `notification_target` data values shown in the example below:

```JSON
{
  "notification_content": {
    "name": "Cyclists and Dog Lovers",
    "title": "Crossover Event This Weekend",
    "body": "Do your dogs like to ride bikes? Come to our crossover event this weekend.",
    "custom_data": {"eventDate": "06/01/2020", "eventTime": "08:00 AM"}
  },
  "notification_target": {
    "type": "audiences_target",
    "audiences": ["dog-lovers", "cyclists"]
  }
}
```

In this example:

+ `name`: Defines the name for the notification message.
+ `title`: Defines the title for the notification message. On target platforms where the notification is displayed in a notification area, this value displays in the title area of the notification.
+ `body`: Defines the notification content displayed with the message.
+ `custom_data`: Defines additional data values (delivered as a JSON object) passed to the target application running on the device. The application retrieves this data from the message and uses it in some app-appropriate way.
+ `audiences` references the list of audience names to which notifications are sent.

### Send a notification to specific devices

The App Center SDK creates a unique Install ID (UUID) for each device once the app is installed. This identifier remains the same for a device when the app is updated, but a new one is generated when the app is re-installed or the user manually deletes all app data. Developers can use this unique identifier to target specific devices for notifications. The Install ID is set and maintained through the App Center SDK. To obtain the Install ID and use it to target specific devices (or installations if you want to think of it that way), you must obtain it using the App Center SDK:

+ [Android SDK](~/sdk/other-apis/android.md#identify-installations)
+ [iOS SDK](~/sdk/other-apis/ios.md#identify-installations)
+ [macOS SDK](~/sdk/other-apis/macOS.md#identify-installations)
+ [React Native SDK](~/sdk/other-apis/react-native.md#identify-installations)
+ [Unity SDK](~/sdk/other-apis/unity.md#identify-installations)
+ [UWP SDK](~/sdk/other-apis/uwp.md#identify-installations)
+ [Xamarin SDK](~/sdk/other-apis/xamarin.md#identify-installations)

The app must obtain the Install ID and send it to a backend application or database for reference when an app  wants to send notifications to the device.

Assuming the following array of dummy Install IDs: `[ "00000000-0000-0000-0000-000000000001", "00000000-0000-0000-0000-000000000002", "00000000-0000-0000-0000-000000000003" ]`, to send a notification message to the devices, use the [`push/notifications`](https://openapi.appcenter.ms/#/push/Push_Send) API. Submit an HTTP POST request using the following URL:

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

Send the body of the request in JSON format (using the `application/json` content type), and include the `notification_content` and `notification_target` data values shown in the example below:

```JSON
{
  "notification_content": {
    "name": "First Push From App Center",
    "title": "Push From App Center",
    "body": "Hello! Isn't this an amazing notification message?",
    "custom_data": {"key1": "val1", "key2": "val2"}
  },
  "notification_target": {
    "type": "devices_target",
    "devices": ["00000000-0000-0000-0000-000000000001","00000000-0000-0000-0000-000000000002", "00000000-0000-0000-0000-000000000003"]
  }
}
```

In this example:

+ `name`: Defines the name for the notification message.
+ `title`: Defines the title for the notification message. On target platforms where the notification is displayed in a notification area, this value displays in the title area of the notification.
+ `body`: Defines the notification content displayed with the message.
+ `custom_data`: Defines additional data values (delivered as a JSON object) passed to the target application running on the device. The application retrieves this data from the message and uses it in some app-appropriate way.
+ `devices` references the list of Install IDs to which notifications are sent.

### Send notifications to users

Since App Center supports setting user identity two different ways (using the SDK or using the App Center Auth service), the approach an app takes to send a notification to one or more users varies depending on how App Center obtained the target user's identity.

> [!NOTE]
> The two supported methods for sending notifications to users are mutually exclusive; you can only work with one approach at a time. If an app is configured for App Center Auth *and* sets user identity manually using the SDK, you can use the Push API (or the App Center portal) to send notifications to users via App Center Auth or the SDK set identity, but not both. If you want to use both, you must submit separate notification requests for each.

#### User Identity set through the SDK

Many apps use proprietary methods or third-party services to authenticate users in the app. To accommodate this use case, the App Center SDK offers a method the app uses to set the captured user identifier and pass it to App Center. With this ID set, App Center can then associate users with their [Analytics](https://docs.microsoft.com/en-us/appcenter/analytics/) and [Diagnostics](https://docs.microsoft.com/en-us/appcenter/diagnostics/) data as well as send notifications to specific users.

To set an app user's identity using the App Center SDK, refer to the following articles based on the target platform:

+ [Android SDK](~/sdk/other-apis/android.md#identify-users)
+ [iOS SDK](~/sdk/other-apis/ios.md#identify-users)
+ [macOS SDK](~/sdk/other-apis/macOS.md#identify-users)
+ [React Native SDK](~/sdk/other-apis/react-native.md#identify-users)
+ [Unity SDK](~/sdk/other-apis/unity.md#identify-users)
+ [Xamarin SDK](~/sdk/other-apis/xamarin.md#identify-users)

> [!NOTE]
> The user's identity set through the SDK can be whatever the developer wants it to be: the user's name, email address, phone number, or some other unique identifier.

To send a notification to one or more users, the app must set the User ID (as described above) and keep a copy of the identity later in order to identify target users for notifications. Developers typically store the ID in the app's backend system for reference later.

In the following example, we'll assume the app uses email addresses to identify users and sends a notification to the following users identities: `["james@somecomany.com", "allison@somecompany.com", "anna@somecompany.com"]`. To send a notification message to the specified users, use the [`push/notifications`](https://openapi.appcenter.ms/#/push/Push_Send) API. Submit an HTTP POST request using the following URL:

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

Send the body of the request in JSON format (using the `application/json` content type), and include the `notification_content` and `notification_target` data values shown in the example below:

```JSON
{
  "notification_content": {
    "name": "First Push From App Center",
    "title": "Push From App Center",
    "body": "Hello! Isn't this an amazing notification message?",
    "custom_data": {"key1": "val1", "key2": "val2"}
  },
  "notification_target": {
    "type": "user_ids_target",
    "user_ids": [ "james@somecompany.com", "allison@somecompany.com", "anna@somecompany.com" ]
  },
}
```

In this example:

+ `name`: Defines the name for the notification message.
+ `title`: Defines the title for the notification message. On target platforms where the notification is displayed in a notification area, this value displays in the title area of the notification.
+ `body`: Defines the notification content displayed with the message.
+ `custom_data`: Defines additional data values (delivered as a JSON object) passed to the target application running on the device. The application retrieves this data from the message and uses it in some app-appropriate way.
+ `user_ids` Defines the list of user identities (User ID) to which notifications are sent.

> [!NOTE]
> The App Center Push to User feature limits notifications to 100 users and up to a maximum of 1,000 target devices.

#### User Identity set using Auth

The App Center Auth service delivers an easy way for apps to authenticate users using a variety of third-party identity providers (like Facebook, Google, Microsoft). Auth handles signing in users and assigns a unique Account ID for the user. Using that Account ID, an application can send notifications to specific users. To send a notification to one or more users, the app must grab the Account ID (included in the asynchronous result returned from Auth's `signin` method) in order to identify target users for notifications. Developers typically store the Account ID in the app's backend system for reference later.

Assuming the following array of Account IDs: `[ "00000000-0000-0000-0000-000000000001", "00000000-0000-0000-0000-000000000002", "00000000-0000-0000-0000-000000000003" ]`, to send a notification message to the specified users, use the [`push/notifications`](https://openapi.appcenter.ms/#/push/Push_Send) API. Submit an HTTP POST request using the following URL:

```text
https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications
```

Send the body of the request in JSON format (using the `application/json` content type), and include the `notification_content` and `notification_target` data values shown in the example below:

```JSON
{
  "notification_content": {
    "name": "First Push From App Center",
    "title": "Push From App Center",
    "body": "Hello! Isn't this an amazing notification message?",
    "custom_data": {"key1": "val1", "key2": "val2"}
  },
  "notification_target": {
    "type": "account_ids_target",
    "account_ids": ["00000000-0000-0000-0000-000000000001", "00000000-0000-0000-0000-000000000002", "00000000-0000-0000-0000-000000000003"]
  },
}
```

In this example:

+ `name`: Defines the name for the notification message.
+ `title`: Defines the title for the notification message. On target platforms where the notification is displayed in a notification area, this value displays in the title area of the notification.
+ `body`: Defines the notification content displayed with the message.
+ `custom_data`: Defines additional data values (delivered as a JSON object) passed to the target application running on the device. The application retrieves this data from the message and uses it in some app-appropriate way.
+ `account_ids` Defines the list of user identities (Account ID) to which notifications are sent.

> [!NOTE]
> The App Center Push to User feature limits notifications to 100 users and up to a maximum of 1,000 target devices.
