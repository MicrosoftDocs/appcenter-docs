---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 05/10/2018
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# Cloud Build Machines

Each build is run on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.13.4 (17E199) **High Sierra**

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).

## Installed Software

### Language and Runtime

- Java 1.7.0_80
- Java 1.8.0_172
- Java 9.0.4
- Java 10.0.1
- Node.js 6.14.2
- PowerShell 6.0.2
- Python 2.7.10
- Python 3.6.5
- Ruby 2.5.1p57
- .NET Core SDK 1.0.4, 2.0.3
- Go 1.10.2

### Package Management

- Bundler 1.16.1
- Carthage 0.29.0
- CocoaPods 1.5.0
- Homebrew 1.6.3
- NPM 3.10.10
- Yarn 1.6.0
- NuGet 4.3.0.4406
- pip 10.0.1

### Project Management

- Apache Maven 3.5.3
- Gradle 4.7

### Utilities

- curl 7.54.0 (libcurl/7.54.0 LibreSSL/2.0.20 zlib/1.2.11 nghttp2/1.24.0)
- Git 2.17.0
- Git LFS 2.4.0
- GNU Wget 1.19.5
- Subversion (SVN) 1.10.0

### Tools

- fastlane 2.94.0
- App Center CLI 1.0.16
- Azure-CLI 2.0.32

## Xcode

- Xcode 9.3
- Xcode 9.2
- Xcode 9.1
- Xcode 9.0.1
- Xcode 9.0
- Xcode 8.3.3
- Xcode 8.3.2
- Xcode 8.3.1
- Xcode 8.2.1
- Xcode 8.2
- Xcode 8.1
- Xcode 8.0

### Xcode Support Tools

- Nomad CLI 2.7.6
- Nomad CLI IPA 0.14.3
- xcpretty 0.2.8
- xctool 0.3.4

### Installed SDKs
| SDK                       | SDK name    |
|---------------------------|-------------|
| macOS 10.12               | macosx10.12 |
| macOS 10.13               | macosx10.13 |
| iOS 10.0                  | iphoneos10.0 |
| iOS 10.1                  | iphoneos10.1 |
| iOS 10.2                  | iphoneos10.2 |
| iOS 10.3                  | iphoneos10.3 |
| iOS 11.0                  | iphoneos11.0 |
| iOS 11.1                  | iphoneos11.1 |
| iOS 11.2                  | iphoneos11.2 |
| iOS 11.3                  | iphoneos11.3 |
| iOS Simulator 10.0        | iphonesimulator10.0 |
| iOS Simulator 10.1        | iphonesimulator10.1 |
| iOS Simulator 10.2        | iphonesimulator10.2 |
| iOS Simulator 10.3        | iphonesimulator10.3 |
| iOS Simulator 11.0        | iphonesimulator11.0 |
| iOS Simulator 11.1        | iphonesimulator11.1 |
| iOS Simulator 11.2        | iphonesimulator11.2 |
| iOS Simulator 11.3        | iphonesimulator11.3 |
| tvOS 10.0                 | appletvos10.0 |
| tvOS 10.1                 | appletvos10.1 |
| tvOS 10.2                 | appletvos10.2 |
| tvOS 11.0                 | appletvos11.0 |
| tvOS 11.1                 | appletvos11.1 |
| tvOS 11.2                 | appletvos11.2 |
| tvOS 11.3                 | appletvos11.3 |
| tvOS Simulator 10.0       | appletvsimulator10.0 |
| tvOS Simulator 10.1       | appletvsimulator10.1 |
| tvOS Simulator 10.2       | appletvsimulator10.2 |
| tvOS Simulator 11.0       | appletvsimulator11.0 |
| tvOS Simulator 11.1       | appletvsimulator11.1 |
| tvOS Simulator 11.2       | appletvsimulator11.2 |
| tvOS Simulator 11.3       | appletvsimulator11.3 |
| watchOS 3.0               | watchos3.0 |
| watchOS 3.1               | watchos3.1 |
| watchOS 3.2               | watchos3.2 |
| watchOS 4.0               | watchos4.0 |
| watchOS 4.1               | watchos4.1 |
| watchOS 4.2               | watchos4.2 |
| watchOS 4.3               | watchos4.3 |
| watchOS Simulator 3.0     | watchsimulator3.0 |
| watchOS Simulator 3.1     | watchsimulator3.1 |
| watchOS Simulator 3.2     | watchsimulator3.2 |
| watchOS Simulator 4.0     | watchsimulator4.0 |
| watchOS Simulator 4.1     | watchsimulator4.1 |
| watchOS Simulator 4.2     | watchsimulator4.2 |
| watchOS Simulator 4.3     | watchsimulator4.3 |

### Installed Simulators

#### Device Types

