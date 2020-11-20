---
title: Why doesn't my Appium test show test results?
description: Test file names that don't follow the Surefire naming pattern won't be executed.
keywords: appcenter, test, stall
author: king-of-spades
ms.author: kegr
ms.date: 07/24/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Why doesn't my Appium test show test results?
The most common reason for Appium tests not executing is if test class filenames don't match the Surefire naming pattern. Appium tests are executed using the Surefire Maven plugin. This requirement is mentioned in our [prerequisites](~/test-cloud/frameworks/appium/index.md#prerequisites). If your test class file names don't follow the naming patterns used by Surefire, they won't be found or executed.

If no tests were found to execute in your Appium upload, the App Center user interface will display `Something went wrong while running your tests` and show the test log file. Normally, after the Surefire step, you'd see something in the test log file like this:

```
[INFO] --- maven-surefire-plugin:2.20:test (default-test) @ run-test --- 
[INFO]
[INFO] ----------------------------------------------------
[INFO]  T E S T S
[INFO] ----------------------------------------------------
[INFO] Running ... 
...
```

But, if there were no tests found to execute then the log continues with the next step without showing any test results, like:

```
[INFO] --- maven-surefire-plugin:2.20:test (default-test) @ run-test ---
[INFO] 
[INFO] --- maven-jar-plugin:2.4:jar (default-jar) @ run-test ---
```

The default naming pattern and options are described in the [Surefire documentation](http://maven.apache.org/surefire/maven-surefire-plugin/examples/inclusion-exclusion.html). When executing in App Center Test these file name patterns are case-sensitive. For example, `MyTest` would be found but `Mytest` wouldn't.

If you're hitting this issue, then change the class file names to match the Surefire names (or change your Surefire settings).

After making changes to your tests, execute the [prepare step](~/test-cloud/frameworks/appium/index.md#3-upload-to-app-center-test) again before submitting your tests.