## Add App Center Push to your app

### 1. Add the App Center Push module

The App Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

#### Integration via Cocoapods

If you are integrating App Center into your app via Cocoapods, add the following dependency to your podfile and run `pod install`.

```ruby
pod 'AppCenter/Push'
```

#### Integration via Carthage

1. Add the following dependency to your `Cartfile` to include App Center.

    ```ruby
    # Use the following line to get the latest version of App Center
    github "microsoft/appcenter-sdk-apple"
    ```

    ```ruby
    # Use the following line to get the specific version of App Center
    github "microsoft/appcenter-sdk-apple" ~> X.X.X
    ```

1. Run `carthage update`.
1. Open your application target's **General** settings tab. Drag and drop the **AppCenterPush.framework** file from the **Carthage/Build/iOS** folder to the **Linked Frameworks and Libraries** section in XCode.
1. A dialog will appear, make sure your app target is checked. Then click **Finish**.

#### Integration by copying the binaries into your project

If you wish to manually integrate the module, follow this [documentation link](apple-manual-integration.md).

### 2. Start App Center Push

In order to use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.

#### 2.1 Add the import for App Center Push

Open the project's **AppDelegate.m** file  in Objective-C or **AppDelegate.swift** file in Swift and add the following import statements:

```objc
@import AppCenter;
@import AppCenterPush;
```
```swift
import AppCenter
import AppCenterPush
```
