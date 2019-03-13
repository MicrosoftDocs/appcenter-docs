---
# required metadata

title: Send Push Notifications to Users | Android Sample App Tutorials
description: Tutorial to send a push notification to the sample Android app.
keywords: app center
author: sshibu
ms.author: t-shshib
ms.topic: article
ms.service: vs-appcenter
ms.date: 03/13/2019
---

# Send Push Notifications to Users

First, follow the [getting started tutorial](getting-started.md) to set up the sample app.

## Prerequisites

- A Google account.
- A device with Play Store installed or an emulator using a Google APIs image (API level >= 16).

## Set up Firebase Cloud Messaging

Push on App Center for Android uses **Firebase Cloud Messaging** servers.
You need a Google Account and use the Firebase console.

1. Create a project on the [Firebase console](https://console.firebase.google.com/).
2. Go to project settings (the cog icon).
3. Download the **google-services.json** file, as you will need it for the SDK integration.
4. Go to **Cloud Messaging** tab.
5. Copy the **Server Key**. You will need this key as part of the configuration of Push on the App Center portal for your application.

## Integrate App Center SDK

*The following directions are also located in the push service on App Center.*

1. Copy **google-services.json** file to your Android project app module.

2. Modify the **project root** level **build.gradle** file:

  ```groovy
  buildscript {
      repositories {
          // Add google line if missing before jcenter
          google()
          jcenter()
      }

      dependencies {
          // Add this line
          classpath 'com.google.gms:google-services:4.0.1'
      }
  }

  allprojects {
      repositories {
          // Add google line if missing before jcenter
          google()
          jcenter()
      }
  }
  ```

3. Modify the **app** level **build.gradle** file:

  ```groovy
  dependencies {
      // Add App Center Push module dependency
      def appCenterSdkVersion = '1.11.4'
      implementation "com.microsoft.appcenter:appcenter-push:${appCenterSdkVersion}"
  }

  // Add this line at the bottom
  apply plugin: 'com.google.gms.google-services'
  ```

  > [!NOTE]
  > If the version of your Android Gradle plugin is lower than 3.0.0, then you need to replace the word **implementation** by **compile**.

4. Make sure to trigger a Gradle sync in Android Studio.

5. Locate the App Center import statement in **MainActivity.java** and add the push import statement below it:

   ```java
   import com.microsoft.appcenter.AppCenter;
   import com.microsoft.appcenter.push.Push;
   ```

3. Locate **onCreate** and add the following code:

  ```java
  AppCenter.start(getApplication(), "<APP SECRET HERE>", Push.class);
  ```

  If you also use other services like Analytics or Crashes then modify the existing `start` call like in the following example:

  ```java
  AppCenter.start(getApplication(), "<APP SECRET HERE>", Analytics.class, Crashes.class, Push.class);
  ```

## Set up Push in App Center

1. Go to the **Push** service in [App Center](https://appcenter.ms/apps).

2. Click **Next** twice and skip the first and second pages.

3. Go to the [Firebase Console](https://console.firebase.google.com/) and select the project.

4. Navigate to Project Settings and copy your server key.

5. Paste your server key in App Center.

## Set up a push notification

1. Run your app on your device or emulator.

2. Press the **HOME** button (a circle icon on modern devices) as Push notifications are only displayed if the application is in background.

3. Navigate to the **Push** service in App Center.

4. Click **Send notification**.

5. Set the **Campaign Name** as "Using Push Notifications". Set the **Message** as "Testing".

## Send a push notification

1. Click **Next** at the bottom.

2. Choose **All registered devices**.

3. Click **Next** and **Send notification** at the bottom.
