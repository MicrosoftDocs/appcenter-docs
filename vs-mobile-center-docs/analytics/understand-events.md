---
title: Events Metrics
description: Help using the Events Metrics on Mobile Center
keywords: mobile center, analytics

---

# Events Metrics

Events are actions that users take in your app. They measure the user's interaction with the content in the app and allow you to better understand your user's behavior.
Event properties provide contextual information about the events.

Examples of events are: *"FileUpload", "Launch","LogOut"*.

Mobile Center provides information about your custom events and their custom properties. To track these events, you will need to use the trackEvent method once you have started the SDK. More information about how to define the events can be found at the [SDK Documentation](~/sdk) for [Android](~/sdk/analytics/android), [iOS](~/sdk/analytics/ios), [React-Native](~/sdk/analytics/react-native) and [Xamarin](~/sdk/analytics/xamarin).

By tracking events with properties to your app, you will be able to answers questions like:
- What is the top N content viewed?
- What is the most liked content?
- What type of files do my users send?


## General information
The events page can be filtered by **time range** and for the selected **app version**. This means that the events shown will be the ones happening in a given time range and for the selected app version.
The maximum number of distinct events that can be sent per app is 200. However, there is no limit on the maximum number of events instances sent per device.

## Events Page
The Events Page provides a table with an overview of the events happening in your app. This table can be sorted by count in both descending and ascending order. You can also look for an event in the table by its name. For each event, the following information is provided:

- Users: Number and percentage of users who have triggered an event during the selected period of time.
- User change: Change of the number of Users in absolute value and in percentage change during the selected period of time.
- Count: Number of times that an event has been triggered during the selected period of time.
- Count change: Change of the Count in absolute value and in percentage change during the selected period of time.
- Count per user: Average number of times that an event is triggered per user.
- Count per session: Average number of times that an event is triggered per session.

## Detailed event view
By clicking on an event in the events table, you will access to a more detailed page, in which further information about an event is provided. Also, this page will provide information about the event properties.
This page will include a detailed overview of the previous introduced information in the Events Page (count, users, count per user, count per session) over the selected period of time.
It will also include information about the event properties, if any.

## Events Properties
Events Properties provide contextual information about the events. They allow to have a deeper understanding about the actions that the users take in your app.
Below there is an example of an event with one property and several property values.

*Event: "SendFile"*

*Event Property: "FileType"*

*Event Property Values: "png", "jpeg", "pdf"*


The maximum number of properties currently supported in Mobile Center is five. The number of property values per event property is unlimited. However, for each property, we will show the five event property values with highest count and its distribution.
Currently, we support properties and property values that are strings.
