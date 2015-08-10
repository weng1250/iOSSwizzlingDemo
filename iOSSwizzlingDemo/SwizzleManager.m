//
//  SwizzleManager.m
//  iOSSwizzlingDemo
//
//  Created by zilin_weng on 15/8/5.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "SwizzleManager.h"
#import <UIKit/UIKit.h>

@implementation SwizzleManager

+ (void)createAllHooks
{
    [UIViewController aspect_hookSelector:@selector(viewDidLoad)
                              withOptions:AspectPositionBefore
                               usingBlock:^(id<AspectInfo> info){
                                   //用户统计代码写在此处
                                   NSLog(@"[ASPECT] inject in class instance:%@", [info instance]);
                               }
                                    error:NULL];
    //other hooks ... goes here
    //...
}

@end
