# Haxe Ads Demo

Demo of [AdMob](https://github.com/Tw1ddle/samcodes-admob) and [Chartboost](https://github.com/Tw1ddle/samcodes-chartboost) haxelibs for Android and iOS:
	
### Usage ###

This demo requires HaxeFlixel and the ads haxelibs, so install these first:
```bash
haxelib install flixel # Else try dev branch of HaxeFlixel: haxelib git flixel https://github.com/HaxeFlixel/flixel dev
haxelib install samcodes-admob
haxelib install samcodes-chartboost
```

Uncomment the ```<set>``` tags at the top of ```Project.xml``` for the ad network you want to test, then follow the setup steps:

### AdMob ###
If you want to get test ads then enter your hashed device id. Refer to the AdMob documentation on this.

For Android add it to ```Project.xml```:
```xml
<setenv name="AdmobTestDeviceId" value="YOUR_HASHED_TEST_DEVICE_ID" />
```

For iOS pass the id in the AdMob init method:
```haxe
// In AdsWrapper.hx
AdMob.init("YOUR_HASHED_TEST_DEVICE_ID");
```

### Chartboost ###
Ensure "test mode" is enabled on your Chartboost app dashboard.

Fill in your app identifier and signature. For Android add it to ```Project.xml```:
```xml
<setenv name="ChartboostAppId" value="your_app_id" />
<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass the app identifier and signature in the Chartboost init call:
```haxe
// In AdsWrapper.hx
Chartboost.init("your_app_id", "your_app_signature");
```

------

App ids, interstitial and banner ids in this demo are unconfigured and need to be set yourself:

```haxe
// In AdLocations.hx
#if chartboostads
// Chartboost locations have custom names - they can be whatever you want e.g.
public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "my_cb_interstitial";
#elseif admobads
// AdMob locations are taken from your AdMob dashboard e.g.
public static inline var DEMO_BANNER_LOCATION:String = "ca-app-pub-2600848144826429/9144221192";
#end
```

Build the app. Press the buttons at the bottom of the "Game Substate" to test the app out. When an ad is visible the app should enter an "Ad Focused Substate".

![](screenshots/chartboost-video.png?raw=true)

![](screenshots/admob-banner.png?raw=true)

### Notes ###
After building on iOS, you may need to drag the static ads library e.g. ```libChartboost.a``` into the "link binaries with libraries" section under the "build phases" tab in Xcode.