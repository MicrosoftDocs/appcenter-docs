Please configure Apple Push Notifications service (APNs) for your app from your Apple developer account and the Mobile Center portal before adding Mobile Center Push to your app. Mobile Center Push won't get any notifications if you don't setup push notifications.

1. Enable push notifications on your application by following the **Step 1** instructions in Apple's documentation on [how to configure push notifications](http://help.apple.com/xcode/mac/current/#/dev11b059073).

2. Log in to the Mobile Center portal, select your application, click on the **Push** button from the left menu then click **Next** to reveal the push notification settings UI:
![mobile-center-push-settings](images/ios-push-settings-mc-portal.png)
On the bottom of the page select **Sandbox** for initial development or **Production** for production version of your application.  
You will collect the **Key ID**, **App Name**, **App ID** and **Push Token** in the next steps.

3. Go to your Apple developer account and select your application from the [App ID list](https://developer.apple.com/account/ios/identifier/bundle) in **Identifiers**. Copy the **Prefix** value from this window and paste it to the Mobile Center push settings **App ID** field. Do the same with the **ID** value to be copied to the Mobile Center push settings **App Name** field.
![apple-dev-center-app-id](images/ios-app-id-apple-portal.png)

4. Go to your Apple developer account and select the [Auth Keys](https://developer.apple.com/account/ios/authkey/) section in **Certificates, Identifiers & Profiles**. Create a new Auth Key by pressing the **+** button on the top right of the page. Make sure to check the APNs checkbox, fill in the key name and press **Continue** then **Confirm**.
![apple-dev-center-new-auth-key](images/ios-new-auth-key-apple-portal.png)
On the next screen, copy the **Key ID** value and paste it to the Mobile Center push settings **Key ID** field.
Download the Auth Key file.
![apple-dev-center-confirm-auth-key](images/ios-confirm-auth-key-apple-portal.png)

5. Open your Auth Key file with a text editor and extract the authentication token it contains.
![auth-key-file](images/ios-auth-key-file.png)
Paste this token to the Mobile Center push settings **Authentication Token** field. Click the **Done** button from the Mobile Center push settings page to complete this configuration.
