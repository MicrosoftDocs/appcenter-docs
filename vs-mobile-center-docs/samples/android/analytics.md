---
# required metadata

title: View Custom Events and Track User Analytics | Sample App Tutorials
description: Tutorial to help user set up analytics, track custom events and check logflow.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
ms.date: 07/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: 2eab2986-32ce-4cc5-aa49-ab60a72bf456


# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---


# View Custom Events and Track User Analytics

## Open the app and view user analytics
1. Run the app using the emulator on Android Studio, or from your device.
2. Go to the **Analytics** service in [Mobile Center](https://mobile.azure.com/apps).

Once the app runs on any device or simulator, you should start seeing users, session, and other information on the Overview page.

## Send and view custom events

1. In the sample app, press the **Send a sample event** button.
2. In the sample app, press the **Send event with color property** button. Choose a color.
3. Navigate to the **Analytics** service in [Mobile Center](https://mobile.azure.com/apps) and go to the **Events** section.
4. You should see data for both the sample and color event buttons. Click on the color event to see that the color you chose has been pressed at least once.  


In Mobile Center, you can view detailed analytics about both buttons by clicking on the events, and even see how many people chose each color.
