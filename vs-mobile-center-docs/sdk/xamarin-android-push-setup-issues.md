1. After adding if you see **java exited with code 2**, it is caused by the Firebase dependency. Xamarin team is tracking an issue where [Xamarin.Android projects hit the multidex limit](https://bugzilla.xamarin.com/show_bug.cgi?id=55117).
    * For debug builds, we recommend enabling **Multi-dex** in build options to work around that issue.
    * For release builds, you can also use multi-dex but it's better to try using **Proguard** first (and if you can, **Link All**). Read more about [linker settings](https://developer.xamarin.com/guides/android/advanced_topics/linking/) and how they work.
2. If your target framework is lower than **7.0**, you need to update it.
   * Target framework has no impact on minimum supported version which remains unchanged (you can still support Android 4.0.3 / API level 15, this setting has nothing to do with it). You can change target version in build settings. The difference between minimum and target API levels is explained in the 
[Xamarin.Android API levels guide]( https://developer.xamarin.com/guides/android/application_fundamentals/understanding_android_api_levels/).
   * After the change, you need to update your **packages.config** and update all **targetFramework** attributes to match the version. For example if in build settings the version is **7.1**, then you need all the lines in **packages.config** to match this: `targetFramework="monoandroid71"`.
3. If you see something like

> java.lang.IllegalStateException: Default FirebaseApp is not initialized in this process {your_package_name}. Make sure to call FirebaseApp.initializeApp(Context) first.

in the logs, and you made sure the **google-services.json** has the **GoogleServicesJson** build action, then **clean** and build again, this is a known issue when reusing builds (this issue is not caused by Mobile Center SDK, you can read more about this issue in the [Xamarin forums](https://forums.xamarin.com/discussion/96263/default-firebaseapp-is-not-initialized-in-this-process)).
