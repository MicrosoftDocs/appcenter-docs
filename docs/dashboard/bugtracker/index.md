---
title: App Center bug tracker documentation
description: how to integrate App Center with bug trackers like Jira, Visual Studio Team Services (VSTS) and GitHub
keywords: app center, appcenter, visual studio app center, visual studio appcenter, bug tracker, bugtracker, documentation, hockeyapp, VSTS, github
author: amchew
ms.author: amchew
ms.date: 11/18/2019
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 97b6f745-736f-4abc-a85b-88
---

# App Center bug tracker integration

## Overview

App Center has bug tracker integration for the crashes service. Users can be quickly informed about critical App Center events within the tools that you use regularly in your day to day flow for a seamless experience. App Center supports bug trackers like Jira Cloud, Azure DevOps (formerly Visual Studio Team Services (VSTS)), and GitHub. Users need to have manager or developer permissions to be able to create and configure the bug tracker.

## Getting Started

1. Navigate to [https://appcenter.ms/apps](https://appcenter.ms/apps), and select the specific app you would like for bug tracker integration.

2. In your app, select **Settings**, **Services**, and click the **Add account or service** button.

3. <a name="step3"/>Select which bug tracker (Jira, VSTS, Azure DevOps, or GitHub) to integrate with. In order to add a bug tracker for a repository, you need admin permissions for it.

   1. For Jira:

      1. Login with your Jira credentials (username, password and base URL) and click **Add**. Please see here on [how to find your base URL](https://confluence.atlassian.com/adminjiraserver071/configuring-the-base-url-802593107.html).
      > Note: Jira has [deprecated basic authentication](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-basic-auth-and-cookie-based-auth/). Instead of typing in your password, you must create an [API token in Jira](https://confluence.atlassian.com/cloud/api-tokens-938839638.html) and use that as your password.
      2. Select which Jira projects to integrate the bug tracker with and click **Next**.
      3. Toggle **On** for **Auto create ticket** and click **Add**:

   2. For Azure DevOps (formerly VSTS):

      1. Login with your Azure DevOps credentials and click **Accept** when prompted on app authorization.
      2. Select which Azure DevOps projects to integrate the bug tracker with and click **Next**.
      3. Toggle **On** for **Auto create ticket**, and fill in the fields for **Area** and **Default Payload**, and click **Add**:
         - Default payload is an optional field to fill in for use in work items. For example, `{"System.IterationPath": "Area\\Iteration 1", "System.AssignedTo": "Fabrikam"}`. Please refer to the [work item types API](https://docs.microsoft.com/rest/api/vsts/wit/work%20item%20types) for additional information.

   3. For GitHub:

      1. Login with your GitHub credentials and click **Authorize App Center**.
      2. Select which GitHub repository to integrate the bug tracker with and click **Next**.
      3. Toggle **On** for **Auto create ticket** and click **Add**:

4. Done! Your bug tracker is now configured. With this configuration:

    - When a new crash group is created in App Center, it will trigger the creation of a bug in the configured bug tracker
    - The bug will contain a link to the crash group in App Center 
    - When you [change the state of the crash group](#changeState) in App Center, it changes the state of the bug in the connected bug tracker, and vice versa.

5. Toggle to the extreme right hand of the bug tracker to **Configure** or **Disconnect** it.

   - **Configure** enables you to change the responses to **Auto create ticket**, **Number of crashes**, **Area**, and **Default payload**.
   - **Disconnect** unlinks all the bugs from your crash group.

6. Bug tracker integration is done at the app level, and only one bug tracker can be configured per app. To change bug trackers:

   1. Go to the **Services** page.
   2. Toggle to the extreme right hand of the bug tracker to **Disconnect** it.
   3. Repeat [step 3](#step3).

## <a name="changeState"/>Changing the state of a crash group in App Center

1. Navigate to [https://appcenter.ms/apps](https://appcenter.ms/apps), and select the specific app that has a bug tracker integration.

2. In your app, select **Diagnostics**, **Crashes**, and click on the crash group that has a connected bug associated with it.

3. In the top right corner, click on the **green drop down box** that has either of the states:
   - **Open**
   - **Closed**
   - **Ignored**
 
 4. Choose the state of the crash group. Once you've changed the state of the crash group in App Center, it will update the state in bug. Similarly, if you change the state of the bug in your connected bug tracker, it will update the state in the crash group as well.

