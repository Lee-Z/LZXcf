//
//  LZTabBarViewController.m
//  LZXcf
//
//  Created by app on 16/5/7.
//  Copyright © 2016年 app. All rights reserved.
//

#import "LZTabBarViewController.h"
#import "LZKitTableViewController.h"
#import "LZComTableViewController.h"
#import "LZMarViewController.h"
#import "LZMeViewController.h"
#import "LZNavViewController.h"


@interface LZTabBarViewController ()

@end

@implementation LZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LZKitTableViewController *Kit=[[LZKitTableViewController alloc]init];
    LZComTableViewController *Com=[[LZComTableViewController alloc]init];
    LZMarViewController *Mar=[[LZMarViewController alloc]init];
    LZMeViewController *Me=[[LZMeViewController alloc]init];
    [self addChildvc:Kit title:@"下厨房" image:@"tabADeselected" selectedImage:@"tabASelected"];
    [self addChildvc:Mar title:@"市集" image:@"tabBDeselected" selectedImage:@"tabBSelected"];
    [self addChildvc:Com title:@"社区" image:@"tabCDeselected" selectedImage:@"tabCSelected"];
    [self addChildvc:Me title:@"我" image:@"tabDDeselected" selectedImage:@"tabDSelected"];
    
  

}
//设置显示方法
-(void)addChildvc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image
     selectedImage:(NSString *)selectedImage
{
 
    LZNavViewController *nav=[[LZNavViewController alloc]initWithRootViewController:childVc];
    //设置子控制的文字
    childVc.title=title;
    //设置子控制的图片
    childVc.tabBarItem.image=[UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage=[UIImage imageNamed:selectedImage];
    [self addChildViewController:nav];
    
    //设置文字的样式
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=HWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs=[NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName]=HWColor(250, 100, 80);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
//    childVc.view.backgroundColor=HWRandomColor;
    
    [self addChildViewController:nav];
    
}

@end
