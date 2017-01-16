# React Native

Mobile Center can build React Native apps written in React Native version 0.34 or newer.

To start building a React Native iOS app, you will firstly need to connect to your GitHub account, select a repository and a branch where your app lives and then you can set up your first build. Choose the project's `package.json` that you want to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

# 1. Linking your repository
If you haven't previously connected to your GitHub account, you will firstly need to do that. Once your GitHub account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

# 2. Selecting a branch
Next step once you have selected a GitHub repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

# 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

3.1. **Project** - Select your project’s `package.json`. Mobile Center will automatically detect the shared scheme.

3.2. **XCode version** - Select the XCode version to run the build on.

3.3. **Build triggers** - By default a new build is triggered on every push a developer does to the configured branch. This is often referred as "Continuous Integration". If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

3.4. **Code signing** - A successful build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](../code-signing/uploading-code-signing-files/), along with the password for the certificate. The settings in your Xcode project need to be compatible with the files you are uploading. You can read more about code signing [here](../code-signing) and in the [Apple Developer official documentation](https://developer.apple.com/support/code-signing/).

3.5. **CocoaPods** - Mobile Center scans the selected branch and if it finds a Podfile, it will automatically do a `pod install` step at the beginning of every build. This will ensure that all dependencies are installed.

3.6. **Distribution to a distribution group** - You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be automatically kicked off.

# 4. Build results
After a build has been triggered, it can be in the following states:
* **queued** -  the build is in a queue waiting for resources to be freed up
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

## 4.1. Build logs
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

## 4.2. The app (.ipa)
The .ipa is an iPhone application archive file which stores the iOS app.
* if the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. More details about code signing and distribution with Mobile Center can be found [here](../code-signing).
* if the build has not been signed, the .ipa can be signed by the developer (e.g. locally using xcodesign) or used for other purposes (e.g. upload to TestCloud for UI testing on real devices or run in the simulator)

## 4.3. The symbol files
Upon building a React Native iOS app, a JavaScript source map and one or multiple .dsym files are automatically generated with each build and can be downloaded once the build is completed.
* if you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting beacon requires this .dsym file and the JavaScript sourcemap for a build in order to display human readable (symbolicated) crash reports
* if you have previously integrated another SDK for crash reporting purposes in your app, the corresponding service requires the .dsym file and the JavaScript sourcemap in order to display human readable (symbolicated) crash reports

Keep in mind that the .dsym file does not change upon code signing the .ipa. If you decide to code sign the build later, the .dsym generated before code signing is still valid.

If this app has the crashes SDK integrated, iOS symbols and source maps will automatically be sent to Mobile Center Crashes service to enable human readable (symbolicated) crash reports at both the native and JavaScript stack.
