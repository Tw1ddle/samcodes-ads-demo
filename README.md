# Haxe Ads Demo

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/LICENSE)
[![Build Status](https://img.shields.io/travis/Tw1ddle/samcodes-ads-demo.svg?style=flat-square)](https://travis-ci.org/Tw1ddle/samcodes-ads-demo)

Demo of [AdMob](https://github.com/Tw1ddle/samcodes-admob) and [Chartboost](https://github.com/Tw1ddle/samcodes-chartboost) ads haxelibs for Android and iOS Haxe OpenFL targets.

## Usage

This demo app uses HaxeFlixel and my ads haxelibs, so install these first:
```bash
haxelib install flixel
haxelib install samcodes-admob # Or use lib/samcodes-admob submodule in the repo
haxelib install samcodes-chartboost # Or use lib/samcodes-chartboost submodule in the repo
```

Configure the ```<set>``` tags at the top of ```Project.xml``` for the ads platform you want to use, then follow these steps for the one you selected:

### AdMob
To use test mode ads, enter your hashed device id. Refer to the AdMob documentation for instructions.

For Android set it in ```Project.xml```:
```xml
<setenv name="AdmobTestDeviceId" value="YOUR_HASHED_TEST_DEVICE_ID_GOES_HERE" />
```

For iOS pass the id in the AdMob init method:
```haxe
// In AdsWrapper.hx
#if ios
AdMob.initAdMob("YOUR_HASHED_TEST_DEVICE_ID_GOES_HERE");
#end
```

### Chartboost
To use test ads, first ensure "test mode" is enabled on your Chartboost app dashboard.

On Android, simply set the app identifier and signature in your project settings:
```xml
<setenv name="ChartboostAppId" value="YOUR_ID" if="android" />
<setenv name="ChartboostAppSignature" value="YOUR_SIG" if="android" />
```

On iOS, pass the app identifier and signature in when initializing Chartboost:
```haxe
Chartboost.initChartboost(yourAppId, yourAppSignature);
```

### Set Ad Ids

App, interstitial and banner ids come unconfigured in this demo. You need to set your own:

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

Once you have done the above, build the app. Press the buttons at the bottom of the "Game Substate" to test the different types of ads. When an ad is visible the app should enter an "Ad Focused Substate".

## Screenshots

Chartboost video ad:

![](screenshots/chartboost-video.png?raw=true)

AdMob banner ad:

![](screenshots/admob-banner.png?raw=true)

## Notes
 * Run the JavaScript build [here](https://tw1ddle.github.io/samcodes-ads-demo/index.html). There's no web ad support yet.