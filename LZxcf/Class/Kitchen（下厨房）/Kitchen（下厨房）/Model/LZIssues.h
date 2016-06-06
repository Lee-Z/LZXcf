//
//  LZIssues.h
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LZItems;

@interface LZIssues : NSObject
/**菜谱数量*/
@property(nonatomic,assign)NSUInteger items_count;
/**标题*/
@property(nonatomic,strong)NSString *title;
/**菜谱数组*/
@property(nonatomic,strong)NSArray<LZItems *> *items;
/**当天菜谱id*/
@property(nonatomic,assign)NSUInteger issue_id;
/**菜谱发布日期*/
@property(nonatomic,strong)NSString *today_events;

@end
