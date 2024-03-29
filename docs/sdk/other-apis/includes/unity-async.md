---
author: lucen-ms
ms.author: lucen
ms.topic: include
ms.date: 09/13/2021
ms.tgt_pltfrm: unity
---

Asynchronous APIs return a `AppCenterTask` object instead of returning the result directly, and return immediately instead of waiting for the action to finish.

There are three ways to interact with these methods.

### Method 1: ContinueWith
To perform an action after the `AppCenterTask`'s activity has completed, add a callback using the `ContinueWith` method.

Example:
```csharp
AppCenter.IsEnabledAsync().ContinueWith(task =>
{
    // Do something with task.Result
});
```

In situations where the method has an actual return value, it will return `AppCenterTask<{Return Type}>` (as in the example above). In these situations, the task parameter in the callback will have a `Result` property that you can access.

### Method 2: Built-in language features
If you're writing code that has access to .NET 4.6 or above, then `AppCenterTask` can be `await`ed in an asynchronous context.

Example:
```csharp
bool isEnabled = await AppCenter.IsEnabledAsync();
```

### Method 3: Coroutines
`AppCenterTask`s are also suitable for use in coroutines.

Example:
```csharp
void SomeMethod()
{
    StartCoroutine(IsEnabledCoroutine());
}

IEnumerator IsEnabledCoroutine()
{
    var isEnabled = AppCenter.IsEnabledAsync();
    yield return isEnabled;

    // do something with the isEnabled
}
```
