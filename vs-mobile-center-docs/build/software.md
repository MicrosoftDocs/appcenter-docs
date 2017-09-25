---
title: Mobile Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 09/22/2017
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
- Ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin16]

### Package Management

- Bundler 1.15.4
- Carthage 0.25.0
- CocoaPods 1.3.1
- Homebrew 1.3.2
- Homebrew/homebrew-core (git revision c010; last commit 2017-09-14)
- NPM 3.10.10
- Yarn 1.0.2

### Project Management

- Apache Maven 3.5.0
- Gradle 4.1

### Utilities

- curl 7.54.0 (x86_64-apple-darwin16.0) libcurl/7.54.0 SecureTransport zlib/1.2.8
- Git 2.14.1
- Git LFS 2.2.1
- GNU Wget 1.19.1 built on darwin16.6.0

### Tools

- fastlane 2.56.0
- Mobile Center CLI 0.11.0

## Xcode

- Xcode 9 beta 6
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

- OS X 10.12                `-sdk macosx10.12`
- iOS 10.0                  `-sdk iphoneos10.0`
- iOS 10.1                  `-sdk iphoneos10.1`
- iOS 10.2                  `-sdk iphoneos10.2`
- iOS 10.3                  `-sdk iphoneos10.3`
- iOS Simulator 10.0        `-sdk iphonesimulator10.0`
- iOS Simulator 10.1        `-sdk iphonesimulator10.1`
- iOS Simulator 10.2        `-sdk iphonesimulator10.2`
- iOS Simulator 10.3        `-sdk iphonesimulator10.3`
- tvOS 10.0                 `-sdk appletvos10.0`
- tvOS 10.1                 `-sdk appletvos10.1`
- tvOS 10.2                 `-sdk appletvos10.2`
- tvOS Simulator 10.0       `-sdk appletvsimulator10.0`
- tvOS Simulator 10.1       `-sdk appletvsimulator10.1`
- tvOS Simulator 10.2       `-sdk appletvsimulator10.2`
- watchOS 3.0               `-sdk watchos3.0`
- watchOS 3.1               `-sdk watchos3.1`
- watchOS 3.2               `-sdk watchos3.2`
- watchOS Simulator 3.0     `-sdk watchsimulator3.0`
- watchOS Simulator 3.1     `-sdk watchsimulator3.1`
- watchOS Simulator 3.2     `-sdk watchsimulator3.2`

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
iPad 2 (com.apple.CoreSimulator.SimDeviceType.iPad-2)
iPad Retina (com.apple.CoreSimulator.SimDeviceType.iPad-Retina)
iPad Air (com.apple.CoreSimulator.SimDeviceType.iPad-Air)
iPad Air 2 (com.apple.CoreSimulator.SimDeviceType.iPad-Air-2)
iPad (5th generation) (com.apple.CoreSimulator.SimDeviceType.iPad--5th-generation-)
iPad Pro (9.7-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-)
iPad Pro (12.9-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
iPad Pro (12.9-inch) (2nd generation) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--12-9-inch---2nd-generation-)
iPad Pro (10.5-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--10-5-inch-)
Apple TV 1080p (com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p)
Apple Watch - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm)
Apple Watch - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm)
Apple Watch Series 2 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm)
Apple Watch Series 2 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm)
```

#### Runtimes
```
iOS 8.4 (8.4 - 12H141) (com.apple.CoreSimulator.SimRuntime.iOS-8-4)
iOS 9.0 (9.0 - 13A344) (com.apple.CoreSimulator.SimRuntime.iOS-9-0)
iOS 9.1 (9.1 - 13B143) (com.apple.CoreSimulator.SimRuntime.iOS-9-1)
iOS 9.2 (9.2 - 13C75) (com.apple.CoreSimulator.SimRuntime.iOS-9-2)
iOS 9.3 (9.3 - 13E233) (com.apple.CoreSimulator.SimRuntime.iOS-9-3)
iOS 10.0 (10.0 - 14A345) (com.apple.CoreSimulator.SimRuntime.iOS-10-0)
iOS 10.1 (10.1 - 14B72) (com.apple.CoreSimulator.SimRuntime.iOS-10-1)
iOS 10.2 (10.2 - 14C89) (com.apple.CoreSimulator.SimRuntime.iOS-10-2)
iOS 10.3 (10.3.1 - 14E8301) (com.apple.CoreSimulator.SimRuntime.iOS-10-3)
tvOS 10.2 (10.2 - 14W260) (com.apple.CoreSimulator.SimRuntime.tvOS-10-2)
watchOS 2.2 (2.2 - 13V144) (com.apple.CoreSimulator.SimRuntime.watchOS-2-2)
watchOS 3.1 (3.1 - 14S471a) (com.apple.CoreSimulator.SimRuntime.watchOS-3-1)
watchOS 3.2 (3.2 - 14V243) (com.apple.CoreSimulator.SimRuntime.watchOS-3-2)
```

#### Devices

##### iOS 8.4
```
iPhone 4s (15BEF145-AC11-4142-8B11-8EF19E4F75AA)
iPhone 5 (28855B9E-10EE-4CA1-A669-F87C45494EE0)
iPhone 5s (73EAD36F-F743-4AE7-BEFE-F62C0ECC29F0)
iPhone 6 (770317CD-D74A-429E-8079-BDDF6DCE5023)
iPhone 6 Plus (E93DC116-D912-4E0D-9D70-4E7061A8EABE)
iPad 2 (58349BC0-9C78-4B94-90A5-AB306959D0EA)
iPad Retina (B032E303-C1F8-4C47-BEFD-368CBF122E22)
iPad Air (B8E12AAB-4263-40CB-9B64-ABC7F3B0747E)
```

##### iOS 9.0
```
iPhone 4s (883395F4-FCDC-46DC-9761-F61A2F8CC21D)
iPhone 5 (E52521FC-89C6-470E-B617-652FC3EB32D0)
iPhone 5s (B7BDD940-E0A4-42A1-BC43-4F8A9FE22AAD)
iPhone 6 (16E48A0A-7AC3-4709-85F3-49FDFFE857D2)
iPhone 6 Plus (B9AEFA85-02AF-4A00-A8B0-3661CC6F8169)
iPhone 6s (8ECBF85F-D55E-4E57-AF05-076FB2673534)
iPhone 6s Plus (82686FE4-6370-4118-ACC4-37F16A817EC4)
iPad 2 (BDD34107-60EB-473F-AEEE-605941C6CCC1)
iPad Retina (C41A4DF8-DBB3-4E74-82FD-561D66A352DD)
iPad Air (08381F33-923B-45B4-96DA-CC485A85B302)
iPad Air 2 (8FD36AC1-3451-45EE-A6D9-661410D7AAD8)
```

##### iOS 9.1
```
iPhone 4s (3632FE9B-02C0-4F90-A824-79BF805426FC)
iPhone 5 (9748B86E-3D42-4EAE-A483-56D770D41A95)
iPhone 5s (B88E72CB-ED48-4BA3-869D-36CC1D9EED8E)
iPhone 6 (F701E73C-76CA-4782-9DC0-6F075E8A09EC)
iPhone 6 Plus (9982E2B9-6C01-471D-B67E-8E0F7177B247)
iPhone 6s (9C267078-A808-4319-8EA3-D3DFAE29FECA)
iPhone 6s Plus (7A71B485-10CF-4EDE-ADF4-BF4962102A46)
iPad 2 (E645C4F2-1F7E-4701-8435-7B0B7A88BE34)
iPad Retina (B4AF81D5-76FC-4078-95FD-DBA225F8BFD1)
iPad Air (8016A9DD-B074-4619-A71B-572A5E116ED7)
iPad Air 2 (C05C51EF-4312-4003-B03A-1570DA0382BF)
iPad Pro (9F99191D-969E-467C-81E1-4E8A0B03F1DD)
```

##### iOS 9.2
```
iPhone 4s (A1E2E247-7CFF-41F3-B935-896B925D15A1)
iPhone 5 (4D48E186-BACF-4CAF-A304-26209D066522)
iPhone 5s (D3CA36D8-E8D7-49FB-87BF-EFEAEFFDEB1A)
iPhone 6 (560641F9-7AC8-48A4-9BD0-085C68D079BF)
iPhone 6 Plus (6E721C69-35C0-4832-91A0-AF27AD2D56A3)
iPhone 6s (6405F87B-3F77-44AA-83CA-EDE6285A8BC5)
iPhone 6s Plus (7A93FD2A-D74F-455A-B7B6-4E34C4DBD645)
iPad 2 (B272DF02-7630-48C8-A58E-03D9ED103844)
iPad Retina (9BE219C4-BCF0-45A5-B583-7072D2925320)
iPad Air (ACE298DC-7147-491A-8BC9-EAD434EAD24E)
iPad Air 2 (907E005B-6540-4666-8D7B-B7C852ADF897)
iPad Pro (5EE15DC2-219E-4EDF-90E2-80A74B9412BA)
```

##### iOS 9.3
```
iPhone 4s (1382D850-CD86-4127-A70F-934FE7DA732D)
iPhone 5 (5EFDD61B-AFA4-40A5-A4CF-4AC06EFCC152)
iPhone 5s (B2CCBA3C-EDD3-4151-A4D0-A46BB6FC1447)
iPhone 6 (5D166C44-5333-4A29-9B0A-EF2C5CD5C21B)
iPhone 6 Plus (3108A62A-85E3-4AFB-8265-2A2742F1ECAF)
iPhone 6s (50590AC4-9A2C-43C3-A746-92E8AB8F220E)
iPhone 6s Plus (D89AB98D-1ACD-41C0-85C0-B1EDD2E4AFA0)
iPad 2 (48E21601-D1FC-4A0A-BB7B-07C1261FB163)
iPad Retina (9B4AFE9A-374A-4EA3-8A74-0638451089EC)
iPad Air (C4B9B3CF-7C98-4CA1-9E21-3D3E2C671C5A)
iPad Air 2 (0887A2DF-BDC0-4D5C-B99E-2D4A8E7162DE)
iPad Pro (7DB50BF2-6719-42DD-A4C0-EFDF953DCE0A)
```

##### iOS 10.0
```
iPhone 5 (9A8BC610-8410-4F05-A02E-D40B486F295C)
iPhone 5s (DB3EC213-DC5A-4A7B-B67C-74F9F0AE61C8)
iPhone 6 (93E357A5-8D67-421B-AE1F-101E7B23C5E6)
iPhone 6 Plus (E6BBB6E0-3875-4398-8FA3-44D293E3F84B)
iPhone 6s (AD0055F7-1C59-46FF-9FC1-941EC7059F13)
iPhone 6s Plus (0C36C045-C61A-4ECB-9D71-66AB973F56CD)
iPhone SE (0268A0FF-AAE6-45F9-A8D7-7DDF97B90D00)
iPad Air (F7B13FC6-C3FC-4049-831F-AE305990F37C)
iPad Air 2 (AA92D85B-FE68-4E29-8763-645EB36301DE)
iPad Pro (9.7 inch) (96BE67CC-ED7F-487F-B786-BEDE602924B3)
iPad Pro (12.9 inch) (6A8BC64A-BB7B-4C58-A8D4-06B54B679457)
```

##### iOS 10.1
```
iPhone 5 (973DE30D-AF9C-4350-90F0-563F64319F35)
iPhone 5s (A9B05762-DA4E-4AC8-B305-C3817EF42C21)
iPhone 6 (5912CE80-FA36-4D88-9569-570827C2054F)
iPhone 6 Plus (4875704E-FC8E-4B6C-8B23-AF6A34666EDC)
iPhone 6s (E694CBFF-006F-41C5-A551-6301D85C3D05)
iPhone 6s Plus (E19D4510-2E7B-4099-8095-2C037FB9ECDF)
iPhone 7 (C55A0C18-8058-4E8D-B28B-D96026E21FA1)
iPhone 7 Plus (4F3FAC25-57CD-4FE8-8C43-0B4E10E39539)
iPhone SE (E89E3485-B8F4-45CD-A6A9-E9FE596CBBC0)
iPad Air (E3BEF9D7-8ABC-472A-A1ED-F1A4765C0D9F)
iPad Air 2 (3C8819E1-2AA7-4142-992C-5A1605E7E6DD)
iPad Pro (9.7 inch) (7996342B-EC80-4B1E-A46B-5E133B7BCB2C)
iPad Pro (12.9 inch) (9D639EDA-1B52-408F-8AAF-031184FF6B71)
```

##### iOS 10.2
```
iPhone 5 (C09E7C8F-C225-4FA8-BF82-08AA5F452340)
iPhone 5s (94D8DD52-F62A-4468-ACE8-236EF347D280)
iPhone 6 (DEC00DF0-5489-4684-B6D2-FB67AEC9D7C0)
iPhone 6 Plus (BC40C4B6-AEFB-493E-A185-9EAFD3906CE2)
iPhone 6s (A465084D-6728-4939-A3D6-D981009CA099)
iPhone 6s Plus (CCD4A968-DE3A-4768-9F9F-179DE98AF86B)
iPhone 7 (CFC13637-8081-4B98-8930-0108FD9EC5F0)
iPhone 7 Plus (DDCCBC03-DA5F-4D07-B5F2-5AF1AD717801)
iPhone SE (B8F7342A-15E4-4B24-851D-949A74BA741B)
iPad Air (417A49F0-F4D2-436B-9C29-F979D8F52A9F)
iPad Air 2 (A6046A18-D0F9-4403-8ED4-5354ABEAE55E)
iPad Pro (9.7 inch) (328A1885-6E8F-42FD-8C00-F9FE9322D147)
iPad Pro (12.9 inch) (2F59536C-2924-40EA-935A-8EF2CC179A9D)
```

##### iOS 10.3
```
iPhone 5 (FD076363-351E-4303-9816-5CA595A1ED4A)
iPhone 5s (5C207C03-C1ED-486B-A7E4-6B4EFDC8E12A)
iPhone 6 (282A3988-60D2-4307-AA07-96F083E178C8)
iPhone 6 Plus (F4B0583A-35B2-42DE-9FC6-E361CBBBDDD3)
iPhone 6s (CB99774D-885A-484F-ADFB-6EF3F456BBE9)
iPhone 6s Plus (C6460843-40E2-42AE-A009-6AD13FF59277)
iPhone 7 (4B2A1263-8F26-4F6F-9111-F7E3A488E29D)
iPhone 7 Plus (BDE386F5-EF76-4092-B822-36294542E65C)
iPhone SE (61706F95-E608-41A6-98BF-E5BF8482D414)
iPad Air (0A174ABC-0C61-4200-9C7F-C8B6DA12F63C)
iPad Air 2 (1D4C8052-D197-4768-9F69-9AFDE5FDF963)
iPad (5th generation) (77322E34-DC2C-49C8-ADC0-BBA7023B9A26)
iPad Pro (9.7 inch) (13EBFE59-90E3-49F4-AA7F-B2672FF41F15)
iPad Pro (12.9 inch) (4A1A1121-4406-4C7F-A5DA-F62C43E69EC0)
iPad Pro (12.9-inch) (2nd generation) (CEE6ED21-EF97-499A-B8E8-664CEAB39B09)
iPad Pro (10.5-inch) (32D2CAF2-239A-4313-9C6B-1FD22CCF0AA9)
```

##### tvOS 10.0
```
Apple TV 1080p (B5CB3CD3-46B1-4608-82B9-54D08A7DC72B
```

##### tvOS 10.1
```
Apple TV 1080p (C5BDC8B8-AC08-4CCF-B777-2F8E9DC7F8CA)
```

##### tvOS 10.2
```
    Apple TV 1080p (385B9475-469A-435D-B711-033F3A52D2F4)
```

##### watchOS 2.2
```
    Apple Watch - 38mm (96B2681E-6E1B-49AE-A222-B170688722B4)
    Apple Watch - 42mm (5E38F695-2BE1-44BD-86F3-FC9C450FC1D6)
```

##### watchOS 3.0
```
Apple Watch - 38mm (911D722D-5C83-4EA5-8150-21B02DD080CF)
Apple Watch - 42mm (A89E9EF5-6047-477A-913D-20D170A3806A)
Apple Watch Series 2 - 38mm (91823FD8-EF2A-4902-89FC-7DE881BACDE0)
Apple Watch Series 2 - 42mm (214C720B-B2F0-4169-B5E9-4A08C4025A33)
```

##### watchOS 3.1
```
Apple Watch - 38mm (AABB01C8-38F7-4522-9339-3DF8144B4896)
Apple Watch - 42mm (E1480FCC-BB93-451D-8F2C-0BF7EFF3EB5F)
Apple Watch Series 2 - 38mm (B6A1B243-EC4E-4CFD-BA20-FBFD99EFD3F8)
Apple Watch Series 2 - 42mm (99FB29C0-DEFC-41C2-BB01-F3D36D3A5557)
```

##### watchOS 3.2
```
Apple Watch - 38mm (0EF9A64C-EF73-41EC-BF91-89A6E8B56233)
Apple Watch - 42mm (6D09C8BE-D7EE-4022-8B3C-DFAFC972E8A6)
Apple Watch Series 2 - 38mm (6EB56F96-6975-4875-B153-598E597D2A3D)
Apple Watch Series 2 - 42mm (6DBBD166-5A43-42AB-BC3F-AAE5A90FD04B)
```

### Device Pairs
```
0349D228-EC54-4C10-BC13-6D27881D5E64 (active, disconnected)
    Watch: Apple Watch - 38mm (0EF9A64C-EF73-41EC-BF91-89A6E8B56233)
    Phone: iPhone 6s (CB99774D-885A-484F-ADFB-6EF3F456BBE9)
617896A7-FB7F-4FD2-AD3F-5E173E272CE4 (active, disconnected)
    Watch: Apple Watch - 42mm (6D09C8BE-D7EE-4022-8B3C-DFAFC972E8A6)
    Phone: iPhone 6s Plus (C6460843-40E2-42AE-A009-6AD13FF59277)
8EB4CAEE-D1D7-4460-B449-F055C15A5397 (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (6EB56F96-6975-4875-B153-598E597D2A3D)
    Phone: iPhone 7 (4B2A1263-8F26-4F6F-9111-F7E3A488E29D)
4597F1D8-8F60-47FE-9AC2-9607F03E91D0 (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (6DBBD166-5A43-42AB-BC3F-AAE5A90FD04B)
    Phone: iPhone 7 Plus (BDE386F5-EF76-4092-B822-36294542E65C)
```


## Android

### Android SDK tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 26.0.2          |

### Android SDK Platform-tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 26.0.0 |

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
| build-tools-17.0.0    | Android SDK Build-tools, Revision 17.0.0  |
| build-tools-19.1.0    | Android SDK Build-tools, Revision 19.1.0  |
| build-tools-20.0.0    | Android SDK Build-tools, Revision 20.0.0  |
| build-tools-21.1.2    | Android SDK Build-tools, Revision 21.1.2  |
| build-tools-22.0.1    | Android SDK Build-tools, Revision 22.0.1  |
| build-tools-23.0.1    | Android SDK Build-tools, Revision 23.0.1  |
| build-tools-23.0.2    | Android SDK Build-tools, Revision 23.0.2  |
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

- Visual Studio for Mac: 7.1.3.1
- Xamarin.iOS: 10.12.3.3
- Xamarin.Android: 7.4.3-1
- Xamarin.Mac: 3.6.3.3
- Mono Framework MDK: Mono JIT compiler version 5.2.0

### Package Management

- NuGet: 4.1.0

### Unit Test Framework

- NUnit: 3.6.1
