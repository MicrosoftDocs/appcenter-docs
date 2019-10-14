---
title: Manage App Center Distribution Groups
description: Distribute mobile apps to groups of users
keywords: distribution
author: botatoes
ms.author: bofu
ms.date: 10/14/2019
ms.topic: article
ms.assetid: 65c820ac-e2ec-4ab1-9d2e-bbc2ddac2640
ms.service: vs-appcenter
ms.custom: distribute
---

# Manage App Center Distribution Groups

## Manage Distribution Groups

Distribution Groups are used to control access to releases. A Distribution Group represents a set of users that can be managed jointly and can have common access to releases. Example of Distribution Groups can be teams of users, like the QA Team or External Beta Testers, or can represent stages or rings of releases, such as Staging.

## Creating a Distribution Group

To create a new Distribution Group, sign in to the App Center portal, select your desired app, click **Distribute** in the navigation pane, and lastly select the **New Group** group button from the top of the screen. Provide a name for the Distribution Group. You can then add users to this group by email. You can also add additional users after the group has been created.

## Managing Users in a Distribution Group

Clicking on a Distribution Group will allow for management of the group. You can use the invitation box to add additional users. Select users from the table to remove them from the group.

From this page, you can also see the full release history for this Distribution Group by clicking on the Releases tab.

## Types of Distribution Groups

### Private Distribution Groups

In App Center, distribution groups are private by default. Only testers invited via email can access the releases available to this group. Testers added to this group will receive a notification that they have been added to the app to test. After a release, testers that were previously added to this group will receive the new release notification email and will be required to sign in to their App Center account in order to access and download releases.

### Public Distribution Groups

Distribution groups must be public to enable unauthenticated installs from public links. When creating a new distribution group, the options is available during the setup process. After giving your group a name, you can enable **Allow public access**.

To make an existing distribution group public, open the distribution group and click on the settings icon in the upper right-hand corner of the screen. From the settings modal, you can enable **Allow public access**.

As with private distribution groups, testers will receive an email notifying them that they've been invited to test the app and when a release is available to them. In order to access the app from here, testers will be required to sign in with their App Center account.

In addition to this, a **public download link** is displayed underneath the distribution group name at the top of the distribution group page. **Anyone, including testers who aren't explicitly added to the distribution group, can access the release without signing in using the public download link**.

### Shared Distribution Group

Shared distribution groups are private or public distribution groups that are shared across multiple apps in a single organization. Shared distribution groups eliminate the need to replicate distribution groups across multiple apps. With a few clicks, you can give a shared distribution group access to any combination of apps belonging to a particular organization.

Unlike traditional public and private distribution groups, shared distribution groups are at the organization level rather than the app level. Due to this, the steps to create one are slightly different:

1. Sign in to the App Center portal, then select the organization to which you would like to add a shared group.
2. On the navigator pane that opens, click **People**.
3. On the People page, click the distribution group link to open the shared distribution groups page.
4. On the top-right corner of the shared distribution groups page, select the blue **Create new group** button.

Once you have a distribution group, click the group entry in the table to add testers and apps to the group.

To add testers to your new shared distribution group, select the **Testers** tab and enter the emails of the desired testers.

To add apps to your new shared distribution group, select the **Apps** tab and enter the name of the desired apps that this group should have access to.

## Automatically manage devices

Ordinarily, when you release an iOS app signed with an ad-hoc or development provisioning profile, you must obtain each tester's device IDs (UDIDs) and add them to the provisioning profile before compiling the release.

By enabling the distribution group's **Automatically manage devices** setting, App Center automates this process, updating the provisioning profile every time a tester registers a new device.

> [!NOTE]
> As part of automating the workflow, you must provide the user name and password for your Apple ID and your production certificate in a .p12 format.

Whenever a new device is added, App Center will ensure that all devices from the target distribution group are registered in your developer portal, using your Apple ID, and then all provisioning profiles used in the app will be re-generated with both existing and new device IDs. The re-generated provisioning profiles are then downloaded to App Center servers.

App Center uses your saved certificate, and the re-generated provisioning profiles, to re-sign the current version of your app so it can be installed on any device in the release's distribution group, without waiting for a new version of your app to be built. A download link to the newly signed release will be available through the [App Center Install portal](https://install.appcenter.ms).

Read more about [what re-signing is](auto-provisioning.md#app-signing-re-signing-and-device-provisioning) and [privacy concerns when App Center stores your Apple ID and certificate](auto-provisioning.md#privacy-concerns-on-username-and-password).

## Adding Azure Active Directory (AAD) security groups to a Distribution Group

App Center supports adding AAD security groups to a distribution group. Any member of an AAD security group can link their organization's subscription to their AAD tenant in App Center. Doing so will enable members of an organization to start adding managed groups to their app's distribution groups.

To get started, link your AAD tenant to your organization:

1. Sign in to the App Center portal, then select the organization to link to your AAD tenant.
2. On the navigator pane that opens, click **Manage**.
3. On the Azure Active Directory panel on the Manage page, click **Connect**.
4. You will be redirected to a Microsoft page where you can sign in with your Azure AD account.
5. After logging in, you will be redirected to the App Center portal. Click on the desired tenant you would like to attach.
6. At the bottom right of the presented window, click **Connect**.

Once your tenant is connected to the organization, you can add AAD security groups to the distribution group, using the same page you use to [add individual testers](#managing-users-in-a-distribution-group).

## Releasing a Build to a Distribution Group

To [release a new build][upload] to a Distribution Group. Make use of the **Distribute new Release** button at the top of the screen and choose the Distribution Group from the list during the steps.

> [!NOTE]
> Testers added to a distribution group because they are members of an AAD security group will not receive emails when new builds are released. If you have users who should receive emails for each release, you should add them directly to the distribution group.

## User Download Analytics

User download analytics allow you to monitor how testers within a distribution group are interacting with a release. Total and unique download counts for a release are available both at the top of each distribution group page as well as on the Release Details page. The total download count represents the total number of times the Install button has been clicked by a tester. The unique download count represents the number of users that have installed the release. For example, if one tester has downloaded a release to two different test devices, this would equal two total downloads and one unique download.

Public distribution groups include only the total download count, and not the unique download count.

[app_users]: ~/dashboard/creating-and-managing-apps.md
[upload]: ~/distribution/uploading.md
