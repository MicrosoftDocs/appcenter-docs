---
title: Working with Timeouts
description: This guide will discuss how to identify and select an iOS simulator that should be used to run Xamarin.UITests locally.
keywords: uitest test cloud
author: glennwester
ms.author: glwest
ms.reviewer: crdun
ms.date: 08/08/2018
ms.topic: article
ms.assetid: E72E94A6-479F-4D65-9394-C6310F670DD9
ms.service: vs-appcenter
ms.custom: test
---

# Working with Timeouts

Sometimes it is necessary to pause test execution while waiting for the user interface to update while a long running action is in progress. UITest provides two API's to address these concerns:

* `IApp.WaitForElement`
* `IApp.WaitForNoElement`

The methods `IApp.WaitForElement`, and `IApp.WaitForNoElement` fundamentally work the same: they will wait for a query to be satisfied and will throw a `TimeoutException` if it is not satisfied in the specified time limit.

By default, UITests waits 15 seconds for tests running locally and one minute for tests running in App Center Tests before throwing the exception.

`IApp.WaitForElement` is useful for situations where the test needs to confirm the presence of a view that provides important information to the user, such as a success message or perhaps an icon. This is an example of `IApp.WaitForElement` that will wait 90 seconds for a view that is marked with `success_message_label` to appear on the screen:

```csharp
app.WaitForElement(c=>c.Marked("success_message_label"),
                   "Did not see the success message.",
                   new TimeSpan(0,0,0,90,0));
```
In particular, it is a good idea to call `IApp.WaitForElement` before interacting with views. Many of the gesture API's will fail if the view is not visible or if animating. The following snippet is one such example of an extension method that will first verify the visibility of a view and then try to enter text:

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
