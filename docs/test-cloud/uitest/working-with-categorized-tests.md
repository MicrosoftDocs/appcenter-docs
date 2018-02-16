---
title: Working With - Categorized Tests
keywords: uitest test cloud
author: glennwester
ms.author: glwest
ms.reviewer: crdun
ms.date: 01/10/2019
ms.topic: article
ms.assetid: EBA22D3B-EB39-400E-8881-B78D621301D4
ms.service: vs-appcenter
ms.custom: test
---

# Categorized Tests

UITests may be grouped into logical categories by adorning them with the [CategoryAttribute](http://www.nunit.org/index.php?p=category&r=2.6.4) from the NUnit framework. This provides some flexibility on what tests are to be run.

For example, an application may have one set of tests that are specifically for tablets, and another set that are for phones. This makes it possible to run the tablet specific tests seperate from the phone tests.  Another popular scenario is to segregate slow tests from fast tests. The fast tests are run more frequently, perhaps at each commit to source code control. The slow tests are run less frequently, for example at the end of the day.

UITests can be categorised either by text fixture or by test by adding the `CategoryAttribute` to the class or method. It is possible to assign more than one category. The following class shows an example of categorization: 

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
There are two ways to run UITests according to category:

* `appcenter` &ndash; this is the [Command Line Interface](/appcenter/cli/index) for App Center.
* `nunit-console.exe` &ndash; this is the command line runner for NUnit tests. It is also used to run UITests locally.


> [!NOTE]
> Xamarin Test Cloud does not honor the [`ExplicitAttribute`](http://www.nunit.org/index.php?p=explicit&r=2.6.4); tests marked as `Explicit` will still be run.

## Running Tests Locally by Category

[[ide name="vs"]]

Running tests locally is accomplished using **nunit-console.exe**, NUnit's command line runner. The command line switch `/include` identifies the test categories to run, while the switch `/exclude` specifies the test categories to ignore.

```text
nunit-console .\CreditCardValidator.iOS.UITests\bin\Debug\CreditCardValidator.iOS.UITests.dll /include:flerp
```

[[/ide]]

[[ide name="xs"]]

Running tests locally is accomplished using **nunit-console.exe**, NUnit's command line runner. The command line switch `-include` identifies the test categories to run, while the switch `-exclude` specifies the test categories to ignore.

```bash
$ nunit-console ./CreditCardValidator.iOS.UITests/bin/Debug/CreditCardValidator.iOS.UITests.dll -include=flerp
```

[[/ide]]

## Submitting Tests to App Center Test by Category

You can instruct Test Cloud to run a subset of your tests using the 
`--include-category` parameter.  

```bash
appcenter test run uitest --app "<APP NAME>" --devices <DEVICE SET ID> --app-path <PATH TO IPA> --test-series "<TEST SERIES>" --locale "en_US" --build-dir <PATH TO UITEST BUILD DIRECTORY> 
--include-category flerp 
```

It is also possible to exclude certain tests by category using the the 
`--exclude-category` parameter.

```bash
appcenter test run uitest --app "<APP NAME>" --devices <DEVICE SET ID> --app-path <PATH TO IPA> --test-series "<TEST SERIES>" --locale "en_US" --build-dir <PATH TO UITEST BUILD DIRECTORY> 
--exclude-category erp

```

Please the see the [NUnit console documentation](http://www.nunit.org/index.php?p=consoleCommandLine&r=2.6.4) for more information on how to use _category expressions_ to include or exclude tests according to category combinations.

> [!NOTE]
>️ When running tests locally, `IApp` must be configured with the path to the application and the application bundle.


