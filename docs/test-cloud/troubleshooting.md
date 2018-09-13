---
# required metadata
title: Troubleshooting | App Center Test
description: Troubleshooting App Center Test
keywords: test, troubleshooting
author: glennwester
ms.author: glwest
ms.date: 08/12/2018
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 6a1da1b3-66d8-4088-9544-76877a8b4410
---

# Troubleshooting App Center Test

## Exit codes

The CLI tool returns an exit code which reflects whether Test received the necessary information or errors. In the table below, exit codes are listed and paired with an explanation.

| Exit code | Explanation |
| --------- | ----------- |
|  0 | Success |
|  1 | Unknown Error |
|  2 | Invalid Options |
|  3 | App File Not Found |
|  4 | Assembly Directory Not Found |
|  5 | NUnit Not Found |
|  6 | UITest Not Found |
|  7 | Test Assemblies Not Found |
|  8 | Sign Info File Not Found |
|  9 | Key Store Not Found |
| 10 | dSym Not Found Or Not Directory |
| 11 | dSym Directory Wrong Extension |
| 12 | dSym Contains More than One Dwarf |
| 13 | Test Chunking Failed |
| 14 | Upload Negotiation Failed |
| 15 | Upload Failed |
| 16 | Job Status Retrival Failed |
| 17 | NUnit Report Not Returned |
| 18 | Job Failed |
| 19 | Test Failures |
| 20 | Incompatible Versions |
| 21 | No Tests Would Run |
| 22 | Data File Not Contained In Assembly Directory |
| 23 | Data File Not Found |
| 24 | Did Not Pass Validation |
| 25 | Cancelled |
| 26 | NUnit Version Unsupported |
| 27 | Artifacts Directory Invalid |

## Getting help

You can always contact us through [the chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). Be aware that we do not provide 24/7 support, but will strive to reply as fast as possible.

To help debug your test run, you can navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.
