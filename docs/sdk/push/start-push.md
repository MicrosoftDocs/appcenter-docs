In order to use App Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add the following using statement to the top of the file you are referencing `Push` from: 

```csharp
using Microsoft.AppCenter.Push
```

Next, add `typeof(Push)` to your `AppCenter.Start()` method to start App Center Push service.

```csharp
AppCenter.Start("{Your App Secret}", typeof(Push));
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your app secret.
