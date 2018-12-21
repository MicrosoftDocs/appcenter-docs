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

You can get [verbose logs](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/ios#adjust-the-log-level) from the Push SDK. Since the Push SDK is often initialized during the app start, it is important to get verbose logs as early as possible when the app is starting.

## <a name="error-messages"/>Common Error Messages

You may see some error messages, during an unsuccessful push, like below,
![An example of a Push Error message](~/push/images/expired-channel-error.PNG)

### "No Targets"

Check for one of the following reasons:

- Device registration has expired. This can happen when an app is uninstalled, or the registration that we had stored on our servers had become obsolete.
- You are not using a valid certificate. It's possible that you have re-signed the app with a different certificate.
- If you're using the API, it's possible that it's not sending the correct device ID.
- The SDK didn't initialize properly. Depending on the Platform, you can get [verbose logs](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/ios#adjust-the-log-level) to see if there are any errors during initialization.

### "Bad Channel"

Check for one of the following reasons:

- The token that was registered with App Center Push is no longer valid.
- Production mode/sandbox mode doesn't match the certificate. If the Provisioning profile is *Development*, then you have to use *Sandbox* endpoint type. If the Provisioning profile is either *Adhoc* or *Production*, then you must use *Production* endpoint type.

For Android apps, this generally means the push token has an incorrect format. This should not happen if you have configured the AppCenter Push SDK correctly.

For iOS apps, this generally means the push token has an incorrect format. This should not happen if you have configured the AppCenter Push SDK correctly. This *could* also be caused by a mismatch in the APNs environment (sandbox vs production) between the app entitlements and the APNs credentials.

### "Wrong Token"

This is an error that is returned by the Notification Hubs, indicating the push token is not correct for the given credentials.

For Android apps, this generally means the Google API token does not have permission to send notifications to the specific app. You should double check the **Sender ID** or **Google API Key** and ensure the values are valid for the app.

For iOS apps, this generally means that the APNs credentials do not have permission to send notifications to the specific app. This *could* be caused by a mismatch in the APNs environment (sandbox vs production) between the app entitlements and the APNS credentials.
