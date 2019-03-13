---
title: HockeySDK for Android Migration
description: Migrate from the HockeySDK to App Center Android SDK
author: elamalani
ms.author: emalani
ms.date: 03/13/2019
ms.topic: article
ms.assetid: bfce1840-20b2-4589-a726-d6aacd645d91
ms.service: vs-appcenter
ms.tgt_pltfrm: android
---

# Migrate from the HockeySDK to App Center Android SDK

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

Open your app level **build.gradle** file (**app/build.gradle**) and replace the following line in your `dependencies { ... }` configuration.

Before:

```groovy
implementation 'net.hockeyapp.android:HockeySDK:...'
```

After:

```groovy
def appCenterSdkVersion = '1.11.4'
implementation "com.microsoft.appcenter:appcenter-analytics:${appCenterSdkVersion}"
implementation "com.microsoft.appcenter:appcenter-crashes:${appCenterSdkVersion}"
implementation "com.microsoft.appcenter:appcenter-distribute:${appCenterSdkVersion}"
```

Please note that the App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in. Each SDK module needs to be added as a separate dependency in this section. See the equivalences in the next table:

HockeyApp class  | App Center module
---------------- | -----------------
`MetricsManager` | `Analytics`
`CrashManager`   | `Crashes`
`UpdateManager`  | `Distribute`

## 2. Update the SDK setup code

### 2.1 Convert the application identifier

The App Center SDK uses application identifiers in the globally unique identifier (GUID) format. Your HockeyApp App ID can be used by App Center but you need to convert it to a different format. To convert the identifier you must add four hyphens to get an 8-4-4-4-12 representation.

Before (HockeyApp):  
`00112233445566778899aabbccddeeff`

After (App Center):  
`00112233-4455-6677-8899-aabbccddeeff`

### 2.2 Replace SDK initialization in the application code

1. Replace the following imports in your activity class.

    Before:

    ```java
    import net.hockeyapp.android.CrashManager;
    import net.hockeyapp.android.metrics.MetricsManager;
    import net.hockeyapp.android.UpdateManager;
    ```

    After:

    ```java
    import com.microsoft.appcenter.AppCenter;
    import com.microsoft.appcenter.analytics.Analytics;
    import com.microsoft.appcenter.crashes.Crashes;
    import com.microsoft.appcenter.distribute.Distribute;
    ```

1. Replace registration code inside your app's main activity class' `onCreate`-callback.

    Before:

    ```java
    CrashManager.register(this);
    MetricsManager.register(getApplication());
    UpdateManager.register(this);
    ```

    After:

    ```java
    AppCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class, Distribute.class);
    ```

    If you used metadata to provide the application identifier, you must copy it from there to the initialization code and remove

    ```xml
    <meta-data android:name="net.hockeyapp.android.appIdentifier" android:value="..." />
    ```

    from your **AndroidManifest.xml** file.

1. Replace HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

Feature | HockeyApp | App Center
------- | --------- | ---
Adjust the log level | [HockeyLog.setLogLevel](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-8-control-output-to-logcat) | [AppCenter.setLogLevel](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/android#adjust-the-log-level)
Identify installations | Internal only | [AppCenter.getInstallId](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/android#identify-installations)
Identify users | [Documentation (crashes only)](https://support.hockeyapp.net/kb/client-integration-android/customization-options-for-android#method-getuserid)| [AppCenter.setUserId](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/android#identify-users)

### Analytics

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically track sessions | Yes, can be disabled by `MetricsManager.setSessionTrackingDisabled` | [Documentation (cannot be disabled)](https://docs.microsoft.com/en-us/appcenter/sdk/analytics/android#session-and-device-information)
Custom events with properties | [MetricsManager.trackEvent](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#2-5-add-user-metrics) | [Analytics.trackEvent](https://docs.microsoft.com/en-us/appcenter/sdk/analytics/android#custom-events)
Disable service at runtime | `MetricsManager.disableUserMetrics` and `MetricsManager.enableUserMetrics` | [Analytics.setEnabled](https://docs.microsoft.com/en-us/appcenter/sdk/analytics/android#enable-or-disable-app-center-analytics-at-runtime)

### Crashes

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically send crashes | [Documentation (disabled by default)](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-2-1-auto-send-crash-reports) | [Documentation (enabled by default)](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/android#should-the-crash-be-processed)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-2-2-attach-additional-meta-data) | [Documentation (can be attached from listener)](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/android#add-attachments-to-a-crash-report)
Customize user dialog | Yes | [Documentation (not provided by default)](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/android#ask-for-the-users-consent-to-send-a-crash-log)
Get info about the sending status | [Documentation](https://support.hockeyapp.net/kb/client-integration-android/customization-options-for-android#method-oncrashessent) | [Documentation](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/android#get-information-about-the-sending-status-for-a-crash-log)
Info about a previous crash | `CrashManager.getLastCrashDetails` | [Crashes.getLastSessionCrashReport](https://docs.microsoft.com/en-us/appcenter/sdk/crashes/android#get-more-information-about-a-previous-crash)

### Distribute

Feature | HockeyApp | App Center
------- | --------- | ---
Restricted in-app updates | [LoginManager.verifyLogin](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-5-authentication) | [Documentation (works out of box)](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/android#how-do-in-app-updates-work)
Disable service at runtime | [UpdateManager.unregister](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#2-6-add-update-distribution) | [Distribute.setEnabled](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/android#enable-or-disable-app-center-distribute-at-runtime)
Customize the update dialog | [Documentation](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-3-1-providing-your-own-user-interface-for-the-update-process) | [Documentation](https://docs.microsoft.com/en-us/appcenter/sdk/distribute/android#customize-or-localize-the-in-app-update-dialog)

### Feedback

This service wont be supported in App Center.

## 4. Contact us

In case you have any questions or feedback related to the SDK migration, please contact us via support by clicking on the blue icon in App Center portal or leaving us a note in the docs itself.
