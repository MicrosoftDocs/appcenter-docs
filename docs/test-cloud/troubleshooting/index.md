---
title: Troubleshoot App Center Test
description: Troubleshooting App Center Test.
keywords: appcenter test cloud, troubleshooting
author: oddj0b
ms.author: vigimm
ms.date: 02/27/2019
ms.topic: article
ms.assetid: 63f6b52d-ecd6-4270-b179-0ce580c8916c
ms.service: vs-appcenter
ms.custom: test
---

# Test Troubleshooting
The documents in this section provide general troubleshooting tips for App Center Test. 

## General Tips
If you're unsure how to diagonse your issue, here are some general tips:

- Confirm your tests work locally. Ideally compare similar device model(s) and OS versions to minimize variables.
- **iOS simulator app packages can't be uploaded to Test**. Test requires a iOS device build (IPA) that our system can re-sign using our Development Provisining files. 
- Your test suite might need [extra time](time-outs.md) or a [server connection](server-connection.md) to reliably pass tests in App Center.
- Test can't automate multiple apps, or system apps (browser, camera, etc.). This limitation is true even for testing frameworks that allow full system control locally. 

## Common Documented Issues
- [(Android) missing or corrupted screenshots](android-screenshots.md)
- [(iOS) Privacy Alerts](ios-privacy-alerts.md)
- [(iOS) Incorrect coordinates](incorrect-ios-coordinates.md)
- [CLI exit codes](cli-exit-codes.md)
- [Database changes during tests](database-changes.md)
- [Device idling](sleep.md)
- [Device log analysis](device-logs.md)
- [Stalled devices](stalls.md)
- [Time limits](time-outs.md)
- [Web & server connection issues](server-connection.md) 

## Getting more help
### Contacting App Center Support
Open the help menu in the upper right corner of the App Center portal: **? > Contact support**. Use the message field to explain your issue or question. 

![App Center Support Form](~/images/app-center-support-form.png)

Support is provided in English only and during business hours.

### Framework-specific resources
Issues that are encountered in local testing, or using specific framework features, usually require framework-specific troubleshooting. Helpful resources are listed below:

| App Center Guides | External Framework Documentation |
| -------------- | ----------------------------------------- |
| [Appium](~/test-cloud/frameworks/appium/index.md) | [Appium Website](https://appium.io) |
| Calabash | [Calabash iOS Wiki](https://github.com/calabash/calabash-ios/wiki),  [Calabash Android Wiki](https://github.com/calabash/calabash-android/wiki) |
| [Espresso](~/test-cloud/frameworks/espresso/index.md) | [Espresso Documentation](https://developer.android.com/training/testing/espresso/) |
| [Xamarin.UITest](~/test-cloud/frameworks/uitest/troubleshooting/index.md) | N/A |
| [XCUITest](~/test-cloud/frameworks/xcuitest/index.md) | [XCUITest Documentation](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/testing_with_xcode/chapters/09-ui_testing.html) |

