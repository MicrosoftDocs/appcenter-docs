---
title: If Build fails at getting JCenter Bintray resources
description: How to deal with JCenter shutdown
keywords: android
author: milenkomarkovic
ms.author: v-gradojcic
ms.date: 06/16/2021
ms.topic: article
ms.assetid: 
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: android
---

# Gradle build after JCenter shutdown

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

If you use JCenter and Bintray resources in your AppCenter Android builds and your builds fail on Gradle Task failure (could not get resource error), it's because JCenter Bintray is being shut down.
Following lines (from Build Logs) illustrate this problem:

> ```
> Resolved com.android.tools.build:gradle:3.5.4 in :classpath 
> Resolved com.google.gms:google-services:4.2.0 in :classpath 
> Project mobileapp at : is either no Android app project or build version has not been set to override. Skipping...
> Configure project :@react-native-community_async-storage
> Project @react-native-community_async-storage at :@react-native-community_async-storage is either no Android app project or build version has not been set to override.
> * What went wrong:
> Execution failed for task ':app:***'.
> Could not resolve all files for configuration ':app:lintClassPath'.
> Could not download groovy-all.jar (org.codehaus.groovy:groovy-all:2.4.15)
> Could not get resource 'https://jcenter.bintray.com/org/codehaus/groovy/groovy-all/2.4.15/groovy-all-2.4.15.jar'.
> Could not GET 'https://jcenter.bintray.com/org/codehaus/groovy/groovy-all/2.4.15/groovy-all-2.4.15.jar'.
> ```
>

This problem is caused by the fact that JFrog has shutdown JCenter (part of Bintray) on May 1, 2021. The JCenter was important part of Android development because a major fraction of Android artifacts were hosted on this site. 
Android developers should port their libraries to Maven Central with precaution that some old libraries are no longer maintained. 
These posts tell you what you need to know and do to avoid disruptions to your build pipelines.

- [JCenter Shutdown announcement](https://blog.gradle.org/jcenter-shutdown)
- [JFrog Bintray Migration Guide](https://www.jfrog.com/confluence/display/BT/JFrog+Bintray+Migration+Guide)
- [What publishers need to know about migrating from JCenter Bintray to the central repository](https://blog.sonatype.com/what-publishers-need-to-know-about-migrating-from-jcenter-/-bintray-to-the-central-repository)