- iPhone 4s
- iPhone 5
- iPhone 5s
- iPhone 6
- iPhone 6 Plus
- iPhone 6s
- iPhone 6s Plus
- iPhone 7
- iPhone 7 Plus
- iPhone 8
- iPhone 8 Plus
- iPhone SE
- iPhone X
- iPad 2
- iPad Retina
- iPad Air
- iPad Air 2
- iPad (5th generation)
- iPad Pro (9.7-inch)
- iPad Pro (12.9-inch)
- iPad Pro (12.9-inch) (2nd generation)
- iPad Pro (10.5-inch)
- Apple TV
- Apple TV 4K
- Apple TV 4K (at 1080p)
- Apple Watch - 38mm
- Apple Watch - 42mm
- Apple Watch Series 2 - 38mm
- Apple Watch Series 2 - 42mm
- Apple Watch Series 3 - 38mm
- Apple Watch Series 3 - 42mm

#### Runtimes
| OS      | Version |
|---------|---------|
| iOS 8.4 | 12H141 |
| iOS 9.0 | 13A344 |
| iOS 9.1 | 13B143 |
| iOS 9.2 | 13C75 |
| iOS 9.3 | 13E233 |
| iOS 10.0 | 14A345 |
| iOS 10.1 | 14B72 |
| iOS 10.2 | 14C89 |
| iOS 10.3 | 14E269 |
| iOS 11.1 | 15B87 |
| iOS 11.2 | 15C107 |
| iOS 11.3 | 15E217 |
| tvOS 10.0 | 14T328 |
| tvOS 10.1 | 14U591 |
| tvOS 10.2 | 14W260 |
| tvOS 11.1 | 15J580 |
| tvOS 11.2 | 15K104 |
| tvOS 11.3 | 15L211 |
| watchOS 3.0 | 14S326 |
| watchOS 3.1 | 14S471a |
| watchOS 3.2 | 14V243 |
| watchOS 4.0 | 15R372 |
| watchOS 4.1 | 15R844 |
| watchOS 4.2 | 15S100 |
| watchOS 4.3 | 15T212 |

#### Devices

#### iOS 8.4

- iPhone 4s
- iPhone 5
- iPhone 5s
- iPhone 6
- iPhone 6
- iPad 2
- iPad Retina
- iPad Air

#### iOS 9.0, 9.1, 9.2, 9.3

- iPhone 4s
- iPhone 5
- iPhone 5s
- iPhone 6
- iPhone 6 Plus
- iPhone 6s
- iPhone 6s Plus
- iPad 2
- iPad Retina
- iPad Air
- iPad Air 2

#### iOS 10.0, 10.1, 10.2, 10.3

- iPhone 5
- iPhone 5s
- iPhone 6
- iPhone 6 Plus
- iPhone 6s
- iPhone 6s Plus
- iPhone 7
- iPhone 7 Plus
- iPhone SE
- iPad Air
- iPad Air 2
- iPad Pro (9.7 inch)
- iPad Pro (12.9 inch)

#### iOS 11, 11.1, 11.2, 11.3

- iPhone 5s
- iPhone 6
- iPhone 6 Plus
- iPhone 6s
- iPhone 6s Plus
- iPhone 7
- iPhone 7 Plus
- iPhone SE
- iPhone 8
- iPhone 8 Plus
- iPhone X
- iPad Air
- iPad Air 2
- iPad (5th generation)
- iPad Pro (9.7-inch)
- iPad Pro (12.9-inch)
- iPad Pro (12.9-inch) (2nd generation)
- iPad Pro (10.5-inch)

#### tvOS 10, 10.1, 10.2

- Apple TV 1080p

#### tvOS 11, 11.1, 11.2, 11.3

- Apple TV
- Apple TV 4K
- Apple TV 4K (at 1080p)

#### watchOS 3.0, 3.1, 3.2

- Apple Watch - 38mm
- Apple Watch - 42mm
- Apple Watch Series 2 - 38mm
- Apple Watch Series 2 - 42mm

#### watchOS 4.0, 4.1, 4.2, 4.3

- Apple Watch - 38mm
- Apple Watch - 42mm
- Apple Watch Series 2 - 38mm
- Apple Watch Series 2 - 42mm
- Apple Watch Series 3 - 38mm
- Apple Watch Series 3 - 42mm

### Device Pairs

| Watch                       | Phone          |
|-----------------------------|----------------|
| Apple Watch - 38mm          | iPhone 6s      |
| Apple Watch - 42mm          | iPhone 6s Plus |
| Apple Watch Series 2 - 38mm | iPhone 7       |
| Apple Watch Series 2 - 42mm | iPhone 7 Plus  |
| Apple Watch Series 3 - 38mm | iPhone 8       |
| Apple Watch Series 3 - 42mm | iPhone 8 Plus  |

## Android

### Android SDK Tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 26.1.1          |

### Android SDK Platform-tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 27.0.1 |

