---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 10/10/2018
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# Cloud Build Machines

Each build is run on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.13.6 (17G65) **High Sierra**

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).

## Installed Software

### Language and Runtime

- Java 1.7.0_80
- Java 1.8.0_181
- Java 9.0.4
- Java 10.0.2
- Java 11
- Node.js 6.14.4
- Node.js v8.11.3
- PowerShell 6.1.0
- Python 2.7.10
- Python 3.7.0
- Ruby 2.5.1p57
- .NET SDK 1.0.1 1.0.4 1.1.10 1.1.4 1.1.5 1.1.7 1.1.8 1.1.9 2.0.0 2.0.3 2.1.100 2.1.101 2.1.102 2.1.103 2.1.104 2.1.105 2.1.2 2.1.200 2.1.201 2.1.202 2.1.300 2.1.301 2.1.302 2.1.4 2.1.400 2.1.401 2.1.402 2.1.403
- Go 1.11.1
- Miniconda 4.5.11
- MacOS toolcache Python 2.7.15 3.4.8 3.5.5 3.6.5 3.7.0

### Package Management

- Bundler 1.16.1
- Carthage 0.31.0
- CocoaPods 1.5.3
- Homebrew 1.7.6
- NPM 3.10.10
- Yarn 1.10.1
- NuGet 4.7.0.5148
- pip 18.0

### Project Management

- Apache Maven 3.5.4
- Gradle 4.10.2

### Utilities

- curl 7.54.0 (libcurl/7.54.0 LibreSSL/2.0.20 zlib/1.2.11 nghttp2/1.24.0)
- Git 2.19.0
- Git LFS 2.5.2
- GNU Wget 1.19.5
- Subversion (SVN) 1.10.2

### Tools

- fastlane 2.105.2
- App Center CLI 1.1.4
- Azure-CLI 2.0.46

## Xcode

- Xcode 10.1 beta 2 (10O35n)
- Xcode 10 (10A255)
- Xcode 9.4.1
- Xcode 9.4
- Xcode 9.3.1
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
- xcpretty 0.3.0
- xctool 0.3.4

### Installed SDKs

| SDK                       | SDK name    |
|---------------------------|-------------|
| macOS 10.12               | macosx10.12 |
| macOS 10.13               | macosx10.13 |
| macOS 10.14               | macosx10.14 |
| iOS 10.0                  | iphoneos10.0 |
| iOS 10.1                  | iphoneos10.1 |
| iOS 10.2                  | iphoneos10.2 |
| iOS 10.3                  | iphoneos10.3 |
| iOS 11.0                  | iphoneos11.0 |
| iOS 11.1                  | iphoneos11.1 |
| iOS 11.2                  | iphoneos11.2 |
| iOS 11.3                  | iphoneos11.3 |
| iOS 11.4                  | iphoneos11.4 |
| iOS 12.0                 | iphoneos12.0 |
| iOS 12.1                 | iphoneos12.1 |
| iOS Simulator 10.0        | iphonesimulator10.0 |
| iOS Simulator 10.1        | iphonesimulator10.1 |
| iOS Simulator 10.2        | iphonesimulator10.2 |
| iOS Simulator 10.3        | iphonesimulator10.3 |
| iOS Simulator 11.0        | iphonesimulator11.0 |
| iOS Simulator 11.1        | iphonesimulator11.1 |
| iOS Simulator 11.2        | iphonesimulator11.2 |
| iOS Simulator 11.3        | iphonesimulator11.3 |
| iOS Simulator 11.4        | iphonesimulator11.4 |
| iOS Simulator 12.0        | iphonesimulator12.0 |
| iOS Simulator 12.1        | iphonesimulator12.1 |
| tvOS 10.0                 | appletvos10.0 |
| tvOS 10.1                 | appletvos10.1 |
| tvOS 10.2                 | appletvos10.2 |
| tvOS 11.0                 | appletvos11.0 |
| tvOS 11.1                 | appletvos11.1 |
| tvOS 11.2                 | appletvos11.2 |
| tvOS 11.3                 | appletvos11.3 |
| tvOS 11.4                 | appletvos11.4 |
| tvOS 12.0                 | appletvos12.0 |
| tvOS 12.1                 | appletvos12.1 |
| tvOS Simulator 10.0       | appletvsimulator10.0 |
| tvOS Simulator 10.1       | appletvsimulator10.1 |
| tvOS Simulator 10.2       | appletvsimulator10.2 |
| tvOS Simulator 11.0       | appletvsimulator11.0 |
| tvOS Simulator 11.1       | appletvsimulator11.1 |
| tvOS Simulator 11.2       | appletvsimulator11.2 |
| tvOS Simulator 11.3       | appletvsimulator11.3 |
| tvOS Simulator 11.4       | appletvsimulator11.4 |
| tvOS Simulator 12.0       | appletvsimulator12.0 |
| tvOS Simulator 12.1       | appletvsimulator12.1 |
| watchOS 3.0               | watchos3.0 |
| watchOS 3.1               | watchos3.1 |
| watchOS 3.2               | watchos3.2 |
| watchOS 4.0               | watchos4.0 |
| watchOS 4.1               | watchos4.1 |
| watchOS 4.2               | watchos4.2 |
| watchOS 4.3               | watchos4.3 |
| watchOS 5.0               | watchos5.0 |
| watchOS 5.1               | watchos5.1 |
| watchOS Simulator 3.0     | watchsimulator3.0 |
| watchOS Simulator 3.1     | watchsimulator3.1 |
| watchOS Simulator 3.2     | watchsimulator3.2 |
| watchOS Simulator 4.0     | watchsimulator4.0 |
| watchOS Simulator 4.1     | watchsimulator4.1 |
| watchOS Simulator 4.2     | watchsimulator4.2 |
| watchOS Simulator 4.3     | watchsimulator4.3 |
| watchOS Simulator 5.0     | watchsimulator5.0 |
| watchOS Simulator 5.1     | watchsimulator5.1 |

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
- iPad (6th generation)
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
| iOS 11.4 | 15F79 |
| iOS 12.0 | 16A5288q |
| tvOS 10.0 | 14T328 |
| tvOS 10.1 | 14U591 |
| tvOS 10.2 | 14W260 |
| tvOS 11.1 | 15J580 |
| tvOS 11.2 | 15K104 |
| tvOS 11.3 | 15L211 |
| tvOS 11.4 | 15L576 |
| tvOS 12.0 | 16J5283n |
| watchOS 3.0 | 14S326 |
| watchOS 3.1 | 14S471a |
| watchOS 3.2 | 14V243 |
| watchOS 4.0 | 15R372 |
| watchOS 4.1 | 15R844 |
| watchOS 4.2 | 15S100 |
| watchOS 4.3 | 15T212 |
| watchOS 5.0 | 16R5283q |

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

