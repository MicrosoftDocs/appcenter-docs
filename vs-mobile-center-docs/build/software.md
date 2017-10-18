---
title: Mobile Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 10/18/2017
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: mobile-center
ms.custom: build
---

# Cloud Build Machines

Each build is run on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulting from the build (log files, application files, symbol files) are stored on Mobile Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.12.6 (16G29)

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).


## Installed Software

### Language and Runtime

- Java 1.8.0_144
- Node.js v6.11.3
- Powershell v6.0.0-beta.7
- Python 2.7.10
- Ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]

### Package Management

- Bundler 1.15.4
- Carthage 0.25.0
- CocoaPods 1.3.1
- Homebrew 1.3.4
- Homebrew/homebrew-core (git revision 8124; last commit 2017-10-03)
- NPM 3.10.10
- Yarn 1.1.0
### Project Management

- Apache Maven 3.5.0
- Gradle 4.2.1

### Utilities

- curl 7.54.0 (x86_64-apple-darwin16.0) libcurl/7.54.0 SecureTransport zlib/1.2.8
- Git 2.14.2
- Git LFS 2.3.2
- GNU Wget 1.19.1 built on darwin16.6.0

### Tools

- fastlane 2.60.1
- Mobile Center CLI 0.11.0

## Xcode

- Xcode 9.0
- Xcode 8.3.3
- Xcode 8.3.2
- Xcode 8.3.1
- Xcode 8.2.1
- Xcode 8.2
- Xcode 8.1
- Xcode 8.0

### Xcode Support Tools

- Nomad CLI 2.6.13
- Nomad CLI IPA ipa 0.14.3
- xcpretty 0.2.8
- xctool 0.3.3

### Installed SDKs

- macOS 10.12               `-sdk macosx10.12`
- macOS 10.13               `-sdk macosx10.13`
- iOS 10.0                  `-sdk iphoneos10.0`
- iOS 10.1                  `-sdk iphoneos10.1`
- iOS 10.2                  `-sdk iphoneos10.2`
- iOS 10.3                  `-sdk iphoneos10.3`
- iOS 11.0                  `-sdk iphoneos11.0`
- iOS Simulator 10.0        `-sdk iphonesimulator10.0`
- iOS Simulator 10.1        `-sdk iphonesimulator10.1`
- iOS Simulator 10.2        `-sdk iphonesimulator10.2`
- iOS Simulator 10.3        `-sdk iphonesimulator10.3`
- iOS Simulator 11.0        `-sdk iphonesimulator11.0`
- tvOS 10.0                 `-sdk appletvos10.0`
- tvOS 10.1                 `-sdk appletvos10.1`
- tvOS 10.2                 `-sdk appletvos10.2`
- tvOS 11.0                  `-sdk appletvos11.0`
- tvOS Simulator 10.0       `-sdk appletvsimulator10.0`
- tvOS Simulator 10.1       `-sdk appletvsimulator10.1`
- tvOS Simulator 10.2       `-sdk appletvsimulator10.2`
- tvOS Simulator 11.0       `-sdk appletvsimulator11.0`
- watchOS 3.0               `-sdk watchos3.0`
- watchOS 3.1               `-sdk watchos3.1`
- watchOS 3.2               `-sdk watchos3.2`
- watchOS 4.0               `-sdk watchos4.0`
- watchOS Simulator 3.0     `-sdk watchsimulator3.0`
- watchOS Simulator 3.1     `-sdk watchsimulator3.1`
- watchOS Simulator 3.2     `-sdk watchsimulator3.2`
- watchOS Simulator 4.0     `-sdk watchsimulator4.0`

### Installed Simulators

#### Device Types

