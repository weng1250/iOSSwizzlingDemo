//
//  SwizzleManager.h
//  iOSSwizzlingDemo
//
//  Created by zilin_weng on 15/8/5.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//
//  所有的注入操作都在这个类里面管理，降低与View Controller的耦合

#import <Foundation/Foundation.h>
#import "Aspects/Aspects.h"

@interface SwizzleManager : NSObject

+ (void)createAllHooks;

@end
