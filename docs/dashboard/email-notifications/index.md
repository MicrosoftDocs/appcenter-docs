---
title: App Center Email Notifications Documentation
description: How to configure App Center email notifications
keywords: app center, appcenter, visual studio app center, visual studio appcenter, email, email notifications, crashes, crash, distribute, diagnostics, crash groups, crash group, new app version released, new crash group
author: lucen-ms
ms.author: lucen
ms.date: 11/19/2019
ms.topic: article
ms.service: vs-appcenter
ms.assetid: b0d2bf02-d28f-48e9-889f-74a3aa5fac45
---

# App Center Email Notifications

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

## Overview

Many developers want to be automatically notified when key events happen in their apps, and not have to continually log in to a portal for information. Email and [webhooks](/appcenter/dashboard/webhooks/) are important notification methods for that.

### Events

You can choose to have email notifications automatically sent for the following events:

- **Crashes**: 
    - **Immediately**: when a new crash group is created
    - **Daily**: a summary of all your new crash groups for that day will be sent at approximately 0:00 UTC
    - **Never**: you won't receive notifications when a new crash group is created

> [!NOTE]
> Only the top 3 crash groups based on number of occurrences will be included in the daily email. 
    
- **Distribute:**
  - A new version is released:
    - **Immediately**: when a new version is released
    - **Daily**: a summary of all your releases for that day will be sent at approximately 0:00 UTC
    - **Never**: you won't receive notifications when a new version is released
  - Adding new devices to a release failed:
    - **Checked**: when adding new devices to a release failed
    - **Unchecked**: you won't receive notifications when adding new devices to a release fails

### Email notification preferences

App Center sends email notifications at two levels:  
  - **App-level**: Turning email notifications on and off for an app sets your preference to receive emails at the app-level. Currently, users are only able to turn email notifications on and off for themselves, not for all collaborators of the app.
  - **User-level**: Disabling notifications at the user-level overrides app-level notification settings.

App Center sends notifications using the alias `no-reply@mail.appcenter.ms`.

## Getting Started

### User-level email notifications

1. Navigate to [https://appcenter.ms](https://appcenter.ms) and log in with your account information.

2. On the top right corner, click your user icon and select **Account Settings**.

3. In the middle panel, select **Email notifications** from the menu list.

4. In the row panel titled **Receive notifications**, click the **toggle button** to enable or disable email notifications for all your apps.

    ![How to configure email notifications at the user-level](media/configureEmailNotificationUser.png)

The default email notification settings at the user-level are toggled **On**.

### App-level email notifications

App-level email notifications send information for the specific app to the user.

1. Navigate to [https://appcenter.ms/apps](https://appcenter.ms/apps), and select the app you want to configure email notifications for.

2. In the left panel, select **Settings** from the menu list.

3. In the row panel titled **Email notifications**, in the far right corner, click the **pencil icon** to edit your app-level email notification settings.

    ![How to configure email notifications at the app-level](media/configureEmailNotificationApp.png)

4. In the row titled **Receive notifications**, click the **toggle button** to enable or disable email notifications for the app. Select the **dropdown** for Crashes adn Distribute notifications to decide what events will trigger an email.

The default email notification settings at the app-level are:
  - **On** for receiving email notifications
  - **Immediately** for Distribute new release
  - **Checked** for when Distribute fails to add new devices to a release
  - **Never** for Crashes

You'll receive automatic email notifications when your selected events happen.