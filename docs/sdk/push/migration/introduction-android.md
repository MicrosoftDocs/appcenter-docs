# How to remove Firebase SDK dependencies

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [Xamarin.Android](xamarin-android.md)
> * [React Native Android](react-native-android.md)

The Firebase SDK is no longer a dependency of the App Center SDK.
Your application might still have the explicit dependencies if you integrated
the SDK in an earlier version.

If you wish to **only** use App Center Push service,
you can choose to remove the firebase dependencies by using the following steps.

Our SDK remains compatible with Firebase SDK so these steps are optional to
avoid undesired dependencies.

> [!NOTE]
> If you are a Firebase customer and use Firebase features, please **do not**
> follow any of these steps.