```
iPhone 4s (com.apple.CoreSimulator.SimDeviceType.iPhone-4s)
iPhone 5 (com.apple.CoreSimulator.SimDeviceType.iPhone-5)
iPhone 5s (com.apple.CoreSimulator.SimDeviceType.iPhone-5s)
iPhone 6 (com.apple.CoreSimulator.SimDeviceType.iPhone-6)
iPhone 6 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6-Plus)
iPhone 6s (com.apple.CoreSimulator.SimDeviceType.iPhone-6s)
iPhone 6s Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-6s-Plus)
iPhone 7 (com.apple.CoreSimulator.SimDeviceType.iPhone-7)
iPhone 7 Plus (com.apple.CoreSimulator.SimDeviceType.iPhone-7-Plus)
iPhone SE (com.apple.CoreSimulator.SimDeviceType.iPhone-SE)
iPhone2017-A (com.apple.CoreSimulator.SimDeviceType.iPhone-8)
iPhone2017-B (com.apple.CoreSimulator.SimDeviceType.iPhone-8-Plus)
iPhone2017-C (com.apple.CoreSimulator.SimDeviceType.iPhone-X)
iPad 2 (com.apple.CoreSimulator.SimDeviceType.iPad-2)
iPad Retina (com.apple.CoreSimulator.SimDeviceType.iPad-Retina)
iPad Air (com.apple.CoreSimulator.SimDeviceType.iPad-Air)
iPad Air 2 (com.apple.CoreSimulator.SimDeviceType.iPad-Air-2)
iPad (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-)
iPad Pro (9.7-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-)
iPad Pro (12.9-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
iPad Pro (12.9-inch) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---2nd-generation-)
iPad Pro (10.5-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--10-5-inch-)
Apple TV (com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p)
Apple TV 4K (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-4K)
Apple TV 4K (at 1080p) (com.apple.CoreSimulator.SimDeviceType.Apple-TV-4K-1080p)
Apple Watch - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm)
Apple Watch - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm)
Apple Watch Series 2 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm)
Apple Watch Series 2 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm)
Watch2017 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-38mm)
Watch2017 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-42mm)
```

#### Runtimes
```
iOS 10.0 (10.0 - 14A345) - com.apple.CoreSimulator.SimRuntime.iOS-10-0
iOS 10.1 (10.1 - 14B72) - com.apple.CoreSimulator.SimRuntime.iOS-10-1
iOS 10.2 (10.2 - 14C89) - com.apple.CoreSimulator.SimRuntime.iOS-10-2
iOS 11.0 (11.0 - 15A372) - com.apple.CoreSimulator.SimRuntime.iOS-11-0
tvOS 11.0 (11.0 - 15J380) - com.apple.CoreSimulator.SimRuntime.tvOS-11-0
watchOS 3.1 (3.1 - 14S471a) - com.apple.CoreSimulator.SimRuntime.watchOS-3-1
watchOS 4.0 (4.0 - 15R372) - com.apple.CoreSimulator.SimRuntime.watchOS-4-0
```

#### Devices

##### iOS 10.0
```
iPhone 5 (EDFECD31-97B8-46A0-9CB6-829BA2F30E2B)
iPhone 5s (04C29F0C-37B3-4641-BE5C-486145D11053)
iPhone 6 (B1CE81EF-2104-4801-876B-FF9059236333)
iPhone 6 Plus (E044DEAB-324C-4B89-B3ED-16A2F30252C2)
iPhone 6s (6F875293-0776-471D-B450-04D2606A19E6)
iPhone 6s Plus (9721B600-D190-4A85-BD2B-82947BAC7FF0)
iPhone SE (B748C75C-22E4-41F4-9BCB-BE81E9682EB6)
iPad Air (1D669D91-043E-46BA-8A9F-4CCD1487675C)
iPad Air 2 (17A4CEAD-BA64-40F9-BA21-72BF1E33C211)
iPad Pro (9.7 inch) (7DE05F49-91DA-4B17-9B43-3BEF8E53BDED)
iPad Pro (12.9 inch) (72ED47C9-AE77-4006-85FE-762B9A23E99C)
```

