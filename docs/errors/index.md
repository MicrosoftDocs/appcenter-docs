---
title: App Center Errors
description: Errors in App Center
keywords: app center, errors, exceptions, handled
author: blparr
ms.author: blparr
ms.date: 01/26/2018
ms.topic: article
ms.assetid: C0320343-CCA1-4C2B-91D6-DF88608E8446
ms.service: vs-appcenter
ms.custom: errors
---

# Errors

App Center Errors allow you to handle the errors in your app and avoid potential issues in your app. This section examines how to catch and report the errors in your app. Learn more about best practices about when and how to use errors [in the official documentation for exceptions](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/exceptions/using-exceptions).

> [!NOTE]
> Handled Errors are currently in preview, behind a feature flag. To try out this feature during the preview, contact us via our support system in the App Center portal, and we will provide you with access.

> [!NOTE]
> Handled Errors are currently only supported on the Xamarin platform.


## General information

When running App Center in an application, the service reports all errors during the lifetime of the application. These errors are sent to the server when they occur (provided there is a network connection) or the next time the application is started.

Learn more about our feature set in [our Errors documentation](~/errors/featureset.md).


## Integrate the Crashes SDK to get started

To track errors in your Xamarin app, integrate the Crashes module in the App Center SDK. Check out our [Crashes SDK Documentation](~/sdk/getting-started/xamarin.md) to learn how to do so.

### Uncaught Errors (Crashes)

An uncaught error (crash) is an error that occurs outside of a try/catch block. App Center automatically reports these crashes by default, when integrating the crashes module of the App Center SDK.

### Inside a Try/Catch Enclosure (Errors)

By calling `TrackError` method inside try/catch enclosure, you can control what information is sent to the App Center service when an error occurs, and therefore get a clearer picture of the error and the state of the device.

There are a number of benefits using the `TrackError` method:

- Send reports to the service with greater accuracy.
- Send reports to the service with additional information.


#### Track Handled Errors in App Center

Include the Crashes SDK to handle errors and report them to App Center. As part of this module, you will be able to track errors by using the `TrackError` method:

```csharp
try
{
    int divByZero = 42 / int.Parse("0");
} catch (DivideByZeroException ex){
    Crashes.TrackError(ex);
}
```

Learn more about how to use the Crashes SDK to track errors in Xamarin in our [Crashes SDK Documentation](~/sdk/crashes/xamarin.md).


## Adding Additional Information to Error Catching

It's possible to tailor the error report sent to App Center to provide additional information for further context about the error. Achieve this by passing a Dictionary of strings key/value pairs to the `TrackError` method. These properties are completely optional. For example:

```csharp
try
{
    using (var text = File.OpenText("saved_game001.txt"))
    {
        Console.WriteLine("{0}", text.ReadLine());
        ...
    }
}
catch (FileNotFoundException ex)
{
    Crashes.TrackError(ex, new Dictionary<string,string>{
        { "Filename", "saved_game001.txt" },
        { "Where", "Reload game" },
        { "Issue", "Index of available games is corrupted" }
    });
}
```

Here the full exception (ex) is still being sent back to the App Center service, but in addition to this, a Dictionary containing additional debugging information is also being created and sent.

### Limitations

- You can define a maximum of 5 properties per error, anything beyond that limit will be rejected.
- The maximum number of characters per error property key and error property value is 64 characters.
