---
author: lucen-ms
ms.author: lucen
ms.topic: include
ms.date: 09/13/2021
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

Asynchronous APIs return a `AppCenterFuture` object instead of returning the result directly.

You can either call `get()` on the future object to synchronously wait for the result or provide a callback like this, filling in the respective return types when calling the API:

```java
AppCenterFuture<{ReturnType}> future = {AnyAsyncApi}();
future.thenAccept(new AppCenterConsumer<{ReturnType}>() {

    @Override
    public void accept({ReturnType} result) {

        // do something with result, this is called back in UI thread.
    }
});
```
```kotlin
val future = {AnyAsyncApi}()
future.thenAccept(object : AppCenterConsumer<{ReturnType}> {
    override fun accept(t: {ReturnType}?) {
        // do something with result, this is called back in UI thread.
    }
})
```

To avoid blocking UI thread that causes slowing down your application, consider using `thenAccept` with the callback all the time.

On a worker thread you can call `{AnyAsyncApi}().get()`.

Callback example:

```java
AppCenter.isEnabled().thenAccept(new AppCenterConsumer<Boolean>() {

    @Override
    public void accept(Boolean enabled) {
        Log.d("MyApp", "AppCenter.isEnabled=" + enabled);
    }
});
```
```kotlin
AppCenter.isEnabled().thenAccept { enabled -> 
    Log.d("MyApp", "AppCenter.isEnabled=$enabled")
}
```

Synchronous example:

```java
boolean enabled = AppCenter.isEnabled().get();
```
```kotlin
val enabled = AppCenter.isEnabled().get()
```