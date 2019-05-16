//
//  NSString+HXCPString.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSString+HXCPString.h"
#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"

@implementation NSString (HXCPString)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class stringClass = NSClassFromString(@"__NSCFConstantString");
        
        SEL sel       = @selector(substringFromIndex:);
        Method method = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSUInteger from), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(from);
                }
                @catch (NSException *exception) {
                    object = @"";
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        sel       = @selector(substringFromIndex:);
        method    = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSUInteger from), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(from);
                }
                @catch (NSException *exception) {
                    object = @"";
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
    
        sel       = @selector(substringToIndex:);
        method    = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSUInteger to), RSSWReplacement( {
                
                id object = nil;
                @try {
                    object = RSSWCallOriginal(to);
                }
                @catch (NSException *exception) {
                    object = @"";
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(substringWithRange:);
        method    = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSRange range), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(range);
                }
                @catch (NSException *exception) {
                    object = @"";
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(stringByReplacingOccurrencesOfString:withString:);
        method    = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSString *target, NSString *replacement), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(target, replacement);
                }
                @catch (NSException *exception) {
                    object = @"";
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(stringByReplacingOccurrencesOfString:withString:options:range:);
        method    = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSString *target, NSString *replacement, NSStringCompareOptions options, NSRange searchRange), RSSWReplacement( {
                
                id object = nil;
                @try {
                    object = RSSWCallOriginal(target, replacement, options, searchRange);
                }
                @catch (NSException *exception) {
                    object = @"";
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(stringByReplacingCharactersInRange:withString:);
        method    = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSString *), RSSWArguments(NSRange range, NSString *replacement), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(range, replacement);
                }
                @catch (NSException *exception) {
                    object = @"";
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
