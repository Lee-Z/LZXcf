//
//  LZMeViewController.m
//  LZXcf
//
//  Created by app on 16/5/7.
//  Copyright © 2016年 app. All rights reserved.
//

#import "LZMeViewController.h"

@interface LZMeViewController ()

@end

@implementation LZMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=HWColor(245, 240, 215);
    [self nav];
    
}
-(void)nav
{
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(rightBar) image:@"rightPageSetting" highImage:@"rightPageSetting"];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(leftBar) image:@"navFindFriendsImage" highImage:@"navFindFriendsImage"];
}
-(void)rightBar{}
-(void)leftBar{}

@end
