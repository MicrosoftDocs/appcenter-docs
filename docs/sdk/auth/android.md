---
title: App Center Auth for Android
description: Using Auth in App Center
keywords: sdk, auth
author: amchew
ms.author: achew
ms.date: 05/01/2019
ms.topic: article
ms.assetid: b19b58c4-f662-41bd-8ca3-049ae1e0b90d
ms.service: vs-appcenter
ms.custom: sdk, auth
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

# App Center Auth

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

## Add the SDK to your app

App Center Auth is a cloud-based identity management service that enables developers to authenticate application users and manage user identities. The service integrates with other parts of App Center, enabling developers to leverage the user identity to view user data in other services and even send push notifications to users instead of individual devices. App Center Auth is powered by [Azure Active Directory B2C](https://docs.microsoft.com/azure/active-directory-b2c/).

Please follow the [Getting Started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your app.

### 1. Add the App Center Auth module

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open the app-level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`.

    ```groovy
    dependencies {
       def appCenterSdkVersion = '2.0.0'
       implementation "com.microsoft.appcenter:appcenter-auth:${appCenterSdkVersion}"
    }
    ```

   > [!NOTE]
   > If the version of your Android Gradle plugin is lower than 3.0.0, then you must replace the word **implementation** by **compile**.

2. Click **Sync Project with Gradle Files** in the Android Studio toolbar.

### 2. Start App Center Auth

App Center only uses the specific modules invoked in the app. The app must explicitly call each of them when starting the SDK.

Add the Auth class to the project's `AppCenter.start()` method to start App Center Auth service.

```java
AppCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class, Auth.class);
```
```kotlin
AppCenter.start(application, "{Your App Secret}", Analytics::class.java, Crashes::class.java, Auth::class.java)
```

Make sure you replace `{Your App Secret}` in the code sample above with your App Secret (and remove the curly braces).

Android Studio automatically suggests the required import statement when adding a reference to the `Auth` class to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in the project's activity class:

```java
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.auth.Auth;
```
```kotlin
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.auth.Auth
```

## AndroidManifest.xml

To use the sign-in UI, the app must have the following element to the project's **AndroidManifest.xml** file's `application` tag:

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

Be sure to replace `{Your App Secret}` in the code sample above with [your App Secret](https://docs.microsoft.com/en-us/appcenter/dashboard/faq) (e.g., `msal65dc3680-7325-4000-a0e7-dbd2276eafd1` where `65dc3680-7325-4000-a0e7-dbd2276eafd1` is your app secret).

## Sign users into the app

App Center provides a `signIn` method that triggers the sign-in policy defined in your Azure AD B2C tenant.

To present the sign-in UI to the user, call the `signIn` method:

```java
import com.microsoft.appcenter.auth.Auth;

Auth.signIn().thenAccept(new AppCenterConsumer<SignInResult>() {

    @Override
    public void accept(SignInResult signInResult) {

        if (signInResult.getException() == null) {

            // Sign-in succeeded.
            String accountId = signInResult.getUserInformation().getAccountId();
        } else {

            // Do something with sign in failure.
            Exception signInFailureException = signInResult.getException();
        }
    }
});
```
```kotlin
import com.microsoft.appcenter.auth.Auth

Auth.signIn().thenAccept { signInResult ->
    if (signInResult.exception == null) {

        // Sign-in succeeded.
        val accountId = signInResult.userInformation.accountId
    } else {

        // Do something with sign in failure.
        val signInFailureException = signInResult.exception
    }
}
```

Please note the following:

* The Auth module must be started at the same time as other modules, in a `AppCenter.start` call. If you decide to start the Auth service separately using `AppCenter.startService`, the app will not sign in automatically after the restart and the user will have to call `signIn` again.
* The app must initialize the App Center SDK using `AppCenter.start` before calling `signIn`.
* The app must be in the foreground before calling `signIn`.
* App Center associates crash reports and handled errors with the signed-in user after sign-in completes successfully.
* If sign-in fails, the crash reports and handled errors are not associated with any user.
* New push notifications targeting the signed-in user are received on the device that the user has signed into.
* Signing in on a device is not retroactive: the user does not receive push notifications that were sent prior to signing in on that device, and past error or crash reports are not updated with the new user information.
* The SDK automatically saves the signed-in users' information so they do not have to sign in to app again.
* If the app calls `signIn` again, the SDK shows the sign-in UI again only if the saved sign-in information expired or was revoked by the authentication server.

## Sign out

To sign out the user and clear all associated authentication tokens, call the `signOut` method:

```java
import com.microsoft.appcenter.auth.Auth;

Auth.signOut();
```
```kotlin
import com.microsoft.appcenter.auth.Auth

Auth.signOut()
```

## Enable or disable App Center Auth at runtime

As with every other App Center service, the app can disable the Auth service within the app. When disabled, the SDK signs the user out and ignores all other Auth method calls. In particular, `signIn` will not do anything and no UI will be shown while Auth is disabled.

```java
Auth.setEnabled(false);
```
```kotlin
Auth.setEnabled(false)
```

To re-enable Auth, use the same API but pass `true` as a parameter.
 
```java
Auth.setEnabled(true);
```
```kotlin
Auth.setEnabled(true)
```

The enabled/disabled state is stored by the SDK and does not change when the app restarts.

## Check if App Center Auth is enabled

Check to see if App Center Auth is enabled using the following:

```java
Auth.isEnabled();
```
```kotlin
Auth.isEnabled()
```

[!include[](../android-see-async.md)]
