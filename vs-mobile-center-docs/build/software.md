---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 10/25/2017
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: vs-appcenter
ms.custom: build
---

# Cloud Build Machines

Each build is run on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulting from the build (log files, application files, symbol files) are stored on App Center servers.

## Operating System

Builds for iOS and Android apps (including Xamarin and React Native platforms) are run on macOS VMs running the following configuration:

- OS X 10.12.6 (16G29)

Builds for UWP apps are run on [Hosted Windows Agents](https://www.visualstudio.com/en-us/docs/build/concepts/agents/hosted).


## Installed Software

### Language and Runtime
- Java 1.8.0_144
- Node.js v6.11.4
- Powershell v6.0.0-beta.8
- Python 2.7.10
- Ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]

### Package Management

- Bundler 1.15.4
- Carthage 0.26.2
- CocoaPods 1.3.1
- Homebrew 1.3.5
- Homebrew/homebrew-core (git revision e9f6; last commit 2017-10-17)
- NPM 3.10.10
- Yarn 1.2.1
### Project Management

- Apache Maven 3.5.0
- Gradle 4.2.1

### Utilities

- curl 7.54.0 (x86_64-apple-darwin16.0) libcurl/7.54.0 SecureTransport zlib/1.2.8
- Git 2.14.2
- Git LFS 2.3.3 
- GNU Wget 1.19.1 built on darwin16.6.0

### Tools

- fastlane 2.62.0
- App Center CLI 0.11.0

