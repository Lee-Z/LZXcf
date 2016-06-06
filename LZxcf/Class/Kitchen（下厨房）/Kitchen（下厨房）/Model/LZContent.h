//
//  LZContent.h
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LZIssues;

@interface LZContent : NSObject

/**菜谱组数*/
@property(nonatomic,assign)NSUInteger count;
/**菜谱数据*/
@property(nonatomic,strong)NSArray<LZIssues *> *issues;

@end
