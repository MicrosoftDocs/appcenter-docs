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
There are various reasons why your build could have failed; so it helps to start by attempting to isolate as many variables between a working build versus a failing build to understand what could have happened.

# If building works locally but not in App Center
If your build succeeds on your local Windows or Mac computer but not on App Center, that’s usually because of uncommitted files, tooling or dependency differentiation. 

To check for this, you can perform a full git clone of your project into a new folder, this rules out dependencies which are cached locally. Then compile with the same configuration as App Center. This will ideally eliminate the most common root cause of these failures and expedite resolution.  

1. Open your terminal or command line prompt then type in: `mkdir appcenterTest`
2. Then change directories: `cd appcenterTest`
3. Clone your repository with: `git clone -b your-branch https://your-repo`
4. Launch the freshly cloned project in your local IDE or command line. If possible, try comparing the build command executed in App Center to the command executed locally in the respective logs: https://intercom.help/appcenter/build/how-to-find-your-build-command-in-app-center

It's also a good idea to check the versions of the tools you're using against the tools in our Cloud Build Machines: https://docs.microsoft.com/en-us/appcenter/build/software. When multiple versions of the same tool are listed in the doc, the latest version is used by default, but all versions are installed. 

# Comparing different builds in App Center
## Some branches work while others fail
In this case, it's a good idea to check if there are differences in the build settings that are correlated with the failing behavior. 

## Builds fail intermittently
If your builds sometimes work, but sometimes fail; with no change in source code, project settings, or build settings; then it's usually a good idea to check if the type of failure is the same in each case. 

# Isolating and interpreting error messages
## Automatic error highlighting
The Build system automatically attempts to highlight common error messages or useful output to make it more visible:
(Screenshot here)

> jarsigner: unable to sign jar: java.util.zip.ZipException: invalid entry compressed size (expected 13274 but got 13651 bytes)
> ##[error]Error: /usr/bin/jarsigner failed with return code: 1
> ##[error]Return code: 1

Usually when an error occurs, clues can be found in the primary error, the logging before, or the logging afterwards. In this example, app signing is misconfigured. 

## Digging deeper
If you're unable to find any suspect error messages, then the next step is to download the build logs, which you can do from the main build page. Open the folder named `logs_n > Build` and you will see a list of separate log files listed in numerical order. For example:

> 1_Intialize job.txt
> 2_Checkout.txt
> 3_Tag build.txt
etc. 

These logs are numbered and ordered based on the major sub-tasks of your build. Most build failures result in a skipped sequence of these sub-tasks, because when a step fails; usually a few steps immediately after it become invalid, such as in the example below:

> (Steps 1-9)...
> 10_Pre Build Script.txt
> 11_Build Xamarin.Android project.txt
> 12_Sign APK.txt
> 15_Post Build Script.txt
> 20_Post-job Checkout.txt
> 21_Finalize Job.txt

There are two places where the log sequence skipped. However, the first location where it occurred is between log #12 & log #15; therefore, most of the time, the failures in log #12 will be the most interesting as to why the build as a whole failed, essentially the failure _must_ have been while attempting to sign the APK. (This is reasonable because this example is the same as the "jarsigner" error above.)

Essentially, if your builds are consistently failing on one particular step; this approach can help you isolate the problematic step.

# Next Steps
Sometimes just isolating the error message & conditions to encounter the issue can be enough to address it. If not, you have a few options on where to research next:

- Other Build troubleshooting docs: https://docs.microsoft.com/en-us/appcenter/build/troubleshooting/
- Build Help Center: https://intercom.help/appcenter/en/collections/206279-build
- StackOverflow: https://stackoverflow.com/questions/tagged/visual-studio-app-center
- Documentation for the development platform(s) your app uses

# Contacting Support
You can also reach out to AppCenter support by logging into https://appcenter.ms/apps and clicking the chat icon in the lower right corner of the screen. For best results, it's a good idea to open the ticket with:

- A summary of your observations
- Details and citations of your research on the issue
- Links to failing builds that demonstrate the issue
- Links to passing builds for comparison to the failures (if applicable)