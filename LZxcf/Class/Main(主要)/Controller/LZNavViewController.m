//
//  LZNavViewController.m
//  LZXcf
//
//  Created by app on 16/5/7.
//  Copyright © 2016年 app. All rights reserved.
//

#import "LZNavViewController.h"
#import "UIBarButtonItem+Extension.h"

@interface LZNavViewController ()

@end

@implementation LZNavViewController
// 程序启动的时候先调用的方法
+(void)initialize
{
    //取出tabbar的上面设置
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //设置右边 正常的状态
    NSMutableDictionary *textAttrs =[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor redColor];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:13];
    
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
}
-(void)viewDidLoad
{
    [super viewDidLoad];
}
//启用uinavigationController 先调用这个方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"backStretchBackgroundNormal" highImage:@"backStretchBackgroundNormal"];
        
    }
    //使用父类，将之前的viewcontroller添加到自定义的UINavgetionController
    [super pushViewController:viewController animated:YES];
    
}
-(void)back
{
    [self popViewControllerAnimated:YES];
}

@end
