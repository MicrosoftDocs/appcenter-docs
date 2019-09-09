---
title: HockeySDK for Android Migration
description: Migrate from the HockeySDK to App Center Android SDK
author: elamalani
ms.author: emalani
ms.date: 08/16/2019
ms.topic: article
ms.assetid: bfce1840-20b2-4589-a726-d6aacd645d91
ms.service: vs-appcenter
ms.tgt_pltfrm: android
---

# Migrate from the HockeySDK to App Center Android SDK

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

Open the project's app level **build.gradle** file (`app/build.gradle`) and replace the following line in the `dependencies { ... }` configuration.

Before:

```groovy
implementation 'net.hockeyapp.android:HockeySDK:...'
```

After:

```groovy
def appCenterSdkVersion = '2.3.0'
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
Adjust the log level | [HockeyLog.setLogLevel](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-8-control-output-to-logcat) | [AppCenter.setLogLevel](~/sdk/other-apis/android.md#adjust-the-log-level)
Identify installations | Internal only | [AppCenter.getInstallId](~/sdk/other-apis/android.md#identify-installations)
Identify users | [Documentation (crashes only)](https://support.hockeyapp.net/kb/client-integration-android/customization-options-for-android#method-getuserid)| [AppCenter.setUserId](~/sdk/other-apis/android.md#identify-users)

### Analytics

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically track sessions | Yes, can be disabled by `MetricsManager.setSessionTrackingDisabled` | [Documentation (cannot be disabled)](~/sdk/analytics/android.md#session-and-device-information)
Custom events with properties | [MetricsManager.trackEvent](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#2-5-add-user-metrics) | [Analytics.trackEvent](~/sdk/analytics/android.md#custom-events)
Disable service at runtime | `MetricsManager.disableUserMetrics` and `MetricsManager.enableUserMetrics` | [Analytics.setEnabled](~/sdk/analytics/android.md#enable-or-disable-app-center-analytics-at-runtime)

### Crashes

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically send crashes | [Documentation (disabled by default)](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-2-1-auto-send-crash-reports) | [Documentation (enabled by default)](~/sdk/crashes/android.md#should-the-crash-be-processed)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-2-2-attach-additional-meta-data) | [Documentation (can be attached from listener)](~/sdk/crashes/android.md#add-attachments-to-a-crash-report)
Customize user dialog | Yes | [Documentation (not provided by default)](~/sdk/crashes/android.md#ask-for-the-users-consent-to-send-a-crash-log)
Get info about the sending status | [Documentation](https://support.hockeyapp.net/kb/client-integration-android/customization-options-for-android#method-oncrashessent) | [Documentation](~/sdk/crashes/android.md#get-information-about-the-sending-status-for-a-crash-log)
Info about a previous crash | `CrashManager.getLastCrashDetails` | [Crashes.getLastSessionCrashReport](~/sdk/crashes/android.md#get-more-information-about-a-previous-crash)

### Distribute

> [!NOTE]
> Unlike in HockeyApp, App Center in-app updates feature only works with **RELEASE** builds (by default) that are distributed using the **App Center Distribute** service.
Also, once the app is installed and opened for the first time after the App Center Distribute SDK has been added, a browser window will open to enable in-app updates. This is a ONE-TIME step that will not occur for subsequent releases of your app. Please refer to the [App Center Distribute Documentation](~/sdk/distribute/android.md#how-do-in-app-updates-work) for more details.

Feature | HockeyApp | App Center
------- | --------- | ---
Restricted in-app updates | [LoginManager.verifyLogin](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-5-authentication) | [Documentation (works out of box)](~/sdk/distribute/android.md#how-do-in-app-updates-work)
Disable service at runtime | [UpdateManager.unregister](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#2-6-add-update-distribution) | [Distribute.setEnabled](~/sdk/distribute/android.md#enable-or-disable-app-center-distribute-at-runtime)
Customize the update dialog | [Documentation](https://support.hockeyapp.net/kb/client-integration-android/hockeyapp-for-android-sdk#4-3-1-providing-your-own-user-interface-for-the-update-process) | [Documentation](~/sdk/distribute/android.md#customize-or-localize-the-in-app-update-dialog)

### Feedback

The feedback service won't be supported in App Center. See [HockeyApp feedback](feedback.md).
