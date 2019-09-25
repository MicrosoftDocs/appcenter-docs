## 3. Add the App Center SDK modules

The App Center SDK can be integrated into your app extension via [Cocoapods](https://cocoapods.org) or by manually adding the binaries to your project.

### 3.1 Integration via Cocoapods

1. Add the following dependencies to your `podfile` to include App Center Crashes into your app extension. This will pull in the following frameworks: **AppCenter** and **AppCenterCrashes**.

```ruby
pod 'AppCenter/Crashes'
```

2. Run `pod install` to install your newly defined pod and open the project's **.xcworkspace**.

> [!NOTE]
> If you see an error like ```[!] Unable to find a specification for `AppCenter` ```
>  while running `pod install`, please run `pod repo update` to get the latest pods from the Cocoapods repository and then run `pod install`.

Now that you've integrated the frameworks in your application extension, it's time to start the SDK and make use of the App Center services.

### 3.2 Integration by copying the binaries into your project
Below are the steps on how to integrate the compiled binaries in your Xcode project to set up App Center Crashes for your app extension.

1. Download the [App Center SDK](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file.

2. Unzip the file and you will see a folder called **AppCenter-SDK-Apple** that contains different frameworks for each App Center service on each platform folder. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules.

3. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries usually reside inside a subdirectory, often called **Vendor**. If the project isn't organized with a subdirectory for libraries, create a **Vendor** subdirectory now.
   * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

4. Open the unzipped **AppCenter-SDK-Apple** folder in Finder and copy the folder into your project's folder at the location where you want it to reside. The folder contains frameworks in subfolders for other platforms that App Center SDK supports, so you might need to delete subfolders that you don't need.

5. Add the SDK frameworks to the project in Xcode:
   * Make sure the Project Navigator is visible (⌘+1).
   * Now drag and drop **AppCenter.framework** and **AppCenterCrashes.framework** from the Finder (in the location from the previous step) into Xcode's Project Navigator. The **AppCenter.framework** is required to start the SDK. If it is not added to the project, the other modules won't work and your app extension won't compile.
   * A dialog will appear, make sure your app extension target is checked. Then click **Finish**.

Now that you've integrated the frameworks in your app extension, it's time to start the SDK and make use of the App Center services.

## 3. Start the SDK

In order to use App Center, you must opt in to the module(s) that you want to use. By default, no modules are started, and you will have to explicitly call each of them when starting the SDK. 

### 3.1 Add the import statements

Insert the following lines in the file containing the app extension's entry point. For example inside the main ViewController file of a Today extension.

```objc
@import AppCenter;
@import AppCenterCrashes;
```
```swift
import AppCenter
import AppCenterCrashes
```

### 3.2 Add the `start:withServices:` method

Insert the following line in the app extension's entry point. For example inside the `viewDidLoad` method of the main ViewController file of a Today extension.

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSCrashes class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSCrashes.self])
```

Currently, only crash reporting is supported for application extensions.

### 3.3 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application extension. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

Great, you are all set to visualize Crashes data on the portal that the SDK collects automatically.