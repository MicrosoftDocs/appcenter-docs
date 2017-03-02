---
title: Mobile Center Cloud Build Machines
description: Software used on build machines
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 01/26/2017
ms.topic: article
ms.assetid: 1d1f2f48-1e6c-45da-8cad-0e25200abd98
ms.service: mobile-center
ms.custom: build
---

Each build is ran on a separate, clean virtual machine and no other user has access to this virtual machine. Once the build is completed, the virtual machine is discarded and all files removed. The files resulted from the build (log files, application files, symbol files) are stored on Mobile Center servers.

# OS X Build Machine Image

- Updated: 2017-03-02

## Operating System
- OS X 10.11.6 (15G1004)

## Installed Software

### Language and Runtime
- Ruby ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin15]
- Python Python 2.7.10
- Node.js 6.9.4
- Java 1.8.0_121-b13

### Package Management
- NPM 3.10.10
- Homebrew 1.1.7
- Homebrew/homebrew-core (git revision 7af1a; last commit 2017-01-17)
- bundler Bundler version 1.13.6
- CoCoaPods 1.1.1

### Utilities

- Git 2.11.0
- Git LFS 1.5.3
- Curl 7.43.0 (x86_64-apple-darwin15.0) libcurl/7.43.0 SecureTransport zlib/1.2.5
- GNU Wget 1.18 built on darwin15.5.0

### Project Manangement
- Apache Maven 3.3.9

### Xcode
- Xcode 7.3.1
- Xcode 8.0
- Xcode 8.1
- Xcode 8.2
- Xcode 8.2.1

### Xcode Support

- Nomad CLI 2.6.8
- Nomad CLI IPA ipa 0.14.3
- xctool 0.3.1
- xcpretty 0.2.4

## Installed SDKs

- OS X 10.11                `-sdk macosx10.11`
- OS X 10.12                `-sdk macosx10.12`
- iOS 9.3                   `-sdk iphoneos9.3`
- iOS 10.0                  `-sdk iphoneos10.0`
- iOS 10.1                  `-sdk iphoneos10.1`
- iOS 10.2                  `-sdk iphoneos10.2`
- iOS Simulator 9.3         `-sdk iphonesimulator9.3`
- iOS Simulator 10.0        `-sdk iphonesimulator10.0`
- iOS Simulator 10.1        `-sdk iphonesimulator10.1`
- iOS Simulator 10.2        `-sdk iphonesimulator10.2`
- tvOS 9.2                  `-sdk appletvos9.2`
- tvOS 10.0                 `-sdk appletvos10.0`
- tvOS 10.1                 `-sdk appletvos10.1`
- tvOS Simulator 9.2        `-sdk appletvsimulator9.2`
- tvOS Simulator 10.0       `-sdk appletvsimulator10.0`
- tvOS Simulator 10.1       `-sdk appletvsimulator10.1`
- watchOS 2.2               `-sdk watchos2.2`
- watchOS 3.0               `-sdk watchos3.0`
- watchOS 3.1               `-sdk watchos3.1`
- watchOS Simulator	2.2     `-sdk watchsimulator2.2`
- watchOS Simulator 3.0     `-sdk watchsimulator3.0`
- watchOS Simulator 3.1     `-sdk watchsimulator3.1`

## Installed Simulators

