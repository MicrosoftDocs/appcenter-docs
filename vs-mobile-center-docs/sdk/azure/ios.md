---
title: iOS Azure
description: Setting up Azure for iOS
keywords: sdk,azure
author: ysxu
ms.author: ysxu
ms.date: 01/20/17
ms.topic: article
ms.assetid: 896ece30-60c1-43fa-ac66-a37627af5b9d
ms.service: mobile-center
ms.tgt_pltfrm: ios
---

# iOS Azure


> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)

The iOS SDK supports Objective-C projects, Swift 2.2 projects, and Swift 2.3 projects for iOS versions 8.0 or later.

## Add Azure iOS SDK to your app
1. Go to [iOS Client SDK] to get the latest Azure iOS SDK.
2. Create an _MSClient_ in your app to work with Azure features.

You will need:
* your Mobile Center app secret, which you can find at by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

### for Swift:
```swift
let azureMobileClient = MSClient(applicationURLString: "_https://mobile-{app secret}.azurewebsites.net_")
```

### for Objective-C:
```obj-c
MSClient *azureMobileClient = [MSClient clientWithApplicationURLString:@"_https://mobile-{app secret}.azurewebsites.net_"];
```


## Use Azure features in your app
* [Identity]

[iOS Client SDK]: https://github.com/Azure/azure-mobile-apps-ios-client/blob/master/README.md#ios-client-sdk
[Identity]: /sdk/iOS/azure/identity/
