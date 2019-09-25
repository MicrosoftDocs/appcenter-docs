---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: nrajpurkar
ms.author: niloferr
ms.date: 9/20/2019
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# App Center Cloud Build Machines

Each build runs on a separate, clean virtual machine (VM), and no other user has access to the VM. Once the build completes, App Center discards the virtual machine, and all files removed. The artifacts resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Image Changes

**App Center now uses the Java Azul OpenJDK**

The following Java versions are available on the VM image: 7, 8, 11, 12. Java versions 9 and 10 were deprecated.

Previously, Microsoft hosted Mac machines ran with pre-installed JDKs overloaded with complex licensing, end-user restrictions, and lack of long-term support. With recent image changes, App Center replaced the JDKs with tested, certified, LTS builds of OpenJDK from Azul Systems.

Java developers can now build and run production Java applications using Azul Systems Zulu Enterprise builds of OpenJDK without incurring additional support costs. This new offering is designed to make Microsoft hosted Java builds and deployments worry-free by incorporating quarterly security updates and bug fixes as well as critical out-of-band updates and patches as needed.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.14.6 (18G95) **Mojave** for builds running Xcode 9.4.1 and higher and also for non-Xcode builds
- OS X 10.13.6 (17G7024) **High Sierra** for builds running Xcode 9.4 and lower

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).

## Installed Software

### Language and Runtime

- java 1.7: OpenJDK Runtime Environment (Zulu 7.31.0.5-CA-macosx) (build 1.7.0_232-b6)
- java 1.8: OpenJDK Runtime Environment (Zulu 8.40.0.25-CA-macosx) (build 1.8.0_222-b10) (default)
- java 11: OpenJDK Runtime Environment (Zulu11.33+15-CA) (build 11.0.4+11-LTS)
- java 12: OpenJDK Runtime Environment (Zulu12.3+11-CA) (build 12.0.2+3)
- PowerShell 6.2.3
- Python 2.7.16
- Python 3.7.4
- Ruby 2.6.4p104
- .NET SDK 1.0.1 1.0.4 1.1.4 1.1.5 1.1.7 1.1.8 1.1.9 1.1.10 1.1.11 1.1.12 1.1.13 2.0.0 2.0.3 2.1.100 2.1.101 2.1.102 2.1.103 2.1.104 2.1.105 2.1.2 2.1.200 2.1.201 2.1.202 2.1.300 2.1.301 2.1.302 2.1.4 2.1.400 2.1.401 2.1.402 2.1.403 2.1.500 2.1.502 2.1.503 2.1.504 2.1.505 2.2.100 2.2.101 2.2.102 2.2.103 2.2.104 2.2.105
- Go 1.13
- Miniconda 4.7.10
- MacOS tool cache Python 2.7.16 3.4.10 3.5.7 3.6.9 3.7.4
- MacOS tool cache Ruby 2.3.8 2.4.6 2.5.5 2.6.3

### Node.js versions
- v6.17.1
- v8.16.1
- v10.16.3
- v12.10.0

### Package Management

- Bundler 2.0.2
- Carthage 0.33.0
- CocoaPods 1.7.5
- Homebrew 2.1.11
- NPM 3.10.10
- Yarn 1.17.3
- NuGet 4.7.0.5148
- Pip 19.1.1 (python 3.7)
- Pip 19.1.1 (python 2.7)

### Project Management

- Apache Maven 3.6.2
- Gradle 5.6.2

### Utilities

- Curl 7.66.0 (x86_64-apple-darwin18.6.0) libcurl/7.66.0 SecureTransport zlib/1.2.11
- Git 2.23.0
- Git LFS 2.8.0
- GNU Wget 1.20.3
- Subversion (SVN) 1.12.2
- GNU parallel 20190822

### Tools

- Fastlane 2.131.0
- App Center CLI 1.2.2
- Azure-CLI 2.0.72

## Xcode

