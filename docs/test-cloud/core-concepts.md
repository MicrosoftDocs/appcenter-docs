---
title: App Center Test Core Concepts
description: Glossary of terms used in App Center Test
keywords: Test
author: lucen-ms
ms.author: lucen
ms.date: 09/25/2020
ms.topic: article
ms.assetid: 5ed07ad2-ed36-4812-adbb-fc1cbf7931df
ms.service: vs-appcenter
ms.custom: test
---

# App Center Test Core Concepts
[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

It is helpful to familiarize yourself with the core concepts that comprise the App Center Test experience.


|       Concept        |                                                                                                                                                                                                                                                                 Definition                                                                                                                                                                                                                                                                  |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Device Configuration |                                                                                                                                                                                    A combination of device model and operating system version. For example, an iPhone 7 running iOS 10 and an iPhone 7 running iOS 10.2 are 2 different configurations.                                                                                                                                                                                     |
|     Device Tier      | Device configurations are organized by tiers. Tier 1 devices are the most popular in the market. They typically include the flagship phones from the major manufacturers. Tier 1 devices are maintained at higher volume and usually have shorter wait times than other tiers. As these configurations age, they'll eventually become Tier 2. Tier 3 devices are typically edge devices that aren't common or popular in the market. Tier 3 devices are maintained in small volumes and have a high chance of longer wait times. |
|      Device Set      |                                                                                                                                                                            A collection of device configurations. Device sets are typically used to conveniently access devices commonly used for repeated tasks, such as devices for running basic smoke tests.                                                                                                                                                                            |
|  Device Concurrency  | Device concurrency is the maximum number of devices an account can run tests on at once. Once the concurrency limit[1] is reached across all test runs, additional devices are queued until one or more of those running tests finish. Concurrency is determined by the account's subscription level, and it's also the basis for pricing.                                       |
|       Test Run       |                                                                                                                                                                               An execution of your test suite against the provided app binary on the selected device set. Test runs can be kicked off using the App Center CLI tool.                                                                                                                                                                               |
|     Test Report      |                                                                                                                         The artifact generated by a test run. The test report includes the overall pass/fail status, a detailed breakdown of pass/fail status by manufacturer, operating system version, and form factor, and assets such as screenshots and device logs. Test reports are viewable in the web UI.                                                                                                                          |
|     Test Series      |                                                                                                                     Test Series are an arbitrary system for organizing your test runs. They can be thought of as labels that are used by the UI to group related test runs together. Common uses for test series include feature area (for example, "login tests") and development stage (for example, "smoke tests").                                                                                                                     |

[1] - Note on Concurrency Limits: If a specific device (model & OS version) has limited availability, it may be queued despite available concurrency. Each account can use up to 50% of the available instances of a specific device. This limitation is to preserve reasonable availability to other testers. 
