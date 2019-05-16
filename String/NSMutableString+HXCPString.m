//
//  NSMutableString+HXCPString.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSMutableString+HXCPString.h"

#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"

@implementation NSMutableString (HXCPString)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class stringClass = NSClassFromString(@"__NSCFString");
        
        SEL sel       = @selector(replaceCharactersInRange:withString:);
        Method method = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(void), RSSWArguments(NSRange range, NSString *aString), RSSWReplacement( {
                
                @try {
                    RSSWCallOriginal(range, aString);
                }
                @catch (NSException *exception) {
                    
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(replaceOccurrencesOfString:withString:options:range:);
        method = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(NSUInteger), RSSWArguments(NSString *target, NSString *replacement, NSStringCompareOptions options, NSRange searchRange), RSSWReplacement( {
                NSUInteger returnValue = 0;
                @try {
                   returnValue = RSSWCallOriginal(target, replacement, options, searchRange);
                }
                @catch (NSException *exception) {
                    returnValue = 0;
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return returnValue;
                }
            }), 0, NULL);
        }
        
        
        
        sel       = @selector(insertString:atIndex:);
        method = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(void), RSSWArguments(NSString *aString, NSUInteger loc), RSSWReplacement( {
                
                @try {
                    RSSWCallOriginal(aString, loc);
                }
                @catch (NSException *exception) {
                    
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(deleteCharactersInRange:);
        method = class_getInstanceMethod(stringClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(stringClass, sel, RSSWReturnType(void), RSSWArguments(NSRange range), RSSWReplacement( {
                
                @try {
                    RSSWCallOriginal(range);
                }
                @catch (NSException *exception) {
                    
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    
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
