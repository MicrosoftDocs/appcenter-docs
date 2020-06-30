---
title: App Center Build FAQs
description: Code signing apps built with App Center
keywords: build, faq
author: elamalani
ms.date: 06/08/2020
ms.topic: article
ms.assetid: a2a9a5ef-eed5-4a38-b34c-596c7d404401
ms.service: vs-appcenter
ms.custom: build
---

# General Troubleshooting
## Build Notifications
Email and custom webhook notifications give you continual real-time updates of your build status, as well as the permanency and ability to search and be directed to your builds in App Center. This also enables faster collaboration, since you can forward the build status emails or @ mention collaborators in a chat or channel in a single workflow.

You can choose to have email and webhook notifications automatically sent for the following events:

Build success:
* **Always** When your app builds successfully
* **Only** if previously failed: When your app has successfully built after one or more failed builds
* **Never** You won't receive notifications for build success
Build failure:
* **Always** When your app fails to build
* **Only if previously successful** When your app has failed to build after one or more successful builds
* **Never** You won't receive notifications for build failure

By default, email notifications are sent only when a new version is released. Whether you're an admin, app developer, or tester, it's important to be notified immediately when a new version is released to testers or to the store. For admins or app developers involved in the Continuous Integration, Delivery and Deployment process, it's useful to set up email and custom webhook notifications for build and distribute.

## My build scripts (Bash) doesn't execute the logic written inside it.
App Center allows you to use build scripts for some level of customization with builds. 

If you clicked "Save & Build" after modifying scripts, and you see App Center running the Build Script step, for instance, without actually executing the contents inside, chances are, it's because of the line endings.

Note that these Bash scripts are run on a Mac machine. So they're expected to have UNIX style line endings (LF).

If you're using Windows to edit/create these scripts, ensure they're saved with the Unix (LF) format. For Notepad ++, ensure from the menu, **Edit > EOL Conversion > Unix (LF)** is selected.

## When do I have to update my build configuration manually through Save & Build?
You might have noticed the handy **Save & Build** option in App Center Build Configuration. It does more than just help you trigger the build immediately after Saving/Updating changes. Generally, your app build configuration is analyzed when you open the build configuration dialog. If you have made changes to your repository that don't get picked up by the build automatically, you might need to go to the configuration page again and trigger a **Save & Build** from there.

One such example is when you add new Build Scripts to your repository. Since the build scripts are only analyzed when configuring your branch, you'll need to do another analysis to reindex your repository tree and save the results. If you simply made changes to an existing build script, which was also already used in a branch configuration, you can push your changes to the script.

We're working on improving reindexing Build Scripts when changed. Until then, a valid workaround is to do a manual **Save & Build**.

## When configuring a branch, I get an error message saying no projects can be found in my branch
App Center analyzes the contents of the branch in your repository to find an app project matching the platform selected for your app in App Center. This assumes your project uses the platform-specific standards for configuration, that is, an Xcode project or workspace for iOS apps, a Gradle project for Android apps and a solution or project for your Xamarin apps.

App Center currently only searches four directory levels deep for your project files. If App Center doesn't find your project in your branch, moving it to the root directory might help. If your repository is large, it may help to reduce its size or number of files.
