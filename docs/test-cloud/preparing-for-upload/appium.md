---
title: Preparing Appium Tests for Upload
description: How to upload Appium tests to App Center Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 02/13/2019
ms.topic: article
ms.assetid: 898eec94-dfbb-4b10-a72b-b86d3bcf7ff7
ms.service: vs-appcenter
ms.custom: test
---

# Preparing Appium Tests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload to Test Cloud vary depending on the test framework. The section below provides instructions for preparing Appium tests written in Java with JUnit for upload to Test Cloud. For guidance on authoring Appium tests, see the [Appium documentation](https://appium.io/docs/en/about-appium/intro/).

Note the following limitations for Appium support:

* No support for TestNG.
* No support for Android 4.2 or prior.
* No support for automating browsers or WebView context.
* Maven version must be at least 3.3.9.
* Support for Appium version 1.11.0 only. This appium version requires the appium java client to be at least 6.0.0  
* JUnit 4.9 - 4.12 is supported; we don't support JUnit 5.
* Tests must target precisely one app. (`MobileCapabilityType.FULL_RESET` is supported)

## Prerequisites

Tests will be run using Maven Surefire, which requires tests to follow [certain naming conventions](https://maven.apache.org/surefire/maven-surefire-plugin/examples/inclusion-exclusion.html):

```text
"**/Test*.java" - includes all of its subdirectories and all Java filenames that start with "Test".
"**/*Test.java" - includes all of its subdirectories and all Java filenames that end with "Test".
"**/*Tests.java" - includes all of its subdirectories and all Java filenames that end with "Tests".
"**/*TestCase.java" - includes all of its subdirectories and all Java filenames that end with "TestCase".
```

Before attempting to upload to App Center Test, make sure that running tests locally on your machine using Maven works:

```text
➜  AppiumTest git:(master) ✗ mvn verify
...
Running MainTest
started: SimpleTest (MainTest)
Setting up capabilities
failed
finished
Tests run: 2, Failures: 0, Errors: 2, Skipped: 0, Time elapsed: 0.728 sec <<< FAILURE!
SimpleTest(MainTest)  Time elapsed: 0.594 sec  <<< ERROR!
...
```

If you're unable to run the tests using command line locally, tests will also not work in App Center Test.

## 1. Changes to the build system

### Step 1 - Add repository and dependency

You will need to add the JCenter repository to your `pom.xml` file:

```xml
<repositories>
    <repository>
      <id>jcenter</id>
      <url>https://jcenter.bintray.com/</url>
    </repository>
</repositories>
```

Then add a dependency for the Appium test extensions:

```xml
<dependency>
    <groupId>com.microsoft.appcenter</groupId>
    <artifactId>appium-test-extension</artifactId>
    <version>1.5</version>
</dependency>
```

This code will ensure the enhanced Android and iOS drivers are available at compile time. The enhanced drivers are provided primarily to enable the `label` feature. See Step 4 for more detail on the `label` feature.

### Step 2 - Add upload profile

Copy [this snippet](https://github.com/Microsoft/AppCenter-Test-Appium-Java-Extensions/blob/master/uploadprofilesnippet.xml) into your `pom.xml` in the `<profiles>` tag. If there's no `<profiles>` section in your pom, make one.
The profile, when activated, will pack your test classes and all dependencies into the `target/upload` folder, ready to be uploaded to Test Cloud.

## 2. Changes to the tests

### Step 1 - Add imports

Import these packages into your test classes:

```java
import com.microsoft.appcenter.appium.Factory;
import com.microsoft.appcenter.appium.EnhancedAndroidDriver;
import org.junit.rules.TestWatcher;
import org.junit.Rule;
```

### Step 2 - Instantiate the TestWatcher

Insert this declaration in each of your test classes:

```java
    @Rule
    public TestWatcher watcher = Factory.createWatcher();
```

### Step 3 - Update your driver declaration

Replace your *declaration* of `AndroidDriver<MobileElement>` with `EnhancedAndroidDriver<MobileElement>` or `IOSDriver<MobileElement>` with `EnhancedIOSDriver<MobileElement>`

```java
    private static EnhancedAndroidDriver<MobileElement> driver;
```

### Step 4 - Update your driver instantiations

Replace the way you *instantiate* your driver, such that lines in the form of:

```java
    driver = new AndroidDriver<MobileElement>(url, capabilities);
```

...are changed to:

```java
    driver = Factory.createAndroidDriver(url, capabilities);
```

Using these drivers will still allow you to run your tests locally without additional modifications, but enables you to "label" test steps in your test execution using `driver.label("text")`. The text and a screenshot from the device will be visible in test report in  Test Cloud.

A recommended practice is to have a call to label in the `@After` method, which will include a screenshot of the app final state in the test report. A screenshot will be taken, even if a test is failing, and often provides valuable information as to why it does so. An example `@After` method for a test could look like this code:

```java
    @After
    public void TearDown(){
        driver.label("Stopping App");
        driver.quit();
    }
```

## 3. Upload to App Center Test

Steps to upload a test:

1. Generate an App Center Test upload command using the instructions at [starting a test run](~/test-cloud/starting-a-test-run.md).
2. Pack your test classes and all dependencies into the `target/upload` folder:

   ```shell
   mvn -DskipTests -P prepare-for-upload package
   ```

3. Perform upload:

   ```shell
   appcenter test run appium --app "APP_ID" --devices "DEVICE_SET_ID" --app-path PATH_TO_FILE.apk  --test-series "master" --locale "en_US" --build-dir target/upload
   ```

## 4. Performance Troubleshooting

Tests on devices in the AppCenter may execute slightly slower than on a local device under certain circumstances. Normally, this slower execution is outweighed by the fact that you have many more devices available and the ability to parallelize test runs.

There are two main sources of slower test runs: re-signing and reinstallation.

### Re-signing (on iOS)

Before being installed on the iOS device, your app goes through a process called re-signing. This process is necessary to make the provisioning profile match the device in the cloud. Re-signing does take some time, typically ~1-2 minutes. Rarely, re-signing also causes performance degradation because re-signed apps are cached. The time consuming process will only run once per binary.

If you have an automated Continuous Delivery setup where the IPA is having its version bumped before being built and tested, then the binary will be different for each test and the re-signing penalty will occur more often.

### Reinstallation

On a shared device cloud, it is important for us to guarantee that devices are cleaned between each test. The next customer using the device may be someone from another organization.  In App Center Test, the app is automatically uninstalled after the completion of your test run. 

It's possible to omit `MobileCapabilityType.FULL_RESET` and set `MobileCapabilityType.NO_RESET` to `true` to speed up test execution. See [Reset Strategies](https://appium.io/docs/en/writing-running-appium/other/reset-strategies/index.html) for details.
