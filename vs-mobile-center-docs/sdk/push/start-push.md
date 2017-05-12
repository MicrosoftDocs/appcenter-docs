In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add the following using statement to the top of the file you are referencing `Push` from: 

```csharp
using Microsoft.Azure.Mobile.Push
```

Next, add `typeof(Push)` to your `MobileCenter.Start()` method to start Mobile Center Push together with the other services that you want to use in your app.

```csharp
MobileCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Push));
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your app secret.
