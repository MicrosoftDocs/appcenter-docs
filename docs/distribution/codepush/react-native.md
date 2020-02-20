---
title: Using the React Native SDK with CodePush
description: "How to use to the React Native SDK with CodePush"
keywords: distribution
author: Zakeelm
ms.author: zakeelm
ms.date: 12/12/2019
ms.topic: article
ms.assetid: FF626D21-2A99-457E-B632-AAC354782B54
ms.service: vs-appcenter
ms.custom: distribute
---

# React Native Client SDK

This plugin provides client-side integration for the CodePush service, allowing you to easily add a dynamic update experience to your React Native app(s).

## How does it work?

React Native apps are composed of JavaScript files and any associated [images](https://facebook.github.io/react-native/docs/images.html#content), which are bundled together by the [packager](https://github.com/facebook/metro) and distributed as part of a platform-specific binary (an `.ipa` or `.apk` file). When the app is released, updating either the JavaScript code (for example making bug fixes, adding new features) or image assets, requires you to recompile and redistribute the entire binary, which includes any review time associated with the store(s) to which you are publishing.

The CodePush plugin helps get product improvements in front of your end users instantly, by keeping your JavaScript and images synchronized with updates you release to the CodePush server. This way, your app gets the benefits of an offline mobile experience, as well as the "web-like" agility of side-loading updates as soon as they are available.

In order to ensure that your end users always have a functioning version of your app, the CodePush plugin maintains a copy of the previous update, so that in the event that you accidentally push an update that includes a crash, it can automatically roll back. This way, you can rest assured that your newfound release agility won't result in users becoming blocked before you have a chance to [roll back](./cli.md#rolling-back-updates) on the server.

> [!NOTE]
> Any product changes which touch native code (e.g. modifying your **AppDelegate.m**/**MainActivity.java** file, adding a new plugin) cannot be distributed via CodePush, and therefore, must be updated via the appropriate store(s).*

## Supported React Native platforms

- iOS (7+)
- Android (4.1+)
- Windows (UWP)

We try our best to maintain backwards compatibility of our plugin with previous versions of React Native, but due to the nature of the platform, and the existence of breaking changes between releases, it is possible that you need to use a specific version of the CodePush plugin in order to support the exact version of React Native you are using. The following table outlines which CodePush plugin versions officially support the respective React Native versions:

| React Native version(s) | Supporting CodePush version(s)                       |
|-------------------------|------------------------------------------------------|
| <0.14                   | **Unsupported**                                      |
| v0.14                   | v1.3 *(introduced Android support)*                  |
| v0.15-v0.18             | v1.4-v1.6 *(introduced iOS asset support)*           |
| v0.19-v0.28             | v1.7-v1.17 *(introduced Android asset support)*      |
| v0.29-v0.30             | v1.13-v1.17 *(RN refactored native hosting code)*    |
| v0.31-v0.33             | v1.14.6-v1.17 *(RN refactored native hosting code)*  |
| v0.34-v0.35             | v1.15-v1.17 *(RN refactored native hosting code)*    |
| v0.36-v0.39             | v1.16-v1.17 *(RN refactored resume handler)*         |
| v0.40-v0.42             | v1.17 *(RN refactored iOS header files)*             |
| v0.43-v0.44             | v2.0+ *(RN refactored uimanager dependencies)*       |
| v0.45                   | v3.0+ *(RN refactored instance manager code)*        |
| v0.46                   | v4.0+ *(RN refactored js bundle loader code)*         |
| v0.46-v0.53             | v5.1+ *(RN removed unused registration of JS modules)*|
| v0.54-v0.55             | v5.3+ *(Android Gradle Plugin 3.x integration)*       |
| v0.56-v0.58             | v5.4+ *(RN upgraded versions for Android tools)*      |
| v0.59                   | v5.6+ *(RN refactored js bundle loader code)*         |
| v0.60-v0.61             | v6.0+ *(RN migrated to Autolinking)*                  |

We work hard to respond to new React Native releases, but they do occasionally break us. We will update this chart with each React Native release, so that users can check to see what our official support is.

### Supported Components

When using the React Native assets system (like using the `require("./foo.png")` syntax), the following list represents the set of core components (and props) that support having their referenced images updated via CodePush:

| Component                                       | Prop(s)                                  |
|-------------------------------------------------|------------------------------------------|
| `Image`                                         | `source`   |
| `MapView.Marker` <br />*(Requires [react-native-maps](https://github.com/lelandrichardson/react-native-maps) `>=O.3.2`)* | `image`                             |
| `ProgressViewIOS`                               | `progressImage`, `trackImage`            |
| `TabBarIOS.Item`                                | `icon`, `selectedIcon`                   |
| `ToolbarAndroid` <br />*(React Native 0.21.0+)* | `actions[].icon`, `logo`, `overflowIcon` |

The following list represents the set of components (and props) that don't currently support their assets being updated via CodePush, due to their dependency on static images (like using the `{ uri: "foo" }` syntax):

| Component   | Prop(s)                                                              |
|-------------|----------------------------------------------------------------------|
| `SliderIOS` | `maximumTrackImage`, `minimumTrackImage`, `thumbImage`, `trackImage` |
| `Video`     | `source`                                                             |

We will update this list as new core components are released, which support referencing assets, to ensure users know what exactly they can expect to update using CodePush.

## Store Guideline Compliance

While Google Play and internally distributed apps (for example Enterprise, Fabric, HockeyApp) have no limitations over how to publish updates using CodePush, the iOS App Store and its corresponding guidelines have more precise rules you should be aware of before integrating the solution within your application.

[Apple's Developer Program License Agreement](https://developer.apple.com/programs/information/Apple_Developer_Program_Information_8_12_15.pdf), under paragraph **3.3.2**, fully allowed performing over-the-air updates of JavaScript and assets -  and in its latest version (20170605) [downloadable here](https://developer.apple.com/terms/) this ruling is even broader:

> Interpreted code may be downloaded to an Application but only so long as such code: (a) does not change the primary purpose of the Application by providing features or functionality that are inconsistent with the intended and advertised purpose of the Application as submitted to the App Store, (b) does not create a store or storefront for other code or applications, and (c) does not bypass signing, sandbox, or other security features of the OS.

CodePush allows you to follow these rules in full compliance so long as the update you push does not significantly deviate your product from its original App Store approved intent.

To further remain in compliance with Apple's guidelines we suggest that App Store-distributed apps don't enable the `updateDialog` option when calling `sync`, since in the [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) it is written that:

> Apps must not force users to rate the app, review the app, download other apps, or other similar actions in order to access functionality, content, or use of the app.

This is not necessarily the case for `updateDialog`, since it won't force the user to download the new version, but at least you should be aware of that ruling if you decide to show it.

## Releasing Updates

Once your app has been configured and distributed to your users, and you have made some JS and/or asset changes, it's time to instantly release them! The simplest (and recommended) way to do this is to use the `release-react` command in the CodePush CLI, which will handle bundling your JavaScript and asset files and releasing the update to the CodePush server.

> [!NOTE]
> Before you can start releasing updates, please log into App Center by running the `appcenter login` command.

In it's most basic form, this command only requires one parameter: your owner name + "/" + app name.

```shell
appcenter codepush release-react -a <ownerName>/<appName>

appcenter codepush release-react -a <ownerName>/MyApp-iOS
appcenter codepush release-react -a <ownerName>/MyApp-Android
```

> [!TIP]
> By using the App Center CLI `set-current` function you no longer have to use the -a flag to specify which app a command is directed at.*

The `release-react` command enables such a simple workflow because it provides many sensible defaults (like generating a release bundle, assuming your app's entry file on iOS is either `index.ios.js` or `index.js`). However, all of these defaults can be customized to allow incremental flexibility as necessary, which makes it a good fit for most scenarios.

```shell
# Release a mandatory update with a changelog
appcenter codepush release-react -a <ownerName>/MyApp-iOS  -m --description "Modified the header color"

# Release an update for an app that uses a non-standard entry file name, and also capture
# the sourcemap file generated by react-native bundle
appcenter codepush release-react -a <ownerName>/MyApp-iOS --entry-file MyApp.js --sourcemap-output ../maps/MyApp.map

# Release a dev Android build to just 1/4 of your end users
appcenter codepush release-react -a <ownerName>/MyApp-Android  --rollout 25% --development true

# Release an update that targets users running any 1.1.* binary, as opposed to
# limiting the update to exact version name in the build.gradle file
appcenter codepush release-react -a <ownerName>/MyApp-Android  --target-binary-version "~1.1.0"
```

The CodePush client supports differential updates, so even though you are releasing your JS bundle and assets on every update, your end users will only actually download the files they need. The service handles this automatically so that you can focus on creating awesome apps and we can worry about optimizing end user downloads.

For more details about how the `release-react` command works, as well as the various parameters it exposes, refer to the [CLI docs](./cli.md#releasing-updates-react-native). Additionally, if you would prefer to handle running the `react-native bundle` command yourself, and therefore, want an even more flexible solution than `release-react`, see to the [`release` command](./cli.md#releasing-updates-general) for more details.

If you run into any issues, or have any questions/comments/feedback, you can ping us within the [#code-push](https://discord.gg/0ZcbPKXt5bWxFdFu) channel on Reactiflux, [e-mail us](mailto:codepushfeed@microsoft.com) or see the [troubleshooting](react-native-troubleshooting.md) guide. See also [help and feedback](../../help.md).

## Multi-Deployment Testing

In our [getting started](react-native-get-started.md) docs, we illustrated how to configure the CodePush plugin using a specific deployment key. However, in order to effectively test your releases, it is critical that you leverage the `Staging` and `Production` deployments that we recommend making when you first create your CodePush app (or any custom deployments you may have created). This way, you never release an update to your end users that you haven't been able to validate yourself.

> [!NOTE]
> Our client-side rollback feature can help unblock users after installing a release that resulted in a crash, and server-side rollbacks (i.e. `appcenter codepush rollback`) allow you to prevent additional users from installing a bad release once it's been identified. However, it's obviously better if you can prevent an erroneous update from being broadly released in the first place.

Taking advantage of the `Staging` and `Production` deployments allows you to achieve a workflow like the following (feel free to customize!):

1. Release a CodePush update to your `Staging` deployment using the `appcenter codepush release-react` command (or `appcenter codepush release` if you need more control)

2. Run your staging/beta build of your app, sync the update from the server, and verify it works as expected

3. Promote the tested release from `Staging` to `Production` using the `appcenter codepush promote` command

4. Run your production/release build of your app, sync the update from the server and verify it works as expected

   > [!TIP]
   > If you want to take a more cautious approach, you can even choose to perform a "staged rollout" as part of #3, which allows you to mitigate additional potential risk with the update (like did your testing in #2 touch all possible devices/conditions?) by only making the production update available to a percentage of your users (for example `code-push promote -a <ownerName>/<appName> -s Staging -d Production -r 20%`). Then, after waiting for a reasonable amount of time to see if any crash reports or customer feedback comes in, you can expand it to your entire audience by running `appcenter codepush patch -a <ownerName>/<appName> Production -r 100%`.

You will notice that the above steps refer to a "staging build" and "production build" of your app. If your build process already generates distinct binaries per "environment", then you don't need to read any further, since swapping out CodePush deployment keys is just like handling environment-specific config for any other service your app uses (like Facebook). However, if you are looking for examples on how to setup your build process to accommodate this, then refer to the following sections, depending on the platform(s) your app is targeting.

### Android

The [Android Gradle plugin](https://google.github.io/android-gradle-dsl/current/index.html) allows you to define custom config settings for each "build type" (like debug, release). This mechanism allows you to easily configure your debug builds to use your CodePush staging deployment key and your release builds to use your CodePush production deployment key.

> [!NOTE] 
> As a reminder, you can retrieve these keys by running `code-push deployment ls <APP_NAME> -k` from your terminal.*

To set this up, perform the following steps:

**For React Native >= v0.60**

1. Open the project's app level `build.gradle` file (for example `android/app/build.gradle` in standard React Native projects)

2. Find the `android { buildTypes {} }` section and define `resValue` entries for both your `debug` and `release` build types, which reference your `Staging` and `Production` deployment keys respectively.

    ```groovy
    android {
        ...
        buildTypes {
            debug {
                ...
                // Note: CodePush updates should not be tested in Debug mode as they are overriden by the RN packager. However, because CodePush checks for updates in all modes, we must supply a key.
                resValue "string", "CodePushDeploymentKey", '""'
                ...
            }
            releaseStaging {
                ...
                resValue "string", "CodePushDeploymentKey", '"<INSERT_STAGING_KEY>"'
                // Note: It is a good idea to provide matchingFallbacks for the new buildType you create to prevent build issues
                // Add the following line if not already there
                matchingFallbacks = ['release']
                ...
            }
            release {
                ...
                resValue "string", "CodePushDeploymentKey", '"<INSERT_PRODUCTION_KEY>"'
                ...
            }
        }
        ...
    }
    ```

> [!NOTE]
> Remember to remove the key from `strings.xml` if you are configuring the deployment key in the build process*

> [!NOTE]
> The naming convention for `releaseStaging` is significant due to [this line](https://github.com/facebook/react-native/blob/e083f9a139b3f8c5552528f8f8018529ef3193b9/react.gradle#L79).*


**For React Native v0.29 - v0.59**

1. Open up your `MainApplication.java` file and make the following changes:

    ```java
    @Override
    protected List<ReactPackage> getPackages() {
         return Arrays.<ReactPackage>asList(
             ...
             new CodePush(BuildConfig.CODEPUSH_KEY, MainApplication.this, BuildConfig.DEBUG), // Add/change this line.
             ...
         );
    }
    ```

2. Open your app's `build.gradle` file (for example `android/app/build.gradle` in standard React Native projects)

3. Find the `android { buildTypes {} }` section and define `buildConfigField` entries for both your `debug` and `release` build types, which reference your `Staging` and `Production` deployment keys respectively. If you prefer, you can define the key literals in your `gradle.properties` file, and then reference them here. Either way will work, and it's just a matter of personal preference.

    ```groovy
    android {
        ...
        buildTypes {
            debug {
                ...
                // Note: CodePush updates should not be tested in Debug mode as they are overridden by the RN packager. However, because CodePush checks for updates in all modes, we must supply a key.
                buildConfigField "String", "CODEPUSH_KEY", '""'
                ...
            }

            releaseStaging {
                ...
                buildConfigField "String", "CODEPUSH_KEY", '"<INSERT_STAGING_KEY>"'

                // Note: It is a good idea to provide matchingFallbacks for the new buildType you create to prevent build issues
                // Add the following line if not already there
                matchingFallbacks = ['release']
                ...
            }

            release {
                ...
                buildConfigField "String", "CODEPUSH_KEY", '"<INSERT_PRODUCTION_KEY>"'
                ...
            }
        }
        ...
    }
    ```

   > [!TIP]
   > As a reminder, you can retrieve these keys by running `appcenter codepush deployment list -a <ownerName>/<appName> --displayKeys` from your terminal.

   > [!NOTE]
   > The naming convention for `releaseStaging` is significant due to [this line](https://github.com/facebook/react-native/blob/e083f9a139b3f8c5552528f8f8018529ef3193b9/react.gradle#L79).

3. Pass the deployment key to the `CodePush` constructor via the build config you defined, as opposed to a string literal.

**For React Native v0.19 - v0.28**

Open up your **MainActivity.java** file and make the following changes:

 ```java
 @Override
 protected List<ReactPackage> getPackages() {
     return Arrays.<ReactPackage>asList(
         ...
         new CodePush(BuildConfig.CODEPUSH_KEY, this, BuildConfig.DEBUG), // Add/change this line.
         ...
     );
 }
 ```

> [!NOTE]
> If you gave your build setting a different name in your Gradle file, simply make sure to reflect that in your Java code.

And that's it! Now when you run or build your app, your debug builds will automatically be configured to sync with your `Staging` deployment, and your release builds will be configured to sync with your `Production` deployment.

> [!NOTE]
> By default, the `react-native run-android` command builds and deploys the debug version of your app, so if you want to test out a release/production build, simply run `react-native run-android --variant release. Refer to the [React Native docs](https://facebook.github.io/react-native/docs/signed-apk-android.html#conten) for details about how to configure and create release builds for your Android apps.

If you want to be able to install both debug and release builds simultaneously on the same device (highly recommended!), then you need to ensure that your debug build has a unique identity and icon from your release build. Otherwise, neither the OS or you will be able to differentiate between the two. You can achieve this by performing the following steps:

1. In your **build.gradle** file, specify the [`applicationIdSuffix`](https://google.github.io/android-gradle-dsl/current/com.android.build.gradle.internal.dsl.BuildType.html#com.android.build.gradle.internal.dsl.BuildType:applicationIdSuffix) field for your debug build type, which gives your debug build a unique identity for the OS (like `com.foo` vs. `com.foo.debug`).

    ```groovy
    buildTypes {
        debug {
            applicationIdSuffix ".debug"
        }
    }
    ```

2. Create the `app/src/debug/res` directory structure in your app, which allows overriding resources (like strings, icons, layouts) for your debug builds

3. Create a `values` directory underneath the debug res directory created in #2, and copy the existing `strings.xml` file from the `app/src/main/res/values` directory

4. Open up the new debug `strings.xml` file and change the `<string name="app_name">` element's value to something else (like `foo-debug`). This ensures that your debug build now has a distinct display name, so that you can differentiate it from your release build.

5. Optionally, create "mirrored" directories in the `app/src/debug/res` directory for all of your app's icons that you want to change for your debug build. This part isn't technically critical, but it can make it easier to quickly spot your debug builds on a device if its icon is noticeable different.

And that's it! Refer to [resource merging](https://developer.android.com/studio/write/add-resources.html) for more information on how resource merging works in Android.

### iOS

Xcode allows you to define custom build settings for each "configuration" (like debug, release), which can then be referenced as the value of keys within the **Info.plist** file (like the `CodePushDeploymentKey` setting). This mechanism allows you to easily configure your builds to produce binaries, which are configured to synchronize with different CodePush deployments.

To set this up, perform the following steps:

1. Open up your Xcode project and select your project in the **Project navigator** window

2. Ensure the project node is selected, as opposed to one of your targets

3. Select the **Info** tab

4. Click the **+** button within the **Configurations** section and select **Duplicate "Release" Configuration**

   ![Configuration](./images/rn-ios-8.png)

5. Name the new configuration **Staging** (or whatever you prefer)

6. Select the **Build Settings** tab

7. Go to **Build Location > Per-configuration Build Products Path > Staging** and change **Staging** value from `$(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME)` to `$(BUILD_DIR)/Release$(EFFECTIVE_PLATFORM_NAME)`

   ![BuildFilesPath](./images/rn-ios-9.png)

   > [!NOTE]
   > Due to https://github.com/facebook/react-native/issues/11813, we have to do this step to make it possible to use other configurations than Debug or Release on RN 0.40.0 or higher.

8. Click the **+** button on the toolbar and select **Add User-Defined Setting**

   ![Setting](./images/rn-ios-10.png)

9. Name this new setting something like `CODEPUSH_KEY`, expand it, and specify your **Staging** deployment key for the **Staging** config and your **Production** deployment key for the **Release** config.

    ![Setting Keys](./images/rn-ios-11.png)

    > [!NOTE]
    > As a reminder, you can retrieve these keys by running `appcenter codepush deployment list -a <ownerName>/<appName> --displayKeys` from your terminal.*

10. Open the project's **Info.plist** file and change the value of your `CodePushDeploymentKey` entry to `$(CODEPUSH_KEY)`

    ![Info.plist](./images/rn-ios-12.png)

And that's it! Now when you run or build your app, your staging builds will automatically be configured to sync with your **Staging** deployment, and your release builds will be configured to sync with your **Production** deployment.

> [!NOTE]
> If you encounter the error message `ld: library not found for ...`, please consult [this issue](https://github.com/Microsoft/react-native-code-push/issues/426) for a possible solution.

Additionally, if you want to give them separate names and/or icons, you can modify the `Product Bundle Identifier`, `Product Name`, and `Asset Catalog App Icon Set Name` build settings, which will allow your staging builds to be distinguishable from release builds when installed on the same device.

## Dynamic Deployment Assignment

The above section illustrated how you can leverage multiple CodePush deployments in order to effectively test your updates before broadly releasing them to your end users. However, since that workflow statically embeds the deployment assignment into the actual binary, a staging or production build will only ever sync updates from that deployment. In many cases, this is sufficient, since you only want your team, customers, stakeholders, etc. to sync with your pre-production releases, and therefore, only they need a build that knows how to sync with staging. However, if you want to be able to perform A/B tests, or provide early access of your app to certain users, it can prove very useful to be able to dynamically place specific users (or audiences) into specific deployments at runtime.

In order to achieve this workflow, all you need to do is specify the deployment key you want the current user to synchronize with when calling the `codePush` method. When specified, this key will override the "default" one that was provided in your app's **Info.plist** (iOS) or **MainActivity.java** (Android) files. This allows you to produce a build for staging or production, that is also capable of being dynamically "redirected" as needed.

```javascript
// Imagine that "userProfile" is a prop that this component received
// which includes the deployment key that the current user should use.
codePush.sync({ deploymentKey: userProfile.CODEPUSH_KEY });
```

With that change in place, now it's just a matter of choosing how your app determines the right deployment key for the current user. In practice, there are typically two solutions for this:

1. Expose a user-visible mechanism for changing deployments at any time. For example, your settings page could have a toggle for enabling "beta" access. This model works well if you are not concerned with the privacy of your pre-production updates, and you have power users that may want to opt-in to earlier (and potentially buggy) updates at their own will (like Chrome channels). However, this solution puts the decision in the hands of your users, which doesn't help you perform A/B tests transparently.

2. Annotate the server-side profile of your users with an additional piece of metadata that indicates the deployment they should sync with. By default, your app could just use the binary-embedded key, but after a user has authenticated, your server can choose to "redirect" them to a different deployment, which allows you to incrementally place certain users or groups in different deployments as needed. You could even choose to store the server-response in local storage so that it becomes the new default. How you store the key alongside your user's profiles is entirely up to your authentication solution (for example Auth0, Firebase, custom DB + REST API), but is generally pretty trivial to do.

   > [!NOTE]
   > If needed, you could also implement a hybrid solution that allowed your end-users to toggle between different deployments, while also allowing your server to override that decision. This way, you have a hierarchy of "deployment resolution" that ensures your app has the ability to update itself out-of-the-box, your end users can feel rewarded by getting early access to bits, but you also have the ability to run A/B tests on your users as needed.

Since we recommend using the `Staging` deployment for pre-release testing of your updates (as explained in the previous section), it doesn't necessarily make sense to use it for performing A/B tests on your users, as opposed to allowing early-access (as explained in option #1 above). Therefore, we recommend making full use of custom app deployments, so that you can segment your users however makes sense for your needs. For example, you could create long-term or even one-off deployments, release a variant of your app to it, and then place certain users into it in order to see how they engage.

```javascript
// #1) Create your new deployment to hold releases of a specific app variant
appcenter codepush deployment add -a <ownerName>/<appName> test-variant-one

// #2) Target any new releases at that custom deployment
appcenter codepush release-react -a <ownerName>/<appName> -d test-variant-one
```
> [!NOTE]
> The total user count that is reported in your deployment's "Install Metrics" will take into account users that have "switched" from one deployment to another. For example, if your **Production** deployment currently reports having 1 total user, but you dynamically switch that user to **Staging**, then the **Production** deployment would report 0 total users, while **Staging** would report 1 (the user that just switched). This behavior allows you to accurately track your release adoption, even in the event of using a runtime-based deployment redirection solution.

## Example Apps / Starters

The React Native community has graciously created some awesome open-source apps that can serve as examples for developers that are getting started. The following is a list of OSS React Native apps that are also using CodePush, and can therefore be used to see how others are using the service:

- [F8 App](https://github.com/fbsamples/f8app) - The official conference app for [F8 2016](https://www.fbf8.com/).
- [Feline for Product Hunt](https://github.com/arjunkomath/Feline-for-Product-Hunt) - An Android client for Product Hunt.
- [GeoEncoding](https://github.com/LynxITDigital/GeoEncoding) - An app by Lynx IT Digital, which demonstrates how to use numerous React Native components and modules.
- [Math Facts](https://github.com/Khan/math-facts) - An app by Khan Academy to help memorize math facts more easily.

Additionally, if you're looking to get started with React Native + CodePush, and are looking for an awesome starter kit, you should check out the following:

- [Native Starter Pro](https://strapmobile.com/native-starter-pro/)
- [Pepperoni](http://getpepperoni.com/)

  > [!NOTE]
  > If you've developed a React Native app using CodePush, that is open-source, please let us know. We would love to add it to this list!*

## Continuous Integration / Delivery

In addition to being able to use the CodePush CLI to "manually" release updates, we believe that it's important to create a repeatable and sustainable solution for continuously delivering updates to your app. That way, it's simple enough for you and/or your team to create and maintain the rhythm of performing agile deployments. In order to assist with setting up a CodePush-based CD pipeline, refer to the following integrations with various CI servers:

- [Azure DevOps](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.code-push) - Azure DevOps (formerly known as VSTS) also has extensions for publishing to [HockeyApp](https://marketplace.visualstudio.com/items?itemName=ms.hockeyapp) and the [Google Play](https://github.com/Microsoft/google-play-vsts-extension) store, so it provides a pretty great mobile CD solution in general.*
- [Travis CI](https://github.com/mondora/code-push-travis-cli)

Additionally, if you'd like more details of what a complete mobile CI/CD workflow  can look like, which includes CodePush, check out this [excellent article](https://zeemee.engineering/zeemee-engineering-and-the-quest-for-the-holy-mobile-dev-grail-1310be4953d1#.zfwaxtbco) by the [ZeeMee engineering team](https://zeemee.engineering).

## TypeScript Consumption

This module ships its `*.d.ts` file as part of its NPM package, which allows you to simply `import` it, and receive intellisense in supporting editors (like Visual Studio Code), as well as compile-time type checking if you're using TypeScript. For the most part, this behavior should just work out of the box, however, if you've specified `es6` as the value for either the `target` or `module` [compiler option](https://www.typescriptlang.org/docs/handbook/compiler-options.html) in your [`tsconfig.json`](https://www.typescriptlang.org/docs/handbook/tsconfig-json.html) file, then just make sure that you also set the `moduleResolution` option to `node`. This ensures that the TypeScript compiler will look within the `node_modules` for the type definitions of imported modules. Otherwise, you'll get an error like the following when trying to import the `react-native-code-push` module: `error TS2307: Cannot find module 'react-native-code-push'`.
