---
title: Connecting Repositories Using the GitHub App
description: How to use the App Center GitHub App
keywords: build, ios, android, github
author: nrajpurkar
ms.author: nirajpur
ms.date: 05/18/2018
ms.topic: article
ms.assetid: 7868b0c8-bbe7-49e3-a059-0630f4d54a6d
ms.service: vs-appcenter
ms.custom: build
---

# Connecting Repositories Using the GitHub App
In this document, you'll learn how to install the App Center GitHub app and leverage this integration in your development workflow.

## Installing the App Center GitHub App
The App Center GitHub app is a [GitHub Marketplace](https://help.github.com/articles/about-github-marketplace/) app and can be installed directly from GitHub.

To install the app, open a pull request in GitHub in a repository with a mobile project. After opening this pull request, a notification appears to set up continuous integration (CI) via a CI GitHub app. This notification will only appear if you do not have any CI GitHub apps installed.

![An image showing the notification to install CI GitHub apps from a GitHub PR](~/build/images/github-pr-notification.png)

Follow the link in the notification to the mobile CI category of apps and choose the App Center app. Pick one of four plans, including a free tier, and install the app. The app can be installed in both your personal GitHub account and GitHub organizations.

## Onboarding Repositories using the GitHub App
After installing the GitHub App, sign in to App Center or create a new App Center account. Next, select the repository to set up and follow the wizard to create your app(s). The repositories shown are the ones App Center is authorized to see. Additional repositories can be shared by changing the [GitHub app configuration] (https://github.com/settings/installations).

> [!NOTE]
> If the GitHub app was installed in a GitHub organization, an App Center organization is automatically created and that organization will be the owner of the new apps. Other members must be added to the App Center organization to see or edit the apps in App Center. You can read more about [App Center organizations](~/dashboard/creating-and-managing-apps.md).

You must configure a branch before a build can start. Read more about configuring your branch in the Configure a build articles respectively for [Android](~/build/android/first-build.md), [iOS](~/build/ios/first-build.md), and [Windows](~/build/windows/uwp/first-build.md). If you’re building a pull request, specify the configuration for the target branch of that pull request.

## Reporting Build Status to GitHub
Opening a pull request on GitHub will start an App Center build, copying the build configuration of the target branch. App Center will skip the Launch Test and Distribution steps during this build. As the build runs and completes, App Center reports build status back to GitHub in the Checks tab of the pull request view. Navigate back to the build on App Center by clicking the **View more details on App Center** link. Pull requests from a forked repository will not build until merged or show under the Checks tab.

![An image showing the Checks tab in GitHub's pull request view](~/build/images/github-checks-tab.png)

> [!NOTE]
> When opening a pull request on an unconfigured branch, the Checks tab will show that there is **Action Required**. Click the **Resolve** link to configure the branch.

## Connecting a New Repository
Once you install the GitHub app, App Center sends a welcome email. Connect a new repository via the GitHub app by clicking the **Connect your repository** button in the email and repeat the process to create a new connection.

## Connecting Existing Apps
Existing App Center apps connected to GitHub without onboarding with the steps above cannot currently report back build status to GitHub. Create a new app via the email link to take advantage of this feature.
