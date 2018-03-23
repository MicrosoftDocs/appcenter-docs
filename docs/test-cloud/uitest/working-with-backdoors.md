---
title: Working With - Backdoors
description: Backdoors are methods that can be invoked during a test run to perform some special action to configure or set up testing state on a device.
keywords: uitest test cloud
author: glennwester
ms.author: glwest
ms.reviewer: crdun
ms.date: 01/10/2018
ms.topic: article
ms.assetid: BFFC9137-6E6B-4190-AF79-E96B574E3B4B
ms.service: vs-appcenter
ms.custom: test
---

# Backdoors in Xamarin.UITest

*Backdoors* are methods that are included in a Xamarin.iOS or Xamarin.Android
 app that can be invoked during a test run to perform some special action to configure or set up testing state on a device. For example, a backdoor may be used to seed a database with some test data so that all of the tests in a given fixture have the same data.

The [`IApp.Invoke`](/api/member/Xamarin.UITest.IApp.Invoke/p/System
.String/System.Object/) will allow a test to call a backdoor method in a 
backdoor app. 

How to use `Invoke` and implement a backdoor method in an application is 
different between iOS and Android.

### IApp.Invoke on Android

On Android, `IApp.Invoke` can be used to invoke a method in the Xamarin.Android application according to the following rules:
  
* The method must be `public`.
* The backdoor method must be adorned with the [`Java.Interop.Export`]
(http://developer.xamarin.com/api/type/Java.Interop.ExportAttribute/) attribute that exposes the name of the backdoor method.
* The method may return one of `string`, `Java.Lang.String`, or `void`.
* The method may accept a parameter which may be a `string`, `int`, or `bool`. 
* If the method does accept a parameter, it must be provided to `IApp.Invoke`.    

The Xamarin Test Cloud Agent will try to locate the method in the following order:

1. The `Android.App.Application` subclass.
2. The current activity.
3. The context of the root view.

The following code is a snippet of how create a backdoor method in an Activity:

```csharp
[Activity(Label = "@string/activity_main", MainLauncher = true)]
public class MainActivity : Activity
{
    [Export("MyBackdoorMethod")]
    public void MyBackdoorMethod()
    {
        // In through the backdoor - do some work.
    }
}
```

To call this method, first wait for the Activity to load, and pass `Invoke` the name of the method as a string, as shown in the following snippet:

```csharp
[TestFixture]
public class InvokeExampleTestFixture() 
{
    [Test]
    public void InvokeTest()
    {
        // Wait for the Activity to load
        app.WaitForElement(c => c.Marked("action_bar_title").Text("Enter Credit Card Number"));
        
        // Invoke the backdoor method MainActivity.MyBackDoorMethod
         app.Invoke("MyBackdoorMethod");
    }
}
```

> [!NOTE]
> It may be neccessary to add a reference to the **Mono.Android.Export.dll** assembly in the Xamarin.Android project.


### IApp.Invoke on iOS

On iOS, `IApp.Invoke` can call a C# method on the **AppDelegate** according to the following rules:

* The method must be `public`.
* The method must be adorned with the  [`ExportAttribute`](http://developer.xamarin.com/api/type/Foundation.ExportAttribute/) and the name of the exposed C# method identified. The exposed name must append a _:_ (colon) to the name. `IApp.Invoke` must use the iOS form of the method name.
* The method must take a parameter of `NSString`.
* The method must return `NSString`.

The following code is a snippet showing how declare a backdoor method in iOS:

```csharp
[Register("AppDelegate")]
public class AppDelegate : UIApplicationDelegate
{
    [Export("myBackdoorMethod:")] // notice the colon at the end of the method name
    public NSString MyBackdoorMethod(NSString value)
    {
        // In through the backdoor - do some work.
    }
}
```

To call this method, pass the `Invoke` method the name of the method that was specified in the `ExportAttribute`, as demonstrated in the following snippet:

```csharp
[TestFixture]
public class InvokeExampleTestFixture() 
{
    [Test]
    public void InvokeTest()
    {
        // Wait for the ViewController to appear.
        app.WaitForElement(c=>c.Class("UINavigationBar").Marked("Simple Credit Card Validator"));
        
        // Now invoke the backdoor.
        app.Invoke("myBackdoorMethod:", "the value");
    }
}
```