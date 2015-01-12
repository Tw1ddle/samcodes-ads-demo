# Haxe Chartboost Demo

Demo of Chartboost ads library bindings for [OpenFL](http://www.openfl.org/) (Android and iOS).

### Usage ###

This demo requires HaxeFlixel, so install it first:
```bash
haxelib install flixel
```

Make sure "test mode" is enabled on your Chartboost app dashboard.

Fill in your app identifier and signature. For Android add it to project.xml:
```xml
<setenv name="ChartboostAppId" value="your_app_id" />
<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass the app identifier and signature in the Chartboost init call:
```haxe
// In AdsWrapper.hx
Chartboost.init("your_app_id", "your_app_signature");
```

Build the app. When an ad is visible the game should enter the "Ad Focused Substate", else it should be in the "Game Substate". Press the buttons at the bottom to operate.

![](screenshots/main.png?raw=true)

### Notes ###
If the demo does not look like it should or crashes then it may be due to a HaxeFlixel rendering bug. If problems persist then try building against a dev branch of HaxeFlixel or open an issue.

For running on iOS, you may need to drag your ```libChartboost.a``` into the "link binaries with libraries" section under the "build phases" tab in Xcode.
