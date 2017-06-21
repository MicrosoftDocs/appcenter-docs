Asynchronous APIs return a `MobileCenterFuture` object instead of returning the result directly.
You can either call `get()` on the future object to synchronously wait for the result or provide a callback like this:

```java
MobileCenterFuture<ReturnType> future = {AnyAsyncApiOfOurSDK}();
future.thenAccept(new MobileCenterConsumer<ReturnType>() {

    @Override
    public void accept(ReturnType result) {

        // do something with result, this is called back in U.I. thread.
    }
});
```

On U.I. thread, please always use the callback not to slow down your application.

On a worker thread it's fine to use `{AnyAsyncApiOfOurSDK}().get()` directly.
