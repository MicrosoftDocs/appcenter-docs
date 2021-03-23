---
title: Xamarin.UITest test-cloud.exe Upload Errors
description: How to fix "Cannot find test-cloud.exe" and "UITest.dll and the tools are incompatible."
keywords: test-cloud.exe, UITest.dll, Xamarin.UITest, upload
author: lucen-ms
ms.author: kegr
ms.date: 07/28/2020
ms.topic: article
ms.assetid: d732a3cf-88b8-4adc-b4a7-bab3a2c3a6b4
---

# Xamarin.UITest test-cloud.exe Upload Errors
When you submit a Xamarin.UITest test run to App Center Test, the `appcenter` command uses `test-cloud.exe` from the Xamarin.UITest NuGet package. If the `appcenter` command is unable to find that executable, or it finds one that's a different version than the one  used to build the tests, it won't upload the test run and you'll get an error.

The command uses a heuristic to locate test-cloud.exe. Some project or NuGet settings can result in `appcenter` not finding it and reporting the `Cannot find test-cloud.exe` error, or locating the wrong one and advising `UITest.dll and the tools are incompatible`.

## Solutions
### Rebuild
Rebuilding is always a good start for troubleshooting.

If you haven't rebuilt the UITest project after changing the Xamarin.UITest package version, then clean, rebuild, and try the `appcenter test run uitest ...` command again. 

### Manually specify the UITest tools directory
> [!NOTE]
> The Xamarin.UITest version used for your upload *must* be an exact match with the version used to build your tests.

If that doesn't solve the problem, the solution is to add the `--uitest-tools-dir` option to your command, pointing to the `tools` directory that has the right `test-cloud.exe`.

#### But where's test-cloud.exe?
`test-cloud.exe` is inside your Xamarin.UITest package. To find that package, check the **properties > path** setting for Xamarin.UITest in the Visual Studio Project Explorer.

##### Visual Studio for Mac
**References > From Packages > Xamarin.UITest (ctrl+click or right-click) > properties > path**

##### Visual Studio
**Solution Explorer > References > Xamarin.UITest (right-click) > properties > path**

This path will point to the `Xamarin.UITest.dll` and look something like (on Mac): 
> /Users/user/.../PROJECT/packages/Xamarin.UITest.3.0.7/lib/net45/Xamarin.UITest.dll 

The corresponding tools folder for `--uitest-tools-dir` would be:
> /Users/user/.../PROJECT/packages/Xamarin.UITest.3.0.7/tools/ 

Make sure this folder exists and has `test-cloud.exe`.

Add this to your test run command (no line break)
> --uitest-tools-dir "/Users/user/.../PROJECT/packages/Xamarin.UITest.3.0.7/tools/"

You could instead use a relative path based on where you're running the `appcenter` command.

### Remote build service
If the packages are installed on the build machine but you don't know where and can't use Visual Studio to check the location, you can use a brute force method to find the `test-cloud.exe` files on your machine (you may need to vary the starting folders or drives to search):

> dir d:\test-cloud.exe/s  (Windows)
> find / -name test-cloud.exe (Mac)

If the NuGet packages aren't installed until the project builds, you could execute one the brute force method during the build to locate Xamarin.UITest package.

If all else fails, you can manually download the Xamarin.UITest package from NuGet, unzip it and add test-cloud.exe to your project at a known location.