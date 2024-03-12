---
title: Tapping or typing works for some iOS devices but fails for others
description: iOS apps must run in native resolution to avoid tests failing because of screen scaling differences
keywords: Xamarin.UITest, Android, iOS, troubleshooting invalid tests, running tests
author: lucen-ms
ms.author: lucen
ms.date: 07/24/2020
ms.topic: article
ms.assetid: 51d4168f-f76a-4532-b02c-c261af53ec60
---

# Tapping or typing works for some iOS devices but fails for others
[!INCLUDE [Retirement announcement for App Center](../../includes/retirement.md)]
iOS apps must run in native resolution to avoid tests failing because of screen scaling differences.

## Symptoms
If you're tapping or typing test steps consistently fail on particular iOS devices but pass on others, the problem may be scaling of the app display for particular device form factors. If an appropriate launch screen image isn't available for your app, it will be run in a scaled or compatibility mode. Apps running in scaled or compatibility mode can cause incorrect coordinate calculations and result in test failures when tapping or entering text.

If your tests consistently work on one or more device models, but fail on other models while tapping or entering text, this could be the issue. For example, your tests work on an iPhone 7 but have issues tapping or entering text on the iPhone 7 Plus, or only fail on the iPhone X, or on some or all iPads. The underlying issue to look for is if the app isn't running in native resolution on the failing devices, but is running in native resolution on the devices that work.

To fix this problem your app will need to run in native resolution. To do that, make sure to include all required static launch screen images or use a storyboard for your launch screen. You'll also need the appropriate app icon sizes. 

## References
### Static Launch Screen Images
It’s best to use an Xcode storyboard for your launch screen, but you can provide a set of static images if necessary. Create static images in different sizes for different devices, and be sure to include the status bar region.

[Apple Human Interface Guidelines for Launch Screens](https://developer.apple.com/ios/human-interface-guidelines/icons-and-images/launch-screen/)

### App Icon Sizes
Every app must supply small icons for use on the Home screen and throughout the system once your app is installed, as well as a larger icon for display in the App Store.

[Apple Human Interface Guidelines for Icons](https://developer.apple.com/ios/human-interface-guidelines/icons-and-images/app-icon/)