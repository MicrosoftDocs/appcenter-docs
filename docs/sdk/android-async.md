---
title: App Center Asynchronous APIs
description: Usage of asynchronous APIs in the Android SDK
keywords: sdk
author: guperrot
ms.author: guperrot
ms.date: 07/11/2017
ms.topic: article
ms.assetid: 610b8797-6884-4dd4-bad3-7c05f39b3922
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Asynchronous APIs in the Android SDK

Asynchronous APIs return a `AppCenterFuture` object instead of returning the result directly.

You can either call `get()` on the future object to synchronously wait for the result or provide a callback like this:

```java
AppCenterFuture<{ReturnType}> future = {AnyAsyncApi}();
future.thenAccept(new AppCenterConsumer<{ReturnType}>() {

    @Override
    public void accept({ReturnType} result) {

        // do something with result, this is called back in U.I. thread.
    }
});
```

To avoid blocking UI thread that causes slowing down your application, consider using `thenAccept` with the callback all the time.

On a worker thread you can simply call `{AnyAsyncApi}().get()`.

Callback example:

```java
AppCenter.isEnabled().thenAccept(new AppCenterConsumer<Boolean>() {

    @Override
    public void accept(Boolean enabled) {
        Log.d("MyApp", "AppCenter.isEnabled=" + enabled);
    }
});
```

Synchronous example:

```java
boolean enabled = AppCenter.isEnabled().get();
```
