---
title: Analytics Frequently Asked Questions
description: Help using the Analytics features of Mobile Center
keywords: mobile center, analytics, faq
author: blparr
---

# Analytics FAQ

**Is the data Sampled?**

No, Analytics takes into account all the data it is sent, unless it has an incorrect format.


**What is the latency between a log sent and its representation in the charts?**

The normal latency is a few seconds. It may be longer on occasions though


**What is the precision of the displayed numbers?**

The error margin of the numbers displayed is under 1%


**Why are some charts such as "OS Distribution" for example showing more devices than the total number of installed app?**

The distributions are not snapshots, they are counts of devices that match the metric displayed within the time-range. For example in "OS Distributions" if users upgrade massively from one version to the next within the represented time-range, they will be counted in both versions.


**What is the maximum number of event properties that I can define per event? What happens if I send more than the limit?**

The maximum number of event properties is currently set to five. If more than five properties are sent, they are automatically rejected.


**What is the maximum number of property values that I can send per event?**

There is no limit on the number of property values that you can send. However, you will see the five values with highest count.

**What is the maximum number of distinct events that can be sent per app?**

You will be able to send 200 events with distinct names. However, there is no limit on the maximum number of events instances sent per device.
