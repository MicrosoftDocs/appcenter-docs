---
title: App Center Auth for React Native
description: Using Auth in App Center
keywords: sdk, auth
author: jackycodes
ms.author: t-jalu
ms.date: 06/18/2019
ms.topic: article
ms.assetid: ???????????????????????
ms.service: vs-appcenter
ms.custom: sdk, auth
ms.tgt_pltfrm: react-native
dev_langs:
 - javascript
---

# App Center Auth

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)

## Add the SDK to your app

App Center Auth is a cloud-based identity management service that enables developers to authenticate application users and manage user identities. The service integrates with other parts of App Center, enabling developers to leverage user identity to view user data in other services and even send push notifications to users instead of individual devices. App Center Auth is powered by [Azure Active Directory B2C](https://docs.microsoft.com/azure/active-directory-b2c/).

Please follow the [Getting Started](~/sdk/getting-started/react-native.md) section before configuring Auth if you haven't set up the SDK in your app.

### 1. Add the App Center Auth module

Open your terminal and navigate to the root directory of your React Native project. Run the following code to add the Auth SDK to your app:

```bash
npm install appcenter-auth --save-exact
```

### 2. Link the SDK

Link the plugins to the React Native app using the react-native link command:

```bash
react-native link appcenter-auth
```

### 3. Android Specific

Edit the project's `android/app/src/main/java/com/{YourAppName}/MainApplication.java`, so that `AppCenterReactNativeAuthPackage` is the first App Center native package to be instantiated in the `getPackages` method. 

```java
@Override
protected List<ReactPackage> getPackages() {
    return Arrays.asList(
            new AppCenterReactNativeAuthPackage(MainApplication.this), // <-- Load this before other AppCenterReactNative packages
    );
}
```

Open your **AndroidManifest.xml** file and add the following element to your file's `application` tag:

```xml
<activity android:name="com.microsoft.identity.client.BrowserTabActivity">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />

        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />

        <data
            android:host="auth"
            android:scheme="msal{Your App Secret}" />
    </intent-filter>
</activity>
```

Be sure to replace `{Your App Secret}` in the code sample above with [your App Secret](~/dashboard/faq.md):
`android:scheme="msal65dc3680-7325-4000-a0e7-dbd2276eafd1"`.

### 4. iOS Specific

Edit the project's `ios/{YourAppName}/AppDelegate.m`, so that `AppCenterReactNativeAuth` is the first App Center native package to be instantiated in the `didFinishLaunchingWithOptions` method. 

```objectivec
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
[AppCenterReactNativeAuth register];  // <-- Load this before other AppCenterReactNative packages
}
```

> [!NOTE]
> If the App Center Distribute SDK has previously been configured, the `URL types` key will already be present. In this case, add a new entry to the `URL types` key by following the instructions from step 3.

1. In the project's **Info.plist** file, add a new key for **URL types** by clicking the **+** button next to **Information Property List** at the top. If Xcode displays the project's **Info.plist** as source code, refer to the tip below.
2. Change the key type to Array.
3. Add a new entry to the array (`Item 0`) and change the type to Dictionary.
4. Under **Item 0**, add a **Document Role** key and change the value to **Editor**.
5. Under **Item 0**, add a **URL Schemes** key and change the type to Array.
6. Under **URL Schemes** key, add a new entry (**Item 0**).
7. Under **URL Schemes** > **Item 0**, change the value to `msal{APP_SECRET}` and replace `{APP_SECRET}` with [your App Secret](~/dashboard/faq.md): `msal65dc3680-7325-4000-a0e7-dbd2276eafd1`.

> [!TIP]
> If you want to verify that you modified the `Info.plist` correctly, right-click on the file and select **Open as...** > **Source code**. It should contain the following entry with [your actual App Secret](~/dashboard/faq.md) instead of `{APP_SECRET}`: `<string>msal65dc3680-7325-4000-a0e7-dbd2276eafd1</string>`.
> ```xml
> <key>CFBundleURLTypes</key>
> <array>
> 	<dict>
> 		<key>CFBundleTypeRole</key>
> 		<string>Editor</string>
> 		<key>CFBundleURLSchemes</key>
> 		<array>
> 			<string>msal{APP_SECRET}</string>
> 		</array>
> 	</dict>
> </array>
> ```

App Center uses the “com.microsoft.adalcache” keychain access group to support single sign on, by enabling different apps to share keychain items (i.e. user secrets and credentials) with each other. We use this access group to securely share a user secret within a family of apps that rely on the same user secret. This way, logging into one of your apps will automatically grant the same user access to all of the family of apps.

You must add a new keychain group to your project Keychain Sharing Capabilities: `com.microsoft.adalcache`.

To do that, click on the app's target settings, then **Capabilities**, then toggle **Keychain Sharing** on, then add the `com.microsoft.adalcache` entry like in the following screenshot:

![App Center Auth Keychain Capability](images/keychain.png)

## Sign users into the app

App Center provides a `signIn` method that triggers the sign-in policy defined in your Azure AD B2C tenant.

To present the sign-in UI to the user, call the `signIn` method:

```javascript
import Auth from 'appcenter-auth';

async signIn() {
    try {
        const signInResult = await Auth.signIn();
        // Sign-in succeeded
        const { accessToken, accountId, idToken } = signInResult;

    } catch (e) {
        // Do something with sign in failure.
    }
}

signIn();
```

Please note the following:

* The app must be in the foreground before calling `signIn`.
* App Center associates crash reports and handled errors with the signed-in user after sign-in completes successfully.
* If sign-in fails, the crash reports and handled errors are not associated with any user.
* New push notifications targeting the signed-in user are received on the device that the user has signed into.
* Signing in on a device is not retroactive: the user does not receive push notifications that were sent prior to signing in on that device, and past error or crash reports are not updated with the new user information.
* The SDK automatically saves the signed-in users' information so they do not have to sign in to app again.
* If the app calls `signIn` again, the SDK shows the sign-in UI again only if the saved sign-in information expired or was revoked by the authentication server.

## Sign out

To sign out the user and clear all associated authentication tokens, call the `signOut` method:

```javascript
Auth.signOut();
```

## Enable or disable App Center Auth at runtime

As with every other App Center service, the app can disable the Auth service within the app. When disabled, the SDK signs the user out and ignores all other Auth method calls. In particular, `signIn` will not do anything and no UI will be shown while Auth is disabled.

```javascript
Auth.setEnabled(false);
```

To re-enable Auth, use the same API but pass `true` as a parameter.
 
```javascript
Auth.setEnabled(true);
```

The enabled/disabled state is stored by the SDK and does not change when the app restarts.

## Check if App Center Auth is enabled

Check to see if App Center Auth is enabled using the following:

```javascript
Auth.isEnabled();
```