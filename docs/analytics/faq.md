---
title: App Center Analytics Frequently Asked Questions
description: Help using the Analytics features of App Center
keywords: app center, analytics, faq
author: lucen-ms
ms.author: lucen
ms.date: 04/29/2021
ms.topic: article
ms.assetid: bca077bb-4cd9-4b79-bb93-01077680f58e
ms.service: vs-appcenter
ms.custom: analytics
---

# Analytics FAQ
 
[!INCLUDE [Retirement announcement for App Center](../includes/retirement.md)]

## Is the data sampled?
The data isn't sampled. Analytics will use all the data that's sent, unless it's sent in the wrong format or some of the known limits are reached.

## What's the latency between a log sent and its representation in the Analytics dashboards?
The latency is typically a few minutes.

## If the app is offline, does the SDK store the logs and then send them once it's back online?
Yes. When there's no network connectivity, the SDK saves up to 10 MB (by default) of logs in the local storage. The storage size can be changed via `setMaxStorageSize` API. Once the storage is full, the SDK starts discarding old logs to make room for the new logs. Once the network connectivity is restored, the SDK will send these logs to the App Center backend.

## Session duration is unknown, why?
A session is defined as the time from the app coming to foreground to the last event before going to the background. If no custom events are identified within 5 minutes in a session, the session won't be counted.

## Why's my "OS Distribution" chart showing more devices than the number of installs?
OS Distribution counts aren't snapshots. They're counts of devices that match the selected time period. For example, if users upgrade from one OS version to a newer version within the selected time period, they'll be counted in both OS versions. If a significant number of users upgrade within the time period, the overlap could cause noticeably more devices in the "OS Distribution" chart than the number of installs.

## Why's the country/region information not showing? / The country/region information doesn't seem to be correct.
The country/region is determined by the carrier country/region and requires that the device has a SIM. If you're using a tablet or a device with no SIM card, the country/region won't be reported. If you're using a simulator, the country/region information probably won't be accurate.

## What's the maximum number of distinct events that can be sent per app?
For Analytics, the maximum number of distinct custom events that we'll track per day is 200. Counts will be reset daily at 12am UTC. However, there's no limit on the maximum number of events instances sent per device.

The 200 distinct events a day limit does not apply to [Export](./export.md). We export all logs we accept, even if we do not track them in Analytics.

## What's the maximum number of event properties that I can define per event? What happens if I send more than the limit?
The maximum number of event properties is currently set to 20. If more than 20 properties are sent, they're automatically rejected.

## What's the maximum number of property values that I can send per event?
You'll see the count for the 10 property values with highest count.

## Why am I not seeing any data in log flow?
The log flow page will show you the incoming logs as they come in. To start seeing the logs flowing, you'll need to open the log flow page, and then start sending logs from the app.

## Can I export the raw data?
Yes. Under app settings, you can export all your Analytics raw data into Azure Blob Storage and Application Insights.

## What are the time period limitations to send a log to App Center?
The App Center backend will only accept logs that are no more than 25 days in the past or 3 days in the future.

## How granular is the response for Analytics API `start` and `end` parameters?
[Analytics API](https://openapi.appcenter.ms/#/analytics/) returns counters by day. In other words, the time portion of the input is ignored and only the day component is taken into account when the result is processed.

## Why the UserId's value is 'None' in Analytics events, sessions and other analytics data?
User ID can only be applied to Diagnostics (crashes, errors) for now.

The workaround is to add the userId in Properties as shown below.
```Java
Map<String, String> properties = new HashMap<>();
properties.put("UserId", "your user Id");
Analytics.trackEvent("EventName", properties);
```
