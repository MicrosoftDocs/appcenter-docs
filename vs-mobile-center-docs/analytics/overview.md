---
title: Understanding the App Center Overview Page
description: Help using the Overview Page on App Center
keywords: app center, analytics
author: blparr
ms.author: blparr
ms.date: 01/20/2017
ms.topic: article
ms.assetid: d6fea3a0-7a48-4c37-a972-7a803705faf5
ms.service: mobile-center
ms.custom: analytics
---

# Overview Page

The Overview page objective is to provide the key metrics about your app users population: their devices, their locations, activity and engagement.
This will enable answers to questions such as:
- Should I translate my app into a new language?
- Are my users majoritarily on the lastest version?
- What are the main devices used?
- Can I remove support for that old OS version?
and many more.

## General information
All the data in the Overview page represent the device population in the selected **time range** and filters.
For example the Languages will show the number of devices configured for a given language that was active in the selected time-range.
It is possible to further filter the charts by selecting a number of app versions. Note that we only have support for Semver2.0.
You can also export your data into Application Insights. This will provide you with powerful filtering and data visualizations, as well as query capabilities which you can use to create your own custom dashboards.

## Active users
Represents the number of unique app installations that launched the app in the last:
- 1 calendar day for the "daily"
- 7 calendar days for the "weekly"
- 30 calendar days for the "monthly"

All days start at 12am UTC.

## Engagement
Engagement measures the app sessions count and duration.

A **session** is defined as the time between the app coming to the foreground and the last event before going to the background.
However if the app goes to the background for less than 20 seconds, the session will be maintained.

- Session count per user: the number of sessions per active device for each time interval in the time range
- Total sessions: the total number of sessions in the time range
- Average sessions per day: the number of session per day averaged over the time range
- Session lengths: a distribution of the number of sessions over some duration intervals
- Average session length: an average of all the session durations in the time range

## Devices
The Devices panel gives information about the users' devices:
- Device model distribution: shows the count and percentage of the top-4 most used device models
- OS distribution: shows the relative percentage of the top-4 most used OS versions

## Country/Region and Languages
The country/region and languages panel display information about devices geographical location and language setting.
The country/region is determined by the carrier country and requires the device to have a SIM. Note that if you are using a simulator, the country shown will probably not be accurate as it is selected by default. The language is the one defined at the OS level by the user.
- The map shows shaded regions depending on the number of active devices. The more devices, the darker the shade
- Country/Region distribution: shows the top 7 country/region by number of active devices
- Language distribution: shows the top 7 major language device setting

## Version
Version shows the top 20 app version distribution for active devices in the time range.
