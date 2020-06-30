---
title: Handling Concurrent Database Changes During Tests
description: Test file names that do not follow the Surefire naming pattern will not be executed.
keywords: appcenter, test, stall
author: king-of-spades
ms.date: 06/15/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Why does my Appium test show no test results?
The most common reason we have seen for no tests executing in an Appium test run is that the test class file names do not match the Surefire naming pattern. Appium tests are executed using the Surefire Maven plugin. This is mentioned in our documentation at [Prerequisites](~/test-cloud/preparing-for-upload/appium#prerequisites). If your test class file names do not follow the naming patterns used by Surefire they will not be found by Surefire and will not be executed.

If no tests were found to execute in your Appium upload the App Center user interface will display the text _Something went wrong while running your tests_ and show the test log file. Normally, in the test log file, after the Surefire step you would see something like:

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

The default Surefire naming pattern and how to change it is described in the [Surefire documentation](http://maven.apache.org/surefire/maven-surefire-plugin/examples/inclusion-exclusion.html).  When executing in App Center Test these file name patterns are case sensitive so, for example, "MyTest" would be found but "Mytest" would not.

If you are encountering this issue, then change the class file names to match the Surefire names (or change your Surefire settings).

After making changes to your tests, execute the [prepare step](~/test-cloud/preparing-for-upload/appium#3-upload-to-app-center-test) again before submitting your tests.