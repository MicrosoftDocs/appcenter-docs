---
title: App Center Command-Line Interface (CLI)
description: How to use the CLI to access App Center features
keywords: command-line, app center, visual studio app center, CLI, command-line interface
author: lucen-ms
ms.author: lucen
ms.date: 04/21/2021
ms.topic: article
ms.assetid: f98b1b59-ee20-4ed0-beb9-ec8fd4596ad1
ms.service: vs-appcenter
ms.custom: cli
---

# Command-Line Interface (CLI) Documentation
App Center command-line interface is a unified tool for running App Center services from the command-line. The CLI is a powerful tool for using App Center services and scripting a sequence of commands to execute. You can currently log in and view or configure all the apps that you have access to in App Center.

To get more information on CLI installation and currently supported commands, refer to [App Center CLI GitHub repo](https://github.com/Microsoft/mobile-center-cli).

## Getting Started
### Prerequisites
The recommended Node.js version is 12 or higher.

### Installation
Open a terminal/command prompt, and run `npm install -g appcenter-cli`.

### Logging in
1. Open a terminal/command window.
2. Run `appcenter login`. This opens a browser and generates a new `API token`.
3. Copy the `API token` from the browser, and paste this into the command window.
   ![Image of browser token](~/cli/images/browserToken.png)
4. The command window will display `Logged in as {user-name}`.
   ![Image of terminal login](~/cli/images/terminalLogin.png)
5. Congratulations! You're successfully logged in and can run CLI commands. 

There are two ways to use App Center CLI commands without running `appcenter login` prior:
 
**Using the `--token` parameter**
1. Create a `Full Access` [API token](https://docs.microsoft.com/appcenter/api-docs/) (See steps 1-5).
2. Open a terminal/command window.
3. Add the `--token` switch to the CLI command you're running. For example, run `appcenter apps list --token {API-token}` to get a list of your configured applications. 

**Using the `APPCENTER_ACCESS_TOKEN` environment variable**
You can set the `APPCENTER_ACCESS_TOKEN` environment variable with your API token. This works without having to append the `--token` switch to each CLI command.

### Running your first CLI command
1. Open a terminal/command window.
2. Run `appcenter` to see a list of CLI commands. 
3. Run `appcenter profile list` to get the information about logged in user.

For more details on a list of CLI commands, refer to [App Center CLI GitHub repo](https://github.com/microsoft/appcenter-cli).

**A note about using the `--app` parameter:**

Because of restrictions in how app name parsing is done, application names must not begin with hyphens or other ambiguous characters that may confuse GNU style parsers. You can read more about this in the associated [CLI issue](https://github.com/Microsoft/appcenter-cli/issues/287). 

### Using a proxy

You can use CLI through a proxy. For that, you would need to set up `npm config` and specify environment variable with proxy address.
Note that proxy addresses should be specified with protocols (for example `http://`).

**NPM Configuration**

To set up proxy usage in npm you need to run commands:

```bash
npm config set proxy http://username:password@host:port
npm config set https-proxy http://username:password@host:port
```

**Environment variable**

To set up environment variable run command:

Bash:
```bash
export HTTP_PROXY="http://host:port"
```

PowerShell:
```powershell
$Env:HTTP_PROXY="http://host:port"
```
