//
//  NSAttributedString+HXCPString.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSAttributedString+HXCPString.h"

#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"

@implementation NSAttributedString (HXCPString)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class NSConcreteAttributedString = NSClassFromString(@"NSConcreteAttributedString");
        
        SEL sel       = @selector(initWithString:);
        Method method = class_getInstanceMethod(NSConcreteAttributedString, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(NSConcreteAttributedString, sel, RSSWReturnType(id), RSSWArguments(NSString *str), RSSWReplacement( {
                id object = nil;
                @try {
                    object = RSSWCallOriginal(str);
                }
                @catch (NSException *exception) {
                    
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(initWithAttributedString:);
        method = class_getInstanceMethod(NSConcreteAttributedString, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(NSConcreteAttributedString, sel, RSSWReturnType(id), RSSWArguments(NSAttributedString *attrStr), RSSWReplacement( {
                id object = nil;
                @try {
                    object = RSSWCallOriginal(attrStr);
                }
                @catch (NSException *exception) {
                    
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(initWithString:attributes:);
        method = class_getInstanceMethod(NSConcreteAttributedString, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(NSConcreteAttributedString, sel, RSSWReturnType(id), RSSWArguments(NSAttributedString *str, NSDictionary<NSAttributedStringKey, id> *attrs), RSSWReplacement( {
                id object = nil;
                @try {
                    object = RSSWCallOriginal(str, attrs);
                }
                @catch (NSException *exception) {
                    
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
    });
}

#pragma mark - Override

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc
@end
