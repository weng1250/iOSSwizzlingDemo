//
//  ViewController.m
//  iOSSwizzlingDemo
//
//  Created by zilin_weng on 15/8/4.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

//博客园博文链接：
//http://i.cnblogs.com/EditPosts.aspx?postid=4704996


//是否使用Aspect库实现代码注入，取消注释表示启用Aspect；注释掉表示使用Method Swizzling原始代码
//#define kUsingAspect            1


#import "ViewController.h"
#import "Aspects/Aspects.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"I am in - [viewDidAppear:]");
}

@end
