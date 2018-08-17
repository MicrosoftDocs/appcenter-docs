---
title: App Center Build Frequently Asked Questions
description: Code signing apps built with App Center
keywords: build, faq
author: nrajpurkar
ms.author: nirajp
ms.date: 06/15/2018
ms.topic: article
ms.assetid: bcb76094-34c6-48ae-a24d-60c14a261518
ms.service: vs-appcenter
ms.custom: build
---


# General Troubleshooting

## <a name="build-fail"/>Why did my build fail?

There are various reasons why your build could have failed. The best way to find out what happened is to go to the build details page and download the logs. Check the logs for each of the steps to understand what happened and where exactly the build failed. If you cannot understand why the build failed or you think there is an issue on our side, feel free to contact us via [App Center support](https://intercom.help/appcenter/getting-started/getting-help-with-app-center) right from within App Center.


## <a name="longer-build"/>Why is the build in App Center taking longer than my local build?

There are many reasons why build duration can be higher when using a build service:

* When running your build locally, many things are cached (e.g. NuGet packages, pods, dependencies); in App Center, we always perform a clean build and re-download everything required.
* For Xamarin builds, when running your build locally, you are most likely running a simulator build; In App Center you can run a device build (signed), which takes much longer to run.
* Most likely the CPU power of your development machine is higher than the CPU of our VMs.

We are always working on improving build times. If you consider the build duration for your app is too long compared to your expectations, please reach out to us via the in-app chat (Intercom) or with a comment here.

## <a name="build-notifications"/>Build Notificaitons

Email and custom webhook notifications give you continual real time updates of your build status, as well as the permanency and ability to search and be directed to your builds in App Center. This also enables faster collaboration, since you can forward the build status emails or @ mention collaborators in a chat or channel in a single workflow.

You can choose to have email and webhook notifications automatically sent for the following events:

Build success:
* **Always** When your app builds successfully
* **Only** if previously failed: When your app has successfully built after one or more failed builds
* **Never** You will not receive notifications for build success
Build failure:
* **Always** When your app fails to build
* **Only if previously successful** When your app has failed to build after one or more successful builds
* **Never** You will not receive notifications for build failure

By default, email notifications are sent only when a new version is released. Whether you're an admin, app developer, or tester, it's important to be notified immediately when a new version is released to testers or to the store. For admins or app developers involved in the Continuous Integration, Delivery and Deployment process, it's useful to set up email and custom webhook notifications for build and distribute.


## <a name="launch-test"/>Why do I get an extended build time when **Run launch test on a device** is enabled?

We run the test as part of the build operation, which gives the added build time. What happens is that while App Center Test is validating your app is ready to run on real devices, several things can happen here like: signing, checking permissions, etc. After that it's time to wait for a device. Third, it's running the app on a phone, which takes very little time. And lastly, we move test logs, screenshots into the cloud.

Expect an additional **10 minutes of build time**.

## <a name="scripts-execute"/>My build scripts (Bash) does not execute the logic written inside it. ###

App Center allows you to use build scripts for some level of customization with builds. 
​
If you clicked "Save & Build" after modifying scripts, and you see App Center running the Build Script step, for instance, without actually executing the contents inside, chances are, it's because of the line endings.

Please note that these Bash scripts are run on a Mac machine. So they are expected to have UNIX style line endings (LF).
​
If you're using Windows to edit/create these scripts, please ensure they're saved with the Unix (LF) format. For Notepad ++, ensure from the menu, **Edit > EOL Conversion > Unix (LF)** is selected.
​

## <a name="update-manually"/>When do I have to update my build configuration manually through Save & Build? ###

You might have noticed the handy **Save & Build** option in App Center Build Configuration.

It does more than just help you trigger the build immediately after Saving/Updating changes. 

Generally, your app build configuration is analysed when you open the build configuration dialog. So when you have made changes to your repository which don't get picked up by the build automatically, you might need to go to the configuration page again and trigger a **Save & Build** from there.
​
One such example is when you add new Build Scripts to your repository. Since the build scripts are only analyzed when configuring your branch, you'll need to perform another analysis to re-index your repository tree and save the results.

If you simply made changes to an existing build script which was also already used in a branch configuration, you can simply push your changes to the script.
​
We're well aware of this limitation and are working on improving re-indexing Build Scripts when changed. 
Until then, please bear with us and do a manual **Save & Build**.
​
