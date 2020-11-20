---
title: Working with Timeouts
description: This guide will discuss how to identify and select an iOS simulator to run Xamarin.UITests locally.
keywords: uitest test cloud
author: king-of-spades
ms.author: kegr
ms.date: 10/17/2018
ms.topic: article
ms.assetid: E72E94A6-479F-4D65-9394-C6310F670DD9
ms.service: vs-appcenter
ms.custom: test
---

# Working with Timeouts
> [!TIP]
> By default, UITests waits up to 15 seconds for tests running locally, and one minute for tests running in App Center before throwing the `TimeoutException`. If you specify a different wait time, that will override the default, and apply to both local & App Center tests. 

Sometimes it's necessary to pause test execution to wait for the UI to update during a long running action. UITest provides two APIs to address these concerns:

* `IApp.WaitForElement`
* `IApp.WaitForNoElement`

The methods `IApp.WaitForElement`, and `IApp.WaitForNoElement` fundamentally work the same: they'll wait for a query to be satisfied and will throw a `TimeoutException` if it isn't satisfied in the specified time limit.

`IApp.WaitForElement` is useful to confirm the presence of a view, such as a success message or icon. This sample is an example of `IApp.WaitForElement` that will wait up to 90 seconds for a view marked with `success_message_label` to appear:

```csharp
app.WaitForElement(c=>c.Marked("success_message_label"),
                   "Didn't see the success message.",
                   new TimeSpan(0,0,0,90,0));
```
It's a good idea to call `IApp.WaitForElement` before interacting with views. Many of the gesture APIs will fail if the view isn't visible or is still animating. The following snippet is an extension method that verifies the visibility of a view, and then tries to enter text:

```csharp
public static class UITestHelpers
{
    public static void WaitThenEnterText(this IApp app, Func<AppQuery, AppQuery> lambda, string text)
    {
        app.WaitForElement(lambda);
        app.EnterText(lambda, text);
    }
}
```

In contrast, the method `IApp.WaitForNoElement` is useful to pause the test while some view, such as a progress dialog, is still on the screen:

```csharp
app.WaitForNoElement(c=>c.Class("TextView").Text("Uploading data..."), 
    "Upload is taking too long",
    new TimeSpan(0,0,90,0));
```
