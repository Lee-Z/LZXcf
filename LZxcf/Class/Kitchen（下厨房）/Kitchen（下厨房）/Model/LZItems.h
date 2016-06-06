//
//  LZItems.h
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZContents.h"

@interface LZItems : NSObject
/**发布日期*/
@property(nonatomic,copy)NSString *publish_time;
/**网页url*/
@property(nonatomic,copy)NSString *url;
/**模板*/
@property(nonatomic,assign)NSUInteger template;
/**id*/
@property(nonatomic,assign)NSUInteger ID;
/**模板内容*/
@property(nonatomic,strong)LZContents *contents;
/**未知*/
@property(nonatomic,copy)NSString *column_name;
@end
