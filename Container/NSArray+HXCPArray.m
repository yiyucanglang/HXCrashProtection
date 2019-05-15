//
//  NSArray+HXCPArray.m
//  ParentDemo
//
//  Created by 周义进 on 2019/5/10.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSArray+HXCPArray.h"
#import "RSSwizzle.h"
#import "HXExceptionHandler.h"

#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method


@implementation NSArray (HXCPArray)

+ (void)hx_systemMethodExchangeForCrashProtection {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class __NSArrayI = NSClassFromString(@"__NSArrayI");
        Class __NSSingleObjectArrayI = NSClassFromString(@"__NSSingleObjectArrayI");
//        Class __NSArray0 = NSClassFromString(@"__NSArray0");
        
        SEL sel       = @selector(arrayWithObjects:count:);
        Method method = class_getClassMethod([self class], sel);
        if(NULL != method) {
        
            RSSwizzleClassMethod([self class], sel, RSSWReturnType(id), RSSWArguments(const id  _Nonnull *objects, NSUInteger cnt),  {

                id object = nil;

                @try {
                    object = RSSWCallOriginal(objects, cnt);
                }
                @catch (NSException *exception) {
                    [[HXExceptionHandler exceptionManager] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            });
        }
        
        
        
        sel       = @selector(objectAtIndex:);
        method = class_getInstanceMethod(__NSArrayI, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(__NSArrayI, sel, RSSWReturnType(id), RSSWArguments(NSUInteger index), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(index);
                }
                @catch (NSException *exception) {
                    [[HXExceptionHandler exceptionManager] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(objectAtIndex:);
        method = class_getInstanceMethod(__NSSingleObjectArrayI, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(__NSSingleObjectArrayI, sel, RSSWReturnType(id), RSSWArguments(NSUInteger index), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(index);
                }
                @catch (NSException *exception) {
                    [[HXExceptionHandler exceptionManager] handleExcepton:exception];
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
