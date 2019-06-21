---
title: App Center Auth for Android
description: Using Auth in App Center
keywords: sdk, auth
author: amchew
ms.author: achew
ms.date: 06/17/2019
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

App Center Auth is a cloud-based identity management service that enables developers to authenticate application users and manage user identities. The service integrates with other parts of App Center, enabling developers to leverage user identity to view user data in other services and even send push notifications to users instead of individual devices. App Center Auth is powered by [Azure Active Directory B2C](https://docs.microsoft.com/azure/active-directory-b2c/).

Please follow the [Getting Started](~/sdk/getting-started/android.md) section if you haven't set up the SDK in your app.

### 1. Add the App Center Auth module

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open the app-level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`.

    ```groovy
    dependencies {
       def appCenterSdkVersion = '2.1.0'
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

Be sure to replace `{Your App Secret}` in the code sample above with [your App Secret](~/dashboard/faq.md):

```java
AppCenter.start(getApplication(), "65dc3680-7325-4000-a0e7-dbd2276eafd1", Analytics.class, Crashes.class, Auth.class);
```
```kotlin
AppCenter.start(application, "65dc3680-7325-4000-a0e7-dbd2276eafd1", Analytics::class.java, Crashes::class.java, Auth::class.java)
```

Android Studio automatically suggests the required `import` statement when adding a reference to the `Auth` class to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in the project's activity class:

```java
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.auth.Auth;
```
```kotlin
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.auth.Auth
```

## AndroidManifest.xml

To use the sign-in UI, add the following element to the project's **AndroidManifest.xml** file's `application` tag:

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

## Get access token and ID token

When a user signs in to the application, the SDK exposes an ID token and an access token in the returned user information.

The tokens use the [JWT](https://jwt.io/) format.

An ID token represents the user information itself without any permission to call any other services' REST APIs.

The access token contains the same information as the ID token but also contains the scopes of what other services' REST APIs can be called on behalf of the user.

To access the tokens from the sign-in result:

```java
import com.microsoft.appcenter.auth.Auth;

Auth.signIn().thenAccept(new AppCenterConsumer<SignInResult>() {

    @Override
    public void accept(SignInResult signInResult) {

        if (signInResult.getException() == null) {

            // Sign-in succeeded if exception is null.
            // SignInResult is never null, getUserInformation() returns not null when there is no exception.
            // Both getIdToken() / getAccessToken() return non null values.
            String idToken = signInResult.getUserInformation().getIdToken();
            String accessToken = signInResult.getUserInformation().getAccessToken();

            // Do work with either token.
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

        // Sign-in succeeded if exception is null.
        // SignInResult is never null, getUserInformation() returns not null when there is no exception.
        // Both getIdToken() / getAccessToken() return non null values.
        val idToken = signInResult.userInformation.idToken
        val accessToken = signInResult.userInformation.accessToken

        // Do work with either token.
    } else {

        // Do something with sign in failure.
        val signInFailureException = signInResult.exception
    }
}
```

### Decoding tokens

You can decode user profile information such as the display name or the email address from the ID token or the access token. The SDK does not have APIs to directly expose user profile information, but this section will demonstrate how to decode the token.

Before decoding the token to get user profile information, the Azure AD B2C tenant must be configured to include the user profile fields in the tokens. By default, there is only metadata included in the token, and no user profile information.

To configure the list of user profile fields in the tokens, visit the tenant configuration on the Azure portal and select the user flow or custom policy that you've selected in the App Center Auth portal. If you are using a user flow, go to **Application claims** and select the user fields that need to be decoded, then click **Save** as illustrated in the following screenshot:

![Application Claims Settings](images/application-claims.png)

You also need to collect the user profile fields during the sign-up process so that they will be available in the tokens. On the user flow settings, go to **User attributes** and select the user fields, then click **Save** as illustrated in the following screenshot:

![User Attributes Settings](images/user-attributes.png)

If you are using a custom policy instead of a user flow, you can configure the claims as shown in the [XML configuration example](https://docs.microsoft.com/en-us/azure/active-directory-b2c/active-directory-b2c-setup-aad-custom#add-a-claims-provider) in the `OutputClaims` section.

> [!NOTE]
> Adding new user attributes will not update users that signed up before updating the settings.
> For existing users, the new selected fields will thus be missing from the tokens.

Once you have configured the tenant and the application has retrieved the ID token or the access token, you can decode the user profile information. Please see the example code snippets on how to decode the user profile information for **Display name** and **Email Addresses**:

```java
import com.nimbusds.jwt.JWT;
import com.nimbusds.jwt.JWTParser;
import java.text.ParseException;

try {
    String idToken = signInResult.getUserInformation().getIdToken();
    JWT parsedToken = JWTParser.parse(idToken);
    Map<String, Object> claims = parsedToken.getJWTClaimsSet().getClaims();

    // Get display name.
    String displayName = (String) claims.get("name");

    // Get first email.
    net.minidev.json.JSONArray emails = (net.minidev.json.JSONArray) claims.get("emails");
    if (emails != null && !emails.isEmpty()) {
        String firstEmail = emails.get(0).toString();
    }
} catch (ParseException e) {

    /* Handle invalid token here. */
}
```
```kotlin
import com.nimbusds.jwt.JWT
import com.nimbusds.jwt.JWTParser
import java.text.ParseException

try {
    val idToken = signInResult.getUserInformation().getIdToken()
    val parsedToken = JWTParser.parse(idToken)
    val claims = parsedToken.jwtClaimsSet.claims

    // Get display name.
    val displayName = claims["name"] as String?

    // Get first email.
    val emails = claims["emails"] as net.minidev.json.JSONArray?
    if (emails != null && !emails.isEmpty()) {
        val firstEmail = emails[0].toString()
    }
} catch (e: ParseException) {

    /* Handle invalid token here. */
}
```

The third-party classes used in the sample code are already dependencies of the App Center Auth SDK, and are available to use without any extra installation steps.

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
