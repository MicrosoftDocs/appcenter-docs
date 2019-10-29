---
title: App Center Diagnostics
description: Help using the Diagnostic service on App Center
keywords: app center, crashes, errors, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 07/31/2019
ms.topic: article
ms.assetid: b39854a6-c523-4a66-bef6-9b5da03ba256
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Diagnostics

## Overview

App Center Diagnostics is a cloud service that helps developers monitor the health of an application, delivering the data needed to understand what happens when an app fails during testing or in the wild. The App Center Diagnostics SDK collects information about crashes and errors in your apps and uploads them to the App Center portal for analysis by the development team - eliminating the guesswork about what really happened in the app when it failed.

## Crashes

Crashes are what happens when a runtime exception occurs from an unexpected event that terminates the app. These are errors not handled by a try/catch block.  When a crash occurs, App Center Crashes records the state of the app and device and automatically generates a crash log. These logs contain valuable information to help you fix the crash.

## Errors

Experienced developers know where code can fail and wrap potentially risky code with error checking or try/catch blocks to handle problems as they occur. For Xamarin, Unity, WPF and WinForms apps, App Center Errors allow you to handle the errors in your app and avoid potential issues in your app. Learn more about best practices about when and how to use errors in the [official documentation for exceptions](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/exceptions/using-exceptions).

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

### Adding Additional Information to Error Catching

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

Here the full exception (ex) is still sent to the App Center service, but the SDK adds a dictionary containing additional debugging information and sends it to the server with the error report.