### Device Types
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
iPad Pro (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
iPad Pro (9.7-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro--9-7-inch-)
iPad Pro (12.9-inch) (com.apple.CoreSimulator.SimDeviceType.iPad-Pro)
Apple TV 1080p (com.apple.CoreSimulator.SimDeviceType.Apple-TV-1080p)
Apple Watch - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-38mm)
Apple Watch - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-42mm)
Apple Watch Series 2 - 38mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-38mm)
Apple Watch Series 2 - 42mm (com.apple.CoreSimulator.SimDeviceType.Apple-Watch-Series-2-42mm)
```

### Runtimes
```
iOS 8.4 (8.4 - 12H141) (com.apple.CoreSimulator.SimRuntime.iOS-8-4)
iOS 9.0 (9.0 - 13A344) (com.apple.CoreSimulator.SimRuntime.iOS-9-0)
iOS 9.1 (9.1 - 13B143) (com.apple.CoreSimulator.SimRuntime.iOS-9-1)
iOS 9.2 (9.2 - 13C75) (com.apple.CoreSimulator.SimRuntime.iOS-9-2)
iOS 9.3 (9.3 - 13E230) (com.apple.CoreSimulator.SimRuntime.iOS-9-3)
iOS 10.0 (10.0 - 14A345) (com.apple.CoreSimulator.SimRuntime.iOS-10-0)
iOS 10.1 (10.1 - 14B54) (com.apple.CoreSimulator.SimRuntime.iOS-10-1)
iOS 10.2 (10.2 - 14C89) (com.apple.CoreSimulator.SimRuntime.iOS-10-2)
tvOS 9.2 (9.2 - 13Y227) (com.apple.CoreSimulator.SimRuntime.tvOS-9-2)
tvOS 10.0 (10.0 - 14T328) (com.apple.CoreSimulator.SimRuntime.tvOS-10-0)
tvOS 10.1 (10.1 - 14U591) (com.apple.CoreSimulator.SimRuntime.tvOS-10-1)
watchOS 2.2 (2.2 - 13V143) (com.apple.CoreSimulator.SimRuntime.watchOS-2-2)
watchOS 3.1 (3.1 - 14S452) (com.apple.CoreSimulator.SimRuntime.watchOS-3-1)
```
### Devices

#### iOS 8.4
```
iPhone 4s (ED9D963A-3B9B-4D9F-9E81-713EFF7B2EAF) (Shutdown)
iPhone 5 (D31DEB18-4002-45DE-9AC6-B782A76DCD82) (Shutdown)
iPhone 5s (15843C0E-7D22-4626-A8E5-B3AB4C2E8F1C) (Shutdown)
iPhone 6 (87ACD1EA-747E-4FFC-959F-99B9C252EB36) (Shutdown)
iPhone 6 Plus (256E3CD3-9C68-426E-B97A-F52DFB22F32A) (Shutdown)
iPad 2 (2227851E-A0CF-4260-B500-B385307A7015) (Shutdown)
iPad Retina (46C86ACD-7C42-4074-8946-608BD3B689E8) (Shutdown)
iPad Air (D29FA7A3-D4C0-4974-84F7-08EEC4C23FC5) (Shutdown)
```

#### iOS 9.0
```
iPhone 4s (AEC7A306-BAEE-4202-BDBC-FCDF867FE3DA) (Shutdown)
iPhone 5 (5582D627-6A28-4025-A115-BAC9FE9B3D2F) (Shutdown)
iPhone 5s (8B3EBB0B-C199-4268-8F78-8F87DEEAF8BC) (Shutdown)
iPhone 6 (74945262-A2A3-49EE-B4DB-4213836F2B82) (Shutdown)
iPhone 6 Plus (1CC89566-7733-4590-82AF-05775955C831) (Shutdown)
iPhone 6s (DF5F006F-E561-4EEC-BAE5-D384F17BE0F3) (Shutdown)
iPhone 6s Plus (CB117A07-47BF-424D-AC24-C32B676F0776) (Shutdown)
iPad 2 (C75CCC08-628C-483A-88FB-1095272B38A5) (Shutdown)
iPad Retina (AEDE6ECB-A6A1-463A-A0FB-93EFD85C9BDE) (Shutdown)
iPad Air (F441436B-1340-445C-88C7-2A993E6AAB7F) (Shutdown)
iPad Air 2 (C8E3C554-5313-41FB-97A2-16CA8B14561B) (Shutdown)
```

#### iOS 9.1
```
iPhone 4s (0E392599-5EC4-45DF-A3C6-A51ADF0F76A8) (Shutdown)
iPhone 5 (F3CE6913-D4B3-4595-9049-D186A1B9B378) (Shutdown)
iPhone 5s (5201FEDD-604E-4C08-AB41-8C52A77BC004) (Shutdown)
iPhone 6 (51BCAFE3-48FB-41E2-B625-ECD8B674A6E5) (Shutdown)
iPhone 6 Plus (E67CAED2-4B67-4034-802B-7A04CE96B2DE) (Shutdown)
iPhone 6s (3DFD07D3-55A3-484B-8439-23126E47E62A) (Shutdown)
iPhone 6s Plus (17E79817-4559-4367-916E-3D27E52A8FAE) (Shutdown)
iPad 2 (A5FD33CD-C843-4CA7-A487-2705A2FEE78D) (Shutdown)
iPad Retina (6AF06D0B-2921-4360-B4C0-AD256EE64060) (Shutdown)
iPad Air (8CD85FFA-2FD4-4C89-9247-99BEC9E9BEF7) (Shutdown)
iPad Air 2 (6F777599-C358-4559-A8A8-C7AE576A4ED5) (Shutdown)
iPad Pro (34A9469C-9F18-4BE0-9F78-BC947069605E) (Shutdown)
```

#### iOS 9.2
```
iPhone 4s (35939B2B-5D8F-43CB-8985-DA1F651A42B4) (Shutdown)
iPhone 5 (2E0A666C-2B25-4D9E-B254-D43FD1755479) (Shutdown)
iPhone 5s (DB95DBCC-DCFF-4A0A-A20C-47C728B51F72) (Shutdown)
iPhone 6 (824D7B80-8E06-45ED-B0B2-BE777310CC92) (Shutdown)
iPhone 6 Plus (DFA97541-F157-4A79-B4B6-BF909EB76EDA) (Shutdown)
iPhone 6s (B8E7397A-6BE7-4929-8452-DCEEB9EE1338) (Shutdown)
iPhone 6s Plus (1752292F-ADC7-4597-9D30-87F9A65D2CB9) (Shutdown)
iPad 2 (05A67ED9-3B51-4DDF-88C3-1C1D7FA85801) (Shutdown)
iPad Retina (D3D5FC2D-9974-4D23-8962-B6D0D3893762) (Shutdown)
iPad Air (C9908E7A-73E9-4EF3-ABF8-EBFA67A90F94) (Shutdown)
iPad Air 2 (93AFF4B6-5330-402B-8FEB-A6DB289F98ED) (Shutdown)
iPad Pro (10A6356F-FCF1-4655-931E-F8DF549707D2) (Shutdown)
```

#### iOS 9.3
```
iPhone 4s (123E6ACF-808E-40B4-B1C6-B514A511A628)
iPhone 5 (63C38377-87CA-4559-8F86-CE18287114C5)
iPhone 5s (027D635F-A7A7-47D1-B873-22EE6D3F33BF)
iPhone 6 (3B5A5E2E-8CAE-4416-AF33-36F6F4A913E0)
iPhone 6 Plus (8A5FE4B3-4912-46C4-9D55-9146EE5F2520)
iPhone 6s (F0468876-2193-4E46-91ED-61A6068EDD20)
iPhone 6s Plus (66A867CC-DBC4-45D1-A847-E4BDAB4A7AC6)
iPad 2 (E3F67E02-AE62-46A2-BE66-8C70F732E940)
iPad Retina (9F4A86D6-7816-488B-B419-2D27124410CE)
iPad Air (ECAA5408-3EA9-4405-B650-6CD37A96964A)
iPad Air 2 (EA5B861F-8DBF-471F-B5A3-970ECBECF99A)
iPad Pro (F3698E72-1A8F-41BC-936D-E98FF552424A)
```

#### iOS 10.0
```
iPhone 5 (BECA19B0-F596-4681-B21E-0787BE4652C9)
iPhone 5s (871EE6F1-BECA-486C-8D29-D7B44B33A13A)
iPhone 6 (6D146840-79BF-4158-BDAE-16E2913C81A1)
iPhone 6 Plus (AD1FECE7-385E-4CCF-B340-DE5659C23772)
iPhone 6s (3CACA433-5EDE-473D-BF8D-E111F10C783F)
iPhone 6s Plus (B43C630A-F8D3-43D5-BA9E-0A826C882EE1)
iPhone 7 (BC89B66A-4072-4384-838B-4DEEEF784402)
iPhone 7 Plus (ABD36E4D-2517-4C68-A20B-09C5E5ACF5E7)
iPhone SE (9ED29DF8-F4A5-4F7E-A72B-84A629D76905)
iPad Retina (B2DBF6A2-8401-4818-9154-F60928E62834)
iPad Air (70F57783-A460-4F1D-AE63-42579AE90875)
iPad Air 2 (22A957D4-5834-4734-BC6E-9B24325D834A)
iPad Pro (9.7 inch) (CDAAA6E3-3F34-4BE4-B590-95B1A55F5B17)
iPad Pro (12.9 inch) (A53E8C18-C741-43CE-A708-6331142566AC)
```

#### iOS 10.1
```
iPhone 5 (D66944FD-966A-4EC6-A61F-1D0FC6F59596)
iPhone 5s (9BD4528E-4A8A-42D4-B956-F00ACCA5A9EE)
iPhone 6 (06444057-E6D9-44C0-ADE0-98F81F7D82BC)
iPhone 6 Plus (6F4B6EBE-DD5A-45BE-8AB9-866F06EACA64)
iPhone 6s (3FDAA021-F225-42A8-8793-EE72379A5FAE)
iPhone 6s Plus (E3DD3ED6-BABB-4188-B02D-36DB6E6909C5)
iPhone 7 (2C8CE618-EA34-4B72-A199-8FDE8D624124)
iPhone 7 Plus (286DCF43-114D-44AC-9018-863FC139BCFF)
iPhone SE (A2076AD5-A5B0-4375-994F-236BBC3F9E6B)
iPad Retina (4F8A36D7-A810-4AF3-A610-2980C576E2C1)
iPad Air (1AA0B858-6AE7-4BE1-BC06-BD756AADB2B2)
iPad Air 2 (C76ABDE6-C91C-4032-AEE3-6E122CFE29C8)
iPad Pro (9.7 inch) (9E62E6D0-6DBC-4707-B1DC-C7E1D67F6079)
iPad Pro (12.9 inch) (FCED5A59-9BAF-4866-96F1-A77809E4367D)
```

#### iOS 10.2
```
iPhone 5 (58414E42-6959-4430-97A3-9E1B690DEDBC) (Shutdown)
iPhone 5s (AECFFB76-55D2-41BE-B87B-7031C1FD7D86) (Shutdown)
iPhone 6 (A47B592E-4D53-47E7-B64B-7203B66EE54E) (Shutdown)
iPhone 6 Plus (7060C9AD-D7A1-48E5-9D72-1C3E73CB982F) (Shutdown)
iPhone 6s (21B5279C-2948-4E39-AB7C-679D404F53FF) (Shutdown)
iPhone 6s Plus (3B56D306-D67D-4AF7-8D95-6410A6E0FEF2) (Shutdown)
iPhone 7 (6C5925E8-07D4-4930-AD9C-4E535D381AEC) (Shutdown)
iPhone 7 Plus (8C664357-191B-49D4-85D3-170AC9D8752F) (Shutdown)
iPhone SE (1BC846AF-22DF-45BE-BB31-7AC2458F2701) (Shutdown)
iPad Retina (78EF1CAD-43CB-4475-B03E-B7E374863413) (Shutdown)
iPad Air (67909B2F-CEE7-4B7E-876E-EDEAE67F11AB) (Shutdown)
iPad Air 2 (AC263A77-3EAD-4963-A8D6-1F0EBB00DEEA) (Shutdown)
iPad Pro (9.7 inch) (5FFDA24D-B87F-4971-8782-66A5E63F3742) (Shutdown)
iPad Pro (12.9 inch) (3FCCFED7-454F-4090-BBE0-0116A1CCEA13) (Shutdown)
```

#### tvOS 9.2
```
    Apple TV 1080p (2A855999-B575-4445-8731-C1B1C1C51A22)
