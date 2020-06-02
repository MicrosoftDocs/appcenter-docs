---
title: Push Migration Guide
description: App Center Push migration guide
author: merzink
ms.author: merzink
ms.reviewer: kegr
ms.date: 04/30/2020
ms.topic: article
ms.assetid: FDA09DCF-92A4-423C-B18D-FB0A776DF39C
ms.service: vs-appcenter
---

# Push Migration Guide
Microsoft recently [announced](https://devblogs.microsoft.com/appcenter/app-center-mbaas-retirement/) the retirement of Visual Studio App Center MBaaS offering. As an alternative to App Center Push (ACP), we recommend you migrate to [Azure Notification Hubs](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-overview), which serves as the underlying technology on which ACP was built. We understand the unique capabilities that App Center Push provides, and with the upcoming retirement, we have two main goals in mind:

+ We're committed to continuing the developer experience that made App Center Push a compelling offering. 
+ We want to make the migration process from App Center Push to Azure Notification Hubs as seamless as possible.

To help with these goals, we've released new preview releases of the Notification Hubs [Android SDK](https://go.microsoft.com/fwlink/?linkid=2128633) and [iOS SDK](https://go.microsoft.com/fwlink/?linkid=2129045), and created this migration guide to help you get started with the transition.

## Benefits of Azure Notification Hubs
Azure Notification Hubs offers many benefits to mobile app developers:

+ App Center Push was designed for smaller applications, sending notifications to smaller target audiences of 1,000 devices or less. Azure Notification Hubs doesn't have this limitation, and is built to support huge application audiences, plus sending notifications to millions of devices every day.
+ Azure Notification Hubs supports sending notifications to devices running different operating systems with a single API call while App Center Push required a separate API call for each target platform.
+ With the Standard pricing plan, Azure Notification Hubs provides more detailed information about the status of a notification, such as delivery success or failure, with additional information for failure.
+ Azure Notification Hubs is available in multiple regions, enables customers to easily scale, and design high availability into their application.

## Migration steps
To fully migrate your application(s) from using App Center Push to Azure Notification Hubs, you'll need to complete the following steps:
1. Create an Azure subscription (if you don't already have one).
2. Create and configure a new Namespace and Notification Hub in Azure.
3. Integrate the new Notification Hubs SDK into your app.
4. Update your back-end to post notifications to Azure Notification Hubs.
5. Publish updated version of your app.

Let’s look at each of these steps:

### Start with an Azure subscription
Use of native Azure services requires an Azure subscription. If you don’t already have an active subscription, you can quickly and easily [create a free account](https://azure.microsoft.com/free/).

App Center Push has constraints around number of devices registered and number of pushes available to each application. If your needs demand higher volumes or you would like to tailor feature sets to your application, check out Notification Hubs [pricing details](https://azure.microsoft.com/pricing/details/notification-hubs/).

### Get started with Azure Notification Hubs
If you’ve previously used App Center Push within your application(s), you’ve probably gone through the following setup process:
+ Register your application with platform-specific push services: Firebase Cloud Messaging (FCM), Apple Notifications Service (APNs), Windows Notifications Services (WNS).
+ Configure push settings in the App Center portal.
+ Integrate Push using the App Center SDK in your application.

On the Azure side, the setup process looks as follows:
+ Register your application with platform-specific push services: Firebase Cloud Messaging (FCM), Apple Notifications Service (APNs), Windows Notifications Services (WNS).
+ Create a namespace and a notification hub via Azure portal or Azure CLI.
+ Configure push settings within the notification hub.
+ Integrate Notification Hubs SDK into your application. 

Both service flows are similar. However, you’ll see that to use native Azure for push, you must create a new notification hub. When you register with App Center for push, the corresponding Azure Notification Hub resources are automatically configured for your app.

To get set up, you must create an Azure Notification Hub, either via the [Azure portal](https://docs.microsoft.com/azure/notification-hubs/create-notification-hub-portal), or via [Azure CLI](https://docs.microsoft.com/azure/notification-hubs/create-notification-hub-azure-cli). 

### Configure your Notification Hub
To send notifications to your applications, you need to provide the appropriate tokens from platform-specific notification services to Azure Notification Hubs. Once you’ve got your new hub setup, you must [configure platform specific push settings](https://docs.microsoft.com/azure/notification-hubs/configure-notification-hub-portal-pns-settings?tabs=azure-portal). You can do this via the Azure portal or by using Azure CLI.

### Integrate Notification Hubs SDK
First, you'll need to add the Notification Hubs SDK to your app.

**On Android** 
```Gradle
dependencies {
    // Other dependencies here
    implementation 'com.microsoft.azure:notification-hubs-android-sdk: 1.0.0-preview1@aar'
}

repositories {
    maven {
        url "http://dl.bintray.com/microsoftazuremobile/SDK"
    }
}
```

**On iOS** 

The Azure Notification Hubs SDK for iOS can be obtained in a number of ways, including CocoaPods, and direct download and integration.  Once the Azure Notification Hubs SDK release is final, it will be available via Carthage and the Swift Package Manager (SPM).

#### Integration via CocoaPods

Add the following dependencies to your podfile to include Azure Notification Hubs SDK into your app.

```ruby
pod 'AzureNotificationHubs-iOS'
```

#### Integration by copying binaries into your project

- Download the [Azure Notification Hubs iOS SDK](https://github.com/Azure/azure-notificationhubs-ios/releases) framework provided as a zip file and unzip it.

- In Xcode, right-click your project and click the **Add Files to** option to add the WindowsAzureMessaging.framework folder to your Xcode project. Select **Options** and make sure **Copy items if needed** is selected, and then click **Add**.

#### Start Notification Hubs SDK
Previously, applications had to first manually request a device token (provided by the device manufacturer’s native push service) and then submit that token to Azure Notification Hubs. With the latest release, the Notification Hubs SDK automatically handles device registration for push notifications. When you add the SDK to your app, and enable push, the SDK automatically registers the device within the appropriate notification hub. Learn more about how to use the [Installations API](https://docs.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-registration-management).

**On Android** 

Azure Notification Hubs SDK will be initialized with the application, default Listener Connection String from the Notification Hub, and the Notification Hub Name.

```java
NotificationHub.initialize(
    this.getApplication()
    "{Hub Name}",
    "{Connection String}"
);
```

**On iOS** 

##### In Objective-C

The Azure Notification Hubs, using Objective-C, can be initialized via the `MSNotificationHub` imported from the `WindowsAzureMessaging/WindowsAzureMessaging.h` header file, by calling the `initWithConnectionString` method.

```objc
#import <WindowsAzureMessaging/WindowsAzureMessaging.h>

static NSString *const kConnectionString = @"{Connection String}";
static NSString *const kHubName = @"{Hub Name}";

[MSNotificationHub initWithConnectionString:kConnectionString hubName:kHubName];
```

##### In Swift

The Azure Notification Hubs SDK can be used by [importing Objective-C code into Swift](https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift) which creates the Objective-C bridging header.  Then, as before, the MSNotificationHub can be initialized as before.

```swift
import WindowsAzureMessaging

static let connectionString = "{Connection String}"
static let hubName = "{Hub Name}"

MSNotificationHub.initWithConnectionString(connectionString, hubName: hubName)
```

#### Intercept push notifications

Both on Android and iOS, the Azure Notification Hubs SDK registers your device with the platform specific remote notification system, such as Firebase on Android and APNS on iOS.  To allow for intercepting remote notifications, the uesr must set up a listener as shown in the following section.

**On Android** 

Set up a listener to be notified whenever a push notification is received in the background, or a foreground push notification is clicked by the user. Azure Notification Hubs registers a callback for notifications via the setListener method.

```java
NotificationHub.setListener(new NotificationListener() {
    @override 
    public void onNotificationReceived(Context context, NotificationMessage message) {
    }
});

NotificationHub.initialize(this.getApplication(), "{Hub Name}", "{Connection String}"));
```
This interface has a single method, which allows you to process the incoming custom NotificationMessage instance via the onNotificationReceived method. 

```java
public interface NotificationListener {
    void onNotificationReceived(Context context, NotificationMessage message);
}
```

**On iOS**

On iOS, you can intercept messages from APNS by implementing the `MSNotificationHubDelegate` protocol.

##### In Objective-C

```objc
[MSNotificationHub setDelegate:self];
[MSNotificationHub initWithConnectionString:kConnectionString hubName:kHubName];

- (void)notificationHub:(MSNotificationHub *)notificationHub didReceivePushNotification:(MSNotificationHubMessage *)notification fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler  {
    // Log the data
    NSLog(@"Received notification: %@: %@", notification.title, notification.body);

    // Set completion handler to no-data
    completionHandler(UIBackgroundFetchResultNoData);
}
```

##### In Swift

```swift
MSNotificationHub.setDelegate(self)
MSNotificationHub.initWithConnectionString(connectionString!, hubName: hubName!)

func notificationHub(_ notificationHub: MSNotificationHub!, didReceivePushNotification notification: MSNotificationHubMessage!, fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    // Log the data
    NSLog("Received notification: %@; %@", notification.title ?? "<nil>", notification.body)

    // Set completion handler to no-data
    completionHandler(.noData)
}
```

#### Target devices

The new Notification Hubs SDK supports tags that allow you to collect custom properties, associate them with users & devices, and use them for targeting an audience.

**On Android**

The NotificationHub class has information about tags and how to add, remove, clear, and list the tags. It can also add or remove tags via a List<String> with addTags and removeTags. Below is a sample of adding, removing, and fetching all tags. 

```java
// Add a tag
NotificationHub.addTag("android");

// Remove a tag
NotificationHub.removeTag("android");

// Get tags
Iterable<String> tags = NotificationHub.getTags();
```

**On iOS**

The `MSNotificationHub` class has information about tags to add, remove and list the tags.  These methods can also accept an `NSArray` of strings for tags.  Below is a sample of adding, removing, and fetching all tags for both Objective-C and Swift.

##### In Objective-C

```objc
// Add a tag
[MSNotificationHub addTag:@"iOS"];

// Remove a tag
[MSNotificationHub removeTag:@"iOS"];

// Get tags
NSArray *tags = [MSNotificationHub getTags];
```

##### In Swift

```swift
// Add a tag
MSNotificationHub.addTag("iOS")

// Remove a tag
MSNotificationHub.removeTag("iOS");

// Get tags
var tags = MSNotificationHub.getTags();
```

#### Enable/disable push

Just as the AppCenter Push SDK allows you to enable and disable Push, the Azure Notification Hubs SDK allows you to enable and disable the SDK.

**On Android**

To enable or disable the SDK, use the setEnabled method, passing false to disable the SDK and true to enable it. Both APIs are asynchronous using the NotificationHubFuture class. 

```java
// Disable the SDK
NotificationHub.setEnabled(false)

// Enable the SDK
NotificationHub.setEnabled(true)
```

The Notification Hubs SDK can also check if the SDK is enabled via the isEnabled async method. 

```java
/**
  * Gets whether the SDK is enabled. Will always return false before initialize is called
*/
    public NotificationHubFuture<boolean>boolean isEnabled();
```

**On iOS**

To enable or disable the Azure Notification Hubs SDK, use the `setEnabled` method on the `MSNotificationHub`.  In addition, the user can also get the status of the SDK by calling the `isEnabled` method.

##### In Objective-C

```objc
// Disable the SDK
[MSNotificationHub setEnabled:NO];

// Enable the SDK
[MSNotificationHub setEnabled:YES];

// Check the status
BOOL enabled = [MSNotificationHub isEnabled];
```

##### In Swift

```swift
// Disable the SDK
MSNotificationHub.setEnabled(false);

// Enable the SDK
MSNotificationHub.setEnabled(true);

// Check the status
var enabled = MSNotificationHub.isEnabled();
```

### Send notifications using Azure Notification Hubs 
App Center Push service offered two ways to send notifications to registered devices – either via the App Center Portal or by using the Push API. With Azure Notification Hubs, you can send test notifications via the Azure portal and use the Notification Hubs REST APIs to send “production-ready” notifications to all or any subset of registered devices. 

#### Authentication
The API tokens used to communicate with App Center Push can't be used when talking to Azure Notification Hubs. To authenticate and call Azure APIs, you’ll need to get a [Shared Access Authorization Token]( https://docs.microsoft.com/azure/notification-hubs/notification-hubs-push-notification-security#sas-tokens-for-access-policies). 

#### Request URI
Update the endpoint you're using for notification publishing. Replace the App Center Push URI in your application from: `https://appcenter.ms/api/v0.1/apps/{owner_name}/{app_name}/push/notifications` to one for Azure Notification Hubs:
```
https://{namespace}.servicebus.windows.net/{NotificationHub}/messages/?api-version=2015-01
```

#### Sending notifications
To send a notification to registered devices, you can POST to the Notification Hubs URI with the appropriate request headers and body specified for the target platform. For Android devices, you can send a [FCM native notification](https://docs.microsoft.com/rest/api/notificationhubs/send-gcm-native-notification) with the appropriate payload. 

App Center Push supports multiple notification target types and the following table highlights how to implement the same functionality in Azure Notification Hubs.

| App Center Push Target | Azure Notification Hubs Approach |
| ---------------------- | -------------------------------- |
| Audience               | Delivers the same functionality through tags |
| Broadcast              | Supported |
| Device or device list  | Supported using tags |
| User or user list      | Supported using tags |

Check out our [tutorials](https://go.microsoft.com/fwlink/?linkid=2128396) to learn more about the APIs available with Azure Notification Hubs and how to effectively target both devices and users.

### Publish your app
Now that you've updated your app to use the new Notification Hubs SDK, and your back-end to push to Notification Hubs, you're all set to publish your new app.

## Support
If you encounter issues with migrating your application to Azure Notification Hubs, please submit your feedback request in the [Azure Notification Hubs repository](https://github.com/Azure/azureNotificationHubs/issues).  
