---
title: Understanding the App Center Overview Page
description: Help using the Overview Page on App Center
keywords: app center, analytics
author: blparr
ms.author: blparr
ms.date: 01/20/2017
ms.topic: article
ms.assetid: d6fea3a0-7a48-4c37-a972-7a803705faf5
ms.service: vs-appcenter
ms.custom: analytics
---

# Overview Page

The objective of the Overview page is to provide you with the key metrics about your app users. This includes their devices, location, activity and engagement. This will allow you to answer questions such as:

- What are the main devices being used?
- Can I remove support for an old OS version?
- Should I translate my app into a new language?
- Are my users adopting my latest version?

All the data in the Overview page can be filtered by **time range** and **app version**, so you can further drill down into your charts. Note that the app version needs to follow the [Semver 2.0](https://semver.org/spec/v2.0.0.html) format.

## Active users

Represents the number of unique app installations that launched the app in the last:

- 1 calendar day for the "daily"
- 7 calendar days for the "weekly"
- 30 calendar days for the "monthly"

A new day starts at 12am UTC.

## Engagement

Engagement measures the daily sessions per user and session duration.

A **session** is defined as the time from the app coming to foreground to the last event before going to the background. If no custom events are identified within 5 minutes in a session, the session will not be counted.

Analytics will offer you the following information:

- Daily sessions per user: Daily average number of sessions per user.
- Total sessions: Total number of sessions.
- Average sessions per day: Number of session per day averaged over the time range.
- Session duration: Distribution of the number of sessions over a few duration intervals.
- Average session length: Average of all the session durations in the selected time range.

## Devices and OS

The Devices panel gives information about the users' devices:

- Device model distribution: Shows the count and percentage of the top most used device models. 
- OS distribution: Shows the relative percentage of the top most used OS versions.

## Countries and Languages

The Countries and Languages panel display information about devices geographical location and language settings in the device.

The country is determined by the carrier country and requires the device to have a SIM card. Note that if you are using a simulator or another device with no SIM card such as a tablet, the country will be "unknown" or inaccurate.

- The map shows shaded countries depending on the number of active users. The more users, the darker the shade.
- You will see the top seven countries by number of active users.

The language is the one defined at the OS level by the user.

- The panel will show the top 7 major languages.

## Active Users per Version

This chart shows how many users are using a given version. It will show the distribution for the top 20 app version.
