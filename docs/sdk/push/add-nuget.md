#### Visual Studio for Mac or Xamarin Studio

* Under your project, select **Packages**, open context menu and click **Add packages**.
* Search for **App Center**, and select **App Center Push**.
* Click **Add Packages**.

#### Visual Studio for Windows

* Navigate to the **Project > Manage NuGet Packages...**
* Search for **App Center**, then install **Microsoft.AppCenter.Push**.

#### Package Manager Console

* Type the following command in Package Manager Console:

    `PM> Install-Package Microsoft.AppCenter.Push`

> [!NOTE]
> If you use the App Center SDK in a portable project (such as **Xamarin.Forms**), you must install the packages
> in each of the projects: the portable, Android, iOS and UWP ones.

> [!NOTE]
> If your Android project does not target the Mono framework version 8.1 or higher, you will not be able to install the package.
> You can safely bump this version in **Options > General > Target framework** as this has no impact on minimum API level or target API level fields.
> If you are using App Center Build, you must make sure Mono version is 5.8 or higher (in **Build Config > Build app > More options**).
