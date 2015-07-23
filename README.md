# Haxe Ads Demo

Demo of AdMob and Chartboost ads library bindings for [OpenFL](http://www.openfl.org/) (Android and iOS).

### Usage ###

This demo requires HaxeFlixel, so install it first:
```bash
haxelib install flixel # If it doesn't build, try the dev branch of HaxeFlixel: haxelib git flixel https://github.com/HaxeFlixel/flixel dev
```

Uncomment the ```<set>``` tags at the top of ```Project.xml``` for the ad network you want to test, then follow these steps:

### Chartboost ###
Make sure "test mode" is enabled on your Chartboost app dashboard.

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

### AdMob ###
If you want to use test ads fill in your hashed device id. Refer to the AdMob documentation on how to get this.

For Android add it to ```Project.xml```:
```xml
<setenv name="AdmobTestDeviceId" value="YOUR_HASHED_TEST_DEVICE_ID" />
```

For iOS pass the id in the AdMob init call method:
```haxe
// In AdsWrapper.hx
AdMob.init("YOUR_HASHED_TEST_DEVICE_ID");
```

------

The various app ids, interstitial and banner ids in this are unconfigured and will not work. You should set up your own test apps and ads to use with this demo:
	
```haxe
// In AdLocations.hx
#if chartboostads
// Chartboost locations are customizable - they can be whatever you want e.g.
public static inline var SAMPLE_INTERSTITIAL_LOCATION:String = "my_cb_interstitial";
#elseif admobads
// AdMob locations are taken from your AdMob dashboard e.g.
public static inline var DEMO_BANNER_LOCATION:String = "ca-app-pub-2600848144826429/9144221192";
#end
```

Build the app. When an ad is visible the app should enter the "Ad Focused Substate", else it should be in the "Game Substate". Press the buttons at the bottom to use it.

![](screenshots/chartboost-interstitial.png?raw=true)

![](screenshots/admob-banner.png?raw=true)

### Notes ###
If the demo does not look like it should or crashes then it may be due to a HaxeFlixel rendering bug. If problems persist then try building against a dev branch of HaxeFlixel or open an issue.

For running on iOS, you must remember to drag the static ads library e.g. ```libChartboost.a``` into the "link binaries with libraries" section under the "build phases" tab in Xcode.