//
//  NetWorkTools.h
//  OC网络请求单例封装
//
//  Created by Amuxiaomu on 16/7/20.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>

//网络枚举
typedef NS_ENUM(NSUInteger,NetworkToolsType){
    GET,
    POST
};
@interface NetWorkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;

- (void)require:(NetworkToolsType) type urlString:(NSString *)urlString parameters:(id)parameters success:(void(^)(id responseObject))success failure:(void(^)(NSError * error))failure;
@end