## Xcode

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
iOS 8.4 (8.4 - 12H141) - com.apple.CoreSimulator.SimRuntime.iOS-8-4
iOS 9.0 (9.0 - 13A344) - com.apple.CoreSimulator.SimRuntime.iOS-9-0
iOS 9.1 (9.1 - 13B143) - com.apple.CoreSimulator.SimRuntime.iOS-9-1
iOS 9.2 (9.2 - 13C75) - com.apple.CoreSimulator.SimRuntime.iOS-9-2
iOS 9.3 (9.3 - 13E233) - com.apple.CoreSimulator.SimRuntime.iOS-9-3
iOS 10.0 (10.0 - 14A345) - com.apple.CoreSimulator.SimRuntime.iOS-10-0
iOS 10.1 (10.1 - 14B72) - com.apple.CoreSimulator.SimRuntime.iOS-10-1
iOS 10.2 (10.2 - 14C89) - com.apple.CoreSimulator.SimRuntime.iOS-10-2
iOS 11.0 (11.0 - 15A372) - com.apple.CoreSimulator.SimRuntime.iOS-11-0
tvOS 11.0 (11.0 - 15J380) - com.apple.CoreSimulator.SimRuntime.tvOS-11-0
watchOS 4.0 (4.0 - 15R372) - com.apple.CoreSimulator.SimRuntime.watchOS-4-0
```

#### Devices

#### iOS 8.4 
```
iPhone 4s (AD0B53F4-8A1A-46D5-B938-419C46EE8F25) 
iPhone 5 (C39D4C6B-A55F-448D-982B-A3A9AE2FEE30) 
iPhone 5s (D6165038-9AEA-4EC9-8B79-4CD9F04A7C5C)
iPhone 6 (6CCB472E-B2A9-4E66-85F6-89688DF3B622) 
iPhone 6 Plus (B6330144-11FE-4C84-97A6-C3B413D3169E)
iPad 2 (39007BA8-3616-4B96-9C87-376184471A99) 
iPad Retina (065BC548-81D9-4BFF-9043-22003C053352)
iPad Air (D86FA807-F9DF-408C-A51E-7E420E7DE926) 
```

#### iOS 9.0 
```
iPhone 4s (CEA94A5C-BD56-4F18-A183-21EE5F309D6F) 
iPhone 5 (AF748B7A-308C-41B0-9AAC-280E603EFECB) 
iPhone 5s (4A58DB17-D3A6-4C92-90F8-228FEB76CC32)
iPhone 6 (ED143E06-803E-4813-BF56-43CF7C4E4483) 
iPhone 6 Plus (0F47960E-A765-42A2-AD62-DAB866C8CABB)
iPhone 6s (D9FFDBB7-7C07-4D29-BDD4-6927BC706176) 
iPhone 6s Plus (7825EB65-04BF-4285-AD18-062437612739)
iPad 2 (04995B6B-277A-4B3E-84C4-9505509BD05B) 
iPad Retina (8DAC404D-7BB3-461E-BCDF-F6EE610EEAC6)
iPad Air (C4C6D745-7FDE-4F84-9EC0-DEC66719554F) 
iPad Air 2 (14B1CF55-B815-42E1-A5D1-1C529C43C907) 
```

#### iOS 9.1
```
iPhone 4s (260A47DB-E7FD-4942-A27A-A60962A27C01)
iPhone 5 (0953C2AC-067B-42B5-A766-71A5816DE8E3) 
iPhone 5s (06D1DD26-425A-40D3-A987-2B5AEF4F8C85)
iPhone 6 (B4B029F2-323E-4579-9AF5-583B8650E05D) 
iPhone 6 Plus (088FF119-4163-4185-BDE2-AC215BD75B24)
iPhone 6s (9FCB6777-7182-470F-9853-BB5F04C07A6C) 
iPhone 6s Plus (B59D4BBD-42E5-4E07-ABD5-F39BDD3F3B71)
iPad 2 (04650ACD-37D7-47CE-A6C4-7796B7301222) 
iPad Retina (510523DA-A50E-423A-90A1-F04F91B092EA)
iPad Air (337FA825-6977-4E23-8396-5D59B91EBCCD) 
iPad Air 2 (BDD06800-A1A0-42F6-974A-23AEB3F7600D)
iPad Pro (46224132-5CE2-49E5-8FE2-EB12DD6B7B07)
```

#### iOS 9.2 
```
iPhone 4s (FEB738D1-4516-466D-83A0-493E2D5C5CCB)
iPhone 5 (99F80EB6-54CF-4675-ABEC-14CBB9D37EB0) 
iPhone 5s (A173646C-0E16-4C96-B4AB-6D74B4E08F3E) 
iPhone 6 (49B7E0E4-D15E-4134-9B22-7A197145A44E) 
iPhone 6 Plus (F148BAAE-608E-4E61-9CCB-305E0A46C8BE)
iPhone 6s (F93449E9-2880-4B84-9F85-B16055BD7448) 
iPhone 6s Plus (2A9C03A1-A8E4-43AE-82C2-7243F7DF01D3)
iPad 2 (DF62C861-FB37-4148-9AC1-3D47E4C7B13E) 
iPad Retina (18B4C489-F573-4C92-8405-A5D48D95BC6C)
iPad Air (53EAC976-9882-4873-8DD8-26FF4764D8FB) 
iPad Air 2 (92A70287-9E09-470B-BE63-B7FDD64E9CB4)
iPad Pro (16120337-1A21-4B9C-8F9F-CF340C496850) 
```

##### iOS 9.3 
```
iPhone 4s (FC3CCB28-CCA1-4A9B-93C2-4F2B1F313489)
iPhone 5 (AE8CD780-E1B1-4361-A8CE-B89AB9FBD66F) 
iPhone 5s (65EF339D-365F-43D7-94AE-4581D7ECB279)
iPhone 6 (E4F7AE85-098C-407F-91C0-529E33FA6FA0) 
iPhone 6 Plus (3C1C353F-0832-4BDD-AEF5-2470F2F7CAD4)
iPhone 6s (FBC05C32-2F93-46D0-9123-2A7F85AB764B) 
iPhone 6s Plus (D3CC2437-98DE-4C8D-BFEF-A127C71503EB)
iPad 2 (8BEF6A7E-50F5-4508-B8F9-B9A1F48E1F7D) 
iPad Retina (30B253B4-2298-4B09-B9AB-7EDD752A99C4)
iPad Air (4F2471C0-D69D-4B22-9B5D-ACCECD8AA544) 
iPad Air 2 (9666034B-7896-43EF-ADB9-041DDD8AA0A2)
iPad Pro (A7963D98-D0E3-41D7-B25E-5B833EC251DE) 
```

##### iOS 10.0
```
iPhone 5 (6451356D-155F-4CC4-A083-18E730046D53)
iPhone 5s (F42E9B6A-7CDC-43CF-BC9E-4211034C17E1)
iPhone 6 (60E64563-2E37-440E-8555-36E43EF6A8ED) 
iPhone 6 Plus (1C7F3FB0-5E3E-4B0A-B5C2-F13D211BB54B)
iPhone 6s (76744FAB-587E-4A38-876B-5B45AC6F7C28) 
iPhone 6s Plus (0D1094BA-B0E3-45C9-9A9E-9ACC34A30EB3)
iPhone SE (2CC40B19-693A-42B8-ACEE-4DC61BECEE10) 
iPad Air (510802C8-489D-4850-8C40-069876C883B9) 
iPad Air 2 (A9F32D6E-80CF-444A-87CA-8FC6EEC270DE)
iPad Pro (9.7 inch) (7E8D9866-AFA4-493B-ADCA-7C76C01091C0) 
iPad Pro (12.9 inch) (7D6AA558-5310-4283-99D3-4286B055BC1F)
```

##### iOS 10.1
```
iPhone 5 (E14569F7-2CC3-4C31-9722-801E4F05AD0E) 
iPhone 5s (6C98A692-47EF-4B3F-932B-F30196218D01)
iPhone 6 (3AFF7D26-EE9C-4212-A8A4-E84C7BC58CFB) 
iPhone 6 Plus (E0262C58-00B6-4B71-A080-36E81C6C385B)
iPhone 6s (D55D8AEC-5F6F-432F-8833-B4484C99C2AA) 
iPhone 6s Plus (990E846B-ED29-4319-8EB3-CCCC8800191E)
iPhone 7 (A814DDF3-9078-4E0F-9C64-1E26D9E6D86E) 
iPhone 7 Plus (7BD64929-4A51-4662-8FDB-F40343A9257C)
iPhone SE (B4EE49CB-C175-4E88-9491-263F68DF231B) 
iPad Air (0885003B-D216-4A93-A4D4-59CAF0968828)
iPad Air 2 (80FE857D-7942-4FAF-8C1A-9F118303C527)
iPad Pro (9.7 inch) (68CC406C-7117-46C7-8793-71AA398A170B)
iPad Pro (12.9 inch) (7F542D5C-4EB4-4BE9-9E46-9E451D29DF84)
```

##### iOS 10.2
```
iPhone 5 (B543818E-B01C-4B3D-ACA1-03DDE7337025) 
iPhone 5s (459712E4-64A0-4180-AACE-42934C5CC8CF)
iPhone 6 (FCF34E92-D960-4FB7-A855-7A33296FDC51) 
iPhone 6 Plus (1B847D92-55F1-4C29-8E21-5EC7E4BE4AE1)
iPhone 6s (940DDAD4-6A0C-41CF-B94A-D51F88390D04) 
iPhone 6s Plus (43288B76-E8D2-467E-9D21-735627A3302B)
iPhone 7 (E031ED93-E777-459F-BCAF-DBEDDAA3FAFD) 
iPhone 7 Plus (C5098D26-B719-4025-9E0B-38FF7640D0A9)
iPhone SE (1531EB5C-315F-49F4-BD6D-D953FB356D12) 
iPad Air (E67C5367-BCD6-4021-BECF-EF21E0DBF285) 
iPad Air 2 (43204BDD-FBAB-43B0-B4FF-46DB869DD866)
iPad Pro (9.7 inch) (6CBC4E3B-619A-41A4-9C6C-7025E30589AC)
iPad Pro (12.9 inch) (C3CF4C52-AE9C-4358-AEBB-F0A4C08F62C3)
```

##### iOS 11.0
```
iPhone 5s (3161BBB1-5E8D-486A-8666-682EA94F72D6) 
iPhone 6 (E45E04BA-3CB4-466B-A115-0F33058BC957) 
iPhone 6 Plus (BC387FE3-3B7F-4E3C-A7F3-9BCAB71D7C32)
iPhone 6s (84C9133C-7536-4FE2-8BFC-D99E0FB5688D) 
iPhone 6s Plus (C8909535-CC52-4AFC-A4A5-902E8CEE4E9B)
iPhone 7 (CC6F553C-A670-47FD-A448-430E66CC0073) 
iPhone 7 Plus (54EFA10B-8B9E-4385-8180-66542D259A10)
iPhone SE (BA05002F-F929-45CD-B8EA-25F4E8078AD3)
iPhone 8 (CA0C63BE-2712-42C5-8E47-0E57AA10A0D0) 
iPhone 8 Plus (3D3B4777-9BC9-44E9-BA81-10DFE2F28568)
iPhone X (2A33DDFA-AADA-4889-8424-ACAFF821A360) 
iPad Air (96368F73-1A5D-4565-9895-10035A043ADD) 
iPad Air 2 (0F398764-5315-49DC-9E76-FB316371AFA1) 
iPad (5th generation) (D6751BA4-6A16-472D-8F01-76AB57A512C4)
iPad Pro (9.7-inch) (D4761EAC-69B2-4BF0-B29E-2745B003A88B) 
iPad Pro (12.9-inch) (2FB144AE-5904-4BED-8469-E4B2C3A51ACD) 
iPad Pro (12.9-inch) (2nd generation) (8E3A8775-CC80-49EC-8402-1D2B4F680A28)
iPad Pro (10.5-inch) (B38B2F9B-FF76-46B1-A672-2BD07DEAC7EA)
```

##### tvOS 11.0
```
Apple TV (8AFFB701-A9B1-41D9-9E81-EB0B6A6D1C3F) 
Apple TV 4K (DCB99771-1B3B-45DC-B0AC-E608C4733C3A) 
Apple TV 4K (at 1080p) (1E7E438D-1F54-4196-9E21-155216408A14) 
```

##### watchOS 4.0
```
Apple Watch - 38mm (D93E8AF3-BD98-485A-9A5B-389AB953395C) 
Apple Watch - 42mm (E7FD1C64-DC22-40E4-90EC-EC05EEBC8C5A) 
Apple Watch Series 2 - 38mm (9B1796B5-5297-47FB-B6CA-E70773809D5E)
Apple Watch Series 2 - 42mm (9ED83AB7-E4F4-4F01-B9CC-29DA27A82855)
Apple Watch Series 3 - 38mm (AD6D50C3-C646-4F82-8D96-78102D846ACD)
Apple Watch Series 3 - 42mm (C9FC4884-1F6D-4054-8CEB-147F267A7679)
```

### Device Pairs
```
81668C9F-555A-42FC-A27A-E832150C5F4B (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (9B1796B5-5297-47FB-B6CA-E70773809D5E)
    Phone: iPhone 7 (CC6F553C-A670-47FD-A448-430E66CC0073) 
B6288D91-1D12-4FFF-83FC-17396A7C27DF (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (9ED83AB7-E4F4-4F01-B9CC-29DA27A82855) 
    Phone: iPhone 7 Plus (54EFA10B-8B9E-4385-8180-66542D259A10) 
A3768602-DF95-445A-AE7A-1147D12F59FF (active, disconnected)
    Watch: Apple Watch Series 3 - 38mm (AD6D50C3-C646-4F82-8D96-78102D846ACD)
    Phone: iPhone 8 (CA0C63BE-2712-42C5-8E47-0E57AA10A0D0) 
F620EDB7-249F-4590-836C-1A1C3D93AA88 (active, disconnected)
    Watch: Apple Watch Series 3 - 42mm (C9FC4884-1F6D-4054-8CEB-147F267A7679) 
    Phone: iPhone 8 Plus (3D3B4777-9BC9-44E9-BA81-10DFE2F28568) 
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
| build-tools-26.0.2    | Android SDK Build-tools, Revision 26.0.2  |


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
| extra-google-google_play_services | Google Play services, revision 46        |
| extra-google-m2repository         | Google Repository, revision 58           |

## Xamarin

- Visual Studio for Mac: 7.2.0.636

### Mono Framework 5.4.0.201

- Xamarin.iOS: 11.2.0.11
- Xamarin.Android: 8.0.0-33
- Xamarin.Mac: 3.8.0.49

### Mono Framework 5.2.0.224

- Xamarin.iOS: 11.0.0.0
- Xamarin.Android: 7.4.5-1
- Xamarin.Mac: 3.6.3.3

### Mono Framework 5.0.1.1

- Xamarin.iOS: 10.10.0.36
- Xamarin.Android: 7.3.1-2
- Xamarin.Mac: 3.4.0.36

### Mono Framework 4.8.1.0

- Xamarin.iOS: 10.6.0.10
- Xamarin.Android: 7.1.0-43
- Xamarin.Mac: 3.0.0.398

### Package Management

- NuGet: 4.3.0

### Unit Test Framework

- NUnit: 3.6.1
