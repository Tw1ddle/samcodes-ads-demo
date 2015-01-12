# Haxe Chartboost Demo

Chartboost ads library demo for OpenFL Android/iOS targets. The demo uses HaxeFlixel.

### Usage ###

First make sure test mode is enabled on your Chartboost apps dashboard.

Fill in your app identifier and signature. For Android enter this in project.xml:
```xml
<setenv name="ChartboostAppId" value="your_app_id" />
<setenv name="ChartboostAppSignature" value="your_app_signature" />
```
For iOS pass the app identifier and signature as parameters in the Chartboost init call:
```haxe
// In AdsWrapper.hx
Chartboost.init("your_app_id", "your_app_signature");
```

Build and run the app against the Android or iOS target. When the ad is visible the game should enter an "Ad Focused Substate", else it should be in the "Game Substate". Press the buttons at the bottom to operate it.
