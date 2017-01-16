# Configure Twitter

You will need:
* A [Twitter] account with a verified email and a phone number.
* Your Mobile Center app secret, which you can find by going to _Mobile Center_ > _your app_ > _Getting Started_ > _Manage app_ > _App secret_.

### **Register your application with Twitter**

1. Go to the [Twitter Developers] site and sign-in with your Twitter  credentials.

2. Click _Create New App_. Type in the following:
    * _Name_: app name
    * _Description_: app description
    * _URL_: _https://mobile-{app id}.azurewebsites.net/_
    * _Callback URL_: _https://mobile-{app id}.azurewebsites.net/.auth/login/twitter/callback_ (note the https instead of http)

    The URI that is needed for the _URL_ and _Callback URL_ is displayed in the Identity page.
3. Scroll down, read and accept the terms, and click _Create your Twitter application_. This registers the app displays the application details.

4. Click the _Settings_ tab, check _Allow this application to be used to sign in with Twitter_, then click _Update Settings_.

5. Select the _Keys and Access Tokens_ tab. Make a note of the values of Consumer Key (API Key) and Consumer secret (API Secret).

### **Configure Identity for Twitter authentication**

1. In [Mobile Center], go to _Identity_, and click on _Twitter_.

2. Enter the _API Key_ and _API Secret_ that you've collected and _Save_.

Your configuration is now complete. You can check that your app is configured correctly by navigating to _https://mobile-{app id}.azurewebsites.net/.auth/login/twitter_.

[Twitter]: https://twitter.com/
[Twitter Developers]: https://apps.twitter.com/
[Mobile Center]: https://mobile.azure.com/
