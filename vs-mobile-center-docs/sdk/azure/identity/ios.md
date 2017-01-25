---
title: Android Azure Identity
description: Setting up Azure Identity for Android
keywords: sdk,azure
author: ysxu
ms.author: yuaxu
ms.date: 01/20/17
ms.topic: article
ms.assetid: dba12fcc-2c06-4a21-bfc1-58dfee74c7d1
ms.service: mobile-center
---

# iOS Azure Identity

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)

Add Identity to your mobile app with either client flow (recommended) or server flow authentication after [adding Azure iOS SDK to your mobile app].

## Client flow

1. Install the provider client SDK by following its instructions:
    * Azure Active Directory: [Integrate Azure AD into an iOS App]
    * Facebook: [Facebook SDK for iOS - Getting Started]
    * Google: [Google Sign-In for iOS - Start integrating]
    * Microsoft Account: [Signing users in to OneDrive (iOS)]
    * Twitter: [Fabric for iOS - Getting Started]

2. On log in completion with the client SDK, make sure Azure gets the authentication token by adding the following snippets:

### for Swift:

Azure Active Directory
```swift
let payload: [String: String] = ["access_token": result.tokenCacheStoreItem.accessToken]
azureMobileClient.loginWithProvider("aad", token: payload, completion: completion)
```

Facebook
```swift
let payload: [String: String] = ["access_token": result.token.tokenString]
azureMobileClient.loginWithProvider("facebook", token: payload, completion: completion)
```

Google
```swift
let payload: [String: String] = ["id_token": user.authentication.idToken, "authorization_code": user.serverAuthCode]
azureMobileClient.loginWithProvider("google", token: payload, completion: completion)
```

Microsoft Acount
```swift
let payload: [String: String] = ["authenticationToken": self.liveClient.session.authenticationToken]
azureMobileClient.loginWithProvider("microsoftaccount", token: payload, completion: completion)
```

Twitter
```swift
let payload: [String: String] = ["access_token": session!.authToken, "access_token_secret": session!.authTokenSecret]
azureMobileClient.loginWithProvider("twitter", token: payload, completion: completion)
```

### for Objective-C:

Azure Active Directory
```obj-c
NSDictionary *payload = @{
    @"access_token" : result.tokenCacheStoreItem.accessToken
};
[azureMobileClient loginWithProvider:@"aad" token:payload completion:completion];
```

Facebook
```obj-c
NSDictionary *payload = @{@"access_token":result.token.tokenString};
[azureMobileClient loginWithProvider:@"facebook" token:payload completion:completion];
```

Google
```obj-c
NSDictionary *payload = @{
    @"id_token":user.authentication.idToken,
    @"authorization_code":user.serverAuthCode
};
[azureMobileClient loginWithProvider:@"google" token:payload completion:completion];
```

Microsoft Acount
```obj-c
[azureMobileClient loginWithProvider:@"microsoftaccount" token:@{@"authenticationToken" : self.liveClient.session.authenticationToken} completion:completion];
```

Twitter
```obj-c
NSDictionary *payload = @{
    @"access_token":session.authToken,
    @"access_token_secret":session.authTokenSecret
};
[azureMobileClient loginWithProvider:@"twitter" token:payload completion:completion];
```

## Server flow

1. Add the server authentication call to your mobile app to authenticate users.

### for Swift:
```swift
azureMobileClient.loginWithProvider("{provider}", controller: {nonnull UIViewController}, animated: {BOOL}, completion: completion)
```

### for Objective-C:
```obj-c
[azureMobileClient loginWithProvider:@"{provider}" controller:{nonnull UIViewController} animated:{BOOL} completion:completion];
```

[adding Azure iOS SDK to your mobile app]:/sdk/iOS/azure/
[Facebook SDK for iOS - Getting Started]: https://developers.facebook.com/docs/ios/getting-started
[Fabric for iOS - Getting Started]: https://docs.fabric.io/ios/fabric/getting-started.html
[Google Sign-In for iOS - Start integrating]: https://developers.google.com/identity/sign-in/ios/start-integrating
[Integrate Azure AD into an iOS App]: https://azure.microsoft.com/en-us/documentation/articles/active-directory-devquickstarts-ios/#em1-determine-what-your-redirect-uri-will-be-for-iosem
[Signing users in to OneDrive (iOS)]: https://msdn.microsoft.com/en-us/library/office/dn631822.aspx
