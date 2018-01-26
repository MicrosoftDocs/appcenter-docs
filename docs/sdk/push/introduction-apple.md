## Add App Center Push to your app

### 1. Add the App Center Push module

The App Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

#### Integration via Cocoapods

If you are integrating App Center into your app via Cocoapods, add the following dependency to your podfile and run `pod install`.

```ruby
pod 'AppCenter/Push'
```

#### Integration by copying the binaries into your project

If you wish to manually integrate the module, follow this [documentation link](apple-manual-integration.md).

### 2. Start App Center Push

In order to use App Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

#### 2.1 Add the import for App Center Push

Open your **AppDelegate.m** file  in Objective-C or **AppDelegate.swift** file in Swift and add the following import statements:

```objc
@import AppCenter;
@import AppCenterPush;
```
```swift
import AppCenter
import AppCenterPush
```
