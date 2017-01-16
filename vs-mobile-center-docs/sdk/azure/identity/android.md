---
title: Android Azure Identity
description: Setting up Azure Identity for Android
keywords: sdk,azure
author: ysxu
---

# Android Azure Identity

Add Identity to your mobile app with either client flow (recommended) or server flow authentication after [adding Azure Android SDK to your mobile app].

## Client flow

1. Install the provider client SDK by following its instructions:
    * Azure Active Directory: [Integrate Azure AD into an Android App]
    * Facebook: [Facebook SDK for Android - Getting Started]
    * Google: [Google Sign-In for Android - Start integrating]
    * Microsoft Account: [Signing users in to OneDrive (Android)]
    * Twitter: [Fabric for Android - Getting Started]

2. On log in completion with the client SDK, make sure Azure gets the authentication token by adding the following snippets:

Azure Active Directory
```java
val providerToken = new HashMap[String, String](){
    put("access_token", result.getAccessToken())
]
azureMobileClient.login("aad", providerToken, optionalCallback);
```

Facebook
```java
val providerToken = new HashMap[String, String](){
    put("access_token", AccessToken.getCurrentAccessToken().accessToken)
]
azureMobileClient.login("facebook", providerToken, optionalCallback);
```

Google
```java
GoogleSignInAccount acct = result.getSignInAccount();
val providerToken = new HashMap[String, String](){
    put("id_token", acct.getIdToken())
]
azureMobileClient.login("google", providerToken, optionalCallback);
```

Microsoft Acount
```java
val providerToken = new HashMap[String, String](){
    put("authenticationToken", liveClient.getSession().getAuthenticationToken())
]
azureMobileClient.login("microsoftaccount", providerToken, optionalCallback);
```

Twitter
```java
TwitterSession session = Twitter.getSessionManager().getActiveSession();
TwitterAuthToken authToken = session.getAuthToken();
val providerToken = new HashMap[String, String](){
    put("access_token", authToken.token)
]
azureMobileClient.login("twitter", providerToken, optionalCallback);
```

## Server flow

1. Add the server authentication call to your mobile app to authenticate users.

```java
azureMobileClient.login("{provider}", optionalCallback);
```

[adding Azure Android SDK to your mobile app]:/sdk/Android/azure/
[Facebook SDK for Android - Getting Started]: https://developers.facebook.com/docs/android/getting-started
[Fabric for Android - Getting Started]: https://docs.fabric.io/android/twitter/log-in-with-twitter.html
[Google Sign-In for Android - Start integrating]: https://developers.google.com/identity/sign-in/android/start-integrating
[Integrate Azure AD into an Android App]: https://azure.microsoft.com/en-us/documentation/articles/active-directory-devquickstarts-android/
[Signing users in to OneDrive (Android)]: https://msdn.microsoft.com/en-us/library/office/dn631821.aspx
