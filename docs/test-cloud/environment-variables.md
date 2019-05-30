---
title: Environment variables
description: Environment variables in App Center Test
keywords: test cloud
author: glennwilson
ms.author: v-glenw
ms.date: 04/29/2019
ms.topic: article
ms.assetid: 51964205-c1d7-4fd7-8259-83485590c6e1
ms.service: vs-appcenter
ms.custom: test
---

# Environment variables

When App Center runs tests for an application, there are useful environment variables available.  You can set additional environment variables for your application and tests via the App Center CLI.

## Environment variables: available in your application

| Environment Variable    | Description |
| ----------------------- | ----------- |
| `RUNNING_IN_APP_CENTER` | Set to `1` when the device is running in App Center Test

## Environment variables: available in your tests

These variables are only available to your tests when running in App
Center Test.

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

### Example test log output in App Center Test

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

## Sample XCUITest and native iOS application code

XCUITest and native iOS applications access environment variables through the NSProcessInfo API.

```Objective-C
[[NSProcessInfo processInfo] environment]["XAMARIN_TEST_CLOUD"]
```

```swift
ProcessInfo.processInfo.environment["XAMARIN_TEST_CLOUD"]
```

## Calabash Cucumber

Calabash Android and iOS use Cucumber Ruby as the test runner.  You can access the test environment variables with `ENV`.  Access your application's environment using the native APIs (NSProcessInfo for Objc/Swift, Properties for Android Java, and Environment for Xamarin).

```ruby
if ENV["XAMARIN_TEST_CLOUD"]
  puts "running in Test Cloud!"
else
  puts "running locally!"
  end
```

## Setting additional environment variables

When you upload your tests to AppCenter with the appcenter CLI, you can request environment variables be set using the `--test-parameter` option. Environment variables can be set for test runner (XCUITest, Espresso, Xamarin.UITest, etc.) and for your application (the application under test or AUT).

These variables will be available at runtime in the test runner or application under test. This feature is available for all test frameworks.

### Environment variables for your tests

```shell
$ appcenter test run < > \
  < args > \
  --test-parameter "test_env=USERNAME=clever_user@example.com" \
  --test-parameter "test_env=PASSWORD=pa$$w0rd" \
  --test-parameter "test_env=TWO_FACTOR_URL=https://staging.example.com/test-2FA" \
  --test-parameter "test_env=UPGRADE_PURCHASED=0"
```

### Environment variables for your application

```shell
$ appcenter test run < > \
  < args > \
  --test-parameter "app_env=VERBOSE_LOGGING=1" \
  --test-parameter "app_env=CONTENT_SERVER=staging.example.com \
  --test-parameter "app_env=API_LEVEL=3.2" \
  --test-parameter "app_env=UPGRADE_PURCHASED=0"
```

Your application is automatically launched with `RUNNING_IN_APP_CENTER=1`.

## Getting help

You can always contact us through [the blue chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). We don't provide 24/7 support, but will reply as soon as we can.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.
