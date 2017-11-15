---
title: App Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 11/15/2017
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
- Java 1.8.0_152
- Node.js v6.12.0
- PowerShell v6.0.0-beta.9
- Python 2.7.10
- Ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]
- .NET Core SDK 2.0.0

### Package Management

- Bundler 1.16.0
- Carthage 0.26.2
- CocoaPods 1.3.1
- Homebrew 1.3.6
- Homebrew/homebrew-core (git revision 85a3; last commit 2017-11-10)
- NPM 3.10.10
- Yarn 1.3.2

### Project Management

- Apache Maven 3.5.2
- Gradle 4.3.1

### Utilities

- curl 7.54.0 (x86_64-apple-darwin16.0) libcurl/7.54.0 SecureTransport zlib/1.2.8
- Git 2.15.0
- Git LFS 2.3.4 
- GNU Wget 1.19.2 built on darwin16.7.0

### Tools

- fastlane 2.64.0
- App Center CLI 0.12.0

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

- Nomad CLI 2.6.14
- Nomad CLI IPA ipa 0.14.3
- xcpretty 0.2.8
- xctool 0.3.4

### Installed SDKs

- macOS 10.12               `-sdk macosx10.12`
- macOS 10.13               `-sdk macosx10.13`
- iOS 10.0                  `-sdk iphoneos10.0`
- iOS 10.1                  `-sdk iphoneos10.1`
- iOS 10.2                  `-sdk iphoneos10.2`
- iOS 10.3                  `-sdk iphoneos10.3`
- iOS 11.0                  `-sdk iphoneos11.0`
- iOS 11.1                  `-sdk iphoneos11.1`
- iOS Simulator 10.0        `-sdk iphonesimulator10.0`
- iOS Simulator 10.1        `-sdk iphonesimulator10.1`
- iOS Simulator 10.2        `-sdk iphonesimulator10.2`
- iOS Simulator 10.3        `-sdk iphonesimulator10.3`
- iOS Simulator 11.0        `-sdk iphonesimulator11.0`
- iOS Simulator 11.1        `-sdk iphonesimulator11.1`
- tvOS 10.0                 `-sdk appletvos10.0`
- tvOS 10.1                 `-sdk appletvos10.1`
- tvOS 10.2                 `-sdk appletvos10.2`
- tvOS 11.0                  `-sdk appletvos11.0`
- tvOS 11.1                  `-sdk appletvos11.1`
- tvOS Simulator 10.0       `-sdk appletvsimulator10.0`
- tvOS Simulator 10.1       `-sdk appletvsimulator10.1`
- tvOS Simulator 10.2       `-sdk appletvsimulator10.2`
- tvOS Simulator 11.0       `-sdk appletvsimulator11.0`
- tvOS Simulator 11.1       `-sdk appletvsimulator11.1`
- watchOS 3.0               `-sdk watchos3.0`
- watchOS 3.1               `-sdk watchos3.1`
- watchOS 3.2               `-sdk watchos3.2`
- watchOS 4.0               `-sdk watchos4.0`
- watchOS 4.1               `-sdk watchos4.1`
- watchOS Simulator 3.0     `-sdk watchsimulator3.0`
- watchOS Simulator 3.1     `-sdk watchsimulator3.1`
- watchOS Simulator 3.2     `-sdk watchsimulator3.2`
- watchOS Simulator 4.0     `-sdk watchsimulator4.0`
- watchOS Simulator 4.1     `-sdk watchsimulator4.1`

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
Apple Watch Series 3 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-38mm)
Apple Watch Series 3 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-3-42mm)
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
iOS 11.1 (11.1 - 15B87) - com.apple.CoreSimulator.SimRuntime.iOS-11-1
tvOS 11.1 (11.1 - 15J580) - com.apple.CoreSimulator.SimRuntime.tvOS-11-1
watchOS 4.1 (4.1 - 15R844) - com.apple.CoreSimulator.SimRuntime.watchOS-4-1
```

#### Devices

#### iOS 8.4 
```
iPhone 4s (A4C31028-AF16-46B4-8229-F2AEA3F8CD27) 
iPhone 5 (E9A1C1E3-1C1D-4C59-8015-035426980AF5) 
iPhone 5s (D85499BC-3EB2-4960-B677-11E9969A8D1C)
iPhone 6 (73879C39-FF7F-4E22-87E6-B3E5788E9125) 
iPhone 6 Plus (44312371-0CF1-435D-95D1-36878F357B9A)
iPad 2 (82E079F3-4113-4471-87E3-F82571520ACF) 
iPad Retina (C11B0989-2DB8-43C0-86FF-372C92F9D8CC)
iPad Air (C0253F59-6E0C-4C9B-985B-52FD823FA276) 
```

#### iOS 9.0 
```
iPhone 4s (3629698A-1C97-49A8-8296-FA4D3091F149) 
iPhone 5 (578BC28C-90F9-4938-9739-2FC9FE248046) 
iPhone 5s (4ABF2FFE-EBCF-456C-ADFE-CD29EAD45063)
iPhone 6 (54A593AA-6141-4531-8C3E-D813531AB00C) 
iPhone 6 Plus (4E4943DC-1757-4C5E-AC29-6C578CF92E8C)
iPhone 6s (2DA9D5C0-836D-4AB4-AB9B-891F5DEF2828) 
iPhone 6s Plus (3AB4DF8D-5243-4AB6-922A-D0A5C48F351F)
iPad 2 (9F1A3607-3A05-447F-9EA7-1D2363477D56) 
iPad Retina (E1250B08-FB3F-442B-9545-9B8153A006B9)
iPad Air (CDF22FBD-7859-4FCC-8003-5D15CB182B69) 
iPad Air 2 (B27EC246-3613-456E-9911-9D076C2EC7D0)
```

#### iOS 9.1
```
iPhone 4s (5F3434F0-05E5-42E4-B719-38313A734E43)
iPhone 5 (7747DA99-5AD5-4ADE-9CCF-C616933E63D9)
iPhone 5s (B81ADE6D-8E35-46A5-A088-56D2612D3733)
iPhone 6 (22F7A0D1-DAD9-45F8-9E14-FCB9BA9C6C13) 
iPhone 6 Plus (B2445932-211C-42F5-B483-4277796CC1EC)
iPhone 6s (8EEA4CC1-A4FE-44F5-94E6-FA7E434BE33D)
iPhone 6s Plus (180FBC9F-822F-4D8F-8E1A-C349B94C727E)
iPad 2 (F548AB07-4B76-44D2-AAF6-EE44CEFB84D8) 
iPad Retina (DB09A7AC-BF49-4D4A-83CA-9CB29E94F56D)
iPad Air (8F1265B4-275B-46CE-BED6-7014D9667ADD) 
iPad Air 2 (3E221E7B-EA14-4C7F-8F06-7F1924E7D608)
iPad Pro (7DDD0A0D-5481-47D8-8052-24F18F2B96DB) 
```

#### iOS 9.2 
```
iPhone 4s (EBE9C46E-6090-4C52-8D94-03F43077F4A5) 
iPhone 5 (DAB7AC24-C973-49E6-87E5-1B46FC0EA52C) 
iPhone 5s (2396CB1F-94E3-4E0B-8C2D-7E43E8DC51C9)
iPhone 6 (61068A2F-577C-45E5-ABA2-7DEBBFD3FBD8) 
iPhone 6 Plus (B97EEFA7-9337-4783-B082-D18CEE5D040D)
iPhone 6s (A11F1A18-8482-476F-8363-752D90008D88) 
iPhone 6s Plus (0C49893A-4D09-415B-BC86-0E66171EB6D2)
iPad 2 (10D202CB-C663-4B54-B176-F599295C09A4) 
iPad Retina (A612D5B7-C81F-4A37-AD99-D449D50EC8A4)
iPad Air (DC2AF617-0312-4C68-B1A1-09453F835656) 
iPad Air 2 (764DFA5C-DE05-460E-8817-C819F9FB6FFD)
iPad Pro (C5D27076-8810-4E0D-96BE-BBF13EF49F0E) 
```

##### iOS 9.3 
```
iPhone 4s (65C3485D-C473-4F2D-A4C2-8B262A0B115C) 
iPhone 5 (F9CC983A-7A30-46D9-8051-97048D01DBC2) 
iPhone 5s (2B9BA2FF-54A0-4C48-9C30-3C5DEDD9DB8C)
iPhone 6 (1E99C658-0789-4C57-8886-5F002C042684)
iPhone 6 Plus (40E9382A-FA55-4285-A60E-491C9176E097)
iPhone 6s (8A88B1D0-0918-478A-8897-432AF67520CB) 
iPhone 6s Plus (2B65E720-AF7E-4A3D-9E76-C279337BB765)
iPad 2 (DFEFEEDC-1B84-49B0-989B-37E2EFF0773C) 
iPad Retina (A03ED2C2-5232-47B0-B8C1-9E0435936312)
iPad Air (88C784EA-0B05-4FC5-8178-08EF460A2F62) 
iPad Air 2 (E8B519EF-7DF8-4C54-88E3-90320B941DDF)
iPad Pro (7C2837FB-6863-4DB8-9799-D5C7CD4486E4)  
```

##### iOS 10.0
```
iPhone 5 (9FC3102C-37B5-49CB-9BBE-F16740AD9567) 
iPhone 5s (9B2EC245-E3CB-4EB4-846B-9DB38FA75FF8)
iPhone 6 (D94943A8-192D-4B37-AF8E-1B415713E06D) 
iPhone 6 Plus (4E5CE1EE-53F7-49A2-BE4D-09C4D1CE7936)
iPhone 6s (A2F7671E-CCA0-4E39-BD0F-14C7F99CA05F) 
iPhone 6s Plus (83D4D332-C2B1-4651-B4B2-20ACADF1DC32)
iPhone SE (C82394FB-6FC3-4CF3-A7AF-C9E3D583F610) 
iPad Air (C68E619A-A285-4C14-BB46-541352D7FF64) 
iPad Air 2 (619B5C68-7C4F-4A05-829A-47F4EACEA23D)
iPad Pro (9.7 inch) (6AFA44A1-E746-44FD-BFD2-4B6E946F5B96)
iPad Pro (12.9 inch) (74F9478B-704F-4F95-A585-B693F138A24B) 
```

##### iOS 10.1
```
iPhone 5 (5B9E2BA5-1E1E-4695-A304-743346B6F312)
iPhone 5s (B0F362C8-65AF-4552-8099-3FE81D442C9E)
iPhone 6 (9D808A83-3DD4-4DFE-8E95-6B646636E2A2) 
iPhone 6 Plus (B2E62A06-44A5-42C0-9FF2-6B46429A9F13)
iPhone 6s (8BD9F29A-8E35-4342-A7BC-B02C114FC45B) 
iPhone 6s Plus (4569B971-FFEF-440B-911C-71E0074493EF)
iPhone 7 (DEDD3576-A610-49D2-AD3C-0AC2C6F8A22F) 
iPhone 7 Plus (1426C2D5-0568-4C0D-AE0A-864D63244D33)
iPhone SE (8F7184CB-9367-4626-9BAE-82FB9E60AB8E) 
iPad Air (86DFD807-117E-490D-BE8E-45EA70199BF6) 
iPad Air 2 (718B0441-75B7-4FC4-B2C2-03B59E53D988)
iPad Pro (9.7 inch) (1D8E5C1F-EFBE-49AE-B06E-1A8F253DF32F)
iPad Pro (12.9 inch) (89DFCE02-65E5-494E-A720-BE9CF7E50E91)
```

##### iOS 10.2
```
iPhone 5 (BF10C05E-66CA-44C9-AFBE-0786F2FB53E1) 
iPhone 5s (F31ED827-ED43-4E4B-8525-06D3757ED350)
iPhone 6 (CEC4E864-5D8D-4970-911F-74E34D568EA0) 
iPhone 6 Plus (425939AF-4605-43C8-BE9E-9135DE60A9CD)
iPhone 6s (45380E98-69A6-4909-A09A-AF3464803152) 
iPhone 6s Plus (C2747BA2-8842-4903-9D99-2E94B0FC865F)
iPhone 7 (2FB3D9F4-D8B3-4E10-9179-C14BB9B55CD4) 
iPhone 7 Plus (BA88B084-15E0-4F66-9D08-11FAB31D54CD)
iPhone SE (F40E9317-0405-43CD-8D71-27B70561C0E8)
iPad Air (0E699C1B-55FF-4125-A52B-5C1974342EBF) 
iPad Air 2 (04C84072-BA43-4B0A-9837-D05D73FFEBB3) 
iPad Pro (9.7 inch) (0042017C-DBE0-4B9C-9A65-DB82BCDF5AC0) 
iPad Pro (12.9 inch) (DB12EA89-91D8-4A6C-AB80-8A3EF5B5E837)
```

##### iOS 11.1
```
iPhone 5s (15A5EEF4-FAFD-4F78-8365-284F1D79F938)
iPhone 6 (C31A1F3D-5B51-4B55-B9EB-EBF129AB5ACE)
iPhone 6 Plus (43214827-C2BF-4C7C-8C0F-7A4B8E52EAD6)
iPhone 6s (5888C82C-56F9-4AA7-BA80-94D286E8A6F2)
iPhone 6s Plus (F92CDCD2-9A3E-4D78-99B3-43696B91ED09)
iPhone 7 (7C00727D-B86A-4A8F-8B5B-419AA088435A) 
iPhone 7 Plus (9DAC62FA-00F0-40EF-BC54-B7B4469F8441)
iPhone 8 (9B84C5E0-DCD0-4F61-8323-EBF0DD756D2A) 
iPhone 8 Plus (0A49BF8A-9A55-4DD2-8AF4-84DF3FEF5201)
iPhone SE (CE7B5DA4-E232-4C10-90E4-0967D6C5DB17) 
iPhone X (FC7EC715-E088-4D44-BD10-493F479BA3E8) 
iPad Air (9275351B-8228-478A-9FBD-DB277D203951) 
iPad Air 2 (F3CA9A6A-4C8D-4C8E-B7AF-8E81D8DCC2F9)
iPad (5th generation) (5E450A64-05C9-41BC-8983-952414B152EB)
iPad Pro (9.7-inch) (E02B6FC5-8667-44A7-95D2-27F9A70A3C0E) 
iPad Pro (12.9-inch) (27B5D709-9EC8-49E5-B772-B8F0F2DF823F)
iPad Pro (12.9-inch) (2nd generation) (AE904954-701B-4B9D-A278-5EDA07E69B08)
iPad Pro (10.5-inch) (A5EE0BB4-851D-470D-B119-AF1F429420EA)
```

##### tvOS 11.1
```
Apple TV (14A307D3-8720-4A0C-B10E-E2F0FD2DDAED) 
Apple TV 4K (9FA85EF7-011B-41A7-BECA-9324FE0DC31C)
Apple TV 4K (at 1080p) (044B10E6-7876-4F86-B93C-7EE56E89DEA4)
```

##### watchOS 4.1
```
Apple Watch - 38mm (DEBE351F-E18E-41A6-89DF-2366E1CDB5C7) 
Apple Watch - 42mm (D99D49E1-3146-4017-A0C2-8CCB32DD85F9) 
Apple Watch Series 2 - 38mm (54C86689-B1A1-490C-812E-9294E694D0B5)
Apple Watch Series 2 - 42mm (970FAEBD-963D-4CB8-ADEF-8F5630AEB2B4)
Apple Watch Series 3 - 38mm (34D6A884-EFF4-4422-AF94-73852F036674)
Apple Watch Series 3 - 42mm (D7628FD8-14BD-41B4-A470-5DEB6A907409)
```

### Device Pairs
```
4435072E-62B4-4778-A40C-8CCF5D50FEC7 (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (54C86689-B1A1-490C-812E-9294E694D0B5)
    Phone: iPhone 7 (7C00727D-B86A-4A8F-8B5B-419AA088435A)
4DA6320B-24C9-42E9-926B-2094F267993B (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (970FAEBD-963D-4CB8-ADEF-8F5630AEB2B4)
    Phone: iPhone 7 Plus (9DAC62FA-00F0-40EF-BC54-B7B4469F8441) 
35063F77-04BD-44D8-B32A-8D92C7E768A3 (active, disconnected)
    Watch: Apple Watch Series 3 - 38mm (34D6A884-EFF4-4422-AF94-73852F036674)
    Phone: iPhone 8 (9B84C5E0-DCD0-4F61-8323-EBF0DD756D2A) 
0109EE6B-305E-4DD1-A0C9-4DF7FF95873E (active, disconnected)
    Watch: Apple Watch Series 3 - 42mm (D7628FD8-14BD-41B4-A470-5DEB6A907409)
    Phone: iPhone 8 Plus (0A49BF8A-9A55-4DD2-8AF4-84DF3FEF5201)     
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
| build-tools-25.0.3    | Android SDK Build-tools, Revision 25.0.3  |
| build-tools-26.0.0    | Android SDK Build-tools, Revision 26.0.0  |
| build-tools-26.0.1    | Android SDK Build-tools, Revision 26.0.1  |
| build-tools-26.0.2    | Android SDK Build-tools, Revision 26.0.2  |
| build-tools-26.0.3    | Android SDK Build-tools, Revision 26.0.3  |
| build-tools-27.0.0    | Android SDK Build-tools, Revision 27.0.0  |
| build-tools-27.0.1    | Android SDK Build-tools, Revision 27.0.1  |


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

### Visual Studio for Mac

- 7.2.2.11

### Mono

- Mono Version: 5.4.1.6
- Mono Version: 5.4.0.201
- Mono Version: 5.2.0.224
- Mono Version: 5.0.1.1
- Mono Version: 4.8.1.0

### Xamarin.iOS SDK

- Xamarin.iOS SDK Version: 11.3.0.47
- Xamarin.iOS SDK Version: 11.2.0.11
- Xamarin.iOS SDK Version: 11.0.0.0
- Xamarin.iOS SDK Version: 10.10.0.36
- Xamarin.iOS SDK Version: 10.6.0.10

### Xamarin.Android SDK

- Xamarin.Android SDK Version: 8.0.2-1
- Xamarin.Android SDK Version: 8.0.0-33
- Xamarin.Android SDK Version: 7.4.5-1
- Xamarin.Android SDK Version: 7.3.1-2
- Xamarin.Android SDK Version: 7.1.0-43

### Xamarin.Mac SDK

- Xamarin.Mac SDK Version: 3.8.1.0
- Xamarin.Mac SDK Version: 3.8.0.49
- Xamarin.Mac SDK Version: 3.6.3.3
- Xamarin.Mac SDK Version: 3.4.0.36
- Xamarin.Mac SDK Version: 3.0.0.398

### Package Management

- NuGet: 4.3.0

### Unit Test Framework

- NUnit: 3.6.1