---
title: Diagnosing Failed Builds
description: How to find and interpret errors in App Center Build
author: king-of-spades
ms.author: kegr
ms.date: 09/10/2019 
ms.topic: article 
ms.assetid: b39854a6-c523-4a66-bef6-9b5da03ba256 (a unique number representing the asset - just use a GUID, you can generate one at https://www.guidgenerator.com/)
ms.service: vs-appcenter 
ms.custom: build
---

# Diagnosing failed builds
There are various reasons why your build could have failed that might be unique to your project. So usually the most efficient way to diagnose build failures is to compare it to a working build. This  can help you minimize variables and identify the most relevant error conditions for your scenario. 

# If building works locally but not in App Center
If your build succeeds on your local Windows or Mac computer but not on App Center, that’s usually because of uncommitted files, tooling or dependency differentiation. To check, you can do a full git clone of your project into a new folder, to rule out dependencies that are cached locally. Then compile with the same configuration as App Center. This can eliminate the most common root cause of these failures.  

1. Open your terminal or command-line prompt then type in: `mkdir appcenterTest`
2. Then change directories: `cd appcenterTest`
3. Clone your repository with: `git clone -b your-branch https://your-repo`
4. Launch the freshly cloned project in your local IDE or command line. 
5. Try comparing the build command executed in App Center to the command executed locally: https://intercom.help/appcenter/build/how-to-find-your-build-command-in-app-center

You can check the versions of the tools you're using against the tools in our Cloud Build Machines: https://docs.microsoft.com/en-us/appcenter/build/software. When multiple versions of the same tool are listed in the doc, the latest version is used by default, but all versions are installed. 

# Comparing different builds in App Center
## Some branches work while others fail
Try checking for differences in the build settings or committed code between branches. 

## Builds fail intermittently
It's possible for a build to fail without any change in source code, project settings, or build settings. Try checking if the error for the build is consistent when the failures occur. 

# Isolating and interpreting error messages
## Automatic error highlighting
The Build system automatically attempts to highlight common error messages or useful output to make it more visible:
(Screenshot here)

> jarsigner: unable to sign jar: java.util.zip.ZipException: invalid entry compressed size (expected 13274 but got 13651 bytes)
> ##[error]Error: /usr/bin/jarsigner failed with return code: 1
> ##[error]Return code: 1

Usually when an error occurs, clues can be found in the primary error, the logging before, or the logging afterwards. In this example, app signing is misconfigured. 

## Digging deeper
If you don't find relevant error messages, then the next step is to download the build logs, which you can do from the main build page. Open the folder named `logs_n > Build` and you'll see a list of separate log files listed in numerical order. For example:

- 1_Intialize job.txt
- 2_Checkout.txt
- 3_Tag build.txt
- etc. 

Logs are numbered based on the major tasks of your build. Most build failures cause subsequent tasks to be skipped which indicated when the failure happened.

- (Steps 1-9)...
- 10_Pre Build Script.txt
- 11_Build Xamarin.Android project.txt
- 12_Sign APK.txt
- 15_Post Build Script.txt
- 20_Post-job Checkout.txt
- 21_Finalize Job.txt

The first log skipped is log #13. The log before it, "12_Sign APK.txt" probably has the most relevant errors to why the build failed. Other steps might have been skipped or hit failures, but they're less likely to be the primary failure in the build. 

# Next Steps
If comparing builds or isolating errors doesn't fix the issue; you have a few options on where to research next:

- Other Build troubleshooting docs: https://docs.microsoft.com/en-us/appcenter/build/troubleshooting/
- Build Help Center: https://intercom.help/appcenter/en/collections/206279-build
- StackOverflow: https://stackoverflow.com/questions/tagged/visual-studio-app-center
- Documentation for the development platform(s) your app uses

# Contacting Support
If you need more help, log into https://appcenter.ms/apps and click the chat icon in the lower right corner of the screen. For best results, it's a good idea to open the ticket with:

- A summary of your observations
- Details and citations of your research on the issue
- Links to failing builds that demonstrate the issue
- Links to passing builds for comparison to the failures (if applicable)
