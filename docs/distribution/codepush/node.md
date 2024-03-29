---
title: CodePush Management SDK
description: "Learn how to utilize the Management SDK"
keywords: distribution
author: lucen-ms
ms.author: lucen
ms.date: 12/23/2019
ms.topic: article
ms.assetid: 5A294968-C232-41B4-BAD3-EF23981C91F2
ms.service: vs-appcenter
ms.custom: distribute
---

# CodePush Management SDK

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

A JavaScript library for programmatically managing your App Center account (e.g. creating apps, promoting releases), which allows authoring Node.js-based build or deployment scripts, without needing to shell out to the [CLI](./CLI.md).

## Getting Started

1. Create a token to authenticate with the App Center server using the following App Center command:

    ```shell
    appcenter tokens create -d "DESCRIPTION_OF_THE_KEY"
    ```

    `API Token` will be displayed only once, so remember to save it somewhere if needed!

2. Install the management SDK by executing:
    
    ```shell
    npm install code-push --save
    ```

3. Import it using the following statement (using ES6 syntax as applicable):
    * On commonjs environments:

    ```javascript
    const CodePush = require("code-push");    
    ```
    
    * Using ES6 syntax with tsconfig.json:

    ```javascript
    import CodePush from "code-push";
    ```

4. Create an instance of the `CodePush` class, passing it the `API Token` you created in step #1:

    ```javascript
    const codePush = new CodePush("YOUR_API_TOKEN");
    ```

5. Begin automating the management of your account! For more details on what you can do with this `codePush` object, refer to the API reference section below.

## API Reference

The `code-push` module exports a single class (typically referred to as `CodePush`), which represents a proxy to the CodePush account management REST API. This class has a single constructor for authenticating with the CodePush service, and a collection of instance methods that correspond to the commands in the management [CLI](~/distribution/codepush/cli.md), which allow you to programmatically control every aspect of your App Center account.

### Constructors

- **CodePush(accessKey: string)** - Creates a new instance of the CodePush management SDK, using the specified access key to authenticated with the server.

### Methods

> [!NOTE]
>  `access key` here refers to an AppCenter API Token.

- **addAccessKey(description: string): Promise&lt;AccessKey&gt;** - Creates a new access key with the specified description (e.g. "Azure DevOps CI").
- **addApp(appName: string, os: string, platform: string, manuallyProvisionDeployments: boolean = false): Promise&lt;App&gt;** - Creates a new CodePush app with the specified name, os, and platform. If `manuallyProvisionDeployments` is set to true, the app won't create the default deployments of "Staging" and "Production"; if unspecified or set to false, it will.
- **addCollaborator(appName: string, email: string): Promise&lt;void&gt;** - Adds the specified CodePush user as a collaborator to the specified CodePush app.
- **addDeployment(appName: string, deploymentName: string): Promise&lt;Deployment&gt;** - Creates a new deployment with the specified name, and for the specified app.
- **clearDeploymentHistory(appName: string, deploymentName: string): Promise&lt;void&gt;** - Clears the release history for the specified app deployment.
- **getAccessKey(accessKey: string): Promise&lt;AccessKey&gt;** - Retrieves the metadata about the specific access key.
- **getAccessKeys(): Promise&lt;AccessKey[]&gt;** - Retrieves the list of access keys for your CodePush account.
- **getApp(appName: string): Promise&lt;App&gt;** - Retrieves the metadata about the specified app.
- **getApps(): Promise&lt;App[]&gt;** - Retrieves the list of apps for your CodePush account.
- **getCollaborators(appName: string): Promise&lt;CollaboratorMap&gt;** - Retrieves the list of collaborators for the specified app.
- **getDeployment(appName: string, deploymentName: string): Promise&lt;Deployment&gt;** - Retrieves the metadata for the specified app deployment.
- **getDeploymentHistory(appName: string, deploymentName: string): Promise&lt;Package[]&gt;** - Retrieves the list of releases that have been made to the specified app deployment.
- **getDeploymentMetrics(appName: string, deploymentName): Promise&lt;DeploymentMetrics&gt;** - Retrieves the installation metrics for the specified app deployment.
- **getDeployments(appName: string): Promise&lt;Deployment[]&gt;** - Retrieves the list of deployments for the specified app.
- **patchRelease(appName: string, deploymentName: string, label: string, updateMetadata: PackageInfo): Promise&lt;void&gt;** - Updates the specified release's metadata with the given information.
- **promote(appName: string, sourceDeploymentName: string, destinationDeploymentName: string, updateMetadata: PackageInfo): Promise&lt;void&gt;** - Promotes the latest release from one deployment to another for the specified app and updates the release with the given metadata.
- **release(appName: string, deploymentName: string, updateContentsPath: string, targetBinaryVersion: string, updateMetadata: PackageInfo): Promise&lt;void&gt;** - Releases a new update to the specified deployment with the given metadata.
- **removeAccessKey(accessKey: string): Promise&lt;void&gt;** - Removes the specified access key from your CodePush account.
- **removeApp(appName: string): Promise&lt;void&gt;** - Deletes the specified CodePush app from your account.
- **removeCollaborator(appName: string, email: string): Promise&lt;void&gt;** - Removes the specified account as a collaborator from the specified app.
- **removeDeployment(appName: string, deploymentName: string): Promise&lt;void&gt;** - Removes the specified deployment from the specified app.
- **renameApp(oldAppName: string, newAppName: string): Promise&lt;void&gt;** - Renames an existing app.
- **renameDeployment(appName: string, oldDeploymentName: string, newDeploymentName: string): Promise&lt;void&gt;** - Renames an existing deployment within the specified app.
- **rollback(appName: string, deploymentName: string, targetRelease?: string): Promise&lt;void&gt;** - Rolls back the latest release within the specified deployment. Optionally allows you to target a specific release in the deployment's history, as opposed to rolling to the previous release.

### Error Handling

When an error occurs in any of the methods, the promise will be rejected with a CodePushError object with the following properties:

- **message**: A user-friendly message that describes the error.
- **statusCode**: An HTTP response code that identifies the category of error:
  - **CodePush.ERROR_GATEWAY_TIMEOUT**: A network error prevented you from connecting to the CodePush server.
  - **CodePush.ERROR_INTERNAL_SERVER**: An error occurred internally on the CodePush server.
  - **CodePush.ERROR_NOT_FOUND**: The resource you're attempting to retrieve does not exist.
  - **CodePush.ERROR_CONFLICT**: The resource you're attempting to create already exists.
  - **CodePush.ERROR_UNAUTHORIZED**: The access key you configured is invalid or expired.
