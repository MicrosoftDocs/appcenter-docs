---
title: App Center Build Frequently Asked Questions
description: Code signing apps built with App Center
keywords: build, faq
author: nrajpurkar
ms.author: nirajp
ms.date: 08/08/2018
ms.topic: article
ms.assetid: 85e33f0b-ea23-485e-bcb9-cc2aa5fa775c
ms.service: vs-appcenter
ms.custom: build
---
# iOS Build Troubleshooting

## <a name="no-scheme"/>No Xcode scheme is found

In order to build a xcworkspace or a xcproject, a shared Xcode scheme is required. Xcode schemes are saved locally so that Xcode has access to them, but by default they are not shared with others and they are not included in source control.

To share a scheme, select **Product** > **Scheme** > **Manage schemes** in Xcode and make sure that the scheme used for building your xcproject/xcworkspace is marked as shared. The scheme's container needs to be set to the Xcode project or workspace you want to build. Then make sure the added `.xcscheme` file is added to source control and pushed to your remote repository - which App Center accesses.

![Mark scheme as shared](~/build/ios/images/xcode-share-scheme.png "Marking a scheme as shared in Xcode")

[xcode-share-scheme]: ../build/ios/images/xcode-share-scheme.png "Marking a scheme as shared in Xcode"

## <a name="clang-error"/>My iOS builds fail with "clang: error: linker command failed with exit code 1"

The error could be caused by App Center building with the xcodeproj instead of the workspace. When adding CocoaPods to your project, you must switch to using the workspace when building in App Center. 

Indicator: Look for this line in your build log:

```text
ld: library not found for -lPods-GarageController
clang: error: linker command failed with exit code 1 (use -v to see invocation)
​
** ARCHIVE FAILED **
```

To fix this, open your App Center project's Build Configuration, then click Save & Build, App Center will automatically choose the workspace correctly for future builds. 

## <a name="signing-issues"/>iOS signing issues explained

Dealing with provisioning profiles and certificates can sometimes be a challenging process. Here's three handy tips to help you successfully sign your iOS apps.

1. Save the build configuration in App Center after you've pushed signing changes to your project

In App Center, the build configuration of any branch stores two values of your Xcode project: the `CODE_SIGN_STYLE` and `DEVELOPMENT_TEAM` (set in the `project.pbxproj` file in your `.xcodeproj` folder). Whenever you change between manual and automatic signing or switch the development team, make sure you save the build configuration on App Center after pushing the changes, or your build will likely fail with a signing error.

2. Easily drag and drop the correct provisioning profile when using automatic signing

In Xcode, in the General tab of your target under **Signing**, click the info icon next to **Xcode Managed Profile**. You’ll then see a popover with profile information. Click and drag the **PROV** icon on the top left to a desired location (as shown below).

3. Take note of App Center's currently supported options when using manual and automatic signing

App Center fully supports manual iOS app signing, so you can use any type of profile or certificate. Simply verify that the provisioning profile and certificate you upload to App Center match what you’ve specified in your project, and you’re all set.

If you've enabled automatically manage signing in Xcode, App Center supports app signing with developer certificates and profiles (not with distribution). When uploading to App Center, you’ll need to use the auto-generated provisioning profile from Xcode.

### Still running into trouble?

To troubleshoot and get build signing up and running, we suggest the following steps:

1. Set up manual signing in your Xcode project and make sure it’s working locally.
2. Once that's verified, commit and push the changes to your repository.
3. Prepare the provisioning profile and certificate selected in the Xcode target and upload them to the App Center build configuration.
4. Most importantly: make sure you’ve pushed the latest state of your project before saving the new certificate and profile to the build configuration.

## <a name="ipa"/>Where is my .ipa file?

Xcodebuild, unlike xcrun, doesn't allow generating an .ipa file if the build is not signed. Unsigned builds produce an .xcarchive instead. If you wish to generate an .ipa file with the artifacts of an unsigned build, you can use the .xcarchive file to do so.

![Export xcarchive file using xcode](~/build/images/export-xcode-xcarchive-organizer.png "Exporting an Xcarchive file using Xcode Archives organizer")

[export-xcode-xcarchive-organizer]: images/export-xcode-xcarchive-organizer.png "Exporting an Xcarchive file using Xcode Archives organizer"

## <a name="bitcode-error"/>My iOS app using Xcode fails with Invalid bitcode version error, why is that?

If your builds fail with `error: Invalid bitcode version (Producer: '802.0.38.0_0' Reader: '800.0.42.1_0')`, this error means that you are using a library or pod that was built by a newer version of Xcode than the Xcode version currently used in your project. You can either update your project and the build configuration in App Center to use a newer version of Xcode or switch to an alternate, older version of the problematic library which is compiled with a matching version of Xcode.

## <a name="test-error"/>My iOS app fails to run a test, how can I fix this?

A common reason for tests to fail is where the linker commands fail with an error similar to the following:

```text
 ld: directory not found for option iPhoneSimulator10.3.sdk/Developer/Library/Frameworks 
  ❌ ld: embedded dylibs/frameworks are only supported on iOS 8.0 and later (@rpath/XCTest.framework/XCTest) for architecture x86_64 
  ❌ clang: error: linker command failed with exit code 1 (use -v to see invocation)  
```

The likely cause of this error is the linking type of **Apple Mach-O Linker** is not set to **static library**. 
In order to successfully build and test your app,  ensure the linking type of **Apple Mach-O Linker** in your **test target** is set to **static library**.

![Apple Mach-O Linker](~/build/images/mach-o-apple-linkage.png "Set Apple Mach-O Linker to static library")

[mach-o-apple-linkage]: images/mach-o-apple-linkage.png "Set Apple Mach-O Linker to static library"

## <a name="cocoapods-error"/>My iOS builds using CocoaPods on Xcode 9 keep failing, what should I do?

It might be because the signing configuration in you Pods project differs from the one in your Main project. Are your Pods checked-in into your repository? If yes, you must go to your Pods project and ensure it is set to use the same signing method as your Main project. If you set both Pods project and Main project to have the same singing configuration, this should resolve the issue.

If your Pods are not checked-in into your repository, it might be different issues and there are few workarounds you can use with [pre-build script](~/build/custom/scripts/index.md#pre-build) in this [link](https://github.com/CocoaPods/CocoaPods/pull/6964).

## <a name="xcode-10-beta-error"/>Since I have upgraded my project to Xcode 10 beta my app fails to build with the error **Cycle in dependencies between targets**, why is that? 

Xcode 10's new build system detects dependency cycles in your build and fails your build if there are any.

For more information on how to fix the build, please refer to [Apple's documentation on resolving common types of dependency cycles](https://help.apple.com/xcode/mac/current/#/dev621201fb0).