### Android SDK Platforms

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| android-15            | Android SDK Platform 15, Revision 5       |
| android-16            | Android SDK Platform 16, Revision 5       |
| android-17            | Android SDK Platform 17, Revision 3       |
| android-18            | Android SDK Platform 18, Revision 3       |
| android-19            | Android SDK Platform 19, Revision 4       |
| android-20            | Android SDK Platform 20, Revision 2       |
| android-21            | Android SDK Platform 21, Revision 2       |
| android-22            | Android SDK Platform 22, Revision 2       |
| android-23            | Android SDK Platform 23, Revision 3       |
| android-24            | Android SDK Platform 24, Revision 2       |
| android-25            | Android SDK Platform 25, Revision 3       |
| android-26            | Android SDK Platform 26, Revision 2       |
| android-27            | Android SDK Platform 27, Revision 1       |

### Android SDK Build-tools

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| build-tools-19.1.0    | Android SDK Build-tools, Revision 19.1.0  |
| build-tools-20.0.0    | Android SDK Build-tools, Revision 20.0.0  |
| build-tools-21.1.2    | Android SDK Build-tools, Revision 21.1.2  |
| build-tools-22.0.1    | Android SDK Build-tools, Revision 22.0.1  |
| build-tools-23.0.1    | Android SDK Build-tools, Revision 23.0.1  |
| build-tools-23.0.2    | Android SDK Build-tools, Revision 23.0.2  |
| build-tools-23.0.3    | Android SDK Build-tools, Revision 23.0.3  |
| build-tools-24.0.0    | Android SDK Build-tools, Revision 24.0.0  |
| build-tools-24.0.1    | Android SDK Build-tools, Revision 24.0.1  |
| build-tools-24.0.2    | Android SDK Build-tools, Revision 24.0.2  |
| build-tools-24.0.3    | Android SDK Build-tools, Revision 24.0.3  |
| build-tools-25.0.0    | Android SDK Build-tools, Revision 25.0.0  |
| build-tools-25.0.1    | Android SDK Build-tools, Revision 25.0.1  |
| build-tools-25.0.2    | Android SDK Build-tools, Revision 25.0.2  |
| build-tools-25.0.3    | Android SDK Build-tools, Revision 25.0.3  |
| build-tools-26.0.0    | Android SDK Build-tools, Revision 26.0.0  |
| build-tools-26.0.1    | Android SDK Build-tools, Revision 26.0.1  |
| build-tools-26.0.2    | Android SDK Build-tools, Revision 26.0.2  |
| build-tools-27.0.0    | Android SDK Build-tools, Revision 27.0.0  |
| build-tools-27.0.1    | Android SDK Build-tools, Revision 27.0.1  |
| build-tools-27.0.2    | Android SDK Build-tools, Revision 27.0.2  |
| build-tools-27.0.3    | Android SDK Build-tools, Revision 27.0.3  |

### Utils

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| cmake                 | 3.6.4111459                               |
| lldb                  | 2.3.3614996                               |
| ndk-bundle            | 16.1.4479499                              |
| ProGuard              | 5.3.3                                     |
| Android Emulator      | 27.1.12                                    |

### Google APIs

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| google_apis-google-21 | Google APIs, Android API 21, revision 1   |
| google_apis-google-22 | Google APIs, Android API 22, revision 1   |
| google_apis-google-23 | Google APIs, Android API 23, revision 1   |
| google_apis-google-24 | Google APIs, Android API 24, revision 1   |

### Extra packages

| Package name                      | Description                              |
|-----------------------------------|------------------------------------------|
| extra-android-m2repository        | Android Support Repository, revision 47  |
| extra-google-google_play_services | Google Play services, revision 48        |
| extra-google-m2repository         | Google Repository, revision 58           |
| Hardware_Accelerated_Execution_Manager | Intel x86 Emulator Accelerator 6.2.1     |

## Xamarin

### Visual Studio for Mac

- 7.4.2.12

### Mono

- 5.8.1
- 5.8.0
- 5.4.1.7
- 5.4.0.201
- 5.2.0.224
- 5.0.1.1
- 4.8.1.0

### Xamarin.iOS SDK

- 11.9.1.24
- 11.8.0.20
- 11.6.1.4
- 11.2.0.11
- 11.0.0.0
- 10.10.0.36
- 10.6.0.10

### Xamarin.Android SDK

- 8.2.0-16
- 8.2.0-15
- 8.1.5-0
- 8.0.0-33
- 7.4.5-1
- 7.3.1-2
- 7.1.0-43

### Xamarin.Mac SDK

- 4.2.1.28
- 4.2.0.20
- 4.0.0.216
- 3.8.0.49
- 3.6.3.3
- 3.4.0.36
- 3.0.0.398

### Unit Test Framework

- NUnit: 3.6.1