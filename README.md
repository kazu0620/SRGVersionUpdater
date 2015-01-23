# SRGVersionUpdater
Though you improved wonderfully your app, user doesn't upgrade your app and continue to use old version. That's tragedy. SRGVersionUpdater can solve this problem. SRGVersionUpdater notify update to users and force users to launch App Store and download new version app.

The installation is very simple and easy. On client side all you need is only to write a code in 3 lines. And Even if you don't have knowledge in a server side program, you can very easily setup if you have account of Dropbox, Google Drive or other hosting services.

##Screenshot
![](https://dl.dropboxusercontent.com/u/461628/SRGVersionUpdater.png)

##Usage


#### 1. Upload a JSON file
upload a JSON file below. It is OK to upload to public folder of Dropbox, GoogleDrive, or other free hosting services.

```json:app_version.json
{"required_version":"2.0.0","type":"force","update_url":"https://itunes.apple.com/jp/app/idxxxxxxxxxx?mt="}
```

| key | define |
|--------|--------|
|   required_version     |   The version string of  latest client application.      |
|     type   |    The type of update, "force" or "optional".      |
|     update_url   |  The App store URL of your app.     |

[How to Host files with GoogleDrice](https://support.google.com/drive/answer/2881970?hl=en)
[How to Host files with dropbox](http://www.goarch.org/archdiocese/departments/internet/articles/dropbox/)


#### 2. Install  SRGVersionUpdater
First, Install SRGVersionUpdater to project with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

``` ruby:Podfile
platform :ios, '7.0'
pod 'SRGVersionUpdater', '~> 0.0.1'
```

Next, Open up the AppDelegate.m file and edit application:didFinishLaunchingWithOptions: to be like so:


```objc:AppDelegate.m
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SRGVersionUpdater *versionUpdater = [SRGVersionUpdater new];
    versionUpdater.endPointUrl = @"http://xxxxxxxxxxxxx";
    [versionUpdater executeVersionCheck];
    
    return YES;
}
```
In endPointUrl, input URL of the JSON file uploaded by previous step.

####Notice:
There are Bandwidth Limits in Dropbox. If your app have huge number of downloads per day, it is better to change account plan, or use other hosting services.

[Dropbox Help Center : Why were my links banned?](https://www.dropbox.com/help/4204)

## License
Licensed under the MIT License

