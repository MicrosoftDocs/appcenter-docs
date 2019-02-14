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

The steps necessary to prepare an app and its corresponding test suite for upload to Test Cloud vary depending on the test framework. The section below provides instructions for preparing Appium tests written in Java with JUnit for upload to Test Cloud. For guidance on authoring Appium tests, see the [Appium documentation](http://appium.io/docs/en/about-appium/intro/).

Note the following limitations for Appium support:

* No support for TestNG.
* No support for Android 4.2 or prior.
* Maven version must be at least 3.3.9.
* Support for Appium version 1.7.1 only.
* JUnit 4.9 - 4.12 is supported; we don't support JUnit 5.
* Automating browsers or WebView context is not supported.
* Tests that launch multiple apps or no apps are not currently supported. The test must launch precisely one app.

## Prerequisites

Tests will be run using Maven Surefire. This requires tests to follow [certain naming conventions](http://maven.apache.org/surefire/maven-surefire-plugin/examples/inclusion-exclusion.html):

```text
"**/Test*.java" - includes all of its subdirectories and all Java filenames that start with "Test".
"**/*Test.java" - includes all of its subdirectories and all Java filenames that end with "Test".
"**/*Tests.java" - includes all of its subdirectories and all Java filenames that end with "Tests".
"**/*TestCase.java" - includes all of its subdirectories and all Java filenames that end with "TestCase".
```

Before attempting to upload to App Center Test, please make sure that running tests locally on your machine using Maven works:

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

## 1a. Changes to the build system for Maven users

See the section below for instructions if you use Gradle for your project, such as Android Studio builds.

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

This will ensure the enhanced Android and iOS drivers are available at compile time. The enhanced drivers are provided primarily to enable the `label` feature. See Step 4 for more detail on the `label` feature.

### Step 2 - Add upload profile

Copy [this snippet](https://github.com/Microsoft/AppCenter-Test-Appium-Java-Extensions/blob/master/uploadprofilesnippet.xml) into your `pom.xml` in the `<profiles>` tag. If there's no `<profiles>` section in your pom, make one.
The profile, when activated, will pack your test classes and all dependencies into the `target/upload` folder, ready to be uploaded to Test Cloud.

## 1b. Changes to the build system for Gradle users

### Step 1 - Add repository and dependency

Ensure you have the JCenter repository enabled in the `build.gradle` in your project's root folder:

```gradle
allprojects {
    repositories {
        jcenter()
    }
}
```

Then add the following snippet to the `build.gradle` in the `app` folder:

```gradle
androidTestCompile('com.microsoft.appcenter:appium-test-extension:1.0')
```

Starting with Gradle 3.0, `androidTestCompile` is [deprecated](https://docs.gradle.org/current/userguide/java_library_plugin.html#sec:java_library_separation) and you should use `androidTestImplementation` instead.

### Step 2 - Automate pom file generation

The uploader requires a `pom.xml` file to work. Add the following snippet to the `build.gradle` in the `app` folder to automatically build the pom file:

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
                dependencyNode.appendNode('artifactId', it.name)
                dependencyNode.appendNode('version', it.version)
            }

            def profilesNode = asNode().appendNode('profiles')
            profilesNode.append(new XmlParser().parse('https://raw.githubusercontent.com/Microsoft/AppCenter-Test-Appium-Java-Extensions/master/gradleuploadprofilesnippet.xml'))
        }
    }.writeTo("pom.xml")
```

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

A recommended practice is to have a call to label in the `@After` method, this will include a screenshot of the app final state in the test report. The screenshot will be taken, even if a test is failing, and often provides valuable information as to why it does so. An example `@After` method for a test could look like this:

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

Tests run on devices in the AppCenter may execute slightly slower than on a local device under certain circumstances. Normally, this is outweighed by the fact that you have many more devices available and therefore potentially able to parallelize test runs.

There are two main sources of potential slow test runs: re-signing and re-installation.

### Re-signing (on iOS)

Before being installed on the iOS device, your app goes through a process called re-signing. This is necessary to make the provisioning profile match the device in the cloud. Re-signing does take some time, typically ~1-2 minutes. This does rarely cause performance degrades because re-signed apps are cached. The time consuming process will only run once per binary.

If you have a very automated Continuous Delivery setup where the IPA is having it’s version bumped before being built and tested, then the binary will be different for each test and the re-signing penalty will occur more often.

### Re-installation

On a shared device cloud, it is very important for us to guarantee that devices are cleaned between each test. The next customer using the device may be someone from another organization.
Running tests locally does not inflict any penalty because the app mostly stays installed through all tests. In App Center Test, the app is automatically uninstalled after each test. The next test will then have to re-install the app before running the test. This can slow down your tests in the cloud.
Luckily, there’s a solution. Instead of having the appium driver create a new session for each test case, just have one session and re-use it for all tests. To control the app state, make a call to `driver.resetApp()` before each test. This will only incur a 5-second delay between test cases. You can implement this by moving the driver initialization code from the `setUp` method to the `setUpClass` method.
