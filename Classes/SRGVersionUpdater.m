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

- (void) executeVersionCheck {
   NSAssert(_endPointUrl, @"Set EndPointUrl Before Execute Check");
    
   AFHTTPRequestOperationManager* manager = [AFHTTPRequestOperationManager manager];
   manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
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
    UIAlertView *alert = [UIAlertView  bk_alertViewWithTitle:
        NSLocalizedString(@"SRGVersionUpdater.alert.title", nil)
        message:NSLocalizedString(@"SRGVersionUpdater.alert.body", nil)
    ];
    
    [alert bk_addButtonWithTitle:
        NSLocalizedString(@"SRGVersionUpdater.alert.updateButton", nil)
                         handler:^(void) {
        NSURL *updateUrl = [NSURL URLWithString:versionInfo[@"update_url"]];
        [[UIApplication sharedApplication] openURL:updateUrl];
    }];
    
    if([versionInfo[@"type"] isEqualToString:@"once"]){
        [alert addButtonWithTitle:
            NSLocalizedString(@"SRGVersionUpdater.alert.calcelButton",nil)
        ];
    }
    
    [alert show];
}

- (NSInteger)_versionNumberFromString:(NSString *)versionString{
    return [[versionString stringByReplacingOccurrencesOfString:@"." withString:@""] intValue];
}

@end