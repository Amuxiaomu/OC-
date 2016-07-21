

//
//  NetWorkTools.m
//  OC网络请求单例封装
//
//  Created by Amuxiaomu on 16/7/20.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import "NetWorkTools.h"
#import <AFNetworking.h>
@implementation NetWorkTools


+ (instancetype)sharedTools{
    static NetWorkTools * instant;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instant = [[NetWorkTools alloc]init];
        instant.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    });
    
    return instant;
}
- (void)require:(NetworkToolsType) type urlString:(NSString *)urlString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError * error))failure{
    
    if (type == GET) {
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else{
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }

}

@end
