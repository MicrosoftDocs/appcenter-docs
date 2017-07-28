#### Visual Studio for Mac or Xamarin Studio

* Under your project, select **Packages**, open context menu and click **Add packages**.
* Search for **Mobile Center**, and select **Mobile Center Push**.
* Click **Add Packages**.

#### Visual Studio for Windows

* Navigate to the **Project > Manage NuGet Packages...**
* Search for **Mobile Center**, then install **Microsoft.Azure.Mobile.Push**.

#### Package Manager Console

* Type the following command in Package Manager Console:

    `PM> Install-Package Microsoft.Azure.Mobile.Push`

> [!NOTE]
> If you use the Mobile Center SDK in a portable project (such as **Xamarin.Forms**), you need to install the packages
> in each of the projects: the portable, Android, iOS and UWP ones.