| Version                | Build   |
|------------------------|---------|
| 11.0                   | 11A420a |
| 10.3                   | 10G8    |
| 10.2.1                 | 10E1001 |
| 10.2                   | 10E125  |
| 10.1                   | 10B61   |
| 10.0                   | 10A255  |
| 9.4.1                  | 9F2000  |
| 9.4                    | 9F1027a |
| 9.3.1                  | 9E501   |
| 9.3                    | 9E145   |
| 9.2                    | 9C40b   |
| 9.1                    | 9B55    |
| 9.0.1                  | 9A1004  |
| 9.0                    | 9A235   |
| 8.3.3                  | 8E3004b |

### Xcode Support Tools

- Nomad CLI 3.0.3
- Nomad CLI IPA 0.14.3
- xcpretty 0.3.0
- xctool 0.3.6
- xcversion 2.6.1

### Installed SDKs

| SDK                       | SDK name    |Xcode Version |
|---------------------------|-------------|--------------|
| macOS 10.13               | macosx10.13 | 9.4.1        |
| macOS 10.14               | macosx10.14 | 10.0, 10.1, 10.2, 10.2.1, 10.3 |
| macOS 10.15               | macosx10.15 | 11.0         |
| iOS 11.4                  | iphoneos11.4 | 9.4.1       |
| iOS 12.0                  | iphoneos12.0 | 10.0        |
| iOS 12.1                  | iphoneos12.1 | 10.1        |
| iOS 12.2                  | iphoneos12.2 | 10.2, 10.2.1|
| iOS 12.4                  | iphoneos12.4 | 10.3        |
| iOS 13.0                  | iphoneos13.0 | 11.0        |
| iOS Simulator 11.4        | iphonesimulator11.4 | 9.4.1    |
| iOS Simulator 12.0        | iphonesimulator12.0 | 10.0     |
| iOS Simulator 12.1        | iphonesimulator12.1 | 10.1     |
| iOS Simulator 12.2        | iphonesimulator12.2 | 10.2, 10.2.1 |
| iOS Simulator 12.4        | iphonesimulator12.4 | 10.3     |
| iOS Simulator 13.0        | iphonesimulator13.0 | 11.0     |
| tvOS 11.4                 | appletvos11.4 | 9.4.1          |
| tvOS 12.0                 | appletvos12.0 | 10.0           |
| tvOS 12.1                 | appletvos12.1 | 10.1           |
| tvOS 12.2                 | appletvos12.2 | 10.2, 10.2.1   |
| tvOS 12.4                 | appletvos12.4 | 10.3           |
| tvOS 13.0                 | appletvos13.0 | 11.0           |
| tvOS Simulator 11.4       | appletvsimulator11.4 | 9.4.1   |
| tvOS Simulator 12.0       | appletvsimulator12.0 | 10.0    |
| tvOS Simulator 12.1       | appletvsimulator12.1 | 10.1    |
| tvOS Simulator 12.2       | appletvsimulator12.2 | 10.2, 10.2.1 |
| tvOS Simulator 12.4       | appletvsimulator12.4 | 10.3    |
| tvOS Simulator 13.0       | appletvsimulator13.0 | 11.0    |
| watchOS 4.3               | watchos4.3 | 9.4.1         |
| watchOS 5.0               | watchos5.0 | 10.0          |
| watchOS 5.1               | watchos5.1 | 10.1          |
| watchOS 5.2               | watchos5.2 | 10.2, 10.2.1  |
| watchOS 5.3               | watchos5.3 | 10.3          |
| watchOS 6.0               | watchos6.0 | 11.0          |
| watchOS Simulator 4.3     | watchsimulator4.3 | 9.4.1         |
| watchOS Simulator 5.0     | watchsimulator5.0 | 10.0          |
| watchOS Simulator 5.1     | watchsimulator5.1 | 10.1          |
| watchOS Simulator 5.2     | watchsimulator5.2 | 10.2, 10.2.1  |
| watchOS Simulator 5.3     | watchsimulator5.3 | 10.3          |
| watchOS Simulator 6.0     | watchsimulator6.0 | 11.0          |
| DriverKit 19.0            | driverkit.macosx19.0 | 11.0       |

### Installed Simulators

