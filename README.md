# Haxe Ads Demo

[![License](https://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://github.com/Tw1ddle/samcodes-ads-demo/blob/master/LICENSE)

Demo of the [Chartboost](https://github.com/Tw1ddle/samcodes-chartboost) ads haxelib for Android and iOS Haxe OpenFL targets.

*Deprecation note. I am not currently using the Chartboost ads haxelib in any games, so this demo is likely to be out of date.*

## Usage

This demo app uses HaxeFlixel and my ads haxelib, so install these first:
```bash
haxelib install flixel
haxelib install samcodes-chartboost # Or use lib/samcodes-chartboost submodule in the repo
```

Configure the ```<set>``` tags at the top of ```Project.xml``` for the ads platform:

### Chartboost
To use test ads, first ensure "test mode" is enabled on your Chartboost app dashboard.

On Android and iOS, pass the app identifier and signature in when initializing Chartboost:
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
#end
```

Once you have done the above, build the app. Press the buttons at the bottom of the "Game Substate" to test the different types of ads. When an ad is visible the app should enter an "Ad Focused Substate".

## Screenshots

Chartboost video ad:

![](screenshots/chartboost-video.png?raw=true)

## Notes
 * Run the JavaScript build [here](https://tw1ddle.github.io/samcodes-ads-demo/index.html). There's no web ad support yet.