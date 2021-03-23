---
title: Preparing Espresso Tests for Upload
description: How to upload Espresso tests to App Center Test Cloud
keywords: test cloud
author: lucen-ms
ms.author: kegr
ms.date: 01/31/2020
ms.topic: article
ms.assetid: 3864334f-d938-4ac9-9e82-640c3f839eae
ms.service: vs-appcenter
ms.custom: test
---

# Preparing Espresso Tests for Upload
This document provides instructions for preparing Espresso tests for upload to Test. For guidance on authoring Espresso tests, see the [Espresso documentation](https://developer.android.com/training/testing/ui-testing/espresso-testing.html).

## 1. Changes to the build system

Add the JCenter Maven repository. Make sure you have a `jcenter()` entry in the **build.gradle** in your project root directory:

```gradle
allprojects {
    repositories {
        jcenter()
    }
}
```

Add the following dependency in your app module's **build.gradle** file:

```gradle
androidTestImplementation('com.microsoft.appcenter:espresso-test-extension:1.4')
```

This code adds the Test [Espresso Extensions](https://github.com/Microsoft/AppCenter-Test-Espresso-Extensions) as a dependency to your project, which ensures that the `ReportHelper` is available at compile time. The `ReportHelper` enables the `label` feature. See Step 3 for more detail on the `label` feature. 

If you're using a version of Gradle lower that 3.0, then you might need to replace `androidTestImplementation` with `androidTestCompile` as explained in the [gradle docs](https://docs.gradle.org/current/userguide/java_library_plugin.html#sec:java_library_separation).

## 2. Changes to the tests

### Step 1 - Add imports

Import these packages into your test classes:

```java
import org.junit.Rule;
import org.junit.After;
import com.microsoft.appcenter.espresso.Factory;
import com.microsoft.appcenter.espresso.ReportHelper;
```

### Step 2 - Instantiate the ReportHelper

Insert this declaration in each of your test classes:

```java
@Rule
public ReportHelper reportHelper = Factory.getReportHelper();
```

### Step 3 - Update your test cases

Using the helper still allows you to run your tests locally without additional modifications, but enables you to *label* test steps in your test execution using `reportHelper.label("myTestStepLabel")`. The label text is used to navigate the test steps and corresponding screenshots in the test report.

It's recommended to call `label` in the `@After` method, this call takes a screenshot of the app final state for the test report. The screenshot is taken even if a test fails. An example `@After` method for a test could look like this:

```java
@After
public void TearDown(){
    reportHelper.label("Stopping App");
}
```
To build the project and test apk files, run each of the following commands.

```shell
./gradlew assembleDebug
./gradlew assembleDebugAndroidTest
```

> [!NOTE]
> You system `path` variable must include access to your machine's Java installation.

Once a test suite has been instrumented with the Test Cloud extensions, [upload it to Test Cloud](~/test-cloud/starting-a-test-run.md).
