//
//  LZAfnNetWork.m
//  LZxcf
//
//  Created by app on 16/5/24.
//  Copyright © 2016年 win. All rights reserved.
//

#import "LZAfnNetWork.h"


@implementation LZAfnNetWork


#pragma mark ----  获取当前网络连接状态
-(void)reach
{
    /**
     *  AFNetworkReachabilityStatusUnknown          = -1, // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,  // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,  // 3G
     AFNetworkReachabilityStatusReachableViaWiFi = 2,  // WiFi
     */
    
    // 如果要检测网络状态的变化， 必须用检测管理器的单例
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"当前网络状态 = %ld",(long)status);
    }];
}

#pragma mark ----- get请求
-(void)getWithURL:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary
{
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    NSURL *url=[NSURL URLWithString:urlString];
    [manger GET:url.absoluteString parameters:dictionary progress:^(NSProgress * _Nonnull downloadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark ----post数据请求
-(void)postWithURL:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary

{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // JSON 数据解析
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // NSData 数据解析
    // manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 返回的类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSURL *url = [NSURL URLWithString:urlString];
    [manager POST:url.absoluteString parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"POST = %@", responseObject);
        _block(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}
@end
