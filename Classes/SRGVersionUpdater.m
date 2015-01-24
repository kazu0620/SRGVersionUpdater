//
//  SRGVersionUpdater.m
//  Example
//
//  Created by Kazuhiro Sakamoto on 2015/01/22.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import "SRGVersionUpdater.h"
#import "UIAlertView+BlocksKit.h"
#import "AFHTTPRequestOperationManager.h"

@implementation SRGVersionUpdater {
    NSDictionary *versionInfo;
}

#ifndef SRGVersionUpdaterLocalizedStrings
#define SRGVersionUpdaterLocalizedStrings(key) \
NSLocalizedStringFromTableInBundle(key, @"SRGVersionUpdater", [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SRGVersionUpdater.bundle"]], nil)
#endif

- (void) executeVersionCheck {
   NSAssert(_endPointUrl, @"Set EndPointUrl Before Execute Check");
    
   AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
   manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",nil];
   [manager GET:_endPointUrl parameters:nil
       success:^(AFHTTPRequestOperation *operation, id responseObject) {
           versionInfo = responseObject;
           [self showUpdateAnnounceIfNeeded];
       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
           NSLog(@"Request Operation Error! %@", error);
       }
   ];
}

- (void) showUpdateAnnounceIfNeeded {
    if( ![self isVersionUpNeeded] ) {
        return;
    }
    [self showUpdateAnnounce];
}

- (BOOL) isVersionUpNeeded {
    NSString *currentVersion  = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *requiredVersion = versionInfo[@"required_version"];
    return ( [requiredVersion compare:currentVersion options:NSNumericSearch] == NSOrderedDescending );
}

- (void) showUpdateAnnounce {
    UIAlertView *alert = [UIAlertView
        bk_alertViewWithTitle:[self alertTitle]
        message:[self alertBody]
    ];
    
    [alert bk_addButtonWithTitle:[self updateButtonText]
                         handler:^(void) {
        NSURL *updateUrl = [NSURL URLWithString:versionInfo[@"update_url"]];
        [[UIApplication sharedApplication] openURL:updateUrl];
    }];
    
    if([versionInfo[@"type"] isEqualToString:@"optional"]){
        [alert addButtonWithTitle: [self cancelButtonText]];
    }
    
    [alert show];
}

- (NSString *) alertTitle {
    return _customAlertTitle ? _customAlertTitle : [self localizedStringWithFormat:@"SRGVersionUpdater.alert.title"];
}

- (NSString *) alertBody {
    return _customAlertBody ? _customAlertBody : [self localizedStringWithFormat:@"SRGVersionUpdater.alert.body"];
}

- (NSString *) updateButtonText {
    return [self localizedStringWithFormat:@"SRGVersionUpdater.alert.updateButton"];
}

- (NSString *) cancelButtonText {
    return [self localizedStringWithFormat:@"SRGVersionUpdater.alert.calcelButton"];
}

- (NSInteger) versionNumberFromString:(NSString *)versionString{
    return [[versionString stringByReplacingOccurrencesOfString:@"." withString:@""] intValue];
}

- (NSString *) localizedStringWithFormat:(NSString *)format {
    return SRGVersionUpdaterLocalizedStrings(format);
}

@end