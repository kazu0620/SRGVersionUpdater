# SRGVersionUpdater
[![Version](https://img.shields.io/cocoapods/v/SRGVersionUpdater.svg?style=flat)](https://github.com/kazu0620/SRGVersionUpdater)
[![License](https://img.shields.io/cocoapods/l/SRGVersionUpdater.svg?style=flat)](https://github.com/kazu0620/SRGVersionUpdater)
[![Platform](https://img.shields.io/cocoapods/p/SRGVersionUpdater.svg?style=flat)](https://github.com/kazu0620/SRGVersionUpdater)

Though you improved wonderfully your app, some users doesn't upgrade your app and continue to use old version. That's tragedy. SRGVersionUpdater can solve this problem. SRGVersionUpdater can show alert view about update infomation and force users to launch App Store and download new version app.

The installation is very simple and easy. On client side all you need is only to write a code in 3 lines. And Even if you don't have knowledge in a server side programming, you can very easily setup if you have account of Dropbox, Google Drive or other hosting services.

##Screenshot
![](https://dl.dropboxusercontent.com/u/461628/SRGVersionUpdater.png)

##Usage


#### 1. Upload a JSON file
Upload a JSON file below. It is OK to upload to public folder of Dropbox, GoogleDrive, or other free hosting services.
[Example JSON file](https://github.com/kazu0620/SRGVersionUpdater/raw/master/Example/app_version.json)

```json
{"required_version":"2.0.0","type":"force","update_url":"https://itunes.apple.com/jp/app/idxxxxxxxxxx?mt="}
```

| key | define |
|--------|--------|
|   required_version     |   The version string of  latest client application.      |
|     type   |    The type of update, "force" or "optional".      |
|     update_url   |  The App store URL of your app.     |

[How to Host files with GoogleDrive](https://sites.google.com/a/griffith.edu.au/staff-email-learning-centre/help-yourself/google-drive-docs/how-to-share-a-file-with-a-non-google-colleague)

[How to Host files with dropbox](http://www.goarch.org/archdiocese/departments/internet/articles/dropbox/)


#### 2. Install  SRGVersionUpdater
Install SRGVersionUpdater to your project with [CocoaPods](http://cocoapods.org) by adding the following to your Podfile:

``` ruby
pod 'SRGVersionUpdater'
```

At last, Open up the AppDelegate.m and edit application:didFinishLaunchingWithOptions: to be like so:

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SRGVersionUpdater *versionUpdater = [SRGVersionUpdater new];
    versionUpdater.endPointUrl = @"http://xxxxxxxxxxxxx";
    [versionUpdater executeVersionCheck];
    
    return YES;
}
```
Input URL of the JSON file uploaded by previous step in endPointUrl.

####Notice:
There are Bandwidth Limits in Dropbox. If your app have huge number of access per day, it is better to change account plan, or use other hosting services.

[Dropbox Help Center : Why were my links banned?](https://www.dropbox.com/help/4204)

## License
Licensed under the MIT License

