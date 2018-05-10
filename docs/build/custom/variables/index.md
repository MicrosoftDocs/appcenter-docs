---
title: Environment Variables
description: 
keywords: build, pre, post, custom, scripts
author: derpixeldan
ms.author: daadam
ms.date: 11/06/2017
ms.topic: article
ms.assetid: 0d7cfd0a-c317-11e7-abc4-cec278b6b50a
ms.service: mobile-center
ms.custom: build
---

# Environment variables
Custom environment variables allow you to define sensitive information that is required for your build without checking them into your repository. Create your environment variables in the build configuration and use them in your build for example to access an API key, a webhook token or other secrets.

The values of variables can be encrypted by clicking on the lock icon so they won't get exposed to the build configuration and appear obfuscated in the build logs. Please keep in mind that you can't view or edit variables with an encrypted value once they're saved, however, you can always delete and re-create them and for those with a non-encrypted value you can still encrypt them at a later time.

![The build configuration showing custom environment variables in different states][environment-variables]

## Access the variables
Environment variables can be consumed during the build process. Depending on the toolsets you're using the syntax is different.

>[!NOTE]
> The correct way to consume environment variables depends on the toolchain used.

## Build scripts
In the [build scripts](~/build/custom/scripts/index.md) you can access the variables with the following syntax depending on whether you're using Bash or Powershell.

- **Bash**

    ```
    $ENVIRONMENT_VARIABLE
    ```

- **Powershell** 

    ```
    $env:ENVIRONMENT_VARIABLE
    ```

## NuGet.config for Xamarin or UWP
If you're building a Xamarin or UWP app, you might want to connect to a private NuGet feed which requires authentication. In the `NuGet.config` you can simply consume the variables you've defined. For more details about the usage of credentials in your `NuGet.config` please read the [reference documentation](https://docs.microsoft.com/en-us/nuget/schema/nuget-config-file#packagesourcecredentials).

```
<packageSourceCredentials>
  <MyAuthNuget>
    <add key="Username" value="$USER_VARIABLE" />
    <add key="ClearTextPassword" value="$PASSWORD_VARIABLE" />
  </MyAuthNuget>
</packageSourceCredentials>
```


## build.gradle for Android 
For Android apps you can access your variables in the `build.gradle` config. For more details please read the [Gradle Tips and Recipes](https://developer.android.com/studio/build/gradle-tips.html#share-custom-fields-and-resource-values-with-your-app-code) documentation.

```
buildConfigField("string", "API_KEY", "${System.env.API_KEY}")
```

[environment-variables]: ~/build/custom/variables/images/environment-variables.png "Custom environment variables"
