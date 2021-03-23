---
title: How to Use Events for Handled Errors
description: Using events for error handling
keywords: app center, analytics, exceptions
author: lucen-ms
ms.author: kegr
ms.date: 03/22/2017
ms.topic: article
ms.assetid: 8F9AE70D-9153-4EFE-8173-BA1749F4BB0D
ms.service: vs-appcenter
ms.custom: analytics
---

# How to Use Events for Handled Errors
> [!IMPORTANT]
> Handled Errors aren't available yet as part of the Crashes service in App Center. One workaround is to use Custom Events. This isn't how "Handled Errors" are intended to be supported and it isn't the main purpose of Events either. However, this page contains advice on how to best use Events to report on handled errors.

In this section, you'll learn how to use events to get information about your handled errors. Such events for handled errors are helpful if you're interested in counting the number of times an error has happened. You'll get six different measures per event: count, count change, users, user change, count per user, and count per session.

## Event name

We recommend giving the event a name that provides some contextual information. Handled errors can be generic, so it’s necessary to provide some extra information that will identify an error in a more distinct way. An example of contextual information is the file/method name where the error is handled.

**Example**:

Let’s imagine a situation where you want to understand how often your users fail to connect to the WiFi.
“UnknownHostException:ConnectWiFi”, where “UnknownHostException” is the generic name of the exception and “ConnectWiFi” is the method name.

## Event properties

If you’d like to understand more about the distribution of these handled errors for different characteristics (e.g. device type, OS version, build number, or manufacturer), you can use the properties and property values.

**Example**:

Property Key: OS Version

Property Value 1: 10.2.1

Property Value 2: 10.3

Property Value 3: 9.3.5

Depending on your specific use case, you might want to include these as part of the event name instead. However, the number of event names is limited to 200. It's important to know what you want to answer to get the most value from using events for handled errors.
If you want to filter by version, you don't need to include that as part of the property, as you can use the dropdown provided on top right of the event page.

![Use the APP VERSIONS list to select which version or versions to report](~/analytics/images/version-filtering.PNG)

If you want to include the exception message, you can include it as another property.

**Example**:

Property Key: Exception Message

Property Value: Exception in thread "main" java.lang.RuntimeException


The number of characters in the property values is limited to 64 characters, so you'll probably need to truncate or filter the string. Finally, you shouldn't include the stack trace as part of the event name or property values for the same reason.
