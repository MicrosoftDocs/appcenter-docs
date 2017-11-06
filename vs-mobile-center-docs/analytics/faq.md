---
title: App Center Analytics Frequently Asked Questions
description: Help using the Analytics features of App Center
keywords: app center, analytics, faq
author: blparr
ms.author: blparr
ms.date: 01/20/2017
ms.topic: article
ms.assetid: bca077bb-4cd9-4b79-bb93-01077680f58e
ms.service: mobile-center
ms.custom: analytics
---

# Analytics FAQ

**Is the data Sampled?**

No, Analytics takes into account all the data it is sent, unless it has an incorrect format.
<br><br>

**What is the latency between a log sent and its representation in the charts?**

The normal latency is a few seconds. It may be longer on occasions though.
<br><br>

**What is the precision of the displayed numbers?**

The error margin of the numbers displayed is under 1%.
<br><br>

**I cannot the session information, why?**

A session is defined as the time between the app coming to the foreground and the last event before going to the background. This means that you will need to define custom events, in order to measure the session length. 
<br><br>

**Why are some charts such as "OS Distribution" for example showing more devices than the total number of installed app?**

The distributions are not snapshots, they are counts of devices that match the metric displayed within the time-range. For example in "OS Distributions" if users upgrade massively from one version to the next within the represented time-range, they will be counted in both versions.
<br><br>

**Why is the country information not showing? / The country information doesn't seem to be correct.**

The country is determined by the carrier country and requires that the device has a SIM. If you are using a tablet or a device with no SIM card, the country will not be reported. If you are using a simulator, the country information will most probably not be accurate.
<br><br>

**What is the maximum number of distinct events that can be sent per app?**

You will be able to send 200 events with distinct names. However, there is no limit on the maximum number of events instances sent per device.
<br><br>

**What is the maximum number of event properties that I can define per event? What happens if I send more than the limit?**

The maximum number of event properties is currently set to five. If more than five properties are sent, they are automatically rejected.
<br><br>

**What is the maximum number of property values that I can send per event?**

You will see the count and distribution for the ten property values with highest count.

**Can I export the raw data?**

Yes. Under app settings, you can export your Analytics raw data into Azure Blob Storage and Application Insights.
