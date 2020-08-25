---
title: App Center Build FAQs
description: Code signing apps built with App Center
keywords: build, faq
author: elamalani
ms.date: 07/31/2020
ms.topic: article
ms.assetid: a2a9a5ef-eed5-4a38-b34c-596c7d404401
ms.service: vs-appcenter
ms.custom: build
---

# General Troubleshooting
## My build scripts (Bash) doesn't execute the logic written inside it.
App Center allows you to use build scripts for some level of customization with builds. 

If you clicked "Save & Build" after modifying scripts, and you see App Center running the Build Script step, for instance, without actually executing the contents inside, chances are, it's because of the line endings.

Bash scripts are run on a Mac machine. So they're expected to have UNIX style line endings (LF).

If you're using Windows to edit/create these scripts, ensure they're saved with the Unix (LF) format. For Notepad ++, ensure from the menu, **Edit > EOL Conversion > Unix (LF)** is selected.

## When do I have to update my build configuration manually through Save & Build?
You might have noticed the handy **Save & Build** option in App Center Build Configuration. It does more than just help you trigger the build immediately after Saving/Updating changes. Generally, your app build configuration is analyzed when you open the build configuration dialog. If you have made changes to your repository that don't get picked up by the build automatically, you might need to go to the configuration page again and trigger a **Save & Build** from there.

One example is when you add new Build Scripts to your repository. Since build scripts are only analyzed when configuring your branch, you'll need to do another analysis to reindex your repository tree and save the results. If you simply made changes to an existing build script, which was also already used in a branch configuration, you can push your changes to the script.

We're working on improving reindexing Build Scripts when changed. Until then, a valid workaround is to do a manual **Save & Build**.

## When configuring a branch, I get an error message saying "no projects can be found" in my branch
App Center analyzes the contents of the branch in your repository to find an app project matching the platform selected for your app in App Center. This assumes your project uses the platform-specific standards for configuration, that is, an Xcode project or workspace for iOS apps, a Gradle project for Android apps and a solution or project for your Xamarin apps.

App Center currently only searches four directory levels deep for your project files. If App Center doesn't find your project in your branch, moving it to the root directory might help. If your repository is large, it may help to reduce its size or number of files.
