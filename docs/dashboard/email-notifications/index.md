---
title: App Center Email Notifications Documentation
description: How to configure App Center email notifications
keywords: app center, appcenter, visual studio app center, visual studio appcenter, email, email notifications, build status, build, crashes, crash, distribute, diagnostics, crash groups, crash group, new app version released, new crash group, test, test run, test run completed, test run complete
author: amchew
ms.author: amchew
ms.date: 06/26/2018
ms.topic: article
ms.service: vs-appcenter
ms.assetid: b0d2bf02-d28f-48e9-889f-74a3aa5fac45
---

# App Center Email Notifications
## Overview

You can choose to have email notifications automatically sent for the following events:

- Build: 
  - Build success:
    - **Always**: when your app builds successfully
    - **Only if previously failed**: when your app has successfully built after one or more failed builds
    - **Never**: you will not receive notifications for build success

  - Build failure:
    - **Always**: when your app fails to build
    - **Only if previously successful**: when your app has failed to build after one or more successful builds
    - **Never**: you will not receive notifications for build failure

- Crashes: when a crash group is created
- Distribute: when a new version is released
- Test: when a test run completes

App Center sends email notifications at two levels: per user and per user per app level.  User level email notifications settings will override all app level email notifications settings.

## Getting Started

### User level email notifications

1. Navigate to [https://appcenter.ms](https://appcenter.ms) and login with your account information.

2. On the bottom left corner, click your username and select **Account Settings**.

3. In the middle panel, select **Email notifications** from the menu list.

4. In the row panel titled **Receive notifications**, click the **toggle button** to enable or disable email notifications for all your apps.

    ![How to configure email notifications at the user level](media/configureEmailNotificationUser.png)

The default email notification settings at the user level are toggled **On**.

### App level email notifications

App level email notifications send information for the specific app to the user.

1. Navigate to [https://appcenter.ms/apps](https://appcenter.ms/apps), and select the app you would like to configure email notifications for.

2. In the left panel, select **Settings** from the menu list.

3. In the row panel titled **Email notifications**, in the far right corner, click the **pencil icon** to edit your app level email notification settings.

    ![How to configure email notifications at the app level](media/configureEmailNotificationApp.png)

4. In the row titled **Receive notifications**, click the **toggle button** to enable or disable email notifications for the app. Select the **dropdown** for Build status notifications and the **checkbox** for Crashes, Distribute and Test notifications to decide what events will trigger an email.

The default email notification settings at the app level are toggled **On**, set as **Never** for Build event, **checked** for Distribute and Test events, and **unchecked** for Crashes events.

You will receive automatic email notifications when your selected events happen. For example, here is what a Build success email notification looks like:

![Email notification for a successful build](media/emailSuccessfulBuild.png)

> [!NOTE]
> If your branch name contains other alphanumeric characters than `a-z`, `A-Z`, `0-9`, `-`, `+` and `/`, all email notifications will be successfully delivered. However, when you click on the **View Build** button in the email received, you might be directed to a non-existent page. This is due to the encodings for alphanumeric characters by some email services. We advise you to only use the supported characters in branch names. If this is a blocking issue for you, please contact us via support.
