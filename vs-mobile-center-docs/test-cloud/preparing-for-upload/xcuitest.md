---
title: Preparing XCUITest Tests for Upload
description: How to upload XCUITests to App Center Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 9/25/2017
ms.topic: article
ms.assetid: D39D30B0-B009-4BC5-8BDA-5B0B4A44E57E
ms.service: vs-appcenter
ms.custom: test
---

# Preparing XCUITest Tests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload
to Test Cloud vary depending on the test framework. The section below provides instructions for installing the XCUITest extensions for Test Cloud and preparing your tests for upload.

By default, App Center will take screenshots and label them after each test method has completed. The [**VSMobileCenterExtensions.framework**](https://github.com/xamarinhq/test-cloud-xcuitest-extensions) is a library that allows screenshots to be taken and labelled while the test method is running.
 
## Requirements

The **VSMobileCenterExtensions.framework** requires iOS 9.0 or higher and Xcode 8.3.3 or higher. 

Please file an [issue](https://github.com/xamarinhq/test-cloud-xcuitest-extensions/issues/new) if you have trouble with a newer Xcode/macOS configuration.


### Starting an App with XCode 9.0

When using Xcode 9.0, the application must be launched using the `MCLaunch` API. The following snippet shows how to launch the application using using Objective-C:

```objc
XCUIApplication *app = mc_launch
XCUIApplication *app = mc_launch_app([[XCUIApplication alloc] init]);

XCUIApplication *app = [MCLaunch launch];
XCUIApplication *app = [MCLaunch launchApplication:[[XCUIApplication alloc] init]];
```

This code snippet demonstrates how to start the app in Swift:
 
```swift
let app = MCLaunch.launch();
let app = MCLaunch.launch(XCUIApplication());
``` 


## Adding the VSMobileCenterExtensions to a Xcode Project

There are three ways to link the **VSMobileCenterExtensions.framework** into an iOS app:

1. [Carthage](#carthage) &ndash; Preferred. This is a dependency manager for Cocoa.
2. [Building from Source](#building_from_source) &ndash; Build the extension from source and manually add it to the Xcode project.
3. [CocoaPods](#cocoapods) &ndash; For those who are already using CocoaPods.


### <a name="carthage" /> Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager for Cocoa, and is the preferred  technique for adding **VSMobileCenterExtensions.framework** to an app. This section will cover how to install the extensions using Carthage. 

1. If necessary, install [homebrew](http://brew.sh/) by following the directions on that website.

2. Use homebrew to install Carthage:

    ```shell
    $ brew install carthage
    ```
    
3. Create a `Cartfile` with the following contents:

	```text
	github "xamarinhq/test-cloud-xcuitest-extensions"
	```
	
4. Follow the [official Carthage instructions](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos) for installing frameworks from a Cartfile.


### <a name="building_from_source" /> Building from Source

1. Clone the [**VSMobileCenterExtensions**](https://github.com/xamarinhq/test-cloud-xcuitest-extensions) project.

2. From the root of the **VSMobileCenterExtensions** project folder, build the project by running **make**:
	
	```shell
	$ make
	...
	INFO: Installed Products/framework/VSMobileCenterExtensions.framework
	INFO: Done!
	```

2. Copy **VSMobileCenterExtensions.framework** into your application's project folder.

	![Application project folder](images/project-folder.png)

3. In Xcode, in the **Build Phases** tab of the _UI Test target_ (not the main application target),
add the **VSMobileCenterExtensions.framework** in the **Link Binary With Libraries** phase.

4. In the same tab, add the **VSMobileCenterExtensions.framework** to the **Copy Files** phase.

    It may be necessary to create the **Copy Files** phase if it is not already present. To do so, click the **+** (plus) sign on the top left of the pane:

    ![Add phase](images/add-phase.png)

    Once you have a **Copy Files** phase, click the **+** (plus) button on the bottom left of the phase's pane to add a new file. . Ensure that the destination of this new phase is set to **Frameworks**:

    ![Copy files](images/copy-files.png)

    Click **Add Other...** and navigate to the framework:

    ![Choose frameworks](images/select-frameworks.png)

At this point, the **Build Phases** pane should resemble the following screenshot:

![Build Phases in Xcode](images/build-phases.png)


The **VSMobileCenterExtensions** will now be linked in to the iOS app bundle.


### <a name="cocoapods" /> Cocoapods

[CocoaPods](https://cocoapods.org/) is another dependency manager for Swift and Objective-C app. 

1. Ensure that the `cocoapods` gem is installed:

	```shell
	$ gem install cocoapods
	```

2. Create a `Podfile` in your Xcode project folder with the following:

	```ruby
	use_frameworks! # required for projects with Swift sources
	target 'MyUITestTarget' do pod 'VSMobileCenterExtensions' end
	```

	_MyUITestTarget_ is the name of the target for the XCUITests. To see what the test target is called, run:

	```shell
	$ xcrun xcodebuild -list
	```
	
	A list of available targets for the project will appear in the console output.

3. After the `Podfile` has been created, run

	```shell
	$ pod install
	```
	
	When this command completes, close the Xcode project (if it is still open) and use the **[YOUR_PROJECT_NAME].xcworkspace** for future work.

## Usage

The [VSMobileCenterExtensions project](https://github.com/xamarinhq/test-cloud-xcuitest-extensions) has [examples](https://github.com/xamarinhq/test-cloud-xcuitest-extensions/tree/master/TestApp/Tests/UI) of how to use the extensions:

* **[MCLabelTest.m](https://github.com/xamarinhq/test-cloud-xcuitest-extensions/blob/master/TestApp/Tests/UI/MCLabelTest.m)** &ndash; An example using Objective-C.

* **[MCLabelTest.swift](https://github.com/xamarinhq/test-cloud-xcuitest-extensions/blob/master/TestApp/Tests/UI/MCLabelTest.swift)** &ndash; An example using Swift.

## Preparing Your Application Bundles

In order to run a test in App Center, it is necessary to build the application and XCUITest runner bundles. To do this, run the following command from the root of the application project directory:

```shell
$ rm -rf ddp #remove the derivedDataPath if it exists
$ xcrun xcodebuild build-for-testing -configuration Debug -workspace YOUR_WORKSPACE -sdk iphoneos -scheme YOUR_APPLICATION_SCHEME -derivedDataPath ddp
```
This will build the application and your XCUITest-Runner into a local directory called **Build** (specifically, the bundles are in
**ddp/Build/Products/Debug-iphoneos/**).

**YOUR_WORKSPACE** should point to a **.xcworkspace** file, likely titled **PROJECT_NAME.xcworkspace**. **YOUR_APPLICATION_SCHEME** should be the scheme that was used to build the application, it is usually the name of the application. To list the possible schemes in the workspace run

```
$ xcrun xcodebuild -list
```

For more information about Xcode schemes, see the [Apple Developer Documentation](https://developer.apple.com/library/content/featuredarticles/XcodeConcepts/Concept-Schemes.html).

## Known Issues

### UI Testing Failure

When performing gestures in App Center Test, the following error may occur:

```
UI Testing Failure - Failed to scroll to visible (by AX action) Button
...
Error -25204 performing AXAction 2003
```

Presently, the issue is under investigation and believed to originate in **XCTest.framework**. One possible cause could be that XCUITest is not able to "see" the element in the hierarchy when the gesture is invoked.

A potential workaround is to add scaffolding code similar to the following when attempting a gesture. The code in this example will pause for 5 seconds to ensure that an XCUIElement is visible and in a "hittable" state before performing a `tap` gesture:

**Objective-C**

```objc
- (void)waitAndTap:(XCUIElement *)button {
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"exists == 1 && hittable == 1"];
    [self expectationForPredicate:pred
              evaluatedWithObject:button
                          handler:nil];
    [self waitForExpectationsWithTimeout:5 /*or a larger value if necessary*/ handler:nil];
    [button tap];
}
```

**Swift**

```swift
func waitAndTap(element: XCUIElement) {
    let predicate = NSPredicate(format: "exists == 1 && hittable == 1")
    expectation(for: predicate, evaluatedWith: element)
    waitForExpectations(timeout: 5 /* Or a larger value if necessary */)
    element.tap()
}
```

Note that in App Center Test, this issue appears to only be prevelant on iPhone 7 devices.

### Xcode 8.3 and Swift

When building Swift XCUITests using Xcode 8.3 and newer, you may encounter a build error related to bitcode.  As a workaround, disable bitcode in your XCUITest target. Go to **Build Settings**, search for `ENABLE_BITCODE` and set the value to `NO` for the test target. It is not necessary to change the setting for the App target.

![Enable Bitcode in Xcode](images/enable-bitcode.png)

Once a test suite has been instrumented with the Test Cloud extensions, it can be [uploaded to Test Cloud](~/test-cloud/starting-a-test-run.md).
