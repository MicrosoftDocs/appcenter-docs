---
title: Xamarin.UITest and Signing Android Apps
description: Using your Android Keystore to sign your Android App
keywords: appcenter, test, stall
author: king-of-spades
ms.author: kegr
ms.date: 07/24/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Xamarin.UITest and Signing Android Apps
When Xamarin.UITest executes tests with your Android APK, it uses a test server that runs in process with your app to execute the tests. Android won't allow that, unless the test server and your APK are signed with the same Android Keystore. Normally, Xamarin.UITest signs both your APK and the test server with the same debug Keystore and that works.

But, some apps will only work if signed with a specific Android Keystore. Apps that use Google Maps are one example. Also, running locally, if you're connecting to an already installed app you may need to specify the Keystore so that the test server can be signed with the one that matches that APK.

You can specify your Keystore directly or you can specify a Signing Info file that can be used instead. The purpose of the Signing Info file is to avoid exposing your Android Keystore and passwords. 

First we'll examine using your Keystore locally and then in App Center Test. Using you Keystore is the easiest way to start. Once you have that working you may want to go through the extra step of creating and using a Signing Info file. You never specify them both together.

## Android Keystore
### Local
When running locally with Xamarin.UITest to specify an Android Keystore, use the `KeyStore` method on your `ConfigureApp.Android` statement, like this example: 

> ConfigureApp.Android.Keystore(path, spass, kpass, alias).StartApp();

[AndroidAppConfigurator.KeyStore](https://docs.microsoft.com/dotnet/api/Xamarin.UITest.Configuration.AndroidAppConfigurator.KeyStore)

> public AndroidAppConfigurator KeyStore (String path, String storePassword, String keyPassword, String keyAlias)

Configures the keystore that the provided apk file is signed with. A keystore isn't required, but will ensure the apk file is pristine and unchanged. If a keystore is provided, it's used to sign the auxiliary `apks` installed along with the app on the device. If a keystore isn't provided, Xamarin.UITest will generate a keystore and re-sign the apk.

### App Center Test
Question from a user:
> "Hello, I ran Android Xamarin.UITest on App Center Test Cloud. For some reason the device isn't loading Google Maps. Why?"

The problem in this case was that the APK was getting re-signed in App Center Test Cloud with a different Android Keystore. To use the correct Keystore, specify it in the CLI command when submitting your tests. 

Example addition to your CLI [`appcenter` test run command](~/test-cloud/starting-a-test-run.md#submit):
> --store-password mystorepass --key-alias myalias --key-password mykeypass --store-path /Users/myname/test_keystore

All four of these command-line options must be specified to use this approach:

- **--store-password <arg>** - Password to the keystore. Corresponds to the `-storepass` argument in jarsigner.
- **--key-alias <arg>** - Alias to the key in the keystore. Corresponds to the `-alias` argument in jarsigner.
- **--key-password <arg>** - Password to the matching private key in the keystore. Corresponds to the `-keypass` argument in jarsigner.
- **--store-path <arg>** - Path to the keystore file.
    
## Signing Info File
Instead of using Xamarin.UITest to specify an Android Keystore, you can create and specify a signing info file. This has the same effect but doesn't use your Keystore and passwords in the command line. This process requires creating the signing info file.

First, find the test-cloud.exe in your NuGet packages folder for the version of Xamarin.UITest that you're using. It will be in the tools folder under a Xamarin.UITest folder. Then, use it to generate the Signing Info file. If you change the version of Xamarin.UITest you're using, you'll need to generate a new Signing Info file.