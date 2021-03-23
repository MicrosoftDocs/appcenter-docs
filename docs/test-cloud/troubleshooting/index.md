---
title: Troubleshoot App Center Test
description: Troubleshooting App Center Test.
keywords: appcenter test cloud, troubleshooting
author: lucen-ms
ms.author: lucen
ms.date: 01/04/2020
ms.topic: article
ms.assetid: 63f6b52d-ecd6-4270-b179-0ce580c8916c
ms.service: vs-appcenter
ms.custom: test
---

# Test Troubleshooting
The documents in this section provide general troubleshooting tips for App Center Test. 

## General Tips
If you're unsure how to diagnose your issue, here are some general tips:

- **Confirm your tests work locally**. Ideally compare similar device model(s) and OS versions to minimize variables.
- **Compare working vs. failing devices in Test that have at least one variable in common**. For example, OS version, model, or form factor. 
- **iOS simulator app packages can't be uploaded to Test**. Test requires a iOS device build (IPA) that our system can re-sign using our Development Provisioning files. 
- **Your test suite might need [extra time](time-outs.md) or a [server connection](server-connection.md)** to reliably pass tests in App Center.
- **Test can't automate multiple apps, or system apps (browser, camera, and so on)**. This limitation is true even for testing frameworks that allow full system control locally. 
- **Don't include App DLLs in your Test suite**. App DLLs aren't neccessary because your app binary is provided to Test. If you include those DLLs anyways, it can cause unexpected behavior such as stalls or other strange symptoms. 

## Common Documented Issues
- [(Android) missing or corrupted screenshots](android-screenshots.md)
- [(iOS) Privacy Alerts](ios-privacy-alerts.md)
- [(iOS) Incorrect coordinates](incorrect-ios-coordinates.md)
- [CLI exit codes](cli-exit-codes.md)
- [Database changes during tests](database-changes.md)
- [Device idling](sleep.md)
- [Device log analysis](device-logs.md)
- [Stalled devices](stalls.md)
- [Test Report Steps out-of-sync](steps-desync.md)
- [Time limits](time-outs.md)
- [Web & server connection issues](server-connection.md) 

## Framework-specific resources
Issues that occur in local testing, or using specific framework features, usually require framework-specific troubleshooting. Helpful resources are listed below:

| App Center Guides | External Framework Documentation |
| -------------- | ----------------------------------------- |
| [Appium](~/test-cloud/frameworks/appium/index.md) | [Appium Website](https://appium.io) |
| Calabash | [Calabash iOS Wiki](https://github.com/calabash/calabash-ios/wiki),  [Calabash Android Wiki](https://github.com/calabash/calabash-android/wiki) |
| [Espresso](~/test-cloud/frameworks/espresso/index.md) | [Espresso Documentation](https://developer.android.com/training/testing/espresso/) |
| [Xamarin.UITest](~/test-cloud/frameworks/uitest/troubleshooting/index.md) | N/A |
| [XCUITest](~/test-cloud/frameworks/xcuitest/index.md) | [XCUITest Documentation](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) |

## Contacting App Center Support
Open the help menu in the upper-right corner of the App Center portal: **https://www.appcenter.ms > ? > Contact support**. Use the message field to explain your issue or question. Support is provided in English only and during business hours.
