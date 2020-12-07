---
title: Xamarin.UITest cheat sheet
description: This document is a cheat sheet that condenses some  UITest information for quick reference.
keywords: uitest test cloud
author: king-of-spades
ms.author: kegr
ms.date: 03/30/2019
ms.topic: article
ms.assetid: 0060471D-5F3B-4C13-A9BA-FD6F8E3BCB04
ms.service: vs-appcenter
ms.custom: test
---

# Xamarin.UITest cheat sheet
This document is a cheat sheet that condenses some  UITest information for quick reference, it contains the following topics:

* [Writing Tests](#writing-tests)
  * [Initializing Xamarin.UITests on iOS](#initializing-xamarinuitest-on-ios) 
  * [Determine the Device ID for an iOS Simulator](#determine-device-id-for-ios-simulator)
  * [Start a Particular iOS Instance](#starting-an-ios-simulator-instance)
  * [Reset an iOS Simulator to Factory Defaults](#reset-an-ios-simulator-to-factory-defaults)
* [Code Snippets](#code-snippets)
  * [Querying Elements Based on Property Values](#querying-elements-based-on-property-value)
  * [Enable Screenshots Locally](#enable-screenshots-locally)
  * [Invoke a Method on an AppResult or UI Element](#invoke-a-method-on-an-appresult-or-ui-element)

## Writing Tests
This snippet is a boilerplate `TestFixture` for a test class on a single platform:

```csharp
using System;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Android;
using Xamarin.UITest.Queries;

namespace MyApp.MyUITests
{
    [TestFixture]
    public class Tests
    {
        IApp app;

        [SetUp]
        public void BeforeEachTest()
        {
            // Uncomment the line that's appropriate for the platform:
            // app = ConfigureApp.Android.StartApp();
            // app = ConfigureApp.iOS.StartApp();
        }

        // Test cases here
    }
}
```

For solutions involving both Android and iOS, the following code will help with writing cross platform UITests.

```csharp
using System;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

namespace MyApp.MyCrossPlatformUITests
{

    public class AppInitializer
    {
        public static IApp StartApp(Platform platform)
        {
            if(platform == Platform.Android)
            {
                return ConfigureApp.Android.StartApp();
            }
            return ConfigureApp.iOS.StartApp();
        }
    }

    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public class Tests
    {
        IApp app;
        Platform platform;

        public Tests(Platform platform)
        {
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }
    }
}
```

Xamarin.Forms solutions should follow the instructions described in the guide [Automating Xamarin.Forms testing with Xamarin.UITest and App Center](~/test-cloud/frameworks/uitest/xamarin-forms.md).

### Initializing Xamarin.UITest on iOS
Add the following snippet to the `FinishedLaunching` method of the **AppDelegate** class:

```csharp
#region Code for starting up the Xamarin Test Cloud Agent

// Newer version of Visual Studio for Mac and Visual Studio provide the
// ENABLE_TEST_CLOUD compiler directive to prevent the Calabash DLL from
// being included in the released version of the application.
#if ENABLE_TEST_CLOUD
Xamarin.Calabash.Start();
#endif
#endregion
```

The Xamarin Test Cloud Agent uses non-public Apple APIs, which causes apps to be rejected by the App Store. The Xamarin.iOS linker will remove the Xamarin Test Cloud Agent from the final IPA if it not explicitly referenced anywhere by the code. Release builds don't have the `ENABLE_TEST_CLOUD` compiler variable, which causes the Xamarin Test Cloud Agent to be removed from app bundle. Debug builds have the compiler directive defined, preventing the linker from removing the Xamarin Test Cloud Agent.

### Determine Device ID for iOS Simulator
You can determine the UUID for the iOS simulators on a computer, use the `instruments` command as shown below:

```bash
$ xcrun instruments -s devices
Known Devices:
bushmaster [5A4B28A1-392A-59FB-81C5-137E881D61E9]
Resizable iPad (8.1 Simulator) [B3BF8A06-2938-4B74-BF87-16C223F8690C]
Resizable iPhone (8.1 Simulator) [E712409B-CFCC-409A-8162-627B6254EB3C]
iPad 2 (7.1 Simulator) [E8572F8F-227B-4DB0-8C92-590DC770360D]
iPad 2 (8.1 Simulator) [1F425263-3F96-4DAB-B843-0D041C3C71EA]
iPad Air (7.1 Simulator) [2863AFF6-D9FC-45E8-8385-E2A548F19002]
iPad Air (8.1 Simulator) [BBCF5CF2-20A4-4C47-9FA5-EBFF7311B071]
iPad Retina (7.1 Simulator) [B7CBB024-E1D3-4B24-8C20-3E9F7B54CF61]
iPad Retina (8.1 Simulator) [3E21ECD3-397A-4251-AEB6-2ADCF29AEE89]
iPhone 4s (7.1 Simulator) [D36354DD-D6A3-4E08-A25B-276620D844B8]
iPhone 4s (8.1 Simulator) [5C8FE602-8BA7-494D-A113-66C8B9AB3CB7]
iPhone 5 (7.1 Simulator) [C696E83D-F9FE-4DBC-8C67-FA0FC533246E]
iPhone 5 (8.1 Simulator) [9A8A5D92-A7D9-4A3C-81AA-97A9924F7D09]
iPhone 5s (7.1 Simulator) [6CDF5B5C-A315-4A8C-9D38-29437FE59C6D]
iPhone 5s (8.1 Simulator) [3F1C286F-3D5D-47B2-92B8-66B673BD0236]
iPhone 6 (8.1 Simulator) [995FF713-9DE4-460B-800E-F5A20FD93AA7]
iPhone 6 Plus (8.1 Simulator) [AB1C20F6-BFFC-4C80-879C-F19A7E3F0B5C]
```

### Starting an iOS Simulator Instance
It's possible to run UITests on a specific iOS version and simulator by using the device ID.

```csharp
const string simId = "3F1C286F-3D5D-47B2-92B8-66B673BD0236"; //iPhone 5s (8.1 Simulator)
app = ConfigureApp.iOS.DeviceIdentifier(simId).StartApp();
```

### Reset an iOS Simulator to Factory Defaults
This code snippet can be used to stop a given iOS simulator and reset it back to factory defaults:

```csharp
static void ResetSimulator(string deviceId)
{
    var shutdownCmdLine = string.Format("simctl shutdown {0}", deviceId);
    var shutdownProcess = Process.Start("xcrun", shutdownCmdLine);
    shutdownProcess.WaitForExit();

    var eraseCmdLine = string.Format("simctl erase {0}", deviceId);
    var eraseProcess = Process.Start("xcrun", eraseCmdLine);
    eraseProcess.WaitForExit();
}
```

## Code Snippets
This section will provide some code snippets that can be helpful for writing UITests.

### Querying Elements Based on Property Value
```csharp
//Finds all elements that have a "hint" property with a value of "Search"
app.Query(e => e.All().Property("hint", "Search"));
```

### Enable Screenshots Locally
```csharp
app = ConfigureApp.Android
    .EnableLocalScreenshots()
    .StartApp();
```
The above code example puts screenshots in the directory where the test assembly is, naming the image `screenshot-X-png`.

### Invoke a Method on an AppResult or UI Element
It's possible to execute native methods on underlying views with the `AppQuery.Invoke` method. The method invoked must match the native method name, not the C# method name. For example, to invoke the [`setGravity`](https://developer.android.com/reference/android/widget/TextView.html#setGravity(int)) method on an Android `TextView`:

```csharp
app.Query(e => e.Id("userName").Invoke("setGravity", 1)); //center text
```

The `Invoke` uses Java `TextView.setGravity` method and not the C# [TextView.Gravity](https://docs.microsoft.com/dotnet/api/Android.Widget.TextView.Gravity) property.

### Handling Android permissions
```csharp
ConfigureApp.Android.Debug().ApkFile(apkpath).StartApp()
```

If you install using `.ApkFile(apkpath)` instead of `PreferIdeSettings()`, then the app is granted with "all" permissions, which remove the permission pop-ups. In the `.ApkFile(apkpath)` method, `apkpath` must point to the compiled apk file.
