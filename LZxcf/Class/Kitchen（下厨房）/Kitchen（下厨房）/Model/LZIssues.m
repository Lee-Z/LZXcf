//
//  LZIssues.m
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import "LZIssues.h"

#import "LZItems.h"

@implementation LZIssues

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"items" : [LZItems class]};
}
@end
