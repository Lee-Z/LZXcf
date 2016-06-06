//
//  LZAfnNetWork.h
//  LZxcf
//
//  Created by app on 16/5/24.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void  (^NetRequestBlock)(id info);

@interface LZAfnNetWork : NSObject

@property (nonatomic, copy) NetRequestBlock block;
//获取当前连接状态
-(void)reach;
//GET 网络请求连接
-(void)getWithURL:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary;
//POST 网络请求连接
-(void)postWithURL:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary;

@end
