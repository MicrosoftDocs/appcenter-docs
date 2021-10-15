---
author: lucen-ms
ms.author: lucen
ms.date: 10/13/2021
ms.topic: include
---

2. Open the project’s **AndroidManifest.xml** file. Add the `android:dataExtractionRules` attribute to the `<application>` element. It should point to the **appcenter_backup_rule.xml** resource file.

```text
android:dataExtractionRules="@xml/appcenter_backup_rule"
```

3. Add the following backup rules to the **appcenter_backup_rule.xml** file:

```xml
<data-extraction-rules xmlns:tools="http://schemas.android.com/tools">
    <cloud-backup>
        <exclude domain="sharedpref" path="AppCenter.xml"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence-journal"/>
        <exclude domain="file" path="error" tools:ignore="FullBackupContent"/>
        <exclude domain="file" path="appcenter" tools:ignore="FullBackupContent"/>
    </cloud-backup>
    <device-transfer>
        <exclude domain="sharedpref" path="AppCenter.xml"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence"/>
        <exclude domain="database" path="com.microsoft.appcenter.persistence-journal"/>
        <exclude domain="file" path="error" tools:ignore="FullBackupContent"/>
        <exclude domain="file" path="appcenter" tools:ignore="FullBackupContent"/>
    </device-transfer>
</data-extraction-rules>
```
