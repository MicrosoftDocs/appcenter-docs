---
title: Using the Push API
description: API usage on Push
keywords: app center, push, audiences, API
author: dimazaid
ms.author: dimazaid
ms.date: 08/08/2018
ms.topic: article
ms.assetid: AE53841A-B5EF-4A41-BEBD-8210908CD1BA
ms.service: vs-appcenter
ms.custom: push
---

# Using the Push API

App Center follows the philosophy of API-first. You can expect API support for everything you see in the portal. We have a [swagger](https://openapi.appcenter.ms) as well as documentation on [how to get started with our APIs](~/api-docs/index.md).

## Push API

Sending Push Notifications via API will allow you to automate the process of engaging with your users.
Go to the [Push Swagger](https://openapi.appcenter.ms#push) to see the supported APIs.

![Push Swagger](~/push/images/push-swagger.png)

> [!NOTE]
> In the Push API calls, "owner_name" could be either the app owner's user id, or the name of the org the app falls under.

## Send notifications via API

In this documentation we will assume that you already have an app which is ready to receive push notifications. Follow our Push SDK documentation for the different supported platforms: [Android](~/sdk/push/android.md), [iOS](~/sdk/push/ios.md), [React Native Android](~/sdk/push/react-native-android.md), [React Native iOS](~/sdk/push/react-native-ios.md), [UWP](~/sdk/push/uwp.md), [Xamarin Android](~/sdk/push/xamarin-android.md), [Xamarin iOS](~/sdk/push/xamarin-ios.md), [Xamarin Forms](~/sdk/push/xamarin-forms.md)  and [macOS](~/sdk/push/macOS.md).

### API Tokens

The first thing you will need to do is to create an API Token from your [user settings](https://appcenter.ms/settings/apitokens), as shown in the image below.

![Push API Token](~/push/images/API-tokens.png)

### User and Application

In order to send push notifications, you will need to get the user and the application name. To do so, you can use our APIs [for the user](https://openapi.appcenter.ms/#/account/users_get) and [the application](https://openapi.appcenter.ms/#/account/apps_listForOrg).

Here is an example on how to use this information to send push notifications:

```NA
https://appcenter.ms/api/v0.1/apps/<YOUR_USER_NAME>/<YOUR_APP_NAME>/push/notifications
```

### Send the notification

You can send a push using this [POST push API](https://openapi.appcenter.ms/#/push/Push_Send). The push request body is in JSON format (`application/json` content type). Here is an example:

```JSON
{
 "notification_content" : {
  "name" : "First Push From App Center",
  "title" : "Push From App Center",
  "body" : "Welcome!",
  "custom_data" : {"key1" : "val1", "key2" : "val2"}
  }
}
```

## Campaign

Campaign Name should be 64 characters or less, and title should be 128 characters or less. Otherwise you will get an error 400 Bad Request when sending the push via the API. To ensure you are within the limits, try constructing the name and title from the Campaign UI before pushing it via the API.

## Send notifications to Audiences using API

[Audiences](~/push/audiences.md) allow you to segment your user base based on device and custom properties.

### Define an audience

In order to define an audience using properties, you use the following symbols:

| Definition                | Symbol  | Equivalent |
| ------------------------- | ------- | ---------- |
| equals                    |    `=`    |     `eq`     |
| not equals                |    `!=`   |     `ne`     |
| less than                 |    `<`    |     `lt`     |
| greater than              |    `>`    |     `gt`     |
| less than or equal to     |    `<=`   |     `le`     |
| greater than or equal to  |    `>=`   |     `ge`     |

### Audiences based on device properties

You can send push to a group of users that match certain criteria (e.g. all users in United States). You can create groups (audiences) based on the device properties and custom properties. In order to create an audience you can use [this PUT API](https://openapi.appcenter.ms/#/analytics/Analytics_CreateOrUpdateAudience).

Here is an example for an audiences based on a device property where country is `United States`:

```JSON
{
  "definition" : "CarrierCountry eq 'US'",
  "description" : "Users in the United States"
}
```

### Audiences based on custom properties

Here is an example for an audiences based 2 custom properties (boolean and string properties):

```JSON
{
  "definition": "myBooleanProperty eq true and myStringPropety eq 'myStringValue'",
  "custom_properties": {
    "myBooleanProperty": "boolean",
    "myStringPropety": "string"
  }
}
```

You will need to add this custom properties using our SDK for each platform: [Android](~/sdk/other-apis/android.md), [iOS](~/sdk/other-apis/ios.md), [React Native](~/sdk/other-apis/react-native.md), [UWP](~/sdk/other-apis/uwp.md), [Xamarin](~/sdk/other-apis/xamarin.md) and [macOS](~/sdk/other-apis/macOS.md).

### Send push notification to an audience

```JSON
{
 "notification_content" : {
  "name" : "First Push From App Center",
  "title" : "Push From App Center",
  "body" : "Welcome!",
  "custom_data" : {"key1" : "val1", "key2" : "val2"}
  },
    "notification_target" : {
    "type" : "audiences_target",
    "audiences" : ["a-1", "a-2"]
  }
}
```

## Send notifications to Device IDs

This is an example of sending a Push Notifications to a set of Device IDs. To get the install ID, you can use our APIs: [Android](~/sdk/other-apis/android.md), [iOS](~/sdk/other-apis/ios.md), [React Native](~/sdk/other-apis/react-native.md), [UWP](~/sdk/other-apis/uwp.md), [Xamarin](~/sdk/other-apis/xamarin.md) and [macOS](~/sdk/other-apis/macOS.md).

Below, you will find an example where we target the follwing devices IDs: `00000000-0000-0000-0000-000000000001`,`00000000-0000-0000-0000-000000000002`, `00000000-0000-0000-0000-000000000003`.

```JSON
{
 "notification_content" : {
  "name" : "First Push From App Center",
  "title" : "Push From App Center",
  "body" : "Welcome!",
  "custom_data" : {"key1" : "val1", "key2" : "val2"}
  },
    "notification_target" : {
    "type" : "devices_target",
    "devices" : ["00000000-0000-0000-0000-000000000001","00000000-0000-0000-0000-000000000002", "00000000-0000-0000-0000-000000000003"]
  }
}
```

## Send notifications to all registered devices

This is an example of sending a Push Notifications to all registered devices.

```JSON
{
 "notification_content" : {
  "name" : "First Push From App Center",
  "title" : "Push From App Center",
  "body" : "Welcome!",
  "custom_data" : {"key1" : "val1", "key2" : "val2"}
  },
    "notification_target" : null
}
```