```

### tvOS 10.0
```
    Apple TV 1080p (B5CB3CD3-46B1-4608-82B9-54D08A7DC72B
```

### tvOS 10.1 --
```
    Apple TV 1080p (C5BDC8B8-AC08-4CCF-B777-2F8E9DC7F8CA) (Shutdown)
```

#### watchOS 2.2
```
    Apple Watch - 38mm (D6607F94-9BA2-485C-AF7A-03BD45387FF3)
    Apple Watch - 42mm (17C7927C-F3D5-4C51-BF94-D23E9D076B1C)
```

#### watchOS 3.0
```
    Apple Watch - 38mm (911D722D-5C83-4EA5-8150-21B02DD080CF)
    Apple Watch - 42mm (A89E9EF5-6047-477A-913D-20D170A3806A)
    Apple Watch Series 2 - 38mm (91823FD8-EF2A-4902-89FC-7DE881BACDE0)
    Apple Watch Series 2 - 42mm (214C720B-B2F0-4169-B5E9-4A08C4025A33)
```

#### watchOS 3.1
```
    Apple Watch - 38mm (C1F0E07D-133C-4AAC-A2B9-C1F2E7EE4A95)
    Apple Watch - 42mm (EACBCE7B-9EBE-4AC1-A403-8C0E7B1890FC)
    Apple Watch Series 2 - 38mm (093021F7-6F06-43C1-9659-17C729B07FFC)
    Apple Watch Series 2 - 42mm (0363329D-A8B0-4A37-A750-CAD1D8D4F182)
```

#### Android
- Android SDK tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| tools                 | Android SDK Tools, revision 25.2.5          |

- Android SDK Platform-tools

| Package name          | Description                                 |
|-----------------------|---------------------------------------------|
| platform-tools        | Android SDK Platform-tools, revision 25.0.3 |

- Android Platforms

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

- SDK Build tools

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

- Google APIs

| Package name          | Description                               |
|-----------------------|-------------------------------------------|
| google_apis-google-21 | Google APIs, Android API 21, revision 1   |
| google_apis-google-22 | Google APIs, Android API 22, revision 1   |
| google_apis-google-23 | Google APIs, Android API 23, revision 1   |
| google_apis-google-24 | Google APIs, Android API 24, revision 1   |

- Extra packages

| Package name                      | Description                              |
|-----------------------------------|------------------------------------------|
| extra-android-m2repository        | Android Support Repository, revision 43  |
| extra-google-m2repository         | Google Repository, revision 43           |
| extra-google-google_play_services | Google Play services, revision 38        |

#### Xamarin

- Xamarin Studio: 6.1.4.1
- Mono Framework MDK: Mono JIT compiler version 4.6.2.16 (mono-4.6.0-branch/ac9e222 Wed Dec 14 17:02:09 EST 2016)
- Xamarin.iOS: 10.3.1.8
- Xamarin.Android: 7.0.2-42
- Xamarin.mac: 2.10.0.120

#### Device Pairs
```
3A664349-59EF-4DD7-AE9F-509ECDD1FCFA (active, disconnected)
    Watch: Apple Watch - 38mm (2F53DD30-22E2-4E9E-819C-71047954FE71) (Shutdown)
    Phone: iPhone 6s (0EC3F94D-6E9F-4D52-8383-8490B45CEFD3) (Shutdown)

80364A08-B640-42EE-B27F-A40CB4738F23 (active, disconnected)
    Watch: Apple Watch - 42mm (17DF3788-13B0-4169-94F2-CD7EB7E32937) (Shutdown)
    Phone: iPhone 6s Plus (DDA34211-5FD2-4883-908F-A7A56687D572) (Shutdown)

6ABF427D-CD49-4ED7-91DF-12EFB5339FEB (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (A225C70C-F6E0-4E8D-850F-23CD1AF0AAD0) (Shutdown)
    Phone: iPhone 7 (F67BAB83-9936-418B-A449-D9FA3CAE9027) (Shutdown)

718F9538-2C37-4DD3-9B21-69768814E715 (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (EF79176A-248D-4588-9514-D8A2771542AD) (Shutdown)
    Phone: iPhone 7 Plus (C7B21B1C-F7A4-4D0C-804B-4E62C0F89AAB) (Shutdown)

122001D4-7244-429F-A8D1-C9AAFDF906F1 (active, disconnected)
    Watch: Apple Watch Series 2 - 38mm (D246DD85-EDBA-4883-9E4B-24796AD7157D) (Shutdown)
    Phone: iPhone 7 (2EB8AB56-CB9B-46CA-AECE-57AA0C1EBB88) (Shutdown)

82A61469-0A5D-4B37-AA30-9253245ED360 (active, disconnected)
    Watch: Apple Watch Series 2 - 42mm (4D19FFA4-C3EC-4E74-B955-45E01D00102B) (Shutdown)
    Phone: iPhone 7 Plus (F05254EB-1526-497D-99FB-FDB73CE04822) (Shutdown)
    Watch: Apple Watch Series 2 - 38mm (A225C70C-F6E0-4E8D-850F-23CD1AF0AAD0) (Shutdown)
    Phone: iPhone 7 (F67BAB83-9936-418B-A449-D9FA3CAE9027) (Shutdown)
    Watch: Apple Watch Series 2 - 42mm (EF79176A-248D-4588-9514-D8A2771542AD) (Shutdown)
    Phone: iPhone 7 Plus (C7B21B1C-F7A4-4D0C-804B-4E62C0F89AAB) (Shutdown)
```
