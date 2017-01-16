# Xamarin

To start building a Xamarin iOS app, you will firstly need to connect to your GitHub account, select a repository and a branch where your app lives and then you can set up your first build. Choose the solution file and the configuration that you would like to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't previously connected to your GitHub account, you will firstly need to do that. Once your GitHub account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
Next step once you have selected a GitHub repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

## 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

3.1. **Project/solution** - Mobile Center automatically detects the solution files in your repository. Select the `.sln` you would like to build. In your code, make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the solution’s configuration mappings, and for all mappings that target `iPhone` and `iPhoneSimulator`, uncheck all the projects which are targeting other platforms. This will ensure that when the `.sln` is building, it will not attempt to build the other projects.

3.2. **Configuration** - Select the configuration you would like to build with. The configurations are automatically detected depending on the solution picked in the previous step.

3.3. **Xcode Version** - Current version of Xamarin requires Xcode 8.0 or higher.

3.4. **Build triggers** - By default a new build is triggered on every push a developer does to the configured branch. This is often referred as "Continuous Integration". If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

3.5. **Simulator build** - Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

3.6. **Code signing** - A successful device build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](../../code-signing/uploading-files/), along with the password for the certificate. You can read more about code signing and device provisoning of Xamarin iOS apps in the [Xamarin official documentation](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/).

3.7. **Distribution to a distribution group** - You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be automatically kicked off.

## 4. Build results
After a build has been triggered, it can be in the following states:
* **queued** -  the build is in a queue waiting for resources to be freed up
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

### 4.1. Build logs
For a completed build (succeeded or failed), download the logs to understand more about how the build went. Mobile Center povides an archive with the following files:
```
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.ipa or .app)
The .ipa is an iPhone application archive file which stores the iOS app. If the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. More details about code signing and distribution with Mobile Center can be found [here](../../code-signing).

If this is a simulator build, you can run the .app file on a simulator, but you cannot use it on a real device.

### 4.3. The symbol file (.dsym)
Symbol files are only generated for device builds.
The .dsym files contains the debug symbols for the app.
* if you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting beacon requires this .dsym file for a build in order to display human readable (symbolicated) crash reports
* if you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding service requires the .dsym file in order to display human readable (symbolicated) crash reports
