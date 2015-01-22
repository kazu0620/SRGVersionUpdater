//
//  ViewController.m
//  Example
//
//  Created by Kazuhiro Sakamoto on 2015/01/22.
//  Copyright (c) 2015年 Soragoto. All rights reserved.
//

#import "ViewController.h"
#import "SRGVersionUpdater.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [self versionCheck];
    [super viewDidLoad];
}

- (void) versionCheck {
    SRGVersionUpdater *versionUpdater = [SRGVersionUpdater new];
    versionUpdater.endPointUrl = @"https://dl.dropboxusercontent.com/u/461628/app_version.json";
    [versionUpdater executeVersionCheck];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
