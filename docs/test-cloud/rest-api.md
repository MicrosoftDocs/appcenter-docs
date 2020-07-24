---
title: Run UI Tests using App Center REST API
description: Steps to upload the package (ipa/apk) via REST API and queue the UI Tests
keywords: appcenter, test, rest, api
ms.author: anvesh.kasani
ms.date: 07/24/2020
ms.topic: article
ms.assetid: 2abb4242-658c-4914-8ec0-d0c4967d3729
---

# Run UI Tests using App Center REST API
This example shows how to upload an app package, test binaries, and queue UI tests using our API. 

## Steps
1. Use the [create test run POST method](https://openapi.appcenter.ms/#/test/test_createTestRun) to receive a **test run ID** which you'll use later for the Response Header.

**Sample Request** https://api.appcenter.ms/v0.1/apps/MSKASANI/DroidAppSampleXamarin/test_runs 
![Screenshot demonstrating API usage](images/test-runs-api.png)

2. **Create file hashes** for each file you want to upload to App Center Test.

You can get the file hashes by running the command `shasum`. This utility is available in Mac/Linux machines by default. For Windows, consider installing Git Bash and use it instead.

**Example**
```bash
ankasani@AK--PC MINGW64 ~/source/repos/AppXamarin/sampleapp-xamarin-master/UITest/bin/Debug/testdlls (master)

$ shasum nunit.framework.dll
 a2d0dbc920fb3790d4d625e5c47be042ca32c051 *nunit.framework.dll

$ shasum Xamarin.UITest.dll
c1f7342d05a9d95580a507156207e6f9283a2c8d *Xamarin.UITest.dll

$ shasum UITest.dll
542153902bc889d0d85a83b005854b5ebd9864f1 *UITest.dll

$ shasum com.mobilecenter.sampleappxamarin.apk
3f3677f8db9ba7c07ac77d4f01f912e518a6ca16 *com.mobilecenter.sampleappxamarin.apk
```

3. [Create a store for files](https://openapi.appcenter.ms/#/test/test_uploadHashesBatch) using POST and hashes value calculated from the previous step. 

**Sample Request**
https://api.appcenter.ms/v0.1/apps/MSKASANI/DroidAppSampleXamarin/test_runs/fb0cc373-aa4a-455f-b083-4fc1afa87f2e/hashes/batch

   - **file_type** - app-file for apk\ipa and test-file for test assemblies/test related files.

   - **checksum** - hash values from step 2 

   - **relative_path** - you can just define File Name with Extension, no need to specify the complete path.
   
The JSON Body looks like:

```json
[
    {
     "file_type":"app-file", 
     "checksum":"3f3677f8db9ba7c07ac77d4f01f912e518a6ca16",
     "relative_path":"com.mobilecenter.sampleappxamarin.apk"
    }, 
    
    {
     "file_type":"test-file",
     "checksum":"a2d0dbc920fb3790d4d625e5c47be042ca32c051",
     "relative_path":"nunit.framework.dll"
    }, 
    
    {
     "file_type":"test-file",
     "checksum":"c1f7342d05a9d95580a507156207e6f9283a2c8d",
     "relative_path":"Xamarin.UITest.dll"
    }, 
    
    {
     "file_type":"test-file",
     "checksum":"542153902bc889d0d85a83b005854b5ebd9864f1",
     "relative_path":"UITest.dll"
    }
]
```
![Screenshot demonstrating Test API upload json](images/test-api-json.png)

The response looks like:
```json
[
    {
     "fileType": "app-file",
     "checksum": "3f3677f8db9ba7c07ac77d4f01f912e518a6ca16",
     "relativePath": "com.mobilecenter.sampleappxamarin.apk",
     
     "uploadStatus":
        {
         "statusCode": 412,
         "location": "https://testcloud.xamarin.com/v0.1/direct_uploads?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKU1V6STFOaUo5LmV5SjBaWE4w%0AWDNKMWJsOXBaQ0k2SWpjNU5EVmpNbUZtTFRFeFpXTXROR1ptWVMwNU1XSTBM%0AVFExTUdJd09EVTNNbU5sT1NJc0ltVjRjQ0k2TVRVek16Z3dOVFEzTUgwLlJO%0AaTQ3VTNPYTB5YWswMVRVdTV6Q0dfWFhwV25QUWJDdkJaNmVCRWRmOENuQ19U%0AbmdpRGI4MU0yYk1lTlZNY1VCVmRWLXlkRjh4dElLaU1yNFdtQUFhOFdoay02%0AOVVjb29rYkNTYUU2eUlzamowZlZPZVJhR2lFdGpvLWJHTFJLcXNGY0ZTeUdR%0ARTQzQUZ1TFlyTWlCRnowMElpd3ZudjYzZk9wQnRGaXhNa2lNNjhUTWxxVnNa%0AOFl3TFlTeU5KSWFvYVJCM0ZZTUkwajNYOWdVb3VJclVjNnpqcGNkYkxCcWJ0%0AVUpyN0ZFaTdJeWY4UG9rMXZxTzRlUExiaEszTmItTmd0Q2JuckZzS2x6Z3Za%0AaktUWHZZb2oya0FGWXZHaVZ4LVhfNVhUcGdiVnE1Z2dxVEtIdjRaUGFuaGR4%0AdnFvZ2YxRVYwWUJYaG40YUJLM3BnUVBodw%3D%3D%0A"
        }
    },

    {
     "fileType": "test-file",
     "checksum": "a2d0dbc920fb3790d4d625e5c47be042ca32c051",
     "relativePath": "nunit.framework.dll",
     
     "uploadStatus":
        {
         "statusCode": 412,
         "location": "https://testcloud.xamarin.com/v0.1/direct_uploads?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKU1V6STFOaUo5LmV5SjBaWE4w%0AWDNKMWJsOXBaQ0k2SWpjNU5EVmpNbUZtTFRFeFpXTXROR1ptWVMwNU1XSTBM%0AVFExTUdJd09EVTNNbU5sT1NJc0ltVjRjQ0k2TVRVek16Z3dOVFEzTUgwLlJO%0AaTQ3VTNPYTB5YWswMVRVdTV6Q0dfWFhwV25QUWJDdkJaNmVCRWRmOENuQ19U%0AbmdpRGI4MU0yYk1lTlZNY1VCVmRWLXlkRjh4dElLaU1yNFdtQUFhOFdoay02%0AOVVjb29rYkNTYUU2eUlzamowZlZPZVJhR2lFdGpvLWJHTFJLcXNGY0ZTeUdR%0ARTQzQUZ1TFlyTWlCRnowMElpd3ZudjYzZk9wQnRGaXhNa2lNNjhUTWxxVnNa%0AOFl3TFlTeU5KSWFvYVJCM0ZZTUkwajNYOWdVb3VJclVjNnpqcGNkYkxCcWJ0%0AVUpyN0ZFaTdJeWY4UG9rMXZxTzRlUExiaEszTmItTmd0Q2JuckZzS2x6Z3Za%0AaktUWHZZb2oya0FGWXZHaVZ4LVhfNVhUcGdiVnE1Z2dxVEtIdjRaUGFuaGR4%0AdnFvZ2YxRVYwWUJYaG40YUJLM3BnUVBodw%3D%3D%0A"
        }
    },
 
    {
     "fileType": "test-file",
     "checksum": "c1f7342d05a9d95580a507156207e6f9283a2c8d",
     "relativePath": "Xamarin.UITest.dll",
     
     "uploadStatus":
        {
         "statusCode": 412,
         "location": "https://testcloud.xamarin.com/v0.1/direct_uploads?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKU1V6STFOaUo5LmV5SjBaWE4w%0AWDNKMWJsOXBaQ0k2SWpjNU5EVmpNbUZtTFRFeFpXTXROR1ptWVMwNU1XSTBM%0AVFExTUdJd09EVTNNbU5sT1NJc0ltVjRjQ0k2TVRVek16Z3dOVFEzTUgwLlJO%0AaTQ3VTNPYTB5YWswMVRVdTV6Q0dfWFhwV25QUWJDdkJaNmVCRWRmOENuQ19U%0AbmdpRGI4MU0yYk1lTlZNY1VCVmRWLXlkRjh4dElLaU1yNFdtQUFhOFdoay02%0AOVVjb29rYkNTYUU2eUlzamowZlZPZVJhR2lFdGpvLWJHTFJLcXNGY0ZTeUdR%0ARTQzQUZ1TFlyTWlCRnowMElpd3ZudjYzZk9wQnRGaXhNa2lNNjhUTWxxVnNa%0AOFl3TFlTeU5KSWFvYVJCM0ZZTUkwajNYOWdVb3VJclVjNnpqcGNkYkxCcWJ0%0AVUpyN0ZFaTdJeWY4UG9rMXZxTzRlUExiaEszTmItTmd0Q2JuckZzS2x6Z3Za%0AaktUWHZZb2oya0FGWXZHaVZ4LVhfNVhUcGdiVnE1Z2dxVEtIdjRaUGFuaGR4%0AdnFvZ2YxRVYwWUJYaG40YUJLM3BnUVBodw%3D%3D%0A"
        }
    },

    {
     "fileType": "test-file",
     "checksum": "542153902bc889d0d85a83b005854b5ebd9864f1",
     "relativePath": "UITest.dll",
     
     "uploadStatus":
        {
         "statusCode": 412,
         "location": "https://testcloud.xamarin.com/v0.1/direct_uploads?token=ZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKU1V6STFOaUo5LmV5SjBaWE4w%0AWDNKMWJsOXBaQ0k2SWpjNU5EVmpNbUZtTFRFeFpXTXROR1ptWVMwNU1XSTBM%0AVFExTUdJd09EVTNNbU5sT1NJc0ltVjRjQ0k2TVRVek16Z3dOVFEzTUgwLlJO%0AaTQ3VTNPYTB5YWswMVRVdTV6Q0dfWFhwV25QUWJDdkJaNmVCRWRmOENuQ19U%0AbmdpRGI4MU0yYk1lTlZNY1VCVmRWLXlkRjh4dElLaU1yNFdtQUFhOFdoay02%0AOVVjb29rYkNTYUU2eUlzamowZlZPZVJhR2lFdGpvLWJHTFJLcXNGY0ZTeUdR%0ARTQzQUZ1TFlyTWlCRnowMElpd3ZudjYzZk9wQnRGaXhNa2lNNjhUTWxxVnNa%0AOFl3TFlTeU5KSWFvYVJCM0ZZTUkwajNYOWdVb3VJclVjNnpqcGNkYkxCcWJ0%0AVUpyN0ZFaTdJeWY4UG9rMXZxTzRlUExiaEszTmItTmd0Q2JuckZzS2x6Z3Za%0AaktUWHZZb2oya0FGWXZHaVZ4LVhfNVhUcGdiVnE1Z2dxVEtIdjRaUGFuaGR4%0AdnFvZ2YxRVYwWUJYaG40YUJLM3BnUVBodw%3D%3D%0A"
        }
    }
]
```

4. Now we need to **upload** the actual files.
From the previous response body, identify the `location` that contains the URL of the files you're uploading.

   - In the Headers, you need to pass Content-Type: multipart/form-data
   - In the Body, you need to use the type Body_Form with the values:
      - `relative_path` and `file_type`: from the previous Response Body
      - `file`: Path to the actual file

You're on the right track if you get `201 Created` as the response like below.

![Screenshot of API creating test run](images/test-api-created.png)

(We're halfway there) 

5. Repeat the previous step for the rest of the files you want to upload. 

6. We're ready to Execute the test now. For this, we need a device_slug. 

**Note**: You should first create "Device Sets" in your Org or you can [use the REST API to create device sets](https://openapi.appcenter.ms/#/test/test_createDeviceSetOfUser).

Then, you can use the GET Method to get the [list of device sets](https://openapi.appcenter.ms/#/test/test_listDeviceSetsOfUser).

Sample Request: https://api.appcenter.ms/v0.1/apps/MSKASANI/DroidAppSampleXamarin/owner/device_sets

![Screenshot of API call for listing device sets](images/test-api-device-sets.png)

Corresponding Response Body: 

```json
{
     "id": "00917fb6-f30f-4d36-bd53-f900a94efe9f",
     "name": "UI Test",
     "slug": "ui-test",
     "osVersionCount": 1,
     "manufacturerCount": 1,

    "owner":
    {
        "type": "organization",
        "id": "5dd75115-3832-4f10-9cfe-5ac8cc8a51a5",
        "displayName": "MSKASANI",
        "name": "MSKASANI"
    },
 
    "deviceConfigurations":
    {
        {
            "id": "717cfc38-4817-41fc-8a8e-06beef4f73b2",
            "image":
            {
                "thumb": "https://testcloud-prod-system-files.s3-eu-west-1.amazonaws.com/system_files/0dee6ee7-6839-4e4e-ad0b-333e3952f75c?response-cache-control=max-age%3D157788000&AWSAccessKeyId=AKIAI4UZT4FCOF2OTJYQ&Signature=r9EEm/x0YAA4NhRJ%2BhVSQwGtBbI%3D&Expires=1691079085"
            },

            "os": "8.1.0",
            "osName": "Android 8.1.0",
            "model":
            {
                "name": "Google Pixel 2 XL", 
                "manufacturer": "Google", 
                "releaseDate": "October 2017", 
                "formFactor": "phone"
            }
        }
    }
}
```

7. We're now ready to use the [Test start API to trigger the test](https://openapi.appcenter.ms/#/test/test_startTestRun)! 
The Request body below is created for Xamarin.UITest Framework. If you're using other frameworks, refer to the end of the doc for more details! 

Sample JSON Request Body:
```json
{
   "test_framework":"ui_test",
   "device_selection":"MSKASANI/ui-test",
   "locale":"en_US",
   "test_series":"apimaster",
 
   "test_parameters":
        {
         "tests":
            {
    
             "method":
                {
                 "UITest.dll":
                    [
                     "UITest.Tests(Android).AppLaunches",
                     "UITest.Tests(iOS).AppLaunches"
                    ]
                },
             
             "fixture":
                {
                 "UITest.dll":
                    [
                     "UITest.Tests(Android)",
                     "UITest.Tests(iOS)"
                    ]
                }
            }
        }
}
```

Corresponding response body:
```json
{
    "accepted_devices":["Google Pixel 2 XL (8.1.0)"],
    "rejected_devices":[]
}
```
![Screenshot of API call to list devices](images/test-api-devices.png)

If you now go to the **Test** page of your App, you'll see... 

![Screenshot of test run in progress](images/test-run-progress.png)

Congratulations! :) 

PS: For other Test Frameworks, if you want to know how the JSON looks like (for instance, Appium test)

Run the Test command manually with `--debug` switch.

> appcenter test run appium --app "MSKASANI/Appium" --devices "MSKASANI/my" --app-path C:\VSAC\AllTest\AppCenter-Test-Samples-master\Appium\Android\swiftnote.apk--test-series "master" --locale "en_US" --build-dir C:\VSAC\AllTest\AppCenter-Test-Samples-master\Appium\Android\Mavenex\target\upload --debug

Once the test is complete, you can check out the Command output to see how the Request Body looks like:

![Screenshot of API terminal output](images/test-api-terminal)

BONUS! This way you can use the CLI output to see what how our commands queue the Tests using our API! 