#### iOS 11, 11.1, 11.2, 11.3, 11.4

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

#### iOS 12.0

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
- iPad (6th generation)

#### tvOS 10, 10.1, 10.2

- Apple TV 1080p

#### tvOS 11, 11.1, 11.2, 11.3, 11.4, 12.0

- Apple TV
- Apple TV 4K
- Apple TV 4K (at 1080p)

#### watchOS 3.0, 3.1, 3.2

- Apple Watch - 38mm
- Apple Watch - 42mm
- Apple Watch Series 2 - 38mm
- Apple Watch Series 2 - 42mm

#### watchOS 4.0, 4.1, 4.2, 4.3, 5.0

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
| platform-tools        | Android SDK Platform-tools, revision 28.0.1 |

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
| android-27            | Android SDK Platform 27, Revision 3       |
| android-28            | Android SDK Platform 28, Revision 1       |

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
| build-tools-25.0.3    | Android SDK Build-tools, Revision 25.0.3  |
| build-tools-26.0.0    | Android SDK Build-tools, Revision 26.0.0  |
| build-tools-26.0.1    | Android SDK Build-tools, Revision 26.0.1  |
| build-tools-26.0.2    | Android SDK Build-tools, Revision 26.0.2  |
| build-tools-27.0.0    | Android SDK Build-tools, Revision 27.0.0  |
| build-tools-27.0.1    | Android SDK Build-tools, Revision 27.0.1  |
| build-tools-27.0.2    | Android SDK Build-tools, Revision 27.0.2  |
| build-tools-27.0.3    | Android SDK Build-tools, Revision 27.0.3  |
| build-tools-28.0.0    | Android SDK Build-tools, Revision 28.0.0  |
| build-tools-28.0.1    | Android SDK Build-tools, Revision 28.0.1  |
| build-tools-28.0.2    | Android SDK Build-tools, Revision 28.0.2  |
| build-tools-28.0.3    | Android SDK Build-tools, Revision 28.0.3  |

### Utils


| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| cmake                 | 3.6.4111459                               |
| lldb                  | 2.3.3614996                               |
| ndk-bundle            | 18.0.5002713                              |
| ProGuard              | 5.3.3                                     |
| Android Emulator      | 27.2.9                                    |

### Google APIs


| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| google_apis-google-21 | Google APIs, Android API 21, revision 1   |
| google_apis-google-22 | Google APIs, Android API 22, revision 1   |
| google_apis-google-23 | Google APIs, Android API 23, revision 1   |
| google_apis-google-24 | Google APIs, Android API 24, revision 1   |

### Extra packages


| Package name                           | Description                              |
|----------------------------------------|------------------------------------------|
| extra-android-m2repository             | Android Support Repository, revision 47  |
| extra-google-google_play_services      | Google Play services, revision 49        |
| extra-google-m2repository              | Google Repository, revision 58           |
| extras;google;instantapps              | Google Play Instant Development SDK 1.5.0|
| Hardware_Accelerated_Execution_Manager | Intel x86 Emulator Accelerator 7.3.0     |

## Xamarin

### Visual Studio for Mac

- 7.6.6.17

### Mono

- 5.12.0
- 5.10.1
- 5.8.1
- 5.8.0
- 5.4.1.7
- 5.4.0.201
- 5.2.0.224
- 5.0.1.1
- 4.8.1.0

### Xamarin.iOS SDK

- 12.0.0.15
- 11.99.3.538
- 11.14.0.13
- 11.12.0.4
- 11.9.1.24
- 11.8.0.20
- 11.6.1.4
- 11.2.0.11
- 11.0.0.0
- 10.10.0.36
- 10.6.0.10

### Xamarin.Android SDK

- 9.0.0-20
- 9.0.0-18
- 8.3.3-2
- 8.2.0-16
- 8.2.0-15
- 8.1.5-0
- 8.0.0-33
- 7.4.5-1
- 7.3.1-2
- 7.1.0-43

### Xamarin.Mac SDK

- 4.99.3.658
- 4.6.0.13
- 4.4.1.193
- 4.2.1.28
- 4.2.0.20
- 4.0.0.216
- 3.8.0.49
- 3.6.3.3
- 3.4.0.36
- 3.0.0.398

### Unit Test Framework

- NUnit: 3.6.1
