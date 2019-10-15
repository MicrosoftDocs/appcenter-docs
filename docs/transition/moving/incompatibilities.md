---
title: Incompatibilities when moving apps
description: When moving apps from HockeyApp to App Center we are checking for incompatibilities.
keywords: transition
author: derpixeldan
ms.author: daadam
ms.date: 02/18/2019
ms.topic: article
ms.assetid: 59e9c687-8447-4354-8844-43ac6d241e15
ms.service: vs-appcenter
ms.custom: hockeyapp
---

# Incompatibilities when moving apps

When you move an app from HockeyApp to App Center, we check and indicate potential incompatibilities. Find out about what's coming to App Center on our [public roadmap on GitHub](https://github.com/Microsoft/appcenter/wiki/Roadmap).

## Bug tracker integration

App Center will only transfer associates with Azure DevOps, GitHub, and Jira. Other bug trackers will not create new tickets, and the associations are lost.

## Crashes

In App Center, we currently don't support receiving crashes for UWP apps. However, we're working on sending crashes collected by the HockeySDK for UWP to App Center.

## Distribution Groups

On App Center, distribution groups exist on an app or on an organization level. On HockeyApp, all distribution groups exist globally and are owned by a user or an organization. **Distribution groups owned by a user or distribution groups that have a different owner than the app aren't supported on App Center.** When an app gets moved with a distribution group owned by a user, we'll create an app level distribution group on App Center for it. The same applies for a distribution group with a different owner than the app. The functionality of having one distribution group across multiple apps will then be lost.

### The solution

To retain the share functionality of your distribution groups across apps on App Center make sure the distribution groups assigned to an app are owned by the same organization than the app. Follow the steps below if this isn't the case.

Create an organization:

* Create a new organization: Click on your profile on the top right of HockeyApp, go to **Account Settings** > **Organizations** and **Create Organization**. Enter a Name and Email and **Save**. If you have an organization that you want to transfer the app and distribution group to, ignore this step.

Change a distribution group owner:

* At the root level of HockeyApp, click on **Distribution Groups** and select the distribution group you want to change the ownership for.
* In the first tab, **Basic Data**, at the bottom under **Account** select the new owner of the distribution group and **Save**.

Transfer an app:

* Go to the app you want to transfer and click **Manage App** in the upper left.
* In the menu on the right, click **Transfer** at the bottom of the list and follow the steps.

## Externally hosted builds

App Center doesn't currently support externally hosted builds. We won't move any versions with externally hosted builds.

## Feedback

App Center doesn't support HockeyApp's Feedback service. Before moving an app using the HockeyApp Feedback, we recommend using another third-party in-app feedback tool instead. Once we move your app, you won't receive any feedback from the HockeySDK anymore. Make sure the version using the new in-app feedback tool is well adopted before moving to App Center.