#### Runtimes

| OS      | Xcode Version                   | Simulators |
|---------|---------------------------------|------------|
| iOS 8.4 (12H141) | 9.4.1, 10.0, 10.1, 10.2, 10.2.1 | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPad 2<br>iPad Retina<br>iPad Air |
| iOS 9.0 (13A344) | 9.4.1, 10.0, 10.1, 10.2, 10.2.1 | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPad 2<br>iPad Retina<br>iPad Air<br>iPad Air 2 |
| iOS 9.1 (13B143)<br>iOS 9.2 (13C75)<br>iOS 9.3 (13E233) | 9.4.1, 10.0, 10.1, 10.2, 10.2.1 | iPhone 4s<br>iPhone 5<br>iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPad 2<br>iPad Retina<br>iPad Air<br>iPad Air 2<br>iPad Pro |
| iOS 10.0 (14A345) | 9.4.1, 10.0, 10.1, 10.2, 10.2.1 | iPhone 5<br>iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone SE<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7 inch)<br>iPad Pro (12.9 inch) |
| iOS 10.1 (14B72)<br>iOS 10.2 (14C89) | 9.4.1, 10.0, 10.1, 10.2, 10.2.1 | iPhone 5<br>iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone 7<br>iPhone 7 Plus<br>iPhone SE<br>iPad Air<br>iPad Air 2<br>iPad Pro (9.7 inch)<br>iPad Pro (12.9 inch) |
| iOS 11.4 (15F79) | 9.4.1 | iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone 7<br>iPhone 7 Plus<br>iPhone SE<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPad Air<br>iPad Air 2<br>iPad (5th generation)<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch) |
| iOS 12.0 (16A5288q) | 10.0 | iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone 7<br>iPhone 7 Plus<br>iPhone SE<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone XR<br>iPhone XS<br>iPhone XS Max<br>iPad Air<br>iPad Air 2<br>iPad (5th generation)<br>iPad Pro (9.7-inch)<br>iPad Pro (10.5-inch)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad (6th generation) |
| iOS 12.1 (16B91) | 10.1 | iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone 7<br>iPhone 7 Plus<br>iPhone SE<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone X<br>iPhone XS<br>iPhone XS Max<br>iPhone XR<br>iPad Air<br>iPad Air 2<br>iPad (5th generation)<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)<br>iPad (6th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation) |
| iOS 12.2 (16E226)<br>iOS 12.4 (16G73) | 10.2, 10.2.1<br>10.3  | iPhone 5s<br>iPhone 6<br>iPhone 6 Plus<br>iPhone 6s<br>iPhone 6s Plus<br>iPhone 7<br>iPhone 7 Plus<br>iPhone SE<br>iPhone 8<br>iPhone 8 Plus<br>iPhone X<br>iPhone X<br>iPhone XS<br>iPhone XS Max<br>iPhone XR<br>iPad Air<br>iPad Air 2<br>iPad Air (3rd generation)<br>iPad mini 2<br>iPad mini 3<br>iPad mini 4<br>iPad mini (5th generation)<br>iPad (5th generation)<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch)<br>iPad Pro (12.9-inch) (2nd generation)<br>iPad Pro (10.5-inch)<br>iPad (6th generation)<br>iPad Pro (11-inch)<br>iPad Pro (12.9-inch) (3rd generation) |
| iOS 13.0 (17A577a) | 11.0          | iPhone 8<br>iPhone 8 Plus<br>iPhone 11<br>iPhone 11 Pro<br>iPhone 11 Pro Max<br>iPad Pro (9.7-inch)<br>iPad Pro (12.9-inch) (3rd generation)<br>iPad Air (3rd generation) |
| tvOS 11.4 (15L576)<br>tvOS 12.0 (16J5283n)<br>tvOS 12.1 (16J602)<br>tvOS 12.2 (16L225)<br>tvOS 12.4 (16M567)<br>tvOS 13.0 (17J559) | 9.4.1<br>10.0<br>10.1<br>10.2, 10.2.1<br>10.3<br>11.0         | Apple TV<br>Apple TV 4K<br>Apple TV 4K (at 1080p) |
| watchOS 4.3 (15T212) | 9.4.1        | Apple Watch 38mm<br>Apple Watch 42mm<br>Apple Watch Series 2 38mm<br>Apple Watch Series 2 42mm<br>Apple Watch Series 3 38mm<br>Apple Watch Series 3 42mm |
| watchOS 5.0 (16R5283q)<br>watchOS 5.1 (16R591)<br>watchOS 5.2 (16T224)<br>watchOS 5.3 (16U567)<br>watchOS 6.0 (17R566) | 10.0<br>10.1<br>10.2, 10.2.1<br>10.3<br>11.0       | Apple Watch Series 2 38mm<br>Apple Watch Series 2 42mm<br>Apple Watch Series 3 38mm<br>Apple Watch Series 3 42mm<br>Apple Watch Series 4 40mm<br>Apple Watch Series 4 44mm |

