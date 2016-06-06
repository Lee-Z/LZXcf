//
//  LZImage.h
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZImage : NSObject
/**图片地址*/
@property(nonatomic,copy)NSString *url;
/**图片宽*/
@property(nonatomic,assign)NSUInteger width;
/**图片高*/
@property(nonatomic,assign)NSUInteger height;
@end
