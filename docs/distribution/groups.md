---
title: Manage App Center Distribution Groups
description: Distribute mobile apps to groups of users
keywords: distribution
author: lucen-ms
ms.author: kegr
ms.date: 02/11/2021
ms.topic: article
ms.assetid: 65c820ac-e2ec-4ab1-9d2e-bbc2ddac2640
ms.service: vs-appcenter
ms.custom: distribute
---

# Manage App Center Distribution Groups
## Manage Distribution Groups
Distribution Groups are used to control access to releases. A Distribution Group represents a set of users managed jointly and with common access to releases. For example, Distribution Groups include teams of users, like QA or External Beta Testers, or can represent stages or rings of releases, such as Staging.

## Creating a Distribution Group
To create a Distribution Group, sign in to the App Center portal, select your app, click **Distribute > New Group**. Name the Distribution Group. You can add users to the group by email.

## Types of Distribution Groups
### Private Distribution Groups
In App Center, distribution groups are private by default. Only testers invited via email can access the releases available to this group. Testers added to this group will receive a notification that they've been added to the app to test. After a release, testers will receive a new release notification email and must sign in to App Center to access the release.

### Public Distribution Groups
Distribution groups must be public to enable unauthenticated installs from public links. When creating a new distribution group, the options is available during the setup process. After giving your group a name, you can enable **Allow public access**.

To make an existing group public, open the group and click on the settings icon in the upper right-hand corner of the screen. Then enable **Allow public access**.

As with private distribution groups, testers receive emails notifying inviting them to test the app and when releases are available. To access the app, testers are required to sign in with their App Center account.

Also, a **public download link** is under the distribution group name at the top of the distribution group page. **Anyone can access the release without signing in using the public download link**.

### Shared Distribution Groups
Shared distribution groups are private or public distribution groups that are shared across multiple apps in a single organization. Shared distribution groups eliminate the need to replicate distribution groups across multiple apps. You can give a shared distribution group access to any combination of apps in your organization.

Unlike app-level distribution groups, shared distribution groups are at the organization level rather than the app level. To create a shared distribution group:
1. Sign in to the App Center portal, then select the organization to which you want to add the shared group.
2. On the navigator pane that opens, click **People**.
3. On the People page, click the distribution group link to open the shared distribution groups page.
4. On the top-right corner of the shared distribution groups page, select the blue **Create new group** button.

Once you have a distribution group, click the group entry in the table to add testers and apps to the group.

To add testers to your new shared distribution group, select the **Testers** tab and enter the emails of the testers.

To add apps to your new shared distribution group, select the **Apps** tab and enter the name of the apps that this group should have access to.

## Managing Users in a Distribution Group
### Adding testers
Clicking on a Distribution Group will allow for management of the group. You can use the invitation box to add additional users.

> [!NOTE]
> Invites are active for 30 days. You can send a new invite if the previous one wasn't accepted.

If your organization is connected to Azure Active Directory, you can also [add Azure AD security groups](#adding-azure-active-directory-aad-security-groups-to-a-distribution-group) to your distribution group.

### Removing testers
Select users from the table to remove them from the group.

From this page, you can also see the full release history for this Distribution Group by clicking on the Releases tab.

## Automatically manage devices
Ordinarily, when you release an iOS app that's signed with an ad-hoc or development provisioning profile, you must obtain each tester's device IDs (UDIDs) and add them to the provisioning profile before you compile the release.

By enabling the distribution group's **Automatically manage devices** setting, App Center automates this process, updating the provisioning profile every time a tester registers a new device. This setting can only be accessed through an app-level distribution group and isn't available through a global group. You can access an app-level distribution group by selecting the app in App Center, then clicking on **Distribute**. Under Distribute, click on **Groups** and then click the specific group that you want to manage. You can also opt in to automatically adding devices when you distribute a new release. This option is in the **Devices** step in the wizard for distributing a new release.

> [!NOTE]
> As part of automating the workflow, you must provide the user name and password for your Apple ID and your production certificate in a .p12 format.

When a new device is added, App Center ensures that all devices from the target distribution group are registered in your developer portal using your Apple ID. App Center also checks that all provisioning profiles used in the app are regenerated with existing and new device IDs. The regenerated provisioning profiles are then downloaded to App Center servers.

App Center uses your saved certificate and the regenerated provisioning profiles, to re-sign the current version of your app. This way it can be installed on any device in the release's distribution group, without needing a new version to be built. A download link to the newly signed release will be available through the [App Center Install portal](https://install.appcenter.ms).

Read more about [what re-signing is](auto-provisioning.md#app-signing-re-signing-and-device-provisioning) and [privacy concerns when App Center stores your Apple ID and certificate](auto-provisioning.md#privacy-concerns-on-username-and-password).

## Adding Azure Active Directory (AAD) security groups to a Distribution Group
App Center supports adding AAD security groups to a distribution group, after your App Center organization is connected to your Azure Active Directory tenant.

To connect Azure AD tenants to App Center, see [Connecting to Azure Active Directory](~/general/connecting-to-azure-active-directory.md).

Once your tenant is connected to the organization, you can add AAD security groups to the distribution group, using the same page you use to [add individual testers](#managing-users-in-a-distribution-group).

## Releasing a Build to a Distribution Group
To [release a new build][upload] to a Distribution Group, use the **Distribute new Release** button at the top of the screen. Finally, choose the Distribution Group from the list.

> [!NOTE]
> Testers added as members of an AAD security group don't require an App Center login, so they won't be emailed for new build releases. Add testers directly to the distribution group if they should be emailed for each release.

## User Download Analytics
User download analytics allow you to monitor how testers within a distribution group are interacting with a release. Total and unique download counts for a release are available both at the top of each distribution group page and on the Release Details page. The total download count represents the total number of times the Install button has been clicked by a tester. The unique download count represents the number of users that have installed the release. For example, if one tester has downloaded a release to two different test devices, you'd see two total downloads and one unique download.

Public distribution groups include only the total download count, and not the unique download count.

[app_users]: ~/dashboard/creating-and-managing-apps.md
[upload]: ~/distribution/uploading.md
