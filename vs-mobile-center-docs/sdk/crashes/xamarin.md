---
title: Mobile Center Crashes
description: Mobile Center Crashes for Xamarn
keywords: sdk, crash
author: troublemakerben
ms.author: bereimol
ms.date: 03/17/2017
ms.topic: article
ms.assetid: 6a102584-57ad-4b84-9fa1-8c2fd8b903ef
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Mobile Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

Also note that Crash logs on iOS require Symbolication, please check out the [Mobile Center Crashes documentation](~/crashes/ios.md) that explains how to provide symbols for your app.

## 1. Generate a test crash

Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK:

```csharp
Crashes.GenerateTestCrash();
```

Note that this API checks for debug vs release configurations. So you can use only use it when debuging as it won't work for release apps.

## 2. Get more information about a previous crash

Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### 2.1 Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```csharp
bool didAppCrash = Crashes.HasCrashedInLastSession;
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured. 

### 2.2 Details about the last crash

If your app crashed previously, you can get details about the last crash.

```csharp
ErrorReport crashReport = await Crashes.GetLastSessionCrashReportAsync();
```

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [Crashes delegate or listener](#5-customize-your-usage-of-mobile-center-crashes). 

## 3. Enable or disable Mobile Center Crashes at runtime

You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```csharp
Crashes.Enabled = false;
```

To enable Mobile Center Crashes again, use the same API but pass `true` as a parameter.

```csharp
Crashes.Enabled = true;
```

## 4. Check if Mobile Center Crashes is enabled

You can also check if Mobile Center Crashes is enabled or not:

```csharp
bool isEnabled = Crashes.Enabled;
```

## 5. Customize your usage of Mobile Center Crashes

Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.

### 5.1 Should the crash be processed?

Set this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to Mobile Center.

```csharp
bool ShouldProcess(ErrorReport report)
{

 	// Check the report in here and return true or false depending on the ErrorReport.
 
	return true;
}
```

### 5.2 Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to Mobile Center. The SDK exposes a callback that tells Mobile Center Crashes to await your users' confirmation before sending any crash reports.
If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of these options - "Always Send", "Send", and "Don't send". Based on the input, you will tell the Mobile Center Crashes what to do and the crash will then be handled accordingly. The method takes a block as a parameter, use it to pass in your logic to present the UI to ask for the user's consent.

```csharp
Crashes.ShouldAwaitUserConfirmation = () =>
{
	return true; // Return true if the SDK should await user confirmation, otherwise false.
};
```

In case you return `true` in the callback above, your app should obtain user permission and message the SDK with the result using the following API.

```csharp
// Depending on the user's choice, call Crashes.NotifyUserConfirmation() with the right value.
Crashes.NotifyUserConfirmation(UserConfirmation.DontSend);
Crashes.NotifyUserConfirmation(UserConfirmation.AlwaysSend);
Crashes.NotifyUserConfirmation(UserConfirmation.Send);
```

### 5.4 Get information about the sending status for a crash log

In our experience, developers might be interested in the status of Mobile Center Crashes. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. The `Crashes` provides three different callbacks that you can use in your app to be notified of what is going on:

#### 5.4.1 The following callback will be invoked before the SDK sends a crash log

```csharp
Crashes.SendingErrorReport += (sender, e) =>
{
	// Your code, e.g. to present a custom UI.
};
```

#### 5.4.2 The following callback will be invoked after the SDK sent a crash log successfully

```csharp
Crashes.SentErrorReport += (sender, e) =>
{
	// Your code, e.g. to hide the custom UI.
};
```

#### 5.4.3 The following callback will be invoked if the SDK has failed to send a crash log

```csharp
Crashes.FailedToSendErrorReport += (sender, e) =>
{
	// Your code goes here.
};
```