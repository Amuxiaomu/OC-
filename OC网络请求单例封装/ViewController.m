//
//  ViewController.m
//  OC网络请求单例封装
//
//  Created by Amuxiaomu on 16/7/20.
//  Copyright © 2016年 Amuxiaomu. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * string = @"http://www.weather.com.cn/data/sk/101010100.html";
    
    [[NetWorkTools sharedTools] require:GET urlString:string parameters:nil success:^(id responseObject) {
        NSLog(@"请求成功%@",responseObject);
    } failure:^(NSError *error) {
        NSLog(@"请求失败%@",error);
    }];

}

@end
