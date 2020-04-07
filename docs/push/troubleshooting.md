---
title: Push Troubleshooting
description: Troubleshooting help for the push service
keywords: push
author: manb-msft
ms.author: manb
ms.date: 02/28/2020
ms.topic: article
ms.assetid: c0ade5f0-4c37-4a04-8615-142b6a09a192
ms.service: vs-appcenter
---

# Push Troubleshooting

> [!IMPORTANT]
> Please note this feature is being retired. For more information, please see the [blog post](https://devblogs.microsoft.com/appcenter/app-center-mbaas-retirement/). For more information, refer to the [Push Migration Guide](~/migration/push/index.md).

## <a name="push-verbosity"/>Increase Push SDK Verbosity

To get a better understanding what's happening under the covers, [increase log output](https://docs.microsoft.com/appcenter/sdk/other-apis/ios#adjust-the-log-level) in the Push SDK. Since the Push SDK is often initialized during app launch, verbose logs will tell you more about what's happening when the app starts.

## Common Error Messages

### "Bad Channel"

Check for one of the following:

- The token registered with App Center Push is no longer valid.
- Production mode/sandbox mode doesn't match the certificate. If the Provisioning profile is *Development*, then you must use *Sandbox* endpoint type. If the Provisioning profile is either *Ad hoc* or *Production*, you must use *Production* endpoint type.

For Android apps, this usually means the push token has an incorrect format; this should not happen if you have configured the AppCenter Push SDK correctly.

For iOS apps, this usually means the push token has an incorrect format; this should not happen if you have configured the AppCenter Push SDK correctly. This could also be caused by a mismatch in the APNs environment (sandbox vs production) between the app entitlements and the APNs credentials.

### Expired Channel

For Android applications, this means that the device token has expired; either because the token expired or because the application that registered the token was uninstalled from the device.

### "No Targets"

Check for one of the following reasons:

- The device registration expired - this occurs when an app is uninstalled, or the registration App Center has for the device is obsolete.
- You are not using a valid certificate - it's possible that you have re-signed the app with a different certificate.
- You may be sending an incorrect device ID through the API.
- The SDK didn't initialize properly - depending on the Platform, you can enable [verbose logs](https://docs.microsoft.com/appcenter/sdk/other-apis/ios#adjust-the-log-level) to see if there are any errors during initialization.

### "Wrong Token"

This is an error returned by Notification Hubs, indicating the push token is not correct for the given credentials.

For Android apps, this usually means the Google API token does not have permission to send notifications to the specific app. You should double check the **Sender ID** or **Google API Key** and ensure the values are valid for the app.

For iOS apps, this usually means that the APNs credentials do not have permission to send notifications to the specific app. This *could* be caused by a mismatch in the APNs environment (sandbox vs production) between the app entitlements and the APNS credentials.