### Device Pairs

| Watch                       | Phone          |
|-----------------------------|----------------|
| Apple Watch - 38mm          | iPhone 6s      |
| Apple Watch - 42mm          | iPhone 6s Plus |
| Apple Watch Series 2 - 38mm | iPhone 7       |
| Apple Watch Series 2 - 42mm | iPhone 7 Plus  |
| Apple Watch Series 3 - 38mm | iPhone 8       |
| Apple Watch Series 3 - 42mm | iPhone 8 Plus  |
| Apple Watch Series 4 - 40mm | iPhone XS      |
| Apple Watch Series 4 - 44mm | iPhone XS Max  |

## Android

### Android SDK Tools


| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 26.1.1          |

### Android SDK Platform-tools


| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 29.0.4 |

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
| android-28            | Android SDK Platform 28, Revision 6       |
| android-29            | Android SDK Platform 29, Revision 3       |

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
| build-tools-26.0.3    | Android SDK Build-tools, Revision 26.0.3  |
| build-tools-27.0.0    | Android SDK Build-tools, Revision 27.0.0  |
| build-tools-27.0.1    | Android SDK Build-tools, Revision 27.0.1  |
| build-tools-27.0.2    | Android SDK Build-tools, Revision 27.0.2  |
| build-tools-27.0.3    | Android SDK Build-tools, Revision 27.0.3  |
| build-tools-28.0.0    | Android SDK Build-tools, Revision 28.0.0  |
| build-tools-28.0.1    | Android SDK Build-tools, Revision 28.0.1  |
| build-tools-28.0.2    | Android SDK Build-tools, Revision 28.0.2  |
| build-tools-28.0.3    | Android SDK Build-tools, Revision 28.0.3  |
| build-tools-29.0.0    | Android SDK Build-tools, Revision 29.0.0  |
| build-tools-29.0.1    | Android SDK Build-tools, Revision 29.0.1  |
| build-tools-29.0.2    | Android SDK Build-tools, Revision 29.0.2  |

### Utils


| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| cmake                 | 3.6.4111459                               |
| lldb                  | 3.1.4508709                               |
| ndk-bundle            | 18.1.5063045                              |
| ProGuard              | 5.3.3                                     |
| Android Emulator      | 29.1.12                                   |

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
| extras;google;instantapps              | Google Play Instant Development SDK 1.6.0|
| Hardware_Accelerated_Execution_Manager | Intel x86 Emulator Accelerator 7.5.1     |

## Xamarin

### Visual Studio for Mac

- 8.2.6.26

### Mono

- 6.0.0
- 5.18.1
- 5.16.1
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

- 12.14.0.114
- 12.10.0.157
- 12.8.0.2
- 12.6.0.25
- 12.2.1.16
- 12.2.1.11
- 12.0.0.15
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

- 9.4.1.0
- 9.3.0-23
- 9.2.3-0
- 9.1.8-0
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

- 5.16.1.17
- 5.10.0.157
- 5.8.0.0
- 5.6.0.25
- 5.3.1.28
- 5.2.1.16
- 5.2.1.9
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
