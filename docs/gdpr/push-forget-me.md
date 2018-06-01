# How To Delete End-User Data

In the context of Push Notifications, your customer's data can reside in one of three areas:
* Custom value pairs used for audience segmentation
* Audience definition and description 
* Push Notification: message details, or the campaign description.
<!-- 
In this section we will walk you through how to handle a delete request once received from a customer to delete all their data used for Push Notifications. 
-->

### Installations/Device information

If you are collecting custom properties from your customers and using them for Push Notifications, each of these values are associated with a unique install ID. 
To handle a delete request for a Data Subject, you must first to export all data and look for the install ID associated with the requestor. Once you have the install ID, you can send a request to delete data associated with it.
 
* Export all device information
* Find the customer information, and retrieve the installation ID for that specific device
* Use the [following](https://openapi.appcenter.ms/#/push/Push_DeleteInstallId) DELETE API method to delete device information for that specific device. 
```
 https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/devices/{install_id}
 ```
 
### Audience definition and description 
If you are sending push notifications to an audience, this method will help you learn how to delete an audience. Here are the steps to get the audience information:

**1. Retrieve all Audiences under your App**

Make the [following](https://openapi.appcenter.ms/#/analytics/Analytics_ListAudiences) GET call to retrieve all Audience information under your app:
 ```
 https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/analytics/audiences
 ```

**2. Get the Audience name(s) which has customer information**

Go through the list retrieved in step 1, search for any audience information containing your customer’s information, and generate a list of according audience name(s).

**3. Make an API call to delete the audience**

For each audience name found in in Step 2, make the [following](https://openapi.appcenter.ms/#/analytics/Analytics_DeleteAudience) DELETE API method call to delete that audience:
```
https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/analytics/audiences/{audience_name}
```

### Push Notification: message details, or the campaign description.

Every time you send a push notification (campaign), the push notification details and stats are stored under a unique Notification ID. This information may potentially contain personal information associated with users targeted by these push notifications.

**1. Retrieve all Push Notifications under your App**

The [following](https://openapi.appcenter.ms/#/push/Push_List) GET API method call will retrieve all Push Notifications under your App:
 ```
 https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/notifications
 ```

**2. Get the Push Notification ID(s) for the Push Notification containing the customer’s information**

Search through all Push Notifications, find push notification containing your customer’s personal information, and generate a list of associated Push Notification IDs.

**3. Delete the relevant notifications**

Call the [DELETE API method](https://openapi.appcenter.ms/#/operations/push/Push_Delete) for each Push Notification:
 ```
 https://appcenter.ms/v0.1/apps/{owner_name}/{app_name}/push/Push_Delete
 ```
