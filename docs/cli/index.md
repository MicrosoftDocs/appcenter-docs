---
title: App Center Command Line Interface (CLI)
description: How to use the CLI to access App Center features
keywords: command line, app center, visual studio app center, CLI, command line interface
author: amchew
ms.author: amchew
ms.date: 08/08/2018
ms.topic: article
ms.assetid: f98b1b59-ee20-4ed0-beb9-ec8fd4596ad1
ms.service: vs-appcenter
ms.custom: cli
---

# Command Line Interface (CLI) Documentation

App Center command line interface is a unified tool for running App Center services from the command line. Our aim is to offer a concise and powerful tool for our developers to use App Center services and easily script a sequence of commands that they'd like to execute. You can currently login and view/configure all the apps that you have access to in App Center.

Although our current feature set is minimal, all the existing App Center services will be added going forward. Note that the App Center CLI is currently in public preview.

To get more information on CLI installation and currently supported commands, please refer to [App Center CLI GitHub repo](https://github.com/Microsoft/mobile-center-cli).

## Getting Started

### Pre-requisites
App Center CLI requires Node.js version 8 or better.

### Installation
Open a terminal/command prompt, and run `npm install -g appcenter-cli`.

### Logging in

1. Open a terminal/command window.
2. Run `appcenter login`. This will open a browser and generate a new `API token`.
3. Copy the `API token` from the browser, and paste this into the command window.
   ![Image of browser token](~/cli/images/browserToken.png)
4. The command window will display `Logged in as {user-name}`.
   ![Image of terminal login](~/cli/images/terminalLogin.png)
5. Congratulations! You are successfully logged in and can run CLI commands. 

There are two ways to use App Center CLI commands without running `appcenter login` prior:
 
**Using the `--token` parameter:**

1. Create a `Full Access` [API token](https://docs.microsoft.com/en-us/appcenter/api-docs/) (See steps 1-5).
2. Open a terminal/command window.
3. Add the `--token` switch to the CLI command you are running. For example, run `appcenter apps list --token {API-token}` to get a list of your configured applications. 

**Using the `APPCENTER_ACCESS_TOKEN` environment variable:**
  
  You can set the `APPCENTER_ACCESS_TOKEN` environment variable with your API token. This will work without having to append the `--token` switch to each CLI command.

### Running your first CLI command

1. Open a terminal/command window.
2. Run `appcenter` to see a list of CLI commands. 
3. Run `appcenter profile list` to get the information about logged in user.

For more details on a list of CLI commands, please refer to [App Center CLI GitHub repo](https://github.com/microsoft/appcenter-cli).
