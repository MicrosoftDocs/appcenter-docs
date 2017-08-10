---
title: Mobile Center Crashes for Android
description:  Mobile Center Crashes for Android
keywords: sdk, crash
author: troublemakerben
ms.author: bereimol
ms.date: 08/09/2017
ms.topic: article
ms.assetid: a9ac95b3-488f-40c5-ad11-99d8da0fa00b
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Mobile Center Crashes

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/android.md) section if you haven't set up the SDK in your application yet.

## Generate a test crash

Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in debug builds and won't do anything in release builds.

```java
Crashes.generateTestCrash();
```

## Get more information about a previous crash

Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```java
Crashes.hasCrashedInLastSession();
```

[!include[](../android-see-async.md)]

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```java
Crashes.getLastSessionCrashReport();
```

[!include[](../android-see-async.md)]

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [CrashesListener](#customize-your-usage-of-mobile-center-crashes).

## Customize your usage of Mobile Center Crashes

Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.

To handle the callbacks, you must either implement all methods in the `CrashesListener` interface, or override the `AbstractCrashesListener` class and pick only the ones you're interested in.

### Use your own CrashesListener

Create your own CrashesListener and assign it like this:

```java
CrashesListener customListener = new CrashesListener() {
	// Implement all callbacks here.
};
Crashes.setListener(customListener);
```

In case you are only interested in customizing some of the callbacks, use the `AbstractCrashesListener` instead:

```java
AbstractCrashesListener customListener = new AbstractCrashesListener() {
	// Implement any callback here as required.
};
Crashes.setListener(customListener);
```

### Should the crash be processed?

Implement this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to Mobile Center.

```java
@Override
public boolean shouldProcess(ErrorReport report) {
     return true; // return true if the crash report should be processed, otherwise false.
}
```

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to Mobile Center. The SDK exposes a callback that tells Mobile Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you will tell the Mobile Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> No dialog is shown by the SDK, it is up to you to provide UI code if you want to ask for users' consent.

The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:

```java
@Override
public boolean shouldAwaitUserConfirmation() {

	// Build your own UI to ask for user consent here. SDK does not provide one by default.

	// Return true if you just built a UI for user consent and are waiting for user input on that custom U.I, otherwise false.
	return true;
}
```

If you return `true`, your app must obtain (using your own code) the user's permission and message the SDK with the result using the following API:

```java
// Depending on the user's choice, call Crashes.notifyUserConfirmation() with the right value.
Crashes.notifyUserConfirmation(Crashes.DONT_SEND);
Crashes.notifyUserConfirmation(Crashes.SEND);
Crashes.notifyUserConfirmation(Crashes.ALWAYS_SEND);
```

As an example you can refer to [our custom dialog example](https://github.com/Microsoft/mobile-center-sdk-android/blob/0.11.2/apps/sasquatch/src/main/java/com/microsoft/azure/mobile/sasquatch/activities/MainActivity.java#L218).

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. Mobile Center Crashes has three different callbacks that you can use in your app to be notified of what is going on:

#### The following callback will be invoked before the SDK sends a crash log

```java
@Override
public void onBeforeSending(ErrorReport errorReport) {
	// Your code, e.g. to present a custom UI.
}
```

#### The following callback will be invoked after the SDK sent a crash log successfully.

```java
@Override
public void onSendingSucceeded(ErrorReport report) {
	// Your code, e.g. to hide the custom UI.
}
```

#### The following callback will be invoked if the SDK failed to send a crash log

```java
@Override
public void onSendingFailed(ErrorReport report, Exception e) {
	// Your code goes here.
}
```

### Add attachments to a crash report

You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in Mobile Center portal. The following callback will be invoked if you want to add attachments to a crash report. Here is an example to attach a text and an image to a crash:

```java
@Override
public Iterable<ErrorAttachmentLog> getErrorAttachments(ErrorReport report) {

	/* Attach some text. */
	ErrorAttachmentLog textLog = ErrorAttachmentLog.attachmentWithText("This is a text attachment.", "text.txt");

	/* Attach app icon. */
	Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), R.mipmap.ic_launcher);
	ByteArrayOutputStream stream = new ByteArrayOutputStream();
	bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream);
	byte[] bitMapData = stream.toByteArray();
	ErrorAttachmentLog binaryLog = ErrorAttachmentLog.attachmentWithBinary(bitMapData, "ic_launcher.jpeg", "image/jpeg");

	/* Return attachments as list. */
	return Arrays.asList(textLog, binaryLog);
}
```

## Enable or disable Mobile Center Crashes at runtime

You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```java
Crashes.setEnabled(false);
```

To enable Mobile Center Crashes again, use the same API but pass `true` as a parameter.

```java
Crashes.setEnabled(true);
```

[!include[](../android-see-async.md)]

## Check if Mobile Center Crashes is enabled

You can also check if Mobile Center Crashes is enabled or not:

```java
Crashes.isEnabled();
```

[!include[](../android-see-async.md)]
