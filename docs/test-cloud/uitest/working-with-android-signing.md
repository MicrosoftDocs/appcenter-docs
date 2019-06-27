---
title: Working with Android signing
description: How to sign Android apks with your Android keystore in App Center Test
keywords: test cloud
author: glennwilson
ms.author: v-glenw
ms.date: 01/31/2019
ms.topic: article
ms.assetid: 819e647d-be5c-43ce-afbf-c58e51d52e03
ms.service: vs-appcenter
ms.custom: test
---

# Working with Android signing

When Xamarin.UITest executes tests with your Android APK it uses a test server that runs in process with your app to help facilitate the tests. Android will not allow them to run in the same process unless the test server and your APK are both signed with the same Android keystore. Normally, Xamarin.UITest signs both your APK and the test server with the same debug keystore and that works.

Some apps will only work if signed with a specific Android keystore. Apps that use Google Maps are one example. Also, running locally, if you are connecting to an already installed app you may need to specify a keystore so that the test server can be signed with the one that matches that APK.

You specify a keystore directly or by specifying a *signing information file* that can be used instead. Using a signing information file avoids exposing your Android keystore and passwords on the command line, but achieves the same signing result.

> [!IMPORTANT]
> You only need to use these instructions to specify a keystore or signing information file if your APK requires this for testing purposes. Most Android APKs do not require signing with a particular Android keystore for testing.

The following discussion describes using a keystore locally and using it in App Center Test. Using a keystore is the easiest way to start and may be sufficient for your needs. This guide then describes creating and using a signing information file as an alternative to specifying a keystore. You never use both a keystore and a signing information file together.

## Local tests and Android keystore

When running locally with Xamarin.UITest to specify an Android keystore, use the `KeyStore` method on the `ConfigureApp.Android` statement:

```csharp
ConfigureApp.Android.KeyStore(path, spass, kpass, alias).StartApp();
```

The `KeyStore` method takes these parameters:

```csharp
public AndroidAppConfigurator KeyStore (String path, String storePassword, String keyPassword, String keyAlias)
```

>Configures the keystore that the provided apk file is signed with. A keystore is not required, but will ensure that the apk file is pristine and unchanged. If a keystore is provided, it will be used to sign the auxiliary apks installed along with the app on the device. If a keystore is not provided, Xamarin.UITest will generate a keystore and resign the apk.

For more information, see the [AndroidAppConfigurator.KeyStore API reference](https://developer.xamarin.com/api/member/Xamarin.UITest.Configuration.AndroidAppConfigurator.KeyStore/p/System.String/System.String/System.String/System.String/).

If you are working with an already installed APK and need to use the matching Android keystore, you can use this form of the `ConfigureApp.Android` statement:

```csharp
ConfigureApp.Android.KeyStore(...).InstalledApp(...).StartApp();
```

## App Center Test and Android keystore

*Question from a user:*
"Hello, I ran Android Xamarin.UITest on App Center Test Cloud. For some reason the device is not loading Google Maps. Can you tell me why the map is not loading?"

The problem in this case was that the APK was getting re-signed in App Center Test Cloud with a different Android keystore. To use the correct keystore specify it in the command when submitting your tests.

Example addition to your `appcenter test run uitest ...` command:

`--store-password mystorepass --key-alias myalias --key-password mykeypass --store-path /Users/myname/test_keystore`

All four of these command line arguments must be specified to use this approach.

Required arguments:

`--store-password <arg>` Password to the keystore. Corresponds to the `-storepass` argument in `jarsigner`.

`--key-alias <arg>`  Alias to the key in the keystore. Corresponds to the `-alias` argument in `jarsigner`.

`--key-password <arg>` Password to the matching private key in the keystore. Corresponds to the `-keypass` argument in `jarsigner`.

`--store-path <arg>`  Path to the keystore file.

## Signing information file

The other approach is to create and specify a signing information file. This results in the same signing but does not use your keystore and passwords in the command line. This does require creating the signing information file.

First, find the `test-cloud.exe` in your NuGet packages folder for the version of Xamarin.UITest that you are using. It is in the tools folder under a Xamarin.UITest folder. Then, use it to generate the signing information file. If you change the version of Xamarin.UITest you are using, you will need to generate a new signing information file.

### Generating the signing information file

#### [Visual Studio for Windows](#tab/vswin/)

```shell
test-cloud.exe gen-sign-info <apk-signed> <keystorefile> <keystorepass> <keyalias> <keypass> [--dir <directory>]
```

#### [Visual Studio for Mac](#tab/vsmac/)

```shell
mono test-cloud.exe gen-sign-info <apk-signed> <keystorefile> <keystorepass> <keyalias> <keypass> [--dir <directory>]
```
> [!NOTE]
> Beginning with UITest version 3.0.0, generating the signing information file using test-cloud.exe is not supported (it is only available up through UITest version 2.2.7).

* * *

Required arguments:

`<apk-signed>` Path to the application under test, signed,

`<keystorefile>` Path to the keystore.

`<keystorepass>` Password for keystore.

`<keyalias>`  Alias for key in keystore.

`<keypass>`  Password for private key.

Optional argument:

`--dir <directory>` Destination directory for signing information file. The default is the apk directory.

### Local tests and signing information file

When running locally with Xamarin.UITest to specify a signing information file, use the `SigningInfoFile` method on the `ConfigureApp.Android` statement:

```csharp
ConfigureApp.Android.SigningInfoFile(path).StartApp();
```

The `SigningInfoFile` method takes one parameter:

```csharp
public AndroidAppConfigurator SigningInfoFile (String path)
```

>Configures the signing info file that the test server will be "signed" with. A signing info file is not required, but can be used instead of a keystore for signing the test server. The signing info file can be freely shared without the risk of leaking keying material. The signing info file can be generated using the console tool.

For more information, see the [AndroidAppConfigurator.SigningInfoFile API reference.](https://developer.xamarin.com/api/member/Xamarin.UITest.Configuration.AndroidAppConfigurator.SigningInfoFile/p/System.String/)

### App Center Test and signing information file

To use the signing information file in your App Center Tests, specify it in the command when submitting your tests.

Example addition to your `appcenter test run uitest ...` command:

```shell
--sign-info /Users/myname/test_signinfofile
```

Required argument:

`--sign-info <arg>` Use signing information file for signing the test server.

## Getting help

You can always contact us through [the blue chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). We do not provide 24/7 support, but will reply as soon as we can.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.
