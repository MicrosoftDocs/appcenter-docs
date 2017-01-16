# Android Azure

The Android SDK supports API levels 19 through 24 (KitKat through Nougat).

You will need:
* your Mobile Center app secret, which you can find at by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

## Add Azure Android SDK to your app
1. Add this code to the Project level build.gradle file inside the buildscript tag:
```
buildscript {
    repositories {
        jcenter()
    }
}
```

2. Add this code to the Module app level build.gradle file inside the dependencies tag:
```
    compile 'com.microsoft.azure:azure-mobile-android:3.1.0'
```

3. To access Azure, your app must have the INTERNET permission enabled. If it's not already enabled, add the following line of code to your AndroidManifest.xml file:
```
    <uses-permission android:name="android.permission.INTERNET" />
```

4. Create an _MSClient_ in your app to work with Azure features.
```
MobileServiceClient azureMobileClient = new MobileServiceClient(
    "_https://mobile-{app secret}.azurewebsites.net_", this)
```

## Use Azure features in your app
* [Identity]

## Documentation References
* [Javadocs API reference]

[Identity]: /sdk/Android/azure/identity/
[Javadocs API reference]: http://azure.github.io/azure-mobile-apps-android-client/
