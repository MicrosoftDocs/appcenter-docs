---
title: Environment Variables
description: Using environment variables in your build configurations
keywords: build, pre, post, custom, scripts
author: derpixeldan
ms.author: daadam
ms.date: 10/10/2019
ms.topic: article
ms.assetid: 0d7cfd0a-c317-11e7-abc4-cec278b6b50a
ms.service: mobile-center
ms.custom: build
---

# Environment variables
Environment variables help manage your [build script tasks](~/build/custom/scripts/index.md). You can call pre-defined variables or create your own. 

## Pre-Defined variables

| **General variables**             | **Description**                             |
| --------------------------------- | ------------------------------------------- |
| `APPCENTER_BUILD_ID`              | The unique identifier for the current build |
| `APPCENTER_BRANCH`                | Name of the branch that is being built from |
| `APPCENTER_SOURCE_DIRECTORY`      | Location of the source code on the build machine |
| `APPCENTER_OUTPUT_DIRECTORY`      | Location where the build results are stored in |
| `APPCENTER_TRIGGER`               | What triggered the build, was it `manual` or `continuous` by push |
| <br> **iOS specific**             | |
| `APPCENTER_XCODE_PROJECT`         | Selected Xcode project                      |
| `APPCENTER_XCODE_SCHEME`          | Selected Xcode scheme                       |
| <br> **Android specific**         | |
| `APPCENTER_ANDROID_VARIANT`       | Selected Android variant                    |
| `APPCENTER_ANDROID_MODULE`        | Selected Android module                     |
| <br> **UWP specific**             | |
| `APPCENTER_UWP_SOLUTION`          | Selected solution                           |
| `APPCENTER_UWP_CONFIGURATION`     | Selected configuration                      |
| <br> **Xamarin specific**         | |
| `APPCENTER_XAMARIN_PROJECT`       | Selected project                            |
| `APPCENTER_XAMARIN_CONFIGURATION` | Selected configuration                      |
| <br> **React Native specific**    | |
| `APPCENTER_REACTNATIVE_PACKAGE`   | Selected package                            |

[build-scripts-detected]: ~/build/custom/scripts/images/build-scripts-detected.png "Configuration shows detected build scripts"

## Variables declared in Build Configuration

Custom environment variables allow you to define sensitive information that is required for your build without checking them into your repository. You can create your environment variables in the build configuration and use them in your build. For example, to access an API key, a webhook token, or other secrets.

>[!NOTE]
> 'Platform' is reserved from use as an environment variable.

![The build configuration showing custom environment variables in different states](~/build/custom/variables/images/environment-variables.png "Custom environment variables")

#### Encrypting variables
Values of variables are encrypted by clicking on the lock icon, which obfuscates them in the build configuration & logs. Encrypted values aren't editible once they're saved, but they can be deleted & re-created. 

Non-encrypted values can be encrypted at any time.

## Access the variables
Pre-set environment variables can be consumed during the build process. Depending on the toolset you're using, the syntax is different.

> [!NOTE]
> The correct way to consume environment variables depends on the toolchain used.

## Build scripts

In the [build scripts](~/build/custom/scripts/index.md), you can access the variables with the following syntax depending on whether you're using Bash or Powershell.

- **Bash**

    ```shell
    $ENVIRONMENT_VARIABLE
    ```

- **Powershell**

    ```powershell
    $env:ENVIRONMENT_VARIABLE
    ```

## NuGet.config for Xamarin or UWP

If you're building a Xamarin or UWP app, you might want to connect to a private NuGet feed, which requires authentication. In the `NuGet.config` file, you can consume the variables you've defined. For more details about the usage of credentials in your `NuGet.config` file, read the [reference documentation](https://docs.microsoft.com/en-us/nuget/schema/nuget-config-file#packagesourcecredentials).

```xml
<packageSourceCredentials>
  <MyAuthNuget>
    <add key="Username" value="%USER_VARIABLE%" />
    <add key="ClearTextPassword" value="%PASSWORD_VARIABLE%" />
  </MyAuthNuget>
</packageSourceCredentials>
```

## build.gradle for Android 

For Android apps, you can access your variables in the **build.gradle** config. For more details, please read the [Gradle Tips and Recipes](https://developer.android.com/studio/build/gradle-tips.html#share-custom-fields-and-resource-values-with-your-app-code) documentation.

```java
buildConfigField("String", "API_KEY", "\"${System.env.API_KEY}\"")
```

[environment-variables]: ~/build/custom/variables/images/environment-variables.png "Custom environment variables"
