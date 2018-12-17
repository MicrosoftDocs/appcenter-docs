---
title: Sending Push Notifications
description: Instructions on how to send push notifications using the App Center portal.
keywords: app center, push
author: dimazaid
ms.author: dimazaid
ms.date: 12/14/2018
ms.topic: article
ms.assetid: 4db077ee-b9bf-4dc7-ac21-e8ecc8ee840e
ms.service: vs-appcenter
ms.custom: push
---

# Sending push notifications

The Visual Studio App Center Push service (ACPs) offers two ways to send notifications to registered devices:

+ Using the App Center Portal (described in this document)
+ Using the [App Center Push API](~/push/rest-api.md)

When sending notifications through App Center, you can target destination devices (notification recipients) in the following ways:

+ **All registered devices**: Sends notifications to all registered devices.
+ **Custom devices list**: Sends notifications to up to 20 devices (using the install IDs for the target devices).
+ **Audiences**: Sends notifications to a segment of your app's registered device audience based on a set of device and custom properties. For additional information about creating and managing Audiences, refer to [App Center Push Audiences](~/push/audiences.md).

