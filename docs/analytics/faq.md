---
title: App Center Analytics Frequently Asked Questions
description: Help using the Analytics features of App Center
keywords: app center, analytics, faq
author: blparr
ms.author: blparr
ms.date: 01/20/2017
ms.topic: article
ms.assetid: bca077bb-4cd9-4b79-bb93-01077680f58e
ms.service: vs-appcenter
ms.custom: analytics
---

# Analytics FAQ

**Is the data sampled?**

The data is not sampled. Analytics will use all the data that is sent, unless it is sent in the wrong format or some of the known limits is reached.
<br><br>

**What is the latency between a log sent and its representation in the Analytics dashboards?**

The latency is typically just a few seconds.
<br><br>

**If the app is offline, does the SDK store the logs and then send them once it is back online?**

Yes. If the app is offline, the SDK will store up to 300 logs in storage. Once the network connectivity is restored, the SDK will send these logs to the App Center backend.
<br><br>

**Session duration is unknown, why?**

A session is defined as the time from the app coming to foreground to the last event before going to the background. If no custom events are identified within 5 minutes in a session, the session will not be counted.
<br><br>

**Why is my "OS Distribution" chart showing more devices than the number of installs?**

OS Distribution counts are not snapshots. They are counts of devices that match the selected time period. For example, if users massively upgrade from one version to the next one within the selected time period, they will be counted in both versions.
<br><br>

**Why is the country information not showing? / The country information doesn't seem to be correct.**

The country is determined by the carrier country and requires that the device has a SIM. If you are using a tablet or a device with no SIM card, the country will not be reported. If you are using a simulator, the country information will most probably not be accurate.
<br><br>

**What is the maximum number of distinct events that can be sent per app?**

The maximum number of distinct custom events that we will track per day is 200. This count will be reset daily at 12am UTC. However, there is no limit on the maximum number of events instances sent per device.
<br><br>

**What is the maximum number of event properties that I can define per event? What happens if I send more than the limit?**

The maximum number of event properties is currently set to five. If more than five properties are sent, they are automatically rejected.
<br><br>

**What is the maximum number of property values that I can send per event?**

You will see the count for the ten property values with highest count.
<br><br>

**Why am I not seeing any data in log flow?**

The log flow page will show you the incoming logs as they come in. In order to start seeing the logs flowing, you will need to open the log flow page, and then start sending logs from the app.
<br><br>

**Can I export the raw data?**

Yes. Under app settings, you can export all your Analytics raw data into Azure Blob Storage and Application Insights.
<br><br>
