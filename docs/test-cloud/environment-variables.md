---
title: Environment variables
description: Environment variables in App Center Test
keywords: test cloud
author: jonstoneman
ms.author: jonsto
ms.date: 11/27/2019
ms.topic: article
ms.assetid: 51964205-c1d7-4fd7-8259-83485590c6e1
ms.service: vs-appcenter
ms.custom: test
---

# Environment variables

For most frameworks, useful environment variables are available within the test and/or application and you can set additional environment variables via the App Center CLI.

## Support by framework

It is unfortunately currently not possible to use environment variables within the application and test for each framework that App Center supports.

| Framework | Test Environment Variables | Application Environment Variables |
| --------- | ---------------------------| ----------------------------------|
| Appium | Available | Not Available |
| Calabash | Available | Available in iOS only |
| Espresso | Available | Available |
| UITest | Available | Available in iOS only |
| XCUITest | Not Available | Not Available |

> [!NOTE]
> In Espresso tests and Android applications, variables are available in the `InstrumentationRegistry` since Android does not support environment variables.

## Environment variables available in your application

For supported frameworks, these environment variables are available within the application:

| Environment Variable    | Description |
| ----------------------- | ----------- |
| `RUNNING_IN_APP_CENTER` | Set to `1` when the device is running in App Center Test

## Environment variables available in your tests

For supported frameworks, these environment variables are available within the tests:

| Environment Variable | Description |
| -------------------- | ----------- |
| `APP_CENTER_TEST`    | Set to `1` when your tests run in App Center Test. |
| `XTC_APP_ENDPOINT`   | Address of a secure port on the device that allows other services to communicate with the application. Used by applications that embed their own HTTP servers in an application and need to interact with the app outside of the test framework. (Android Only).<br><br>Example: `http://devicehost151.prod:37777/proxy2/token-c059c5c6-37cc-4400-9038-96d1d342ed6e/` |
| `XTC_DEVICE`         | Combines the operating system name and the device name.<br><br>Example: `Google Pixel 2 XL (8.1.0)` |
| `XTC_DEVICE_INDEX`   | A string in the range of 0 to N-1, where N is the number of devices the test is run on. Used in situations where the same test is being run in parallel on multiple devices. `XTC_DEVICE_INDEX` is unique for each test run for each device. For additional discussion, see:  [Handling Concurrent Database Changes During Tests](https://intercom.help/appcenter/test/handling-concurrent-database-changes-during-tests). |
| `XTC_DEVICE_NAME`    | Name of the device running the test.<br><br>Example: `Google Pixel 2 XL` |
| `XTC_DEVICE_OS`      | Name of the operating system for the device running the test.<br><br>Example: `8.1.0` |
| `XTC_LANG`           | Language code used to run the test.<br><br>Example: `en` |
| `XTC_PLATFORM`       | Platform under test, either `android` or `ios`. |

## Setting additional environment variables

When you upload your tests to AppCenter with the appcenter CLI, you can request environment variables be set using the `--test-parameter` option. Environment variables can be set for test runner and for your application (the application under test or AUT).

> [!NOTE]
> See [Support by framework](#support-by-framework) for details of which frameworks support test and application variables in App Center Test.

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

## Using environment variables in your tests

### Sample Appium test code:

The following code snippet shows how to access environment variables in App Center Test using Appium

```java

String appCenterTest = System.getenv("APP_CENTER_TEST");
```

### Sample Calabash test code:

The following code snippet shows how to access environment variables in App Center Test using Calabash

```ruby

app_center_test = ENV["APP_CENTER_TEST"]

```

### Sample Espresso test code

Since Android does not support environment variables, App Center Test sets `InstrumentationRegistry` values instead for Espresso. The following code snippet shows how to access the `InstrumentationRegistry` values.

```java

String appCenterTest = InstrumentationRegistry.getArguments().getString("APP_CENTER_TEST");

```

### Sample Xamarin.UITest test code

The following code snippet shows how to access environment variables in App Center Test using Xamarin.UITest:

```csharp
string appCenterTest = Environment.GetEnvironmentVariable("APP_CENTER_TEST");
```

## Using environment variables in your application

### Sample native Android application code

> [!NOTE]
> See [Support by framework](#support-by-framework) for details of which frameworks support application variables in App Center Test.

Since Android does not support environment variables, App Center Test sets `InstrumentationRegistry` values instead. The following code snippet shows how to access the `InstrumentationRegistry` values.

```java

String runningInAppCenter = InstrumentationRegistry.getArguments().getString("RUNNING_IN_APP_CENTER");

```

### Sample native iOS application code

> [!NOTE]
> See [Support by framework](#support-by-framework) for details of which frameworks support application variables in App Center Test.

Native iOS applications access environment variables through the NSProcessInfo API.

```Objective-C
[[NSProcessInfo processInfo] environment]["RUNNING_IN_APP_CENTER"]
```

```swift
ProcessInfo.processInfo.environment["RUNNING_IN_APP_CENTER"]
```

## Getting help

You can always contact us through [the blue chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). We don't provide 24/7 support, but will reply as soon as we can.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.
