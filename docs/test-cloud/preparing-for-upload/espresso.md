---
title: Preparing Espresso Tests for Upload
description: How to upload Espresso tests to App Center Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 07/16/2018
ms.topic: article
ms.assetid: 3864334f-d938-4ac9-9e82-640c3f839eae
ms.service: vs-appcenter
ms.custom: test
---

# Preparing Espresso Tests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload
to App Center vary depending on the test framework. The section below provides instructions for preparing Espresso tests for upload to Test Cloud. For guidance on authoring Espresso tests, see the [Espresso documentation](https://developer.android.com/training/testing/ui-testing/espresso-testing.html)

## 1. Changes to the build system
First you'll need to add the JCenter Maven repository. Make sure you have a `jcenter()` entry in the `build.gradle` in your project root directory:

```gradle
allprojects {
    repositories {
        jcenter()
    }
}
```

Add the following dependency in your app module's `build.gradle` file:

```gradle
androidTestCompile('com.microsoft.appcenter:espresso-test-extension:1.3')
```

Starting with Gradle 3.0, `androidTestCompile` is [deprecated](https://docs.gradle.org/current/userguide/java_library_plugin.html#sec:java_library_separation) and you should use `androidTestImplementation` instead.

This will add the Test Cloud [Espresso Extensions](https://github.com/Microsoft/AppCenter-Test-Espresso-Extensions) as a dependency to your project, which ensures that the `ReportHelper` is available at compile time. The `ReportHelper` enables the `label` feature. See Step 3 for more detail on the `label` feature.

## 2. Changes to the tests

### Step 1 - Add imports

Import these packages into your test classes:

```java
import android.support.test.runner.AndroidJUnit4;
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

Using the helper will still allow you to run your tests locally without additional modifications, but enables you to "label" test steps in your test execution using `reportHelper.label("myTestStepLabel")`. The label text will be used to navigate the test steps and corresponding screenshots in the test report.

A recommended practice is to have a call to label in the `@After` method, this will include a screenshot of the app final state in the test report. The screenshot will be taken, even if a test is failing, and often provides valuable information as to why it does so. An example `@After` method for a test could look like this:

```java
@After
public void TearDown(){
    reportHelper.label("Stopping App");
}
```
To build the project and test apk files, run each of the following commands.

```
./gradlew assembleDebug
./gradlew assembleDebugAndroidTest
```

> [!NOTE]
> You will need to ensure your path variable has access to your machine's Java installation.

Once a test suite has been instrumented with the Test Cloud extensions, it can be [uploaded to Test Cloud](~/test-cloud/starting-a-test-run.md).
