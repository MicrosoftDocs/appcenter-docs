---
title: Preparing Appium Tests for Upload
description: How to upload Appium tests to App Center Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 898eec94-dfbb-4b10-a72b-b86d3bcf7ff7
ms.service: vs-appcenter
ms.custom: test
---

# Preparing Appium Tests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload
to Test Cloud vary depending on the test framework. The section below provides instructions for preparing Appium tests written in Java with JUnit for upload to Test Cloud. For guidance on authoring Appium tests, see the [Appium documentation](http://appium.io/slate/en/master/?java#)

Note the following limitations for Appium support:

* No support for TestNG
* No support for Android 4.2 or prior
* Maven version must be atleast 3.3.9
* Support for Appium version 1.6 only
* JUnit 4.9 or newer
* Automating browsers (web testing) is not supported.
* Tests that launch multiple apps or no apps are not currently supported. The test must launch precisely one app.

## 1a. Changes to the build system for Maven users
_See the section below for instructions if you use Gradle for your project,
such as Android Studio builds._
### Step 1 - Add dependency
Add the following dependency in your `pom.xml` file:
```xml
<dependency>
    <groupId>com.xamarin.testcloud</groupId>
    <artifactId>appium</artifactId>
    <version>1.0</version>
</dependency>
```
This will ensure the enhanced Android and iOS drivers are available at compile time. The enhanced drivers are provided primarily to enable the `label` feature. See Step 4 for more detail on the `label` feature.

### Step 2 - Add upload profile
Copy [this snippet](https://github.com/xamarinhq/test-cloud-appium-java-extensions/blob/master/uploadprofilesnippet.xml) into your `pom.xml` in the `<profiles>` tag. If there's no `<profiles>` section in your pom, make one.
The profile, when activated, will pack your test classes and all dependencies into the `target/upload` folder, ready to be uploaded to Test Cloud.

## 1b. Changes to the build system for Gradle users
Add the following snippet to the `build.gradle in the 'app' folder:

```gradle
apply plugin: 'maven'

task createPom {
    pom {
        withXml {
            def dependenciesNode = asNode().appendNode('dependencies')

            //Iterate over the compile dependencies (we don't want the test ones), adding a <dependency> node for each
            configurations.testCompile.allDependencies.each {
                def dependencyNode = dependenciesNode.appendNode('dependency')
                dependencyNode.appendNode('groupId', it.group)
                dependencyNode.appendNode('artifactId, it.name)
                dependencyNode.appendNode('version', it.version)
            }

            def profilesNode = asNode().appendNode('profiles')
            profilesNode.append(new XmlParser().parse('https://raw.githubusercontent.com/xamarinhq/test-cloud-appium-java-extensions/master/gradleuploadprofilesnippet.xml'))
        }
    }.writeTo("pom.xml")
```

## 2. Changes to the tests
### Step 1 - Add imports
Import these packages into your test classes:
```java
import com.xamarin.testcloud.appium.Factory;
import com.xamarin.testcloud.appium.EnhancedAndroidDriver;
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
Replace your _declaration_ of `AndroidDriver<MobileElement>` with `EnhancedAndroidDriver<MobileElement>` or `IOSDriver<MobileElement>` with `EnhancedIOSDriver<MobileElement>`
```java
    private static EnhancedAndroidDriver<MobileElement> driver;
```
### Step 4 - Update your driver instantiations
Replace the way you _instantiate_ your driver, such that lines in the form of:
```java
    driver = new AndroidDriver<MobileElement>(url, capabilities);
```
...become:
```java
    driver = Factory.createAndroidDriver(url, capabilities);
```
Using these drivers will still allow you to run your tests locally without additional modifications, but enables you to "label" test steps in your test execution using `driver.label("text")`. The text and a screenshot from the device will be visible in test report in  Test Cloud.
A recommended practice is to have a call to label in the `@After` method, this will include a screenshot of the app final state in the test report. The screenshot will be taken, even if a test is failing, and often provides valuable information as to why it does so. An example `@After` method for a test could look like this:
```java
    @After
    public void TearDown(){
        driver.label("Stopping App");
        driver.quit();
    }
```
