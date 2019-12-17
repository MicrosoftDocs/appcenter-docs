---
title: Data Collected by App Center SDKs
description: The required and optional data sent to App Center by the SDK.
keywords: sdk
author: iageoghe
ms.author: iageoghe
ms.date: 11/21/2019
ms.topic: article
ms.assetid: 6acd2e52-b001-11e9-8b56-784f438a64fa
ms.service: vs-appcenter
ms.custom: sdk
---

# Data Collected by App Center SDKs
 
App Center SDKs send data to App Center services. The data sent varies by the SDK/service used, how an SDK is configured, and for the crash service, on the data handled by your application. The usage of some services requires that certain data be sent in order for the service to function. All data sent to App Center travels through a central ingestion service.
 
## Common data

### Data sent through request headers from SDK to Ingestion
**Required data** – App-Secret, Install-ID

*	**Application Secret (App-Secret)** 
        A unique key used to identify the application. 

*	**Installation Identifier (Install-ID)**
        Each installation of an app with an App Center SDK results in a new, unique installation identifier. This ID is used to differentiate data from unique devices. App Center services require the ID to function properly.
    
    

### Data sent through request body from SDK to Ingestion

**Required data** -  sdkName, sdkVersion, osName, osVersion, locale, timeZoneOffset, appVersion, appBuild
*	**Timestamp (timestamp)** 
        Log timestamp, example: '2017-03-13T18:05:42Z'

*	**Session Identifier (sid)**
        Analytics logs can be part of the same session by specifying this identifier.

*	**User Identifier (userId)**
        An optional string used for associating logs with users.

*	**SDK Name (sdkName)**
        The name of the SDK. Consists of the name of the SDK and the platform, e.g. "appcenter.ios", "hockeysdk.android"

*	**SDK Version (sdkVersion)**
        The version of the SDK in semver format, e.g. "1.2.0" or "0.12.3-alpha.1"

*	**SDK Wrapper Version (wrapperSdkVersion)** 
        The version of the wrapper SDK in semver format. When the SDK wraps a base SDK, the wrapping SDK version is captured in this field while the base SDK version is the sdkVersion. For example, Xamarin.Android wraps native Android.

*	**SDK Wrapper Name (wrapperSdkName)**
        The name of the wrapper SDK. Consists of the name of the SDK and the wrapper platform, e.g. "appcenter.xamarin", "hockeysdk.cordova".

*	**Model (model)** 
        The device model (example: iPad2,3)

*	**OEM Name (oemName)**
        The name of the device manufacturer (example: HTC)

*	**Operating System Name (osName)**
        OS name (example: iOS)

*	**Operating System Version (osVersion)**
        OS version (example: 9.3.0)

*	**Operating System Build Code (osBuild)** 
        OS build code (example: LMY47X)

*	**Operating System API Level (osApiLevel)**
        API level when applicable like in Android (example: 15)

*	**Language and Country Code (locale)**
        ISO language and country code (example: en-US)

*	**Time Zone Offset (timeZoneOffset)** 
        The offset in minutes from UTC for the device time zone, including daylight savings time.

*	**Screen Size (screenSize)** 
        The size of the device screen in pixels (example: 640x480).

*	**Application Version (appVersion)**
        The version of the application typically in major, minor, build (example: 1.1.42)

*	**Carrier Name (carrierName)**
        The name of the cell service provider.

*	**Carrier Country (carrierCountry)**
        The country of the cell service provider.

*	**Application Build (appBuild)**
        The app's build number. (example: 42)

*	**Application Namespace (appNamespace)**
        The bundle identifier, package identifier, or namespace, depending on what the individual platform uses (example: com.microsoft.example)

*	**Live Update Release Label (liveUpdateReleaseLabel)** 
        The label that is used to identify the application code 'version' released via the Live Update beacon running on the device.

*	**Live Update Deployment Key (liveUpdateDeploymentKey)** 
        The identifier of the environment that current application release belongs to, deployment key then maps to environment like Production, Staging

*	**Live Update Package Hash (liveUpdatePackageHash)**
        A hash of all files (ReactNative or Cordova) deployed to device via LiveUpdate beacon. Helps identify the Release version on the device or need to download updates in future

*	**Runtime Wrapper Version (wrapperRuntimeVersion)**
        The version of the wrapper technology framework (Xamarin runtime version, ReactNative, Cordova, and so on). See wrappersdkname to see if this version refers to Xamarin or ReactNative or other.

*	**Jailbreak (jailbreak)**
        A flag indicating if the device has been jailbroken.

    

## Auth

*	[ID Token](https://docs.microsoft.com/azure/active-directory-b2c/active-directory-b2c-reference-tokens)
        This JSON Web Token contains claims that a customer uses to identify a user of the application. 

## Analytics
*	**Engagement Metrics**
        Engagement measures the daily sessions per user and session duration.

    * **Daily sessions per user**: 
        Daily average number of sessions per user.

    * **Total sessions**: 
        Total number of sessions.

    * **Average sessions per day**: 
        Number of sessions per day averaged over the time range.

    * **Session duration**: 
        Distribution of the number of sessions over a few duration intervals.

    * **Average session length**: 
        Average of all the session durations in the selected time range.

*	**Event metrics**
        You can track your own [event metrics](../analytics/event-metrics.md) with up to 20 properties to understand the interaction between your users and the app.

## Diagnostics
*	**Crash and error logs data**
        This data includes the ID and name of processes, threads, frames, related to the crash and the exception type and message and device data as defined in the Common Data section

*	**Crash attachments**
        These attachments are binary or text files that developers can optionally attach to a crash report.        

*	**Custom properties**
        These custom key value pairs can optionally be specified to add additional context to their error reports.        

*	**Crash and error User ID**
        This unique identifier is optionally set by the developer to attach specific user’s identification to crash reports.

*	**Symbol files**
        These symbol files are provided by the developer for App Center to symbolicate crashes.

## Distribute
*	**Token** 
        This GUID is sent to the distribution service to check for a new version of the application. The GUID is only sent if the application was installed using App Center.

## Push
*	**Token**
        This GUID is sent to the service to identify the device for push services.
 
