---
title: Releasing CodePush updates using the App Center CLI
description: "How to use and set up the App Center CLI to release CodePush updates"
keywords: distribution
author: Zakeelm
ms.author: zakeelm
ms.date: 01/28/2019
ms.topic: article
ms.assetid: 25A63776-28D6-4993-A597-C05443F7129F
ms.service: vs-appcenter
ms.custom: distribute
---

# Releasing CodePush updates using the App Center CLI

## Installation

* Install [Node.js](https://nodejs.org/)
* Install the App Center CLI: `npm install -g appcenter-cli`

## Getting Started

1. Create an [App Center account](https://appcenter.ms) or sign in through the CLI using the `appcenter login` command.
2. [Register your app](#app-management) with CodePush, and optionally [share your app with other developers](#app-collaboration) on your team.
3. CodePush-ify your app and point it at the deployment you wish to use ([Apache Cordova](~/distribution/codepush/cordova.md) and [React Native](~/distribution/codepush/react-native.md)).
4. [Release and update for your app](#releasing-app-updates).

## <a name="account-creation"/>Account Management

Before you can begin releasing app updates, you must sign in with your existing CodePush account or create a new App Center account. You can do this by running the following command once you've installed the CLI:

```shell
appcenter login
```

This command will launch a browser, asking you to authenticate with either your GitHub or Microsoft account. Once authenticated, it will create a CodePush account "linked" to your GitHub/MSA identity, and generate an access key you can copy/paste into the CLI in order to sign in.

> [!NOTE]
> After registering, you are automatically logged-in with the CLI, so until you explicitly log out, you don't have to sign in again from the same machine.

### Authentication

Most commands within the App Center CLI require authentication, and therefore, before you can begin managing your account, you must sign in using the GitHub or Microsoft account you used when registering. You can do this by executing the following command:

```shell
appcenter login
```

This command will launch a browser window asking you to authenticate with either your GitHub or Microsoft account. It will generate an access key that you must copy/paste into the CLI (it will prompt you for it). You are now successfully authenticated and can safely close your browser window.

If at any time you want to determine if you're already logged in, you can run the following command to display the e-mail address associated with your current authentication session, your username, and your display name:

```shell
appcenter profile list
```

When you sign in from the CLI, your access key persists to disk for the duration of your session so that you don't have to sign in every time you attempt to access your account. To end your session and delete this access key, execute the following command:

```shell
appcenter logout
```

If you forget to sign out from a machine you'd prefer not to leave a running session on (e.g. your friend's laptop), you can use the following commands to list and remove any current log-in sessions.

```shell
appcenter tokens list
appcenter tokens delete <machineName>
```

### Access Tokens

To authenticate against the CodePush service without launching a browser and/or without needing to use your GitHub and/or Microsoft credentials (e.g. in a CI environment), you can execute the following command to create an "access token" (along with a name describing what it is for):

```shell
appcenter tokens create -d "Azure DevOps Integration"
```

The key will only display once, so remember to save it somewhere if needed! After creating the new key, you can specify its value using the `--token` flag of the `login` command, which allows you to perform "headless" authentication, as opposed to launching a browser.

```shell
appcenter login --token <accessToken>
```

When signing in using this method, the access token will not automatically invalidate on sign-out, and can be used in future sessions until it is explicitly removed from the App Center server. However, you should sign out once your session is complete, to remove your credentials from disk.

## App Management

Before deploying updates, you must create an app with App Center using the following command:

```shell
appcenter apps create -d <appDisplayName> -o <operatingSystem>  -p <platform> 
```

If your app targets both Android and iOS, we highly recommend creating separate apps with CodePush. One for each platform. This way, you can manage and release updates to them separately, which in the long run, tends to make things simpler. Most people just suffix the app name with `-Android` and `-iOS`. For example:

```shell
appcenter apps create -d MyApp-Android -o Android -p React-Native
appcenter apps create -d MyApp-iOS -o iOS -p Cordova
```

> [!NOTE]
> Using the same app for Android and iOS may cause installation exceptions because the CodePush update package produced for iOS will have different content from the update produced for Android.
> 
> [!TIP]
> One important new functionality in the App Center CLI is the ability to set an app as the **current app** using `appcenter apps set-current <ownerName>/<appName>`. By setting an app as the current app you no don't have to use the `-a` flag in other CLI commands. For example, the command `appcenter codepush deployment list -a <ownerName>/<appName>` can be shortened to `appcenter codepush deployment list` when the current app is set. You can check which app is set as your account's current app using `appcenter apps get-current`. Setting current app makes typing most CLI commands shorter.

With the original CodePush, apps automatically had two deployments (`Staging` and `Production`). In App Center, you'll have to create them yourself using the following commands:

```shell
appcenter codepush deployment add -a <ownerName>/<appName> Staging
appcenter codepush deployment add -a <ownerName>/<appName> Production
```

After you create the deployments, you can access the deployment keys for both deployments using `appcenter codepush deployment list --displayKeys`, which you can begin using to configure your mobile clients via their respective SDKs (details for [Cordova](./cordova.md) and [React Native](./react-native.md)).

If you decide that you don't like the name you gave to an app, you can rename it at any time using the following command:

```shell
appcenter apps update -n <newName> -a <ownerName>/<appName>
```

The app's name is only meant to be recognizable from the management side, so feel free to rename it as necessary. It won't actually impact the running app, since update queries are made via deployment keys.

If at some point you no longer need an app, you can remove it from the server using the following command:

```shell
appcenter apps delete -a <ownerName>/<appName>
```

Use caution when executing this command as any apps that have been configured to use it will obviously stop receiving updates.

Finally, if you want to list all apps that you've registered with the App Center server, run the following command:

```shell
appcenter apps list
```

### App Collaboration

If you will be working with other developers on the same CodePush app, you can add them as collaborators using the App Center portal by following the set of instructions below:

1. In the App Center portal, select the app for which you would like to add collaborators
2. In the navigation area on the left side of the page, click **Settings**
3. Click the **Collaborators** link
4. Within the collaborators menu, enter the email addresses of the desired collaborators to invite them

> [!IMPORTANT]
> App Center's Collaborators feature expects that each collaborator has already [registered with App Center](#account-creation) using the specified e-mail address.

Once added, all collaborators will immediately have the following permissions in the shared app:

1. View the app, its collaborators, [deployments](#deployment-management), and [release history](#viewing-release-history)
2. [Release](#releasing-app-updates) updates to any of the app's deployments
3. [Promote](#promoting-updates) an update between any of the app's deployments
4. [Rollback](#rolling-back-updates) any of the app's deployments
5. [Patch](#patching-update-metadata) any releases within any of the app's deployments

Collaborators cannot do any of the following actions:

1. Rename or delete the app
2. Create, rename, or delete new deployments within the app
3. Clear a deployment's release history
4. Add or remove collaborators from the app (*)

> [!NOTE]
> A developer can remove him/herself as a collaborator from an app that was shared with them.

Over time, if someone is no longer working on an app with you, you can also remove them as a collaborator using this collaborator menu in the portal.

If at any time you want to list all collaborators that have been added to an app, you can visit the collaborator menu in the portal.

### Deployment Management

From the CodePush perspective, an app is a named grouping for one or more "deployments". While the app represents a conceptual "namespace" or "scope" for a platform-specific version of an app (e.g. the iOS port of Foo app), its deployments represent the actual target for releasing updates (for developers) and synchronizing updates (for end users). Deployments allow you to have multiple "environments" for each app in-flight at any given time, and help model the reality that apps typically move from a developer's personal environment to a testing/QA/staging environment, before finally making their way into production.

> [!NOTE]
> As you'll see below, the `release`, `promote` and `rollback` commands require both an app name and a deployment name in order to work, because it is the combination of the two that uniquely identifies a point of distribution (e.g. I want to release an update of my iOS app to my beta testers).

Whenever an app is registered with the CodePush service, we recommend you create the following deployments: `Staging` and `Production`. This allows you to begin releasing updates to an internal environment, where you can thoroughly test each update before pushing them out to your end users. This workflow is critical for ensuring your releases are ready for mass-consumption, and is a practice that has been established in the web for a long time.

If having a staging and production version of your app is enough to meet your needs, then you don't have to do anything else. However, if you want an alpha, dev, etc. deployment, you can easily create them using the following command:

```shell
appcenter codepush deployment add -a <ownerName>/<appName> <deploymentName>
```

Just like with apps, you can remove and rename deployments as well, using the following commands respectively:

```shell
appcenter codepush deployment remove -a <ownerName>/<appName> <deploymentName>
appcenter codepush deployment rename -a <ownerName>/<appName> <deploymentName> <newDeploymentName>
```

If at any time you'd like to view the list of deployments that a specific app includes, you can run the following command:

```shell
appcenter codepush deployment list -a <ownerName>/<appName>
```

The install metrics have the following meaning:

* **Active** - The number of successful installs that are currently running this release (i.e. if the user opened your app, they would see/run this version). This number will increase and decrease as end users upgrade to and away from this release, respectively. This metric shows both the total of active users, as well as what percentage of your overall audience that represents. This makes it easy to determine the distribution of updates that your users are currently running, as well as answer questions such as "How many of my users have received my latest update?".

* **Total** - The total number of successful installations that this update has received overall. This number only ever increases as new users/devices install it, and therefore, it is always a superset of the total active count. An update is considered successful once `notifyApplicationReady` (or `sync`) is called after it was installed. Between the moment that an update is downloaded, and it is marked as being successful, it will be reported as a "pending" update (see below for details).

* **Pending** - The number of times this release has been downloaded, but not yet installed (i.e. the app was restarted to apply the changes). Therefore, this metric increases as updates are downloaded, and decreases as those corresponding downloaded updates are installed. This metric primarily applies to updates that aren't configured to install immediately, and helps provide the broader picture of release adoption for apps that rely on app resume and/or restart to apply an update (e.g. I want to roll back an update and I'm curious if anyone has downloaded it yet). If you've configured updates to install immediately, and are still seeing pending updates being reported, then it's likely that you're not calling `notifyApplicationReady` (or `sync`) on app start, which is the method that initiates sending install reports and marks installed updates as being considered successful.

* **Rollbacks** - The number of times that this release has been automatically rolled back on the client. Ideally this number should be zero, and in that case, this metric isn't even shown. However, if you released an update that includes a crash as part of the installation process, the CodePush plugin will roll the end user back to the previous release, and report that issue back to the server. This allows your end users to remain unblocked in case of broken releases, and by being able to see this telemetry in the CLI, you can identify erroneous releases and respond to them by [rolling it back](#rolling-back-updates) on the server.

* **Rollout** - Indicates the percentage of users that are eligible to receive this update. This property will only be displayed for releases that represent an "active" rollout, and therefore, have a rollout percentage that is less than 100%. Additionally, since a deployment can only have one active rollout at any given time, this label would only be present on the latest release within a deployment.

* **Disabled** - Indicates whether the release has been marked as disabled or not, and therefore, is downloadable by end users. This property will only be displayed for releases that are disabled.

When the metrics cell reports `No installs recorded`, that indicates that the server hasn't seen any activity for this release. This could either be because it precluded the plugin versions that included telemetry support, or no end users have synchronized with the CodePush server yet. As soon as an install happens, you will begin to see metrics populate in the CLI for the release.

## <a name="releasing-app-updates" />Releasing Updates

Once your app has been configured to query for updates against the App Center server, you can begin releasing updates to it. In order to provide both simplicity and flexibility, the App Center CLI includes three different commands for releasing updates:

1. [General](#releasing-updates-general) - Releases an update to the App Center server that was generated by an external tool or build script (e.g. a Gulp task, the `react-native bundle` command). This provides the most flexibility in terms of fitting into existing workflows, since it strictly deals with CodePush-specific step, and leaves the app-specific compilation process to you.

2. [React Native](#releasing-updates-react-native) - Performs the same functionality as the general release command, but also handles the task of generating the updated app contents for you (JS bundle and assets), instead of requiring you to run both `react-native bundle` and then `appcenter codepush release`.

3. [Cordova](#releasing-updates-cordova) - Performs the same functionality as the general release command, but also handles the task of preparing the app update for you, instead of requiring you to run both `cordova prepare` (or `phonegap prepare`)  and then `appcenter codepush release`.

Which of these commands you should use is mostly a matter of requirements and/or preference. However, we recommend using the relevant platform-specific command to start (since it greatly simplifies the experience), and then leverage the general purpose `release` command if/when greater control is needed.

> [!NOTE]
> Only the 50 most recent releases in a deployment can be discovered and downloaded by the clients.

### Releasing Updates (General)

```text
appcenter codepush release -a <ownerName>/<appName> -c <updateContentsPath> -t <targetBinaryVersion> -d <deploymentName>

[-t|--target-binary-version <version>]
[-с|--update-contents-path <updateContentsPath>]
[-r|--rollout <rolloutPercentage>]
[--disable-duplicate-release-error]
[-k|--private-key-path <privateKeyPath>]
[-m|--mandatory]
[-x|--disabled]
[--description <description>]
[-d|--deployment-name <deploymentName>]
[-a|--app <ownerName>/<appName>]
[--disable-telemetry]
[-v|--version]
```

#### App name parameter

This parameter specifies the name of the App Center app that this update is being released for. If you want to look it up, you can run the `appcenter apps list` command to see your list of apps.

#### Update contents parameter

This parameter specifies the location of the updated app code and assets you want to release. You can provide either a single file (e.g. a JS bundle for a React Native app), or a path to a directory (e.g. the `/platforms/ios/www` folder for a Cordova app). You don't have to ZIP up multiple files or directories in order to deploy those changes, since the CLI will automatically ZIP them for you.

It's important that the path you specify refers to the platform-specific, prepared/bundled version of your app. The following table outlines which command you should run before releasing, as well as the location you can subsequently refer to using the `updateContentsPath` parameter:

| Platform                         | Prepare command  | Package path (relative to project root)                                    |
| -------------------------------- | ---------------- |--------------------------------------------------------------------------- |
| Cordova (Android)                | `cordova prepare android`    | `./platforms/android/assets/www` directory                     |
| Cordova (iOS)                    | `cordova prepare ios`        | `./platforms/ios/www ` directory                               |
| React Native wo/assets (Android) | `react-native bundle --platform android --entry-file <entryFile> --bundle-output <bundleOutput> --dev false`  | Value of the `--bundle-output` option. |
| React Native w/assets (Android)  | `react-native bundle --platform android --entry-file <entryFile> --bundle-output <releaseFolder>/<bundleOutput> --assets-dest <releaseFolder> --dev false` | Value of the `--assets-dest` option, which should represent a newly created directory that includes the app's assets and JS bundle |
| React Native wo/assets (iOS)     | `react-native bundle --platform ios --entry-file <entryFile> --bundle-output <bundleOutput> --dev false` | Value of the `--bundle-output` option |
| React Native w/assets (iOS)      | `react-native bundle --platform ios --entry-file <entryFile> --bundle-output <releaseFolder>/<bundleOutput> --assets-dest <releaseFolder> --dev false` | Value of the `--assets-dest` option, which should represent a newly created directory that includes the app's assets and JS bundle |

#### Target binary version parameter

This parameter specifies the store/binary version of the application you are releasing the update for, so that only users running that version will receive the update, while users running an older and/or newer version of the app binary will not. It is useful for the following reasons:

1. If a user is running an older binary version, it's possible that there are breaking changes in the CodePush update that wouldn't be compatible with what they're running.

2. If a user is running a newer binary version, then it's presumed that what they are running is newer (and potentially incompatible) with the CodePush update.

If you ever want an update to target multiple versions of the app store binary, we also allow you to specify the parameter as a [semver range expression](https://github.com/npm/node-semver#advanced-range-syntax). That way, any client device running a version of the binary that satisfies the range expression (i.e. `semver.satisfies(version, range)` returns `true`) will get the update. Examples of valid **semver** range expressions are as follows:

| Range Expression | Who gets the update                                                                    |
|------------------|----------------------------------------------------------------------------------------|
| `1.2.3`          | Only devices running the specific binary binary version `1.2.3` of your app         |
| `*`              | Any device configured to consume updates from your CodePush app                        |
| `1.2.x`          | Devices running major version 1, minor version 2, and any patch version of your app     |
| `1.2.3 - 1.2.7`  | Devices running any binary version between `1.2.3` (inclusive) and `1.2.7` (inclusive) |
| `>=1.2.3 <1.2.7` | Devices running any binary version between `1.2.3` (inclusive) and `1.2.7` (exclusive) |
| `1.2`            | Equivalent to `>=1.2.0 <1.3.0`                                                         |
| `~1.2.3`         | Equivalent to `>=1.2.3 <1.3.0`                                                         |
| `^1.2.3`         | Equivalent to `>=1.2.3 <2.0.0`                                                         |

> [!NOTE]
> If the app's **semver** expression starts with a special shell character or operator such as `>`, `^`, or **
> *, the command may not execute correctly if you do not wrap the value in quotes as the shell will not supply the right values to our CLI process. Therefore, it is best to wrap the app's `targetBinaryVersion` parameter in double quotes when calling the `release` command, e.g. `appcenter codepush release -a <ownerName>/<appName> updateContents ">1.2.3"`.

The following table outlines the version value that CodePush expects your update's **semver** range to satisfy for each respective app type:

| Platform               | Source of binary version                                                  |
|------------------------|------------------------------------------------------------------------------|
| Cordova                | The `<widget version>` attribute in the **config.xml** file                    |
| React Native (Android) | The `android.defaultConfig.versionName` property in the project's **build.gradle** file |
| React Native (iOS)     | The `CFBundleShortVersionString` key in the **Info.plist** file                |
| React Native (Windows) | The `<Identity Version>` key in the **Package.appxmanifest** file                                |

> [!NOTE]
> If the binary version in the metadata files are missing a patch version, e.g. `2.0`, it will be treated as having a patch version of `0`, i.e. `2.0 -> 2.0.0`.

#### Deployment name parameter

This parameter specifies which deployment you want to release the update to. It defaults to `Staging`, but when you're ready to deploy to `Production`, or one of your own custom deployments, just explicitly set this argument.

> [!TIP]
> The parameter can be set using either `--deployment-name` or `-d`.

#### Description parameter

This parameter provides an optional "change log" for the deployment. The value is round tripped to the client so that when the update is detected, your app can choose to display it to the end user (e.g. via a "What's new?" dialog). This string accepts control characters such as `\n` and `\t` so that you can include whitespace formatting within your descriptions for improved readability.

> [!TIP]
> This parameter can be set using `--description`.*

#### Disabled parameter

This parameter specifies whether an update should be downloadable by end users or not. If left unspecified, the update will not be disabled (i.e. users will download it the moment your app calls `sync`). This parameter can be valuable if you want to release an update that isn't immediately available, until you explicitly [patch it](#patching-update-metadata) when you want end users to be able to download it (e.g. an announcement blog post went live).

> [!TIP]
> This parameter can be set using either `--disabled` or `-x`*

#### Mandatory parameter

This parameter specifies whether the update should be considered mandatory or not (e.g. it includes a critical security fix). This attribute is round tripped to the client, who can then decide if and how they would like to enforce it.

> [!NOTE]
> This parameter is a "flag", and therefore, its absence indicates that the release is optional, and its presence indicates that it's mandatory. You can provide a value to it (e.g. `--mandatory true`), however, specifying `--mandatory` is sufficient for marking a release as mandatory.*

The mandatory attribute is unique because the server will dynamically modify it as necessary in order to ensure that the semantics of the app's releases are maintained for your end users. For example, imagine that you released the following three updates to your app:

| Release | Mandatory? |
|---------|------------|
| v1      | No         |
| v2      | Yes        |
| v3      | No         |

If an end user is currently running `v1`, and they query the server for an update, it will respond with `v3` (since that is the latest), but it will dynamically convert the release to mandatory, since a mandatory update was released in between. This behavior is important since the code contained in `v3` is incremental to that included in `v2`, and therefore, whatever made `v2` mandatory, continues to make `v3` mandatory for anyone that didn't already acquire `v2`.

If an end user is currently running `v2`, and they query the server for an update, it will respond with `v3`, but leave the release as optional. This is because they already received the mandatory update, and therefore, there isn't a need to modify the policy of `v3`. This behavior is why we say that the server will "dynamically convert" the mandatory flag, because as far as the release goes, its mandatory attribute will always be stored using the value you specified when releasing it. It is only changed on-the-fly as necessary when responding to an update check from an end user.

If you never release an update that is marked as mandatory, then the above behavior doesn't apply to you, since the server will never change an optional release to mandatory unless there were intermingled mandatory updates as illustrated above. Additionally, if a release is marked as mandatory, it will never be converted to optional, since that wouldn't make any sense. The server will only change an optional release to mandatory in order to respect the semantics described above.

> [!TIP]
> This parameter can be set using either `--mandatory` or `-m`*

#### No duplicate release error parameter

This parameter specifies that if the update is identical to the latest release on the deployment, the CLI should generate a warning instead of an error. It is useful for continuous integration scenarios where it is expected that small modifications may trigger releases where no production code has changed.

#### Rollout parameter

> [!IMPORTANT]
> In order for this parameter to take effect, your end users must be running version `1.6.0-beta+` (for Cordova) or `1.9.0-beta+` (for React Native) of the CodePush plugin. If you release an update that specifies a rollout property, no end user running an older version of the Cordova or React Native plugins will be eligible for the update. Therefore, until you have adopted the neccessary version of the platform-specific CodePush plugin (as previously mentioned), we would advise not setting a rollout value on the app's releases, since no one would end up receiving it.

This parameter specifies the percentage of users (as an integer between `1` and `100`) that should be eligible to receive this update. It can be helpful if you want to "flight" new releases with a portion of the app's audience (e.g. 25%), and get feedback and/or watch for exceptions/crashes, before making it broadly available for everyone. If this parameter isn't set, it is set to `100%`, and therefore, you only have to set it if you want to limit how many users will receive it.

 When leveraging the rollout capability, there are a few additional considerations to keep in mind:

1. You cannot release a new update to a deployment whose latest release is an "active" rollout (i.e. its rollout property is non-null). The rollout needs to be "completed" (i.e. setting the `rollout` property to `100`) before you can release further updates to the deployment.

2. If you roll back a deployment whose latest release is an "active" rollout, the rollout value will be cleared, effectively "deactivating" the rollout behavior

3. Unlike the `mandatory` and `description` fields, when you promote a release from one deployment to another, it will not propagate the `rollout` property, and therefore, if you want the new release (in the target deployment) to have a rollout value, you must explicitly set it when you call the `promote` command.

> [!TIP]
> This parameter can be set using either `--rollout` or `-r`*

### Releasing Updates (React Native)

```NA
appcenter codepush release-react -a <ownerName>/<appName> -d <deploymentName> -t <targetBinaryVersion>
[-t|--target-binary-version <targetBinaryVersion>]
[-o|--output-dir]
[-s|--sourcemap-output]
[--plist-file-prefix]
[-p|--plist-file]
[-g|--gradle-file]
[-e|--entry-file]
[--development]
[-b|--bundle-name <bundleName>]
[-r|--rollout <rolloutPercentage>]
[--disable-duplicate-release-error]
[-k|--private-key-path <privateKeyPath>]
[-m|--mandatory]
[-x|--disabled]
[--description <description>]
[-d|--deployment-name <deploymentName>]
[-a|--app <ownerName>/<appName>]
[--disable-telemetry]
[-v|--version]
```

The `release-react` command is a React Native-specific version of the "vanilla" [`release`](#releasing-app-updates) command, which supports all of the same parameters (e.g. `--mandatory`, `--description`), yet simplifies the process of releasing updates by performing the following additional behavior:

1. Running the `react-native bundle` command in order to generate the [update contents](#update-contents-parameter) (JS bundle and assets) that will be released to the CodePush server. It uses sensible defaults as much as possible (e.g. creating a non-dev build, assuming an iOS entry file is named **index.ios.js**), but also exposes the relevant `react-native bundle` parameters to enable flexibility (e.g. `--sourcemap-output`).

2. Inferring the [`targetBinaryVersion`](#target-binary-version-parameter) of this release by using the version name that is specified in the project's **Info.plist** (for iOS) and **build.gradle** (for Android) files.

To illustrate the difference that the `release-react` command can make, the following is an example of how you might generate and release an update for a React Native app using the "vanilla" `release` command:

```shell
mkdir ./CodePush

react-native bundle --platform ios \
--entry-file index.ios.js \
--bundle-output ./CodePush/main.jsbundle \
--assets-dest ./CodePush \
--dev false

appcenter codepush release -a <ownerName>/MyApp-iOS -c ./CodePush -t 1.0.0
```

Achieving the equivalent behavior with the `release-react` command would require the following command, which is less error-prone:

```shell
appcenter codepush release-react -a <ownerName>/MyApp-iOS
```

> [!NOTE]
> We believe that the `release-react` command should be valuable for most React Native developers, so if you're finding that it isn't flexible enough or missing a key feature, please don't hesistate to [let us know](mailto:codepushfeed@microsoft.com), so that we can improve it!

#### App name parameter

It is the same parameter as the one described in the [above section](#app-name-parameter).

#### Platform parameter

This parameter specifies which platform the current update is targeting, and can be either `android`, `ios` or `windows` (case-insensitive). This value is only used to determine how to properly bundle the app's update contents and isn't sent to the server.

#### Deployment name parameter

It is the same parameter as the one described in the [above section](#deployment-name-parameter).

#### Description parameter

It is the same parameter as the one described in the [above section](#description-parameter).

#### Mandatory parameter

It is the same parameter as the one described in the [above section](#mandatory-parameter).

#### No duplicate release error parameter

It is the same parameter as the one described in the [above section](#no-duplicate-release-error-parameter).

#### Rollout parameter

It is the same parameter as the one described in the [above section](#rollout-parameter). If left unspecified, the release will be made available to all users.

#### Target binary version parameter

It is the same parameter as the one described in the [above section](#target-binary-version-parameter). If left unspecified, it defaults to targeting the exact version specified in the app's **Info.plist** (for iOS) and **build.gradle** (for Android) files.

#### Bundle name parameter

This parameter specifies the file name that should be used for the generated JS bundle. If left unspecified, the standard bundle name will be used for the specified platform: **main.jsbundle** (iOS), **index.android.bundle** (Android), and **index.windows.bundle** (Windows).

> [!TIP]
> This parameter can be set using either `--bundle-name` or `-b`*

#### Development parameter

This parameter specifies whether to generate an unminified, development JS bundle. If left unspecified, it defaults to `false` where warnings are disabled and the bundle is minified.

> [!TIP]
> This parameter can be set using `--development`*

#### Disabled parameter

It is the same parameter as the one described in the [above section](#disabled-parameter).

#### Entry file parameter

This parameter specifies the relative path to the app's root/entry JavaScript file. If left unspecified, it defaults to **index.ios.js** (for iOS),  **index.android.js** (for Android), or **index.windows.bundle** (for Windows) if that file exists, or **index.js** otherwise.

> [!TIP]
> This parameter can be set using either `--entry-file` or `-e`*

#### Gradle file parameter (Android only)

This parameter specifies the relative path to the **build.gradle** file that the CLI should use when attempting to autodetect the target binary version for the release. This parameter is only meant for advanced scenarios, since the CLI will automatically be able to find the project's **build.gradle** file in "standard" React Native projects. However, if the project's gradle file is located in an arbitrary location, that the CLI can't discover, then using this parameter allows you to continue releasing CodePush updates, without needing to explicitly set the `--target-binary-version` parameter. Since **build.gradle** is a required file name, specifying the path to the containing folder or the full path to the file itself will both achieve the same effect.

```shell
appcenter codepush release-react -a <ownerName>/MyApp-Android  -g "./foo/bar/"
appcenter codepush release-react -a <ownerName>/MyApp-Android  -g "./foo/bar/build.gradle"
```

> [!TIP]
> This parameter can be set using either `--gradle-file`  or `-g`*

#### Plist file parameter (iOS only)

This parameter specifies the relative path to the **Info.plist** file that the CLI should use when attempting to autodetect the target binary version for the release. This parameter is only meant for advanced scenarios, since the CLI will automatically be able to find the project's **Info.plist** file in "standard" React Native projects, and you can use the `--plistFilePrefix` parameter in order to support per-environment plist files (e.g. **STAGING-Info.plist**). However, if the project's plist is located in an arbitrary location, that the CLI can't discover, then using this parameter allows you to continue releasing CodePush updates, without needing to explicitly set the `--target-binary-version` parameter.

```shell
appcenter codepush release-react -a <ownerName>/MyApp-iOS -p "./foo/bar/MyFile.plist"
```

> [!TIP]
> This parameter can be set using either `--plist-file`  or `-p`*

#### Plist file prefix parameter (iOS only)

This parameter specifies the file name prefix of the **Info.plist** file that that CLI should use when attempting to autodetect the target binary version for the release. This can be useful if you've created per-environment plist files (e.g. **DEV-Info.plist**, **STAGING-Info.plist**), and you want to be able to release CodePush updates without needing to explicitly set the `--target-binary-version` parameter. By specifying a `--plist-file-prefix`, the CLI will look for a file named `<prefix>-Info.plist`, instead of **Info.plist** (which is the default behavior), in the following locations: `./ios` and `./ios/<appName>`. If the project's plist file isn't located in either of those directories (e.g. your app is a native iOS app with embedded RN views), or uses an entirely different file naming convention, then consider using the `--plist-file ` parameter.

```shell
# Autodetect the target binary version of this release by looking up the
# app version within the STAGING-Info.plist file in either the ./ios or ./ios/<APP> directories.
appcenter codepush release-react -a <ownerName>/MyApp-iOS  --plist-file-prefix "STAGING"

# Tell the CLI to use your dev plist (`DEV-Info.plist`).
# The hyphen separator can be explicitly stated.
appcenter codepush release-react -a <ownerName>/MyApp-iOS --plist-file-prefix "DEV-"
```

#### Source map output parameter

This parameter specifies the relative path to where the generated JS bundle's source map file should be written. If left unspecified, source maps will not be generated.

> [!TIP]
> This parameter can be set using either `--sourcemap-output`  or `-s`*

### Releasing Updates (Cordova)

```NA
appcenter codepush release-cordova -a <ownerName>/<appName> -d <deploymentName> -t <targetBinaryVersion>
[-t|--target-binary-version <targetBinaryVersion>]
[--is-release-build-type]
[-b|--build]
[-r|--rollout <rolloutPercentage>]
[--disable-duplicate-release-error]
[-k|--private-key-path <privateKeyPath>]
[-m|--mandatory]
[-x|--disabled]
[--description <description>]
[-d|--deployment-name <deploymentName>]
[-a|--app <ownerName>/<appName>]
[--disable-telemetry]
[-v|--version]
```

The `release-cordova` command is a Cordova-specific version of the "vanilla" [`release`](#releasing-app-updates) command, which supports all of the same parameters (e.g. `--mandatory`, `--description`), yet simplifies the process of releasing updates by performing the following additional behavior:

1. Running the `cordova prepare` (or `phonegap prepare`) command in order to generate the [update contents](#update-contents-parameter) (**www** folder) that will be released to the CodePush server.

2. Inferring the [`targetBinaryVersion`](#target-binary-version-parameter) of this release by using the version name that is specified in the project's **config.xml** file.

To illustrate the difference that the `release-cordova` command can make, the following is an example of how you might generate and release an update for a Cordova app using the "vanilla" `release` command:

```shell
cordova prepare ios
appcenter codepush release -a <ownerName>/MyApp-iOS -c ./platforms/ios/www -t 1.0.0
```

Achieving the equivalent behavior with the `release-cordova` command would require the following command, which is less error-prone:

```shell
appcenter codepush release-cordova -a <ownerName>/MyApp-iOS
```

> [!NOTE]
>  We believe that the `release-cordova` command should be valuable for most Cordova developers, if you're finding that it isn't flexible enough or missing a key feature, please don't hesistate to [let us know](mailto:codepushfeed@microsoft.com), so that we can improve it.*

#### App name parameter

It is the same parameter as the one described in the [above section](#app-name-parameter).

#### Platform parameter

This parameter specifies which platform the current update is targeting, and can be either `iOS` or `Android`.

#### Deployment name parameter

It is the same parameter as the one described in the [above section](#deployment-name-parameter).

#### Description parameter

It is the same parameter as the one described in the [above section](#description-parameter).

#### Mandatory parameter

It is the same parameter as the one described in the [above section](#mandatory-parameter).

#### No duplicate release error parameter

It is the same parameter as the one described in the [above section](#no-duplicate-release-error-parameter).

#### Rollout parameter

It is the same parameter as the one described in the [above section](#rollout-parameter). If left unspecified, the release will be made available to all users.

#### Target binary version parameter

It is the same parameter as the one described in the [above section](#target-binary-version-parameter). If left unspecified, the command defaults to targeting only the specified version in the project's metadata (**Info.plist** if this update is for iOS clients, and **build.gradle** for Android clients).

#### Disabled parameter

It is the same parameter as the one described in the [above section](#disabled-parameter).

#### Build parameter

This parameter specifies whether you want to run `cordova build` instead of `cordova prepare` (which is the default behavior), when generating your updated web assets. It is valuable if your project includes before and/or after build hooks (e.g. to transpile TypeScript), and therefore, having CodePush run `cordova prepare` isn't sufficient to create and release an update. If left unspecified, it defaults to `false`.

> [!TIP]
> This parameter can be set using either `--build` or `-b`*

## <a name="patching-update-metadata" />Patching Update Metadata

After releasing an update, there may be scenarios where you want to modify one or more of the metadata attributes associated with it (e.g. you forgot to mark a critical bug fix as mandatory, you want to increase the rollout percentage of an update). You can easily do this by running the following command:

```NA
appcenter codepush patch -a <ownerName>/<appName> <deploymentName> <existing-release-label>
[-r|--rollout <rolloutPercentage>]
[-d|--description <description>]
[-t|--target-binary-version <targetBinaryVersion>]
[-a|--app <ownerName>/<appName>]
[--disable-telemetry]
[-v|--version]
```

> [!NOTE]
> This command doesn't allow modifying the actual update contents of a release (e.g. `www` folder of a Cordova app). If you want to respond to a release that has been identified as being broken, you should use the [rollback](#rolling-back-updates) command to immediately roll it back, and then if necessary, release a new update with the appropriate fix when it is available.*

Aside from the `<ownerName>/<appName>` and `deploymentName`, all parameters are optional, and therefore, you can use this command to update just a single attribute or all of them at once. Calling the `patch` command without specifying any attribute flag will result in a no-op.

```shell
# Mark the latest production release as mandatory
appcenter codepush patch -a <ownerName>/MyApp-iOS Production -m

# Increase the rollout for v23 to 50%
appcenter codepush patch -a <ownerName>/MyApp-iOS Production v23 -rollout 50%
```

### Label parameter

Indicates which release (e.g. `v23`) you want to update within the specified deployment. If omitted, the requested changes will be applied to the latest release in the specified deployment. In order to look up the label for the release you want to update, you can run the `appcenter codepush deployment history` command and refer to the `Label` column.

### Mandatory parameter

It is the same parameter as the one described in the [above section](#mandatory-parameter), and allows you to update whether the release should be considered mandatory or not. Pay attention that `--mandatory` and `--mandatory true` are equivalent, but the absence of this flag is not equivalent to `--mandatory false`. Therefore, if the parameter is omitted, no change will be made to the value of the target release's mandatory property. You must set this parameter to `--mandatory false` to explicitly make a release optional.

### Description parameter

It is the same parameter as the one described in the [above section](#description-parameter), and allows you to update the description associated with the release (e.g. you made a typo when releasing, or you forgot to add a description at all). If this parameter is omitted, no change will be made to the value of the target release's description property.

### Disabled parameter

It is the same parameter as the one described in the [above section](#disabled-parameter), and allows you to update whether the release should be disabled or not. Pay attention `--disabled` and `--disabled true` are equivalent, but the absence of this flag is not equivalent to `--disabled false`. Therefore, if the parameter is omitted, no change will be made to the value of the target release's disabled property. You must set this parameter to `--disabled false` to explicitly make a release acquirable if it was previously disabled.

### Rollout parameter

It is the same parameter as the one described in the [above section](#rollout-parameter), and allows you to increase the rollout percentage of the target release. This parameter can only be set to an integer whose value is greater than the current rollout value. Additionally, if you want to "complete" the rollout, and therefore, make the release available to everyone, you can set this parameter to `--rollout 100`. If this parameter is omitted, no change will be made to the value of the target release's rollout parameter.

Additionally, as mentioned above, when you release an update without a rollout value, it is treated equivalently to setting the rollout to `100`. Therefore, if you released an update without a rollout, you cannot change the rollout property of it via the `patch` command since that would be considered lowering the rollout percentage.

### Target binary version parameter

It is the same parameter as the one described in the [above section](#target-binary-version-parameter), and allows you to update the **semver** range that indicates which binary version(s) a release is compatible with. This can be useful if you made a mistake when originally releasing an update (e.g. you specified `1.0.0` but meant `1.1.0`) or you want to increase or decrease the version range that a release supports (e.g. you discovered that a release doesn't work with `1.1.2` after all). If this parameter is omitted, no change will be made to the value of the target release's version property.

```shell
# Add a "max binary version" to an existing release
# by scoping its eligibility to users running >= 1.0.5
appcenter codepush patch -a <ownerName>/MyApp-iOS Staging -t "1.0.0 - 1.0.5"
```

## Promoting Updates

Once you've tested an update against a specific deployment (e.g. `Staging`), and you want to promote it "downstream" (e.g. dev->staging, staging->production), you can use the following command to copy the release from one deployment to another:

```NA
appcenter codepush promote -a <ownerName>/<appName> -s <sourceDeploymentName> -d <destDeploymentName>
[-s|--source-deployment-name <sourceDeploymentName>]
[-d|--destination-deployment-name <destDeploymentName>]
[-t|--target-binary-version <targetBinaryVersion>] 
[-r|--rollout <rolloutPercentage>]
[--disable-duplicate-release-error]
[--description <description>]
[-a|--app <ownerName>/<appName>] 
[--disable-telemetry] 
```

The `promote` command creates a new release for the destination deployment, which includes the **exact code and metadata** (description, mandatory, and target binary version) from the latest release of the source deployment. While you could use the `release` command to "manually" migrate an update from one environment to another, the `promote` command has the following benefits:

1. It's quicker, since you don't have to reassemble the release assets you want to publish or remember the description/binary version that is associated with the source deployment's release.

2. It's less error-prone, since the promote operation ensures that the exact thing that you already tested in the source deployment (e.g. `Staging`) will become active in the destination deployment (e.g. `Production`).

We recommend that all users take advantage of the automatically created `Staging` and `Production` environments, and do all releases directly to `Staging`, and then perform a `promote` from `Staging` to `Production` after performing the appropriate testing.

### Description parameter

It is the same parameter as the one described in the [above section](#description-parameter), and allows you to override the description that will be used for the promoted release. If unspecified, the new release will inherit the description from the release being promoted.

### Disabled parameter

It is the same parameter as the one described in the [above section](#disabled-parameter), and allows you to override the value of the disabled flag that will be used for the promoted release. If unspecified, the new release will inherit the disabled property from the release being promoted.

### Mandatory parameter

It is the same parameter as the one described in the [above section](#mandatory-parameter), and allows you to override the mandatory flag that will be used for the promoted release. If unspecified, the new release will inherit the mandatory property from the release being promoted.

### No duplicate release error parameter

It is the same parameter as the one described in the [above section](#no-duplicate-release-error-parameter).

### Rollout parameter

It is the same parameter as the one described in the [above section](#rollout-parameter), and allows you to specify whether the newly created release should only be made available to a portion of your users. Unlike the other release metadata parameters (e.g. `description`), the `rollout` of a release is not carried over/inherited as part of a promote, and therefore, you must explicitly set this if you don't want the newly created release to be available to all of your users.

### Target binary version parameter

It is the same parameter as the one described in the [above section](#target-binary-version-parameter), and allows you to override the target binary version that will be used for the promoted release. If unspecified, the new release will inherit the target binary version property from the release being promoted.

```shell
# Promote the release to production and make it
# available to all versions using that deployment
appcenter codepush promote -a <ownerName>/MyApp-iOS -s Staging -d Production -t "*"
```

## <a name="rolling-back-updates" />Rolling Back Updates

A deployment's release history is immutable, so you cannot delete or remove an update once it has been released. However, if you release an update that is broken or contains unintended features, it is easy to roll it back using the `rollback` command:

```shell
appcenter codepush rollback <ownerName>/<appName> <deploymentName>
appcenter codepush rollback -a <ownerName>/MyApp-iOS Production
```

Executing this command has the effect of creating a new release for the deployment that includes the **exact same code and metadata** as the version prior to the latest one. For example, imagine that you released the following updates to your app:

| Release | Description       | Mandatory |
|---------|-------------------|-----------|
| v1      | Initial release!  | Yes       |
| v2      | Added new feature | No        |
| v3      | Bug fixes         | Yes       |

If you ran the `rollback` command on that deployment, a new release (`v4`) would be created that included the contents of the `v2` release.

| Release                     | Description       | Mandatory |
|-----------------------------|-------------------|-----------|
| v1                          | Initial release!  | Yes       |
| v2                          | Added new feature | No        |
| v3                          | Bug fixes         | Yes       |
| v4 (Rollback from v3 to v2) | Added new feature | No        |

End users that had already acquired `v3` would now be "moved back" to `v2` when the app performs an update check. Additionally, any users that were still running `v2`, and therefore, had never acquired `v3`, wouldn't receive an update since they are already running the latest release (this is why our update check uses the package hash in addition to the release label).

If you would like to roll back a deployment to a release other than the previous (e.g. `v3` -> `v2`), you can specify the optional `--target-release` parameter:

```shell
appcenter codepush rollback -a <ownerName>/MyApp-iOS Production --target-release v34
```

> [!NOTE]
> The release produced by a rollback will be annotated in the output of the `deployment history` command to help identify them more easily.*

## Viewing Release History

You can view a history of the 50 most recent releases for a specific app deployment using the following command:

```shell
appcenter codepush deployment history -a <ownerName>/<appName> <deploymentName>
```

The history will display all attributes about each release (e.g. label, mandatory) as well as indicate if any releases were made due to a promotion or a rollback operation.

![Deployment History](./images/CLI2.png)

Additionally, the history displays the install metrics for each release. You can view the details about how to interpret the metric data in the documentation for the `deployment list` command above.

<!---
By default, the history doesn't display the author of each release, but if you are collaborating on an app with other developers, and want to view who released each update, you can pass the additional `--displayAuthor` (or `-a`) flag to the history command.
-->

## Clearing Release History

You can clear the release history associated with a deployment using the following command:

```shell
appcenter codepush deployment clear -a <ownerName>/<appName> <deploymentName>
```

After running this command, client devices configured to receive updates using its associated deployment key will no longer receive the updates that have been cleared. This command is irreversible, and therefore should not be used in a production deployment.

## Code Signing

### What is it?

Code signing is a way of creating digital signatures for bundles that can later be validated on the client-side prior to installation.

### Why do we need it?

Developers want to know that the code they ship is the code that they wrote. Code signing is the primary mechanism for providing such assurance and can help mitigate or eliminate a whole class of man-in-the-middle attacks.

### How does it work?

First, the developer generates an asymmetric key pair: the private key will be used for signing bundles; the public key for bundle signature verification. The CodePush cli then uses the private key to sign bundles during `release`, `release-react` and `release-cordova` commands. The public key is shipped with the mobile application. Control over the generation and management of keys is in the hands of the developer.

At the end of release command, the cli computes the bundle's content hash and places this value into a JWT signed with the private key. When the codepush plugin downloads a bundle to a device, it checks the `.codepushrelease` file containing the JWT and validates the JWT signature using the public key. If validation fails, the update is not installed.

### Requirements for using this feature

If you are planning to use this feature you need to do the following:

1. Produce new binary update including 
   * updated codepush plugin supporting Code Signing
   * configure your code-push sdk to use your public key (please, refer relevant React Native SDK ([iOS](react-native.md#code-signing-setup-ios),  [Android](react-native.md#code-signing-setup-android)) or [Cordova SDK](cordova.md#getting-started) sections for details)

2. Produce a new CodePush update that targets the new binary version and specifies a `--privateKeyPath` (or simply `-k`) parameter value

Please refer to our compatibility tables to identify if code-signing feature is supported within your SDK/CLI:

|CodePush SDK|Version from which Code Signing is supporting|Supported Platforms|Minimal CodePush CLI version required|
|----|----|----|----|
|[`react-native-code-push`](react-native.md)|5.1.0|Android, iOS|2.1.0|
|[`cordova-plugin-code-push`](cordova.md)|1.10.0|Android, iOS|2.1.2|

### Key generation

Code signing supports PEM encoded RSA keys (non-certificates) for signing. You can generate them via openssl as shown below:

```shell
# generate private RSA key and write it to private.pem file
openssl genrsa -out private.pem

# export public key from private.pem into public.pem
openssl rsa -pubout -in private.pem -out public.pem
```

Generated keys example:

```shell
# public key
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4moC3GsqF7YISFMQ0fnU
0rUF2xhxNqSGx9/GTxCynsQhR3hceroDXj3rAOTxnNkePB27uZfRDHrH3/LLoj9V
k2ghKRtfjDwXa85uDK8slSQDB9ZlD1TLQEJDZpKr1OTXY9VwbgtFaotSXoFmG3MO
RQeALCbrAgDxQ5Q2kJn6rfBuBoszfUz1qZqrlrY74Axerv1/UtTjL8uyF5r00Bxj
kvTveC2Pm5A3kq6QANktgfKWy9Ugs/4ykZF7fxfH+ukJW+iXwLACrdfzhegg/41H
5w06m30h0jqhIBZ3nbj5MN+qVbANHJMjz+fXqXx1Ovr1DfGtdKOku/BTWDxojCl1
iwIDAQAB
-----END PUBLIC KEY-----

# private key
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA4moC3GsqF7YISFMQ0fnU0rUF2xhxNqSGx9/GTxCynsQhR3hc
eroDXj3rAOTxnNkePB27uZfRDHrH3/LLoj9Vk2ghKRtfjDwXa85uDK8slSQDB9Zl
D1TLQEJDZpKr1OTXY9VwbgtFaotSXoFmG3MORQeALCbrAgDxQ5Q2kJn6rfBuBosz
fUz1qZqrlrY74Axerv1/UtTjL8uyF5r00BxjkvTveC2Pm5A3kq6QANktgfKWy9Ug
s/4ykZF7fxfH+ukJW+iXwLACrdfzhegg/41H5w06m30h0jqhIBZ3nbj5MN+qVbAN
HJMjz+fXqXx1Ovr1DfGtdKOku/BTWDxojCl1iwIDAQABAoIBAQCdwf/8VS8fFlbv
DfHKXKlNp5RM9Nrtl/XRjro+nQPYXBBUHClT2gg+wiXcmalAAIhwmscSqhWe/G4I
PMRmaHrYGtYALnKE49nt5AgKDoSh5lW2QExqQkrcm08bSVcxH8J0bWPJSVE0y564
+rCKr8BhmLhWC0f0PXPeAoeCeceRKYX2oDgO8A0yZRSQUdRWiXOiQ4mUQ3IPCmBc
gD1JJNZ5kR4O904PZz5pbgyvN2t5BKOgLKq+x+8Pa8Rb21rFZKMHO8W04oKaRiGs
f4xwOBAWDOfzDKJzT5xepcPyycgjxcuvyKB2g8biWnDGGOTxDgqMX+R4XeP1aISC
h9bzfRoBAoGBAPREuPhIXRJOsIgSWAAiC5vhLZ9wWELWG95eibQm2SfpY4F0sPpE
lNQJ4yzC7J4BiApFzs1yxwwRmgpVd+wF9iMb4NSzaiTM7fju/Xv4aGhBqRXEokGF
v3QxIlbAwBqeL0rJAAadjbUTTO/u6sC80LI3bfPrn/z1hupZQGR559gjAoGBAO1J
xQ2ODVS4dSH2P+Ocd9LiUBPGyV97+MFixh6z1c2Fd3bNuiIhCxkrng45Dq0CkX84
nPUvtYxEQZoFvyB7gAm0SVlLHnJwBiq+Mp9g0UXSy6rZbjhiFkQs1W/W+Z2OIDsC
y+uXZT7No/J9VyjdrWzZJaBImO8/E4NONXWn8M95AoGACH97j+e0lTZ3ncRFm3uT
u9CRrcJSz8BzJ8FSORpA48qS06YjohFQvC+734rIgJa9DN5w22Tq19ik60cd7PAo
KACISd4UC0O147ssxmtV9oqSP1ef7XehuYEcGLiL9mEadBeaEKDalToeqxo8wIfR
GuIiySGhZ0ODdhO00coL7tECgYBargddD70udDNnICj4PbJY5928QQpxr/m3RZz6
3LTHDstBnosUQdZw7wc+3jUqjsG1gZgR5wKVMPx09N8+dZPPoZMqSZfAGelxajAE
UkaHTXBBwUfqyilCMnP6gofv2wGcK4xsYvXxEzslDxtA5b5By5Yic7vmKg+17Sxm
4yAW2QKBgDyEUzXq3Rrm7ZT720pPhuQDDSO0eHe1L1MUjTRsJ96GkIl0iqQCVgK8
A/6rFFTEeVf8L6GNMTwdtnDFz/CqIU+K1X4HLXmUY2suffWVxZ4KYqiEszCbyrdO
puayMcrx2unhKQyDYjUvD8GxHyquA+p52KDke2TkKfDxfzv0WOE1
-----END RSA PRIVATE KEY-----
```

### Releasing signed update

To release signed update you should use `--privateKeyPath` (or simply `-k`) option for `release` or `release-react` command.
