---
title: Xamarin.UITest test-cloud.exe Upload Errors
description: How to fix "Cannot find test-cloud.exe" and "UITest.dll and the tools are incompatible."
keywords: test-cloud.exe, UITest.dll, Xamarin.UITest, upload
author: king-of-spades
ms.date: 05/20/2020
ms.topic: article
ms.assetid: d732a3cf-88b8-4adc-b4a7-bab3a2c3a6b4
---

# Xamarin.UITest test-cloud.exe Upload Errors
When you submit a Xamarin.UITest test run to App Center Test, the `appcenter` command uses `test-cloud.exe` from the Xamarin.UITest NuGet package. If the `appcenter` command is unable to find that executable, or it finds one that is a different version than the one  used to build the tests, it won't upload the test run and you'll get an error.

The command uses a heuristic to locate test-cloud.exe. Some project or NuGet settings can result in `appcenter` not finding it and reporting the `Cannot find test-cloud.exe` error, or locating the wrong one and advising `UITest.dll and the tools are incompatible`.

## Solutions
### Rebuild
If the issue is that you have not rebuilt the Xamarin.UITest project after changing the Xamarin.UITest NuGet package version then clean and rebuild and try the `appcenter test run uitest ...` command again. This is always a good first try.

### Use --uitest-tools-dir
If that does not solve the problem, the solution is to add the `--uitest-tools-dir` option to your appcenter command, pointing to the `tools` directory that has the right `test-cloud.exe`.

#### But where is test-cloud.exe?
To find where your Xamarin.UITest package is located check the properties>path setting in your Visual Studio Project Explorer for Xamarin.UITest in your Xamarin.UITest project. 

##### Visual Studio for Mac
**References > From Packages > Xamarin.UITest (ctrl+click or right click) > properties > path**

##### Visual Studio
**Solution Explorer > References > Xamarin.UITest (right click) > properties > path**

This path will point to the `Xamarin.UITest.dll` and look something like (on Mac): 
> /Users/user/.../PROJECT/packages/Xamarin.UITest.2.2.5/lib/net45/Xamarin.UITest.dll The corresponding tools folder for --uitest-tools-dir would be:

> /Users/user/.../PROJECT/packages/Xamarin.UITest.2.2.5/tools/ 

Make sure this folder exists and has `test-cloud.exe`.

Add this to your appcenter test run uitest  command (no line break)
> --uitest-tools-dir "/Users/user/.../PROJECT/packages/Xamarin.UITest.2.2.5/tools/"

You could instead use a relative path based on where you are running the `appcenter` command.

### Remote build service

If the packages are installed on the build machine but you don't know where and can't use Visual Studio to check the location, you can use a brute force method to find the `test-cloud.exe` files on your machine (you may need to vary the starting folders or drives to search):

> dir d:\test-cloud.exe/s  (Windows)
> find / -name test-cloud.exe (Mac)

If the NuGet packages are not installed until the project builds, you could execute one the brute force method during the build to locate Xamarin.UITest package.

If all else fails, you can manually download the Xamarin.UITest package from NuGet, unzip it and add test-cloud.exe to your project at a known location.

#### Keep --uitest-tools-dir updated
If you are specifying `--uitest-tools-dir` keep in mind that you will need to update it as you update the version of Xamarin.UITest that your project is using.