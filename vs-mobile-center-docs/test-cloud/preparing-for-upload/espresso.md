---
title: Preparing Espresso Tests for Upload
description: How to upload Espresso tests to Mobile Center Test Cloud
keywords: test cloud
author: jraczak
ms.author: jurac
ms.date: 01/20/17
ms.topic: article
ms.assetid: 3864334f-d938-4ac9-9e82-640c3f839eae
ms.service: mobile-center
---

# Preparing Espresso Tests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload
to Test Cloud vary depending on the test framework. The section below provides instructions for preparing Espresso tests for upload to Test Cloud. For guidance on authoring Espresso tests, see the [Espresso documentation](https://developer.android.com/training/testing/ui-testing/espresso-testing.html)

## 1. Changes to the build system
Add the following dependency in your app module's `build.gradle` file:

```gradle
androidTestCompile('com.xamarin.testcloud:espresso-support:1.1')
```

This will ensure the reportHelper is available at compile time. The reportHelper enables the `label` feature. See Step 3 for more detail on the `label` feature.

## 2. Changes to the tests

### Step 1 - Add imports

Import these packages into your test classes:

```java
import android.support.test.runner.AndroidJUnit4;
import com.xamarin.testcloud.espresso.Factory;
import com.xamarin.testcloud.espresso.ReportHelper;
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
