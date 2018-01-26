---
title: Understanding App Center Events Metrics
description: Help using the Events Metrics on App Center
keywords: app center, analytics
author: blparr
ms.author: blparr
ms.date: 09/06/2017
ms.topic: article
ms.assetid: 85da48c4-7abb-49be-92df-3ae814529688
ms.service: vs-appcenter
ms.custom: analytics
---

# Events Metrics

Events are actions that users take in your app. By tracking events in your app, you will learn more about your users' behavior and understand the interaction between your users and your apps. Attaching properties to your events will provide you with contextual information about the events.

Tracking events in your app will allow you to answer questions like:
- What is the top N content viewed?
- What is the most liked content?
- What type of files do my users send?

In order to track custom events in your app, you can use our trackEvent API using the Analytics SDK. More information on how to define custom events using our SDK can be found in our [SDK Documentation](~/sdk/index.md) for [Android](~/sdk/analytics/android.md), [iOS](~/sdk/analytics/ios.md), [React Native](~/sdk/analytics/react-native.md), [Xamarin](~/sdk/analytics/xamarin.md), [UWP](~/sdk/analytics/uwp.md) and [macOS](~/sdk/analytics/macos.md). 


## General information

The events page can be filtered by **time range** (last 7, 30, 60, 90 days) and for the selected **app version**. This will allow you to drill down your events information to the selected time period and/or app version.


## Events Page

The Events Page provides a table with an overview of the events happening in your app. This table can be sorted by count in both descending and ascending order. You can also look for an event in the table by its name. For each event, the following information is provided:

- Count: Number of times that an event has been triggered.
- Trend: Change of the count in absolute value and percentage change, compared to the previous selected time period.
- Users: Number of users that have triggered an event.
- User change: Change of the number of users in absolute value and percentage, compared to the previous selected time period.
- Count per user: Average number of times that an event is triggered per user.


## Detailed event view

By clicking on an event in the events table, you can see more detailed information on the event.
This includes the metrics from the Events table per day for the selected time period.
Also, you will see distribution of counts for your event properties.

You can also remove individual events from this page by clicking the settings option on top right of the page. Note that this action cannot be undone.


## Events Properties

Events Properties provide contextual information about the events. They allow to have a deeper understanding about the actions that the users take in your app.

Examples of events and properties are:
- *Event Name:* "File Upload", *Event properties:* ".PDF", ".txt", ".PNG".
- *Event Name:* "Question answered", *Event properties:* "Accept", "Decline", "Ignore".

Note that property values are optimized for values of type 'String'.


## Limits

- The maximum number of distinct custom events that can be tracked daily is 200. This count will be reset at 12am UTC. However, there is no limit on the maximum number of events instances sent per device.
- The maximum number of event properties that can be defined per event is five. If more than five properties are sent, they are automatically rejected.

- The portal will show up the ten property values with highest count.


## Breadcrumbs (Events before a crash)

Events can also be used to help you identify the root cause of your crashes. As part of the App Center Crashes service, you can see all the events that happened before a crash for a specific session. 

In order to see the events before a crash, the Analytics SDK needs to be integrated and events need to be defined.
