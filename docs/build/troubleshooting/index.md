---
title: App Center Build Frequently Asked Questions
description: Code signing apps built with App Center
keywords: build, faq
author: siminapasat
ms.author: siminap
ms.date: 09/12/2018
ms.topic: article
ms.assetid: 8835183e-4261-4bae-b119-8a8beca72ad4
ms.service: vs-appcenter
ms.custom: build
---

# Hello and welcome to Troubleshooting

We are sorry to hear you are having difficulty in using App Center. If you cannot find the answer to your issue below, reach out via the chat bubble on App Center.

## [General Issues](~/build/troubleshooting/general.md)

* [Why did my build fail?](~/build/troubleshooting/general.md#build-fail)

* [Why is the build in App Center taking longer than my local build?](~/build/troubleshooting/general.md#longer-build)

* [Build Notificaitons](~/build/troubleshooting/general.md#build-notifications)

* [Why do I get an extended build time when "Run launch test on a device" is enabled?](~/build/troubleshooting/general.md#launch-test)

* [My build scripts (Bash) does not execute the logic written inside it.](~/build/troubleshooting/general.md#scripts-execute)

* [When do I have to update my build configuration manually through Save & Build?](~/build/troubleshooting/general.md#update-manually)

## [Code Repositories](~/build/troubleshooting/code-repos.md)

* [The repository I want to connect to is not listed in the Connect to Repository step](~/build/troubleshooting/code-repos.md#not-listed)

* [Can I use on-premises repositories?](~/build/troubleshooting/code-repos.md#on-premises)

* [I have connected to the wrong Bitbucket account. How can I re-connect to the correct one?](~/build/troubleshooting/code-repos.md#wrong-bitbucket)

* [I have connected to the wrong GitHub account. How can I re-connect to the correct one?](~/build/troubleshooting/code-repos.md#reconnect-github)


* [I have connected to the wrong Azure DevOps (formerly VSTS) account. How can I re-connect to the correct one?](~/build/troubleshooting/code-repos.md#wrong-VSTS)

* [When connecting an Azure DevOps (formerly VSTS) repository, I see "No Projects Found"](~/build/troubleshooting/code-repos.md#not-listed)

* [Are Git submodules supported?](~/build/troubleshooting/code-repos.md#git-sub)

* [I'm connected to Bitbucket and my builds fail with Git error.](~/build/troubleshooting/code-repos.md#bitbucket-git)

* [What can I do if am using Team Foundation Version Control (TFVC)?](~/build/troubleshooting/code-repos.md#tfvc)

* [Is my source code secure?](~/build/troubleshooting/code-repos.md#code-source-secure)

## [iOS](~/build/troubleshooting/ios.md)

* [No Xcode scheme is found](~/build/troubleshooting/ios.md#no-scheme)

* [My iOS builds fail with "clang: error: linker command failed with exit code 1"](~/build/troubleshooting/ios.md#clang-error)

* [iOS signing issues explained](~/build/troubleshooting/ios.md#signing-issues)

* [Where is my .ipa file?](~/build/troubleshooting/ios.md#ipa)

* [My iOS app using Xcode fails with Invalid bitcode version error, why is that?](~/build/troubleshooting/ios.md#bitcode-error)

* [My iOS app fails to run a test, how can I fix this?](~/build/troubleshooting/ios.md#test-error)

* [My iOS builds using CocoaPods on Xcode 9 keep failing, what should I do?](~/build/troubleshooting/ios.md#cocoapods-error)

* [Since I have upgraded my project to Xcode 10 beta my app fails to build with the error **Cycle in dependencies between targets**, why is that?](~/build/troubleshooting/ios.md#xcode-10-beta-error)

## [Xamarin](~/build/troubleshooting/xamarin.md)

* [My Xamarin.iOS builds build from solution file (.sln) instead of project file (.csproj)](~/build/troubleshooting/xamarin.md#solution-file)

* [My Xamarin.iOS builds fail claiming I need to provide signing information](~/build/troubleshooting/xamarin.md#fail-signing)

* [Configuring Build scripts](~/build/troubleshooting/xamarin.md#build-scripts)

* [My Xamarin.Android build failed with **Error: No APK files found**. What can be done?](~/build/troubleshooting/xamarin.md#no-apk)

* [I set up my Xamarin.iOS app branch to build without signing but my build failed claiming I need to provide the signing information, why is that?](~/build/troubleshooting/xamarin.md#signing-info-failed)

* [My Xamarin.iOS simulator build fails to install into iOS Simulator with **Failed to chmod ... /Appname.iOS.app/Appname.iOS : No such file or directory** error. How do I fix that?](~/build/troubleshooting/xamarin.md#sim-fails)

* [My Xamarin build fails with error MSB4018: The "WriteRestoreGraphTask" task failed unexpectedly. What can be done?](~/build/troubleshooting/xamarin.md#task-fails)

* [My Xamarin build fails with error: This project references NuGet package(s) that are missing on this computer. What can be done?](~/build/troubleshooting/xamarin.md#nuget-missing)

* [I want to run unit tests for my Xamarin application, how can I do that?](~/build/troubleshooting/xamarin.md#unit-tests)

* [I get an error: No projects found and No configurations found for Xamarin builds](~/build/troubleshooting/xamarin.md#no-projects)

## [React Native](~/build/troubleshooting/react-native.md)

* [My React Native Builds fail with, "The engine "node" is incompatible with this module. Expected version ">=x.x.x" ; error Found incompatible module](~/build/troubleshooting/react-native.md#engine-node)

* [My React Native build fails with: 'FBSDKCoreKit/FBSDKCoreKit.h' file not found](~/build/troubleshooting/react-native.md#FBSDKCoreKit)

* [My React Native build fails with "FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory](~/build/troubleshooting/react-native.md#heap-out)
