---
title: Understanding Build Execution Time
description: Comparing local build times to App Center
keywords: build, faq
author: elamalani
ms.date: 06/08/2020
ms.topic: article
ms.assetid: bcb76094-34c6-48ae-a24d-60c14a261518
ms.service: vs-appcenter
ms.custom: build
---

# Understanding Build Execution Time
## Why is the build in App Center taking longer than my local build?
There are many reasons why build duration can be higher when using App Center Build:

* When running your build locally, many things are cached, including NuGet packages, pods, dependencies and so on. In App Center, we always do a clean build, and also redownload dependencies not already included in your repository.
* [Build configuration differences](~/build/troubleshooting/build-failed#if-building-works-locally-but-not-in-app-center) between your local build compared to App Center. For example, a signed device build typically takes longer than a simulator build. 
* The CPU power of your development machine may be higher than the CPU of our VMs.
* If you have more builds queued then you have build concurrency for your organization.
* If your build includes other production tasks like running tests or publishing binaries those can also increase the total completion time.

## Why do I get an extended build time when **Run launch test on a device** is enabled?
We run the test as part of the build operation, which gives the added build time. What happens is that while App Center Test is validating your app is ready to run on real devices, several things can happen here like signing, checking permissions, and so on. After that it's time to wait for a device. Third, it's running the app on a phone, which takes little time. And lastly, we move test logs, screenshots into the cloud.

Expect an additional **10 minutes of build time**.

## Contact Support
We're always working on improving build times. If you consider the build duration for your app is too long compared to your expectations, contact us on the App Center website using **? > Contact Support**.