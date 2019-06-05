---
title: Configure a React Native iOS build in App Center
description: How to set up a build for React Native iOS apps
keywords: build, ios
author: nrajpurkar
ms.author: nirajpur
ms.date: 06/04/2019
ms.topic: article
ms.assetid: 29111bf4-52a2-41e0-9aa3-d40f728b443a
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: react-native
---

# Configure a React Native iOS build in App Center

App Center can build React Native apps written in React Native version 0.34 or newer.

To build a React Native app for iOS, you must:

1. Connect to your repository service account (for example: Azure DevOps, Bitbucket, GitHub, Bitbucket, or VSTS).
2. Select a repository and a branch where your app lives.
3. Configure the build's project or workspace, and the scheme you would like to build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository

If you haven't connected your repository service account to App Center, you must do this first. Once your account is connected, select the repository where your iOS project is located. You must have admin and pull permission for the repository.

## 2. Selecting a branch

After selecting a repository, select the branch you want to build. By default, all the active branches will be listed.

## 3. Setting up your first build

Before your first build, the React Native project needs to be configured.

### 3.1. Project

Select your project’s `package.json`. App Center will automatically detect the associated Xcode project/workspace.

### <a name="xcode-version"/>3.2. Xcode version

Select the Xcode version to run the build on.
If toggle is in `Off` state then will use [modern build system](https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes/build_system_release_notes_for_xcode_10).
If toggle is in `On` state then will use legacy build system unless the different one is configured in the project settings or branch configuration.

### 3.3. Node.js version

Select the Node.js version to use for the build. Learn more about [how to select Node.js version](~/build/react-native/nodejs.md)

### 3.4. Build triggers

By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.5. Increment build number

When enabled, the `CFBundleVersion` in the project's **Info.plist** of your app automatically increments for each build. The change happens pre-build and won't be committed to your repository.

### 3.6. Code signing

A successful build produces an `.ipa` file. To install the build on a device, the build must be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (`.mobileprovision` file) and a valid certificate (.p12)](~/build/ios/uploading-signing-files.md), along with the password for the certificate.

The settings in your Xcode project must be compatible with the files you are uploading. Read more about [App Center's iOS code signing](~/build/ios/code-signing.md) and the [Apple Developer documentation](https://developer.apple.com/support/code-signing/).

Signing apps with [app or watchOS extensions](https://developer.apple.com/library/archive/documentation/General/Conceptual/ExtensibilityPG/index.html) requires an additional provisioning profile per extension.

### 3.7. Launch your successful build on a real device

Use the newly produced `.ipa` file to test if your app starts on a real device; the laumnch test adds about 10 more minutes to the total build time. Read more about [how to configure launch tests](~/build/build-test-integration.md).

### 3.8. CocoaPods

App Center scans the selected branch and if it finds a Podfile, it will automatically do a `pod install` step at the beginning of every build. This will ensure that all dependencies are installed.

### 3.9. Distribute to a distribution group

Configure each successful build from a branch to be distributed to a previously created distribution group. Add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all users who have access to the app.

Once you save the configuration, a new build will be automatically kicked off.

## 4. Build results

Builds can be in one the following states:

- **queued** -  the build is enqueued waiting for available resources
- **building** - the build is running and performing predefined tasks
- **succeeded** - the build completed successfully
- **failed** - the build completed unsuccessfully; troubleshoot what went wrong by downloading and inspecting the build log
- **canceled** - the build was canceled through user action or timed out

### 4.1. Build logs

For a completed build (succeeded or failed), download the logs to understand more about how the build went. App Center provides an archive with the following files:

```NA
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.ipa)

The `.ipa` file is an iPhone application archive file that contains the iOS app.

- If the build was signed correctly, you can install the `.ipa` file on a real device that is included in the provisioning profile used when signing. More details about code signing and distribution with App Center can be found in [App Center's iOS code signing documentation](~/build/ios/code-signing.md).
- If the build is not signed during the build, developers can sign the `.ipa` file (locally using codesign) or used for other purposes (for example, upload to Test service for UI testing on real devices or run in the simulator).
- Unsigned builds will not produce an .ipa file. The artifact of an unsigned build is the .xcarchive file which can be used to generate an .ipa file with the Xcode Archives organizer.

### 4.3. The source maps and symbol files

Upon building a React Native iOS app, a JavaScript source map and one or multiple `.dsym` files are automatically generated with each build and can be downloaded once the build is completed.

- if you have previously integrated the App Center SDK in your app with the crash reporting module enabled, the crash reporting beacon requires this `.dsym` file and the JavaScript sourcemap for a build to display human readable (symbolicated) crash reports.
- if you have previously integrated another SDK for crash reporting purposes in your app, the corresponding service requires the `.dsym` file and the JavaScript sourcemap to display human readable (symbolicated) crash reports.

Keep in mind that the `.dsym` file does not change upon code signing the `.ipa`. If you decide to code sign the build later, the `.dsym` generated before code signing is still valid.

If this app has the crashes SDK integrated, iOS symbols and source maps will automatically be sent to App Center Crashes service to enable human readable (symbolicated) crash reports at both the native and JavaScript stack.

## 5. Build tips

### 5.1. Yarn

[Yarn](https://yarnpkg.com) is a faster, more deterministic replacement for `npm`. If a `yarn.lock` file is present in your repo next to `package.json`, then App Center will use Yarn, doing `yarn install` at the start of the build. Otherwise, it will do `npm install`.

### 5.2. Custom build scripts

In addition to App Center's [custom build scripts](~/build/custom/scripts/index.md) you might want to use [npm-scripts](https://docs.npmjs.com/misc/scripts) for example, when your React Native app uses TypeScript and you have to run the `tsc` compiler at build start. Add a `postinstall` script in the `package.json` like this:

```javascript
  "scripts": {
    ...
    "postinstall" : "./postinstall.sh"     [other examples: "node ./postinstall.js" or just a single command like "tsc"]
  },
```

Postinstall scripts run right after all the `package.json` packages are installed, so you use those packages in your script.
