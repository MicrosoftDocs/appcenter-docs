# Configure Google

You will need:
* A Google account with a verified email.
* Your Mobile Center app secret, which you can find by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

### **Register your application with Google**

1. Navigate to the [Google apis] website, sign in with your Google account credentials, click the _Project_ dropdown and _Create Project_, provide a _Project name_, then click _Create_.

2. Under _Social APIs_ click _Google+ API_ and then _Enable_.

3. Go to _Credentials_ > _OAuth consent screen_, then select your email address, enter a product name, and click _Save_.

4. In the _Credentials_ tab, click _Create credentials_ > _OAuth client ID_.

5. Create with the following parameters:
    * Application type: Web application
    * _Authorized JavaScript Origins_: _https://mobile-{app id}.azurewebsites.net_
    * _Authorized redirect URIs_: _https://mobile-{app id}.azurewebsites.net/.auth/login/google/callback_

The URI that is needed for the _Authorized JavaScript Origins_ and _Authorized redirect URIs_ is displayed in the Identity page.
On the next screen, make a note of the values of the client ID and client secret.

### **Configure Identity for Google authentication**

1. In [Mobile Center], go to _Identity_, and click on _Google_.

2. Enter the _Client ID_ and _Client Secret_ that you've collected from Google, and _Save_.

Your configuration is now complete. You can check that your app is configured correctly by navigating to _https://mobile-{app secret}.azurewebsites.net/.auth/login/google_.

[Mobile Center]: https://mobile.azure.com/
[Google apis]: http://go.microsoft.com/fwlink/p/?LinkId=268303
