---
title: HockeySDK for Cordova Migration
description: Migrate from the HockeySDK to App Center SDK for Cordova
author: elamalani
ms.author: emalani
ms.date: 08/06/2019
ms.topic: article
ms.assetid: d2aec910-d9db-4386-9d46-1f34d2918472
ms.service: vs-appcenter
ms.tgt_pltfrm: cordova
---

# Migrate from the HockeySDK to App Center SDK for Cordova

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

### 1.1 Remove old HockeySDK

1. Open a terminal window, navigate to the Cordova project folder, and execute the following command:

   ```shell
   cordova plugin add cordova-plugin-appcenter-analytics
   ```

1. Navigate to the **Your app > platforms > android > platform_www > plugins** folder and delete **cordova-plugin-hockeyapp** from it.

### 1.2 Add new App Center SDK

The App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in. See the equivalences in the next table:

HockeyApp module         | App Center module | Install command
------------------------ | ----------------- |---
`Crashes and Exceptions` | `Crashes`         | `cordova plugin add cordova-plugin-appcenter-crashes`
`Metrics`                | `Analytics`       | `cordova plugin add cordova-plugin-appcenter-analytics`

Run one of the commands to install the module you need (or both).

## 2. Update the SDK setup code

### 2.1 Convert the application identifier

The App Center SDK uses application identifiers in the globally unique identifier (GUID) format. Your HockeyApp App ID can be used by App Center but you need to convert it to a different format. To convert the identifier, you must add four hyphens to get an 8-4-4-4-12 representation.

Before (HockeyApp):
`00112233445566778899aabbccddeeff`

After (App Center):
`00112233-4455-6677-8899-aabbccddeeff`

### 2.2 Replace SDK initialization in the application code

1. Remove the HockeyApp initialization inside the `deviceready` handler:

   ```javascript
   hockeyapp.start(null, null, "APP_ID");
   ```

1. Configure the App Center SDK

    Open the Apache Cordova project's **config.xml** file; for each of your Apache Cordova project's target `platform` elements (only Android and iOS today), add a child `preference` element in the following format:

    ```xml
    <preference name="APP_SECRET" value="{App Secret from the previous step}" />
    ```

    For more information, refer to [App Center Cordova documentation](~/sdk/getting-started/cordova.md#configuring-the-plugins).

1. Replace all HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

Feature | HockeyApp | App Center
------- | --------- | ---
Identify Users | [hockeyapp.setUserName](https://github.com/bitstadium/HockeySDK-Cordova#hockeyappsetusername) or [hockeyapp.setUserEmail](https://github.com/bitstadium/HockeySDK-Cordova#hockeyappsetuseremail) | [AppCenter.setUserId](~/sdk/other-apis/cordova.md#identify-users)

### Analytics

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically track sessions | [Documentation (can't be disabled)](https://github.com/bitstadium/HockeySDK-Cordova#tracking-custom-events) | [Documentation (enabled by default)](~/sdk/analytics/cordova.md#wait-for-js-to-enable-app-center-analytics)
Track events | [hockeyapp.trackEvent](https://github.com/bitstadium/HockeySDK-Cordova#hockeyapptrackevent) | [Analytics.trackEvent](~/sdk/analytics/cordova.md#custom-events)

### Crashes

Feature | HockeyApp | App Center
------- | --------- | ---
Automatically send crashes | [autoSend parameter (disabled by default)](https://github.com/bitstadium/HockeySDK-Cordova#hockeyappstart) | [APPCENTER_CRASHES_ALWAYS_SEND (enabled by default)](~/sdk/crashes/cordova.md#processing-crashes-in-javascript)
Attach additional meta data | [hockeyapp.addMetaData](https://github.com/bitstadium/HockeySDK-Cordova#hockeyappaddmetadata) | [Documentation (can be attached from listener)](~/sdk/crashes/cordova.md#add-attachments-to-a-crash-report)
Generate test crash | [hockeyapp.forceCrash](https://github.com/bitstadium/HockeySDK-Cordova#hockeyappforcecrash) | [AppCenter.Crashes.generateTestCrash](~/sdk/crashes/cordova.md#generate-a-test-crash)
Display a dialog on crash | [ignoreDefaultHandler (disabled by default, Android only)](https://github.com/bitstadium/HockeySDK-Cordova#hockeyappstart) | [AppCenter.Crashes.process (callback on processing a crash)](~/sdk/crashes/cordova.md#processing-crashes-in-javascript)

### Version updates

App Center Distribute service is not supported in App Center Cordova SDK yet. Follow [our roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap) to stay up-to-date on it.

### Feedback

The feedback service won't be supported in App Center. See [HockeyApp feedback](feedback.md).
