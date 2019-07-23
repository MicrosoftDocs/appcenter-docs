---
title: App Center Analytics for UWP
description: App Center Analytics for UWP
keywords: analytics
author: elamalani
ms.author: emalani
ms.date: 02/14/2019
ms.topic: article
ms.assetid: 7835dedf-b170-416b-8a89-0a2a18f6196b
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: uwp
---

# App Center Analytics

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

App Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the App Center portal for you to analyze the data.

Please follow the [Get started](~/sdk/getting-started/uwp.md) section if you haven't set up the SDK in your application yet.

## Session and device information

Once you add App Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc.

Country code is not automatically reported by the UWP SDK. If you want to report it manually, you can follow these steps:

1. Make sure that you [enable Location Capability](https://docs.microsoft.com/en-us/windows/uwp/maps-and-location/get-location#enable-the-location-capability) for your app.
2. [Obtain a Bing Maps Authentication Key](https://docs.microsoft.com/en-us/windows/uwp/maps-and-location/authentication-key#get-a-key).
3. Use the following code in any place before you call `AppCenter.Start(... typeof(Analytics) ...);`. 
	As `BingMapsToken`, use the key obtained in step 2.

```csharp
private static async Task SetCountryCode()
{
    // The following country code is used only as a fallback for the main implementation.
    // This fallback country code does not reflect the physical device location, but rather the
    // country that corresponds to the culture it uses.
    var countryCode = new GeographicRegion().CodeTwoLetter;
    var accessStatus = await Geolocator.RequestAccessAsync();
    switch (accessStatus)
    {
        case GeolocationAccessStatus.Allowed:
            var geoLocator = new Geolocator
            {
                DesiredAccuracyInMeters = 100
            };
            var position = await geoLocator.GetGeopositionAsync();
            var myLocation = new BasicGeoposition
            {
                Longitude = position.Coordinate.Point.Position.Longitude,
                Latitude = position.Coordinate.Point.Position.Latitude
            };
            var pointToReverseGeocode = new Geopoint(myLocation);
            MapService.ServiceToken = Constants.BingMapsAuthKey;
            var result = await MapLocationFinder.FindLocationsAtAsync(pointToReverseGeocode);
            if (result.Status != MapLocationFinderStatus.Success || result.Locations == null || result.Locations.Count == 0)
            {
                break;
            }
    
            // The returned country code is in 3-letter format (ISO 3166-1 alpha-3).
            // Below we convert it to ISO 3166-1 alpha-2 (two letter).
            var country = result.Locations[0].Address.CountryCode;
            countryCode = new GeographicRegion(country).CodeTwoLetter;
            break;
        case GeolocationAccessStatus.Denied:
            AppCenterLog.Info(LogTag, "Geolocation access denied. In order to set country code in App Center, enable location service in Windows 10.");
            break;
        case GeolocationAccessStatus.Unspecified:
            break;
    }
    AppCenter.SetCountryCode(countryCode);
}
```

## Custom events

You can track your own custom events with **up to twenty properties** to understand the interaction between your users and the app.

Once you have started the SDK, use the `TrackEvent()` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 125 characters per event property name and event property value.

```csharp
Analytics.TrackEvent("Video clicked", new Dictionary<string, string> {
	{ "Category", "Music" },
	{ "FileName", "favorite.avi"}
});
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:

```csharp
Analytics.TrackEvent("Video clicked");
```

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```csharp
Analytics.SetEnabledAsync(false);
```

To enable App Center Analytics again, use the same API but pass `true` as a parameter.

```csharp
Analytics.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The state is persisted in the device's storage across application launches.

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```csharp
bool isEnabled = await Analytics.IsEnabledAsync();
```

## Local storage size

By default, the SDK stores up to 10MB of logs in the storage.

## No internet access

When there is no network connectivity, the SDK saves up to 10MB of logs in the local storage. Once the storage is full, the SDK will start discarding old logs to make room for the new logs. Once the device gets internet access back, the SDK will send logs in the batch of 50 or after every 3 seconds.

## Batching event logs

The App Center SDK uploads logs in a batch of 50 and if the SDK doesn't have 50 logs to send, it will still send logs after 3 seconds. There can be a maximum of 3 batches sent in parallel.

## Retry and back-off logic

App Center SDK supports back-off retries on recoverable network errors. Below is the retry logic:
* 3 tries maximum per request.
* Each request has its own retry state machine.
* All the transmission channels are disabled (until next app process) after 1 request exhausts all its retries.

Back-off logic
* 50% randomization, 1st retry between 5 and 10s, second retry between 2.5 and 5 minutes, last try between 10 and 20 minutes.
* If network switches from off to on (or from wi-fi to mobile), retry states are reset and requests are retried immediately.
