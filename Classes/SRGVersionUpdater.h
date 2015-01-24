//
//  SRGVersionUpdater.h
//  Example
//
//  Created by Kazuhiro Sakamoto on 2015/01/22.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRGVersionUpdater : NSObject

@property NSString *endPointUrl;
@property NSString *customAlertTitle;
@property NSString *customAlertBody;

- (void) executeVersionCheck;

@end
