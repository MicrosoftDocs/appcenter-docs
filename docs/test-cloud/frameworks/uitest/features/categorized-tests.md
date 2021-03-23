---
title: Working with categorized tests
description: Working with categorized tests in App Center
keywords: uitest test cloud
author: lucen-ms
ms.author: kegr
ms.date: 05/01/2020
ms.topic: article
ms.assetid: EBA22D3B-EB39-400E-8881-B78D621301D4
ms.service: vs-appcenter
ms.custom: test
---

# Working with categorized tests
Xamarin.UITests can be grouped into categories by adding the [CategoryAttribute](http://www.nunit.org/index.php?p=category&r=2.6.4) from the NUnit framework. These categories provide some flexibility on what tests are run.

For example, an application may have one set of tests that are specifically for tablets, and another set for phones. With categories, it's possible to run the tablet-specific tests separately from the phone tests.

Another popular scenario is to segregate slow tests from fast tests. The fast tests are run more frequently, perhaps at each commit to source code control. The slow tests are run less frequently, for example once a day.

Xamarin.UITests can be categorized by both test fixture or test categories by test by adding the `CategoryAttribute` to the class or method. It's possible to assign more than one category. The following class shows an example of categorization:

```csharp
[TestFixture]
[Category("nerp")]
public class Tests
{
    iOSApp app;

    [SetUp]
    public void BeforeEachTest()
    {
        app = ConfigureApp.iOS.StartApp();
    }

    [Test]
    [Category("derp")]
    [Category("erp")]
    public void CreditCardNumber_TooShort_DisplayErrorMessage()
    {
        app.WaitForElement(c=>c.Class("UINavigationBar").Marked("Simple Credit Card Validator"));
        app.EnterText(c=>c.Class("UITextField"), new string('9', 15));
        app.Tap(c=>c.Marked("Validate Credit Card").Class("UIButton"));
        app.WaitForElement(c => c.Marked("Credit card number is too short.").Class("UILabel"));
    }


    [Test]
    [Category("flerp")]
    public void CreditCardNumber_TooLong_DisplayErrorMessage()
    {
        app.WaitForElement(c=>c.Class("UINavigationBar").Marked("Simple Credit Card Validator"));
        app.EnterText(c=>c.Class("UITextField"), new string('9', 17));
        app.Tap(c=>c.Marked("Validate Credit Card").Class("UIButton"));
        app.WaitForElement(c => c.Marked("Credit card number is too long.").Class("UILabel"));
    }

}
```

There are two ways to run Xamarin.UITests according to category:

* `appcenter` - The [Command Line Interface](/appcenter/cli/index) for App Center.
* `nunit-console.exe` - The command-line runner for NUnit tests. It's also used to run Xamarin.UITests locally.

> [!NOTE]
> App Center doesn't honor the [`ExplicitAttribute`](http://www.nunit.org/index.php?p=explicit&r=2.6.4); tests marked as `Explicit` will still be run.

## Running Tests Locally by Category

#### [Visual Studio](#tab/vswin/)
Running tests locally is accomplished using **nunit-console.exe**, NUnit's command-line runner. The command-line switch `--where` matches the categories using a [test selection language](https://github.com/nunit/docs/wiki/Test-Selection-Language).

```shell
nunit-console .\CreditCardValidator.iOS.UITests\bin\Debug\CreditCardValidator.iOS.UITests.dll --where="cat == flerp"
```

#### [Visual Studio for Mac](#tab/vsmac/)
Running tests locally is accomplished using **nunit-console.exe**, NUnit's command-line runner. The command-line switch `--where` matches the categories using a [test selection language](https://github.com/nunit/docs/wiki/Test-Selection-Language).

```shell
nunit-console ./CreditCardValidator.iOS.UITests/bin/Debug/CreditCardValidator.iOS.UITests.dll --where="cat == flerp"
```

* * *

## Submitting Tests to App Center Test by Category

> [!WARNING]
> ️ NUnit category names that contain spaces can't be specified for upload.

You can instruct App Center Test to run a subset of your tests using the `--include-category` parameter.  

```bash
appcenter test run uitest --app "<APP NAME>" --devices <DEVICE SET ID> --app-path <PATH TO IPA> --test-series "<TEST SERIES>" --locale "en_US" --build-dir <PATH TO UITEST BUILD DIRECTORY> 
--include-category flerp 
```

It's also possible to exclude certain tests by category using the `--exclude-category` parameter.

```bash
appcenter test run uitest --app "<APP NAME>" --devices <DEVICE SET ID> --app-path <PATH TO IPA> --test-series "<TEST SERIES>" --locale "en_US" --build-dir <PATH TO UITEST BUILD DIRECTORY> 
--exclude-category erp
```

For more information, see the [NUnit console guide](http://www.nunit.org/index.php?p=consoleCommandLine&r=2.6.4) on how to use *category expressions* to include or exclude tests according to category combinations.

When using `--fixture-chunk`, the whole test suite will be executed and both `--include-cateogry` and `--exclude-category` switches are ignored.

> [!NOTE]
> ️ When running tests locally, `IApp` must be configured with the path to the application and the application bundle.
