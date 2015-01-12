# Haxe Chartboost Demo

Demo of Chartboost ads library bindings for the [OpenFL](http://www.openfl.org/) Android/iOS targets.

### Usage ###

This demo requires HaxeFlixel, so if you don't already have it, install it:
```bash
haxelib install flixel
```

Make sure test mode is enabled on your Chartboost apps dashboard.

Fill in your app identifier and signature. For Android enter it into project.xml:
```xml
<setenv name="ChartboostAppId" value="your_app_id" />
<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass the app identifier and signature as parameters in the Chartboost init call:
```haxe
// In AdsWrapper.hx
Chartboost.init("your_app_id", "your_app_signature");
```

Build and run against Android or iOS targets. When an ad is visible the game should enter the "Ad Focused Substate", else it should be in the "Game Substate". Press the buttons at the bottom to operate.

![](screenshots/main.png?raw=true)

### Notes ###
If the demo does not look like it should or crashes then it may be due to a HaxeFlixel rendering bug. If problems persist then try building against a dev branch of HaxeFlixel or open an issue.
