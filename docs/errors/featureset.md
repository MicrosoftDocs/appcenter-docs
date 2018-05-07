---
title: App Center Errors
description: Feature set for errors in App Center
keywords: app center, errors, exceptions, handled
author: blparr
ms.author: blparr
ms.date: 05/02/2018
ms.topic: article
ms.assetid: FF9FA102-581A-445F-A875-3F90CF0B86A4
ms.service: vs-appcenter
ms.custom: errors
---
# Feature Set

In this page, you will learn about the feature set available for Xamarin errors.

> [!NOTE]
> While the Crashes and Errors section portal experience is similar, there is not feature parity between the two sections of App Center.


## Error Group Overview

The Error group overview page provides you with the key metrics about the errors happening in your app. In order to easily manage all your error instances and allow you to get an understanding of what are the most common errors or the ones that affect most users, App Center creates Error Groups based on the similarity of the error instances' stack traces.

![App Center lists the error groups generated based on your errors instances](~/errors/images/groupsoverview.png)

Note that you can filter this page based on **time range**, **app version** and **status** (open, closed and ignored). The latest will help you track the status of your error groups and close them or ignore them if taken care of.


## Detailed Error Group View

Drill down into error groups to get more information to help you fix the root cause of the error.

This detailed view includes the following information for a group:
- A representative stack trace which corresponds to the one from the first error in that group.
- Statistics on the reports per day and Affected Users.
- List of top devices and Operating Systems (OS) affected by your errors.
- List of the most recent reports and ability to filter by device and OS. This list is a sample of all the reports received.

In addition, you can change the status of the errors to open, closed, or ignored.


## Error Instances

You can access to the individual instances inside an error group. For each error, the system returns the following information:
- Stack Trace
- Error Properties (if exist)
- Device information (model, OS, country, language...).

Also, you can download a .JSON file with the raw information about that error instance.


## Export

You can export all your raw Errors data into Azure Blob Storage. See our [Export documentation](~/analytics/export.md).
