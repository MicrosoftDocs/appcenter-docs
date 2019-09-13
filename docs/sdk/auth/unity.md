---
title: App Center Auth for Unity
description: Using Auth in App Center
keywords: sdk, auth
author: amchew
ms.author: achew
ms.date: 09/13/2019
ms.topic: article
ms.assetid: ef0461f6-8df5-4c9d-bc4d-38c456d55084
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: unity
---

# App Center Auth

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Unity](unity.md)
> * [Xamarin](xamarin.md)

App Center Auth is a cloud-based identity management service that enables developers to authenticate application users and manage user identities. The service integrates with other parts of App Center, enabling developers to leverage user identity to view user data in other services and even send push notifications to users instead of individual devices. App Center Auth is powered by [Azure Active Directory B2C](https://docs.microsoft.com/azure/active-directory-b2c/).

Please follow the [Getting Started](~/sdk/getting-started/unity.md) section before configuring Auth if you haven't set up the SDK in your app.

>[!NOTE]
>To use the APIs presented below, you must add the following `using` statement to your `.cs` file:
>```csharp
>using Microsoft.AppCenter.Unity.Auth;
>```
>You also must make sure that **Use Auth** is checked in the settings of your App Center game object.

## Sign users into the app

App Center provides a `SignInAsync` method that triggers the sign in policy defined in your Azure AD B2C tenant.
To present the sign-in UI to the user, call the `SignInAsync` method:

```csharp
async void SignIn() 
{
    try 
    {
        // Sign-in succeeded
        var userInformation = await Auth.SignInAsync();
        string accountId = userInformation.AccountId;
    } 
    catch (Exception e) 
    {
        // Do something with sign in failure.
    }
}
```

>[!TIP]
>If you are using .NET 3.5 in Unity, which does not support async/await code, you can refer to (../unity-async.md) to use the async APIs in AppCenter Unity SDK.

Please note the following:

* The app must be in the foreground before calling `SignInAsync`.
* App Center associates crash reports and handled errors with the signed-in user after sign-in completes successfully.
* If sign-in fails, the crash reports and handled errors are not associated with any user.
* New push notifications targeting the signed-in user are received on the device that the user has signed into.
* Signing in on a device is not retroactive: the user does not receive push notifications that were sent to him prior to signing in on that device, and past error or crash reports are not updated with the new user information.
* The SDK automatically saves the signed-in users' information so they do not have to sign in to your app again.
* If the app calls `SignInAsync` again, the SDK shows the sign-in UI again only if the saved sign-in information has expired or has been revoked by the authentication server.

## Get access token and ID token

 When a user signs in to the application, the SDK exposes an ID token and an access token in the returned user information.

 The tokens use the [JWT](https://jwt.io/) format.

 An ID token represents the user information itself without any permission to call any other services' REST APIs.

 The access token contains the same information as the ID token but also contains the scopes of what other services' REST APIs can be called on behalf of the user.

 To access the tokens from the sign-in result: 

```csharp
async void SignInAsync() 
{
    try 
    {
        // Sign-in succeeded, UserInformation is not null.
        UserInformation userInfo = await Auth.SignInAsync();

        // Get tokens. They are not null.
        string accessToken = userInfo.AccessToken;
        string idToken = userInfo.IdToken;

        // Do work with either token.
    } 
    catch (Exception e) 
    {
        // Do something with sign in failure.
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

```csharp
/// <summary>
/// Inner class that contains fields needed from JWT Token
/// </summary>
[System.Serializable]
public class TokenInfo
{
    public string displayName;
    public string[] emails;
}

/// <summary>
/// Handle conversion from raw JWT token to JSON string representation
/// Unity reference of JSON conversion API:
/// https://docs.unity3d.com/ScriptReference/JsonUtility.FromJson.html
/// </summary>
/// <param name="inputText">Raw JWT Token</param>
public static string ConvertJwtToken(string inputText)
{
    // Convert from JWT token to JSON string
    char[] separator = { '.' };
    string[] splitedText = inputText.Split(separator);
    if (splitedText.Length < 2)
    {
        return null;
    }
    string textToDecode = splitedText[1];
    if (textToDecode.Length % 4 != 0)
    {
        int extraChars = 4 - textToDecode.Length % 4;
        textToDecode = String.Concat(textToDecode, new string('=', extraChars));
    }
    byte[] decodedBytes = Convert.FromBase64String(textToDecode);
    string decodedText = Encoding.UTF8.GetString(decodedBytes);
    return decodedText;
}

// In your SignIn method after getting the raw accessToken
try 
{
    string jsonString = ConvertJwtToken(accessToken);

    // Convert JSON string representation to an object
    TokenInfo info = JsonUtility.FromJson<TokenInfo>(jsonString);
    var displayName = info.displayName;
    if (displayName != null)
    {
        // Do something with display name.
    }

    var emails = info.emails;
    if (emails?.Length > 0)
    {
        // Do something with email addresses.
    }
}
catch (ArgumentException)
{
    // Handle error.
}
```

## Sign out

To sign out the user and clear all associated authentication tokens, call the `SignOut` method:

```csharp
Auth.SignOut();
```

## Enable or disable App Center Auth at runtime

As with every other App Center service, the app can disable the Auth service within the app. When disabled, the SDK signs the user out and ignores all other Auth method calls. In particular, `SignInAsync` will not do anything and no UI will be shown while Auth is disabled.

To disable Auth, use the following API, passing `false` as a parameter.

```csharp
Auth.SetEnabledAsync(false);
```

To enable App Center Auth again, use the same API but pass `true` as a parameter.

```csharp
Auth.SetEnabledAsync(true);
```

[!include[](../unity-see-async.md)]

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The enabled/disabled state is stored by the SDK and does not change when the app restarts.

## Check if App Center Auth is enabled

You can also check if App Center Auth is enabled or not.

```csharp
bool isEnabled = await Auth.IsEnabledAsync();
```

> [!NOTE]
> This method must only be used after `Auth` has been started, it will always return `false` before start.