##### iOS 10.1
```
iPhone 5 (FC10FFE1-A0DA-4149-9708-03740229C979)
iPhone 5s (CC274BFB-BA57-4172-80E6-C62820E723A7)
iPhone 6 (C9361AF6-5640-4FC9-BB99-8A87B17E6E13)
iPhone 6 Plus (37F76819-26DE-42FF-8C5B-6195F2A8A3F6)
iPhone 6s (B96FD656-6852-4370-9EEF-693EDD322CC9)
iPhone 6s Plus (6DBDD63F-F32B-4B2E-B245-6C4A7217D1A2)
iPhone 7 (6E767FBB-F54A-436A-9BCD-F847B3EC818A)
iPhone 7 Plus (988CDD1A-F9BF-49AC-88E8-D2CBA3666890)
iPhone SE (AA1D6F67-2243-4743-9EF4-6F2CADB40B9E)
iPad Air (7CA4CB0A-9FBF-4E11-9EBB-C2EB5E169ED5)
iPad Air 2 (79F8FA88-8F42-4180-89B5-5050F8E25585)
iPad Pro (9.7 inch) (091B2484-2D8E-46F0-82D8-87972ACBADFF)
iPad Pro (12.9 inch) (E3A4374A-BA47-4B71-84E6-39C357E81E0B)
```

##### iOS 10.2
```
iPhone 5 (60780D8B-92CD-4F2F-B046-3B79BBA98F51)
iPhone 5s (AE4401FF-3AB7-4900-9CDC-8B93DBFD9D9C)
iPhone 6 (4C73FFFF-6143-42EB-997F-45A5B1E488BE)
iPhone 6 Plus (E5F4D992-9D6A-4E96-9A2F-C4A619E84346)
iPhone 6s (D7724A69-20EC-4C63-8722-32781EA086C1)
iPhone 6s Plus (B409D075-037F-41A5-A320-8AAB112A1D56)
iPhone 7 (5E61277B-2BED-4786-9F69-C8FA8D5474AD)
iPhone 7 Plus (66CCB1CF-D64A-4550-9B87-25F9D15EF954)
iPhone SE (3E50D8C8-9BDD-422A-8210-19ED0DC8E728)
iPad Air (A6E85790-B0A1-4443-8CE2-2B867A006B0B)
iPad Air 2 (5EAEE1C8-AB26-4094-8A71-4DD8F8245C17)
iPad Pro (9.7 inch) (124A303D-5D5A-4BDA-BBDE-1105A067B336)
iPad Pro (12.9 inch) (529075FF-67E4-4DED-8359-D37834DFA252)
```

##### iOS 11.0
```
iPhone 5s (DF59E33F-D4E4-4526-81A3-627F5DE1EFDE)
iPhone 6 (30E351DF-5DF6-4353-90A7-1AA7AAC79473)
iPhone 6 Plus (25AD4CE0-B8B4-4C59-9A80-93B777BC109A)
iPhone 6s (84E47CC4-BA2F-4B91-A269-1E16B9A947FA)
iPhone 6s Plus (EA9043D7-6890-4E28-9CDE-10878741ECDE)
iPhone 7 (BE3EC04A-7FF0-48CD-A0EA-F62AF9C2155E)
iPhone 7 Plus (5E9700E4-B1CE-430B-A813-E363701DFE6C)
iPhone SE (DC641598-B6B5-41E4-B9CE-159BC14268B4)
iPhone 8 (55D41C6A-401E-494D-9A2C-C9F5D87959FC)
iPhone 8 Plus (E24499CE-8BFA-4E57-BAAA-66D513D4BB2A)
iPhone X (5CA319A8-9C76-4D49-9077-EBF38B1B0F4A)
iPad Air (ACAABD5C-057D-40BD-9FCF-E1A10576A17B)
iPad Air 2 (2AAD5F8E-A3F7-40F4-8ADB-75FEC50C0EA3)
iPad (5th generation) (D57577DF-7CA2-4C0F-81D0-10A8EFA2C4DC)
iPad Pro (9.7-inch) (F7D1C97F-643D-4A18-8A51-258F9DAA842A)
iPad Pro (12.9-inch) (A338BE86-78F0-486C-8668-BBA5F42132CA)
iPad Pro (12.9-inch) (2nd generation) (D8CA4F4D-5E74-448C-B180-1B54947BACC5)
iPad Pro (10.5-inch) (DC5B8FD0-D489-466A-BF0A-A359F5CD90A4)
```

