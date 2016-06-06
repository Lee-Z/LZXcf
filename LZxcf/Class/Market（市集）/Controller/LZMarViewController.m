//
//  LZMarViewController.m
//  LZXcf
//
//  Created by app on 16/5/7.
//  Copyright © 2016年 app. All rights reserved.
//

#import "LZMarViewController.h"


@interface LZMarViewController ()

@end

@implementation LZMarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self nav];
    self.view.backgroundColor=HWColor(245, 240, 215);
}
-(void)nav
{
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(rightBar) image:@"shoppingCart" highImage:@"shoppingCart"];
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(leftBar) image:@"leftPageButtonBackgroundNormal" highImage:@"leftPageButtonBackgroundNormal"];
}

-(void)rightBar
{
    
}
-(void)leftBar{
    
    
}
@end
