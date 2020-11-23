---
title: Shared docs for Windows SDK
description:  Shared docs for Windows SDK
keywords: sdk
author: king-of-spades
ms.author: kegr
ms.date: 11/19/2020
ms.topic: include
ms.assetid: d0615d68-2a73-11eb-adc1-0242ac120002
ms.tgt_pltfrm: windows
---

## Adjust the log level

You can control the amount of log messages that show up from App Center in the console. Use the `LogLevel` API to enable additional logging while debugging. By default, it's set to `ASSERT` for the App Store environments and `WARN` otherwise.

To have as many log messages as possible, use `LogLevel.Verbose`.

```csharp
AppCenter.LogLevel = LogLevel.Verbose;
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```csharp
System.Guid? installId = await AppCenter.GetInstallIdAsync();
```

## Identify users

The App Center SDK supports setting a **user ID** that's used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `AppCenter.Start(...)` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/xamarin.md).
2. Set a `userID` in the SDK using the following code:

```csharp
AppCenter.SetUserId("your-user-id");
```

[!INCLUDE [user id](user-id.md)]

## Disable all services at runtime

If you want to disable all App Center services at once, use the `Enabled` property. When disabled, the SDK won't forward any information to App Center.

```csharp
AppCenter.SetEnabledAsync(false);
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```csharp
AppCenter.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The state is persisted in the device's storage across application launches.

## Change state of service in runtime

Enable or disable the services at the runtime with following code:

```csharp
Analytics.SetEnabledAsync(false);
```

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```csharp
bool enabled = await AppCenter.IsEnabledAsync();
```

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you're currently using.

```csharp
AppCenter.SdkVersion;
```

## Storage size

When using the App Center SDK, logs are stored locally on the device. Large logs can take up a lot of space, so you may choose to limit the size of the local database.

You can use the `SetMaxStorageSizeAsync` API to set the size of the local DB. The API is asynchronous, and the callback is called when you start App Center services. For this reason, `SetMaxStorageSizeAsync` must be called before your call to `AppCenter.Start(...)`. You may only call the API once.

```csharp
// Use 20 MB for storage.
AppCenter.SetMaxStorageSizeAsync(20 * 1024 * 1024).ContinueWith((storageTask) => {
    // The storageTask.Result is false when the size cannot be honored.
});
AppCenter.Start("{Your App Secret}", typeof(Analytics));
```

If you don't set the max storage size, the SDK uses a default max size of 10 MB. The minimum size you're allowed to set is 20 KB.

> [!NOTE]
> The actual max storage size may be higher than the value you've chosen. SQLite rounds the size up to the next multiple of the page size. The App Center SDK uses a page size of 4 KB.

> [!NOTE]
> The logs older than 25 days will be discarded.