##### tvOS 11.0
```
Apple TV (DBA93686-2FC0-4852-8722-6B8A372EA497)
Apple TV 4K (52C3B57C-BAB0-4F13-963E-D8FB0A4C91E5)
Apple TV 4K (at 1080p) (6AB5B5A8-0688-4912-87C0-79B56B244628)
```

##### watchOS 3.1
```
Apple Watch - 38mm (AD36CFA7-2D2E-421A-A191-87001E272598)
Apple Watch - 42mm (84D0817C-2D42-46AA-B97B-182E81614593)
Apple Watch Series 2 - 38mm (A4854624-FD57-49B8-9996-D295AFC2CCB3)
Apple Watch Series 2 - 42mm (9CA4C236-FCFC-4F95-ACE8-667CB09CCE19)
```

##### watchOS 4.0
```
Apple Watch - 38mm (106EC5A1-4C88-4FAD-92DF-3077F2CF0262)
Apple Watch - 42mm (171EC979-ABDB-47FC-A461-F7E5E3EFDCE2)
Apple Watch Series 2 - 38mm (CE6ED5CD-D3B3-491E-918D-1B4CB1DF32F7)
Apple Watch Series 2 - 42mm (9C5CE248-2B70-4989-B527-0487768FF1C8)
Apple Watch Series 3 - 38mm (188CDB9E-6F12-4E77-B3C4-0FECEEA1F470)
Apple Watch Series 3 - 42mm (2CB4C2C6-1D5A-4271-A267-C27C05DEB39E)
```

### Device Pairs
```
F4ECE8FD-1435-4046-84CF-E572C1CCA7C4 (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (CE6ED5CD-D3B3-491E-918D-1B4CB1DF32F7)
    Phone: iPhone 7 (BE3EC04A-7FF0-48CD-A0EA-F62AF9C2155E)
8FDBB1DE-7992-4184-ADDB-41D4AEDB1779 (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (9C5CE248-2B70-4989-B527-0487768FF1C8)
    Phone: iPhone 7 Plus (5E9700E4-B1CE-430B-A813-E363701DFE6C)
48CA8321-4722-412F-BA00-6597BE455FC8 (active, disconnected)
    Watch: Apple Watch Series 3 - 38mm (188CDB9E-6F12-4E77-B3C4-0FECEEA1F470)
    Phone: iPhone 8 (55D41C6A-401E-494D-9A2C-C9F5D87959FC)
44A7C8FE-9999-4AAA-A1A8-909B877046A1 (active, disconnected)
    Watch: Apple Watch Series 3 - 42mm (2CB4C2C6-1D5A-4271-A267-C27C05DEB39E)
    Phone: iPhone 8 Plus (E24499CE-8BFA-4E57-BAAA-66D513D4BB2A)
```


## Android

### Android SDK tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 26.1.1          |

### Android SDK Platform-tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 26.0.1 |

### Android Platforms

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

### SDK Build tools

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

### Utils

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| cmake;3.6.4111459     | 3.6.4111459                               |
| lldb;2.3              | 2.3.3614996                               |
| ndk-bundle            | 15.2.4203891                              |
| ProGuard              | 5.3.3                                     |

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
| extra-google-google_play_services | Google Play services, revision 44        |
| extra-google-m2repository         | Google Repository, revision 58           |

## Xamarin

- Visual Studio for Mac: 7.1.5.2
- Xamarin.iOS: 11.0.0.0
- Xamarin.Android: 7.4.5-1
- Xamarin.Mac: 3.6.3.3
- Mono Framework MDK: Mono JIT compiler version 5.2.0

### Package Management

- NuGet: 4.1.0

### Unit Test Framework

- NUnit: 3.6.1
