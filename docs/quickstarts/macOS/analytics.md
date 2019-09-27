---
# required metadata

title: Analytics | Sample App Tutorials
description: Tutorial to help user set up analytics, track custom events and check logflow.
keywords: app center
author: clpolet
ms.author: clpolet
ms.date: 11/15/2017
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 06325871-3fc5-4df6-a054-e84861b9e71a
ms.tgt_pltfrm: macos
dev_langs:  
 - swift
---


# Analytics - Sample Swift App and Tutorials

In this tutorial, you will learn to view custom events and other user analytics in App Center. Code to track these events is included in the sample Swift app.

If you have not already, first follow the [getting started tutorial](getting-started.md) to set up the sample Swift app.

## Open the app and view user Analytics
To see users, session, and other information on the Overview page:
1. Run the app using .xcworkspace, or from your device.

2. Interact with the sample app from your device.

3. Go to the **Analytics** service in [App Center](https://appcenter.ms/apps). There may be a short delay before the page is updated.

## Send and view custom events

1. In the sample app, press the **Send a sample event** button.

2. In the sample app, press the **Send event with color property** button. Choose a color.

3. Navigate to the **Analytics** service in [App Center](https://appcenter.ms/apps) and go to the **Events** section.

4. You should see data for both the sample and color event buttons. Click on the color event to see that the color you chose has been pressed at least once.

In App Center, you can view detailed analytics about both buttons by clicking on the events, and even see how many people chose each color.

To make this possible, code from the App Center SDK is included. It will specifically track when these buttons are pressed. These custom events can have multiple properties - in this case, the color chosen is an event property.
