---
title: Environment variables
description: Environment variables in App Center Test
keywords: test cloud
author: glennwilson
ms.author: v-glenw
ms.date: 02/15/2019
ms.topic: article
ms.assetid: 51964205-c1d7-4fd7-8259-83485590c6e1
ms.service: vs-appcenter
ms.custom: test
---

# Environment variables

When your tests run in App Center Test, there are environment variables you can use on the test device or in your test script.

## Device environment variables

On an iOS device, the environment variable `RUNNING_IN_APP_CENTER` is set when the device is running in App Center Test. There is no equivalent on Android devices.

| Environment Variable | Description |
| -------------------- | ----------- |
| `RUNNING_IN_APP_CENTER` | Set to `1` when the device is running in App Center Test. (iOS Only). |

## Test script environment variables

Calabash, Appium, and Xamarin.UITest use a client/server approach. The test script is the *client* and sends HTTP requests to a *server* running on the device with the app being tested. These environment variables are only available for Calabash, Appium, and Xamarin.UITest and only to the test script code. They aren't available on the device or to the application under test. They're set in App Center Test but not when you run locally.

Espresso and XCUITest use a model where the test and the app both run on the mobile device so these environment variables are not available in those test frameworks.

| Environment Variable | Description |
| -------------------- | ----------- |
| `XAMARIN_TEST_CLOUD` | Set to `1` when your tests run in App Center Test. |
| `XTC_APP_ENDPOINT`   | Address of a secure port on the device that allows other services to communicate with the application. Used by applications that embed their own HTTP servers in an application and need to interact with the app outside of the test framework. (Android Only). |
| `XTC_DEVICE`         | Combines the operating system name and the device name. |
| `XTC_DEVICE_INDEX`   | A string in the range of 0 to N-1, where N is the number of devices the test is run on. Used in situations where the same test is being run in parallel on multiple devices. `XTC_DEVICE_INDEX` is unique for each test run for each device. For additional discussion, see:  [Handling Concurrent Database Changes During Tests](https://intercom.help/appcenter/test/handling-concurrent-database-changes-during-tests). |
| `XTC_DEVICE_NAME`    | Name of the device running the test. |
| `XTC_DEVICE_OS`      | Name of the operating system for the device running the test. |
| `XTC_LANG`           | Language code used to run the test. |
| `XTC_PLATFORM`       | Platform under test, either `android` or `ios`. |

## Sample Xamarin.UITest code

The following code snippet shows how to access environment variables in App Center Test using Xamarin.UITest:

```csharp
var xamarintestcloud = Environment.GetEnvironmentVariable("XAMARIN_TEST_CLOUD");
Console.WriteLine($"XAMARIN_TEST_CLOUD={xamarintestcloud}");

var xtcappendpoint = Environment.GetEnvironmentVariable("XTC_APP_ENDPOINT");
Console.WriteLine($"XTC_APP_ENDPOINT={xtcappendpoint}");

var xtcdevice = Environment.GetEnvironmentVariable("XTC_DEVICE");
Console.WriteLine($"XTC_DEVICE={xtcdevice}");

var xtcdeviceindex = Environment.GetEnvironmentVariable("XTC_DEVICE_INDEX");
Console.WriteLine($"XTC_DEVICE_INDEX={xtcdeviceindex}");

var xtcdevicename = Environment.GetEnvironmentVariable("XTC_DEVICE_NAME");
Console.WriteLine($"XTC_DEVICE_NAME={xtcdevicename}");

var xtcdeviceos = Environment.GetEnvironmentVariable("XTC_DEVICE_OS");
Console.WriteLine($"XTC_DEVICE_OS={xtcdeviceos}");

var xtclang = Environment.GetEnvironmentVariable("XTC_LANG");
Console.WriteLine($"XTC_LANG={xtclang}");

var xtcplatform = Environment.GetEnvironmentVariable("XTC_PLATFORM");
Console.WriteLine($"XTC_PLATFORM={xtcplatform}");
```

## Example test log output in App Center Test

The code snippet in the previous section produces output in the Test Log similar to the following when run in App Center Test.

```shell
XAMARIN_TEST_CLOUD=1
XTC_APP_ENDPOINT=http://devicehost151.prod:37777/proxy2/token-c059c5c6-37cc-4400-9038-96d1d342ed6e/
XTC_DEVICE=Google Pixel 2 XL (8.1.0)
XTC_DEVICE_INDEX=0
XTC_DEVICE_NAME=Google Pixel 2 XL
XTC_DEVICE_OS=8.1.0
XTC_LANG=en
XTC_PLATFORM=android
```

## Getting help

You can always contact us through [the blue chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). We don't provide 24/7 support, but will reply as soon as we can.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.
