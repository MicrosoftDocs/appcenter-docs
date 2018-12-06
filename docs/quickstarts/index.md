---
title: App Center Quickstart
description: A quick introduction to working with Visual Studio App Center
keywords: App Center, Build, Test, Distribute, Crashes, Analytics, Diagnostics, Push, CodePush
author: jwargo
ms.author: jowargo
ms.date: 12/03/2018
ms.topic: article
ms.service: vs-appcenter
ms.custom: build
ms.assetid: 9db2dbcb-1840-4f76-bdd6-1b31aa6718dd
---

# App Center Quickstart

[Visual Studio App Center](https://appcenter.ms/) brings together multiple services commonly used by mobile developers into a DevOps cloud solution. Developers use App Center to Build, Test, and Distribute applications. Once the app's deployed, developers monitor the status and usage of the app using the Analytics and Diagnostics services, and engage with users using the Push service. The following figure highlights the App Center services and how each fits on either side of the DevOps story.

![App Center DevOps Diagram](~/images/app-center-devops.png)

This document walks you through the process of setting up an App Center account and creating your first project. At the end of the document, you'll learn where to go next based on what you want to do with App Center.

## Creating an App Center account

To use App Center, start by creating an account in App Center; point your browser of choice to:

+ The [Visual Studio App Center](https://visualstudio.microsoft.com/app-center) landing page and click the **Get started for free** button.
+ The [App Center](https://appcenter.ms) portal and click the **Get Started** button.

Next, App Center prompts you to create a new account. On the page that opens, create a new App Center account using one of the following identity providers:

+ Facebook
+ GitHub
+ Google
+ Microsoft

Select the provider from the list of options on the page, and follow the prompts to authorize App Center to create an account using the selected service.

> [!NOTE]
> Some older App Center accounts were created using an email address and password, but that option is no longer available for new App Center accounts.

## About organizations and users

App Center recognizes two types of entities: users and organizations. You just created a user account, and you can only see the apps you create and manage in App Center. If you work for an organization that is an App Center customer, you could be invited to join your organization's App Center Organization. Once you accept that invitation, you'll be able to see your own apps and your organization's apps in App Center.

App Center even allows you to belong to multiple organizations; in this case, in App Center will list your apps, plus the apps for all of the organizations to which you belong.

## Creating your first App Center App

App Center groups settings for services like Build, Test, and Analytics under an umbrella called an **App**. App Center associates Apps with user accounts or organizations. When you create a new app in your account, only you can view information about the app, unless you invite others to work on your app, or you add it to an organization.

For your projects, you'll create a separate app project for each target platform your application targets. For example, if you're developing a native mobile application for the Android, iOS and Windows platforms, you'll create a separate app project for each target platform.

> [!NOTE]
> We've heard from some customers that they'd like something like a project or workspace to group related apps in App Center. We like that feedback, and are considering something like this for a future release.

To create an app:

1. Log in to [Visual Studio App Center](https://appcenter.ms).
2. Click the **Add new** dropdown in the upper-right corner of the page, then choose **Add new app**.
3. App Center opens the panel shown in the following figure:

    ![App Center New App Panel](~/dashboard/images/app-center-new-app.png)

4. Populate the panel with the settings for your app as described in the following table:

| Input Field | Description |
| ----------- | ----------- |
| App Name    | The name for this application project, this is the name App Center displays for all references to this app. |
| Icon        | Click the button to select and upload an icon for this project. App Center displays this icon whenever it renders data about your app. |
| Description | Your description for this app. App Center shows this value when displaying settings for the app. |
| Owner       | The user or organization that owns the app. Owners have complete control over app settings. Find additional information in [App Center App Permissions](~/dashboard/creating-and-managing-apps.md)|
| OS          | Select the target OS for the application project. |
| Platform    | Select the target language or framework for the application project. |

When you've populated the panel as needed for your app project, click the **Add new app** button to commit your changes.

At this point, you've created a new application project in App Center, but it really doesn't do anything; it's merely a place for you to manage settings and data around an application project. Your app's source code, tests and build settings are somewhere else, either on a local hard drive, in the cloud somewhere, or hosted in a source code control system (like Azure DevOps, Git, GitHub, etc.). What you do next depends on what you want App Center to do for you. See the next section for additional information.

## Where to go next

App Center offers developers a variety of services they can use to build, test and deploy compiled applications, plus offers services developers can use inside their apps to deliver a better experience for app users:

**Server-side Capabilities**

+ **Build** - Convert your app's source code files into standalone software artifact(s) that can be run on a computer, smartphone, or tablet. Use App Center's cloud service to build your app, eliminating the need to maintain a stable build environment and removing the complexities of the build process.
+ **Test** - Execute functional tests for your application on devices hosted in a cloud environment.
+ **Distribute** - Deploy application builds to alpha and beta testers and to other users through public or private app stores.

**Client-side Capabilities**

+ **Analytics** - The [Analytics service](~/analytics/index.md) tracks user activity and actions within an application, capture specific events and other data from the application. Data from each device running your application is aggregated in the cloud in a simple to use interface for your analysis and export.
+ **CodePush** - The [CodePush service](~/distribution/codepush/index.md) enables developers to deploy application updates directly to devices running Apache Cordova and React Native applications.
+ **Diagnostics** - The [Diagnostics service](~/diagnostics/index.md) enables developers to capture data about application crashes. Data from each device running your application is aggregated in the cloud in a simple to use interface for your analysis and export.
+ **Push** - The [Push service](~/push/index.md) enables developers to send notifications to mobile devices.

Refer to the sub-documents in this area for information on how to get started using App Center for Android, iOS, and macOS application projects.