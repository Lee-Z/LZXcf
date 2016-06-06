//
//  LZContent.m
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import "LZContent.h"
#import "LZIssues.h"

@implementation LZContent

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"issues" : [LZIssues class]};
}


@end
