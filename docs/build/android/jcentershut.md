---
title: If Build fails at getting JCenter Bintray resources
description: How to deal with JCenter shutdown
keywords: android
author: 
ms.author: 
ms.date: 14/06/2021
ms.topic: article
ms.assetid: 
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: android
---

# Gradle build after JCenter shutdown
If you are  building Android applications and you still use JCenter and  Bintray resources , it is very likely that you are having problem because of JCenter Bintray being shutdown.
Due to the shutdown (brownout sessions), some of the AppCenter builds were failing, and build logs pointed to Gradle Task failure (could not get JCenter Bintray resources).
Following lines( from Build Logs) illustrate this problem:

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

This is caused by the fact that JFrog has shutdown JCenter (part of Bintray) on May 1, 2021. The JCenter was important part of Android development because a major fraction of Android artifacts were hosted on this site. 
Android developers should port their libraries to Maven Central with precaution that some old libraries are no longer maintained. 
These posts tells you what you need to know and do to avoid disruptions to your build pipelines.

Official JFrog link that announced JCenter shutdown and provides further guidelines.
[Jcenter Shutdown](https://blog.gradle.org/jcenter-shutdown)

Official JFrog Bintray Migration Guide
[Jfrog Bintray Migration Guide](https://www.jfrog.com/confluence/display/BT/JFrog+Bintray+Migration+Guide)

Unofficial Sonatype guide for publishers
[What publishers need to know about migrating from Jcenter Bintray to the central repository](https://blog.sonatype.com/what-publishers-need-to-know-about-migrating-from-jcenter-/-bintray-to-the-central-repository)
