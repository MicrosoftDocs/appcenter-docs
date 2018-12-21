---
title: Push Troubleshooting
description: Troubleshooting help for the push service
keywords: push
author: manb-msft
ms.author: manb
ms.date: 12/21/2018
ms.topic: article
ms.assetid: c0ade5f0-4c37-4a04-8615-142b6a09a192
ms.service: vs-appcenter
---

# Push Troubleshooting

## <a name="push-verbosity"/>Increase Push SDK Verbosity

[Increase log output](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/ios#adjust-the-log-level) in the Push SDK. Since the Push SDK is often initialized during app launch, verbose logs will tell you more about what's happening when the app starts.

## Common Error Messages

### "No Targets"

Check for one of the following reasons:

- Device registration expired. This happens when an app is uninstalled, or the registration App Center has for the device is obsolete.
- You are not using a valid certificate. It's possible that you have re-signed the app with a different certificate.
- You may be sending an incorrect device ID through the API.
- The SDK didn't initialize properly. Depending on the Platform, you can get [verbose logs](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/ios#adjust-the-log-level) to see if there are any errors during initialization.

### "Bad Channel"

Check for one of the following reasons:

- The token registered with App Center Push is no longer valid.
- Production mode/sandbox mode doesn't match the certificate. If the Provisioning profile is *Development*, then you must use *Sandbox* endpoint type. If the Provisioning profile is either *Adhoc* or *Production*, you must use *Production* endpoint type.

For Android apps, this generally means the push token has an incorrect format. This should not happen if you have configured the AppCenter Push SDK correctly.

For iOS apps, this generally means the push token has an incorrect format. This should not happen if you have configured the AppCenter Push SDK correctly. This *could* also be caused by a mismatch in the APNs environment (sandbox vs production) between the app entitlements and the APNs credentials.

### "Wrong Token"

This is an error returned by Notification Hubs, indicating the push token is not correct for the given credentials.

For Android apps, this generally means the Google API token does not have permission to send notifications to the specific app. You should double check the **Sender ID** or **Google API Key** and ensure the values are valid for the app.

For iOS apps, this generally means that the APNs credentials do not have permission to send notifications to the specific app. This *could* be caused by a mismatch in the APNs environment (sandbox vs production) between the app entitlements and the APNS credentials.
