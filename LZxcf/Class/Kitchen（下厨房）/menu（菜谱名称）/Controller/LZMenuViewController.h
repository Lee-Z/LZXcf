//
//  LZMenuViewController.h
//  LZxcf
//
//  Created by win on 16/5/9.
//  Copyright © 2016年 win. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void  (^ReturnTB)(NSString *showtext);
@interface LZMenuViewController : UIViewController

@property(nonatomic,copy)ReturnTB returnTB;
-(void)returnTB:(ReturnTB)block;


@end
