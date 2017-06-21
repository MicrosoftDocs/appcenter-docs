Asynchronous APIs return a `MobileCenterFuture` object instead of returning the result directly.

You can either call `get()` on the future object to synchronously wait for the result or provide a callback like this:

```java
MobileCenterFuture<{ReturnType}> future = {AnyAsyncApi}();
future.thenAccept(new MobileCenterConsumer<{ReturnType}>() {

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
MobileCenter.isEnabled().thenAccept(new MobileCenterConsumer<Boolean>() {

    @Override
    public void accept(Boolean enabled) {
        Log.d("MyApp", "MobileCenter.isEnabled=" + enabled);
    }
});
```

Synchronous example:

```java
boolean enabled = MobileCenter.isEnabled().get();
```
