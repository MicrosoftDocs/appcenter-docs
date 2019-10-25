---
title: Other iOS APIs
description: Other APIs in the App Center SDK for iOS
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 10/16/2019
ms.topic: article
ms.assetid: f79abed4-6e50-4d1c-aa1e-0b78b764908d
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: ios
dev_langs:  
 - swift
 - objc
---

# Other iOS APIs

[!include[](apple.md)]

## Storage size

When using the App Center SDK, logs are stored locally on the device. Large logs can take up a lot of space, so you may choose to limit the size of the local database. It is also useful in conjunction with the `pause` and `resume` APIs. If you expect to be paused for a long time, you can use a larger database size to store more events.

Use the `setMaxStorageSize` API to set the size of the local DB. The API is asynchronous, and the `completionHandler` is called when you start App Center services. For this reason, `setMaxStorageSize` must be called before your call to `[MSAppCenter start:...]`. You may only call the API once.

```obj-c
// Use 20MB for storage.
[MSAppCenter setMaxStorageSize:(20 * 1024 * 1024) completionHandler:^(BOOL success) {
    if (!success) {
        // The success parameter is false when the size cannot be honored.
    }
}];
[MSAppCenter start:@"{your secret}", withServices:@[[MSAnalytics class]]];
```

```swift
// Use 20MB for storage.
MSAppCenter.setMaxStorageSize(20 * 1024 * 1024, completionHandler: { (success) in
    if !success {
        // The success parameter is false when the size cannot be honored.
    }
})
MSAppCenter.start("target={token}", withServices:[MSAnalytics.self])
```

If you don't set the max storage size, the SDK uses a default max size of 10MB. The minimum size you are allowed to set is 20KB.

> [!NOTE]
> The actual max storage size may be slightly higher than the value you have chosen. SQLite rounds the size up to the next multiple of the page size. The App Center SDK uses a page size of 4KB.

### Unsuccessful API calls

There are many reasons the `completionHandler` call may return false.

* The specified size is an invalid value (less than 20KB or greater than 140TB).
* The current database size is larger than the specified maximum size.
* The API has already been called. You may configure it only once per process.
* The API has been called after `[MSAppCenter start:...]` or `[MSAppCenter configure:...]`.

You can check warnings and errors in the console using the `AppCenter` log tag to troubleshoot configuration issues.