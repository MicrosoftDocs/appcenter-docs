---
# required metadata

title: View Custom Events and Track User Analytics | Android Sample App Tutorials
description: Tutorial to help user set up analytics, track custom events and check logflow.
keywords: app center
author: sshibu
ms.author: t-shshib
ms.date: 07/26/2017
ms.topic: article
ms.service: vs-appcenter
ms.custom: samples
ms.assetid: 2eab2986-32ce-4cc5-aa49-ab60a72bf456


# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]
---


# View Custom Events and Track User Analytics
If you have not already, first follow the [getting started tutorial](getting-started.md) to set up the sample app.

## Open the app and view user analytics
1. Navigate to the app repository in your local machine and open the app module in Android Studio.

2. Click **Run > Run 'app'** from the toolbar. Create a new virtual device of your choice if one is not available to you already, select it, and open the app in the Android Emulator.

3. Go to the **Analytics** service in [App Center](https://appcenter.ms/apps).

Once the app runs on any device or simulator, you should start seeing users, session, and other information on the Overview page.

## Send and view custom events

1. Swipe over to the **Analytics** page in the Android Emulator in Android Studio.

2. In the sample app, press the **Send a sample event** button.

3. In the sample app, press the **Send event with color property** button. Choose a color.

4. Navigate to the **Analytics** service in [App Center](https://appcenter.ms/apps) and go to the **Events** section.

5. You should see data for both the sample and color event buttons. Click on the color event to see that the color you chose has been pressed at least once.  


In App Center, you can view detailed analytics about both buttons by clicking on the events, and even see how many people chose each color.
