//
//  UIViewController+swizzling.m
//  iOSSwizzlingDemo
//
//  Created by zilin_weng on 15/8/4.
//  Copyright (c) 2015年 Weng-Zilin. All rights reserved.
//

#import "UIViewController+swizzling.h"
#import <objc/runtime.h>
#import "Aspects.h"

@implementation UIViewController (swizzling)

#ifndef kUsingAspect
+ (void)load
{
    SEL origSel = @selector(viewDidAppear:);
    SEL swizSel = @selector(swiz_viewDidAppear:);
    [UIViewController swizzleMethods:[self class] originalSelector:origSel swizzledSelector:swizSel];
}

//exchange implementation of two methods
+ (void)swizzleMethods:(Class)class originalSelector:(SEL)origSel swizzledSelector:(SEL)swizSel
{
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method swizMethod = class_getInstanceMethod(class, swizSel);
    
    //class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, origSel, method_getImplementation(swizMethod), method_getTypeEncoding(swizMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizSel, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    } else {
        //origMethod and swizMethod already exist
        method_exchangeImplementations(origMethod, swizMethod);
    }
}


- (void)swiz_viewDidAppear:(BOOL)animated
{
    NSLog(@"I am in - [swiz_viewDidAppear:]");
    //handle viewController transistion counting here, before ViewController instance calls its -[viewDidAppear:] method
    //需要注入的代码写在此处
    [self swiz_viewDidAppear:animated];
}

#endif

@end
