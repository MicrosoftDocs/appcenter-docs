---
title: Managing source repository connections
description: How to connect/reconnect to a repository to start building your app
keywords: android
author: nrajpurkar
ms.author: nirjapur
ms.date: 09/20/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: build
ms.assetid: 1EFB8DFD-76D5-4F8C-B73A-2CFBE3E3BD97
---

# Managing source repository connections

App Center supports connections to the following code repository services: [Bitbucket](https://bitbucket.org/), [GitHub](https://github.com/), [Gitlab.com](https://gitlab.com), and [Azure DevOps (formerly VSTS)](https://visualstudio.microsoft.com/team-services/). Build apps in App Center by connecting to one of these providers.

> [!NOTE]
> App Center does not support connections to self-hosted or on-prem versions of the above repository services.
## Connecting to a source repository

To build an app, connect to your code repository service account by selecting the appropriate service from the **Build** tab in your app. Sign-in using the code repository service account credentials if you are not already signed in. Authorizing App Center is required to complete the connection.

Available repositories will populate in App Center after a successful connection. Select a repository and a branch where your app lives and set up your first build.

### Connecting to Self-Hosted GitLab Instances

You may connect to a self-hosted Gitlab instance by providing the instance URL (e.g. `mycompany.gitlab.com`) and a personal access token (PAT). Choose `api` as the scope when creating the PAT for the connection to App Center. The instance must be reachable over the internet. When the PAT expires, any admin on the App Center app can reconnect the connection using their PAT. Edit the connection settings either in the **Build** service when connecting a repository or in **User Settings** > **Developer Accounts**.

## Removing connections and reconnecting

With so many identities, apps (work or personal apps) and authentication methods, you might end up with your App Center account connected to a different code repository service than where your app(s) are living.

If you have connected to a source repository service with the wrong account, you will have to go to your User settings in the source hosting service (Azure DevOps, GitHub or Bitbucket) and revoke the Oauth token manually. Then you can re-connect to another account in App Center.

> [!IMPORTANT]
> Keep in mind that if you connect to a new account, you will lose all the build configuration and previous builds for ALL the apps configured with the previous account.

### Bitbucket

To connect to another Bitbucket account, first revoke the Oauth token. Go to [https://bitbucket.org/account/](https://bitbucket.org/account/) > Access Management (Oauth) > Revoke App Center token. In App Center's **Build** tab, reconnect to Bitbucket and go through the Oauth flow again. Make sure that before you redo the Oauth flow in App Center, you sign out in that browser from Bitbucket first.

![Remove Bitbucket Oauth Token](~/build/images/remove-bitbucket-oauth-token.jpg "Remove Bitbucket token")

### GitHub

If you logged in into App Center with a GitHub account, you can only build apps from repositories under that GitHub account.

To connect to another GitHub account, first revoke the OAuth token. Go to [the GitHub profile web page](https://github.com/settings/profile) > Applications > Authorized OAuth Apps > Revoke App Center token. In App Center's **Build** tab, reconnect to GitHub and repeat the Oauth flow. Sign out from GitHub before reconnecting via the OAuth flow to App Center.

![Remove GitHub Oauth Token](~/build/images/remove-github-oauth-token.jpg "Remove GitHub token")

### <a name="vsts"/>Azure DevOps (formerly Visual Studio Team Services)

To connect to another Azure DevOps account, first revoke the Oauth token. Go to the [Azure DevOps Me Page](https://app.vsaex.visualstudio.com/me) > Manage Authorizations (See screenshot below) > Revoke App Center token. In App Center's **Build** tab, reconnect to Azure DevOps and go through the Oauth flow again. Make sure that before you redo the Oauth flow in App Center, you sign out in the browser from the identity that you used to connect to the previous Azure DevOps account.

> [!NOTE]
> It can take up to 60 minutes for the Azure DevOps token to lose access. After access expires, you can connect App Center to another Azure DevOps account.

![Remove Azure DevOps Oauth Token](~/build/images/remove-vsts-oauth-token.jpg "Remove Azure DevOps token")

[remove-vsts-oauth-token]: ~/build/images/remove-vsts-oauth-token.jpg "Remove Azure DevOps token"
[remove-github-oauth-token]: ~/build/images/remove-github-oauth-token.jpg "Remove GitHub token"
[remove-bitbucket-oauth-token]: ~/build/images/remove-bitbucket-oauth-token.jpg "Remove Bitbucket token"
