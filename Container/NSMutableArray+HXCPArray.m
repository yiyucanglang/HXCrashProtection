//
//  NSMutableArray+HXCPArray.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSMutableArray+HXCPArray.h"
#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"

@implementation NSMutableArray (HXCPArray)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class arrayMClass = NSClassFromString(@"__NSArrayM");
        
        SEL sel       = @selector(objectAtIndex:);
        Method method = class_getInstanceMethod(arrayMClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(arrayMClass, sel, RSSWReturnType(id), RSSWArguments(NSUInteger index), RSSWReplacement( {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(index);
                }
                @catch (NSException *exception) {
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(removeObjectAtIndex:);
        method = class_getInstanceMethod(arrayMClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(arrayMClass, sel, RSSWReturnType(void), RSSWArguments(NSUInteger index), RSSWReplacement( {
                
                @try {
                    RSSWCallOriginal(index);
                }
                @catch (NSException *exception) {
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    
                }
            }), 0, NULL);
        }
        
        
        sel       = @selector(insertObject:atIndex:);
        method = class_getInstanceMethod(arrayMClass, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(arrayMClass, sel, RSSWReturnType(void), RSSWArguments(id object, NSUInteger index), RSSWReplacement( {
                
                @try {
                    RSSWCallOriginal(object, index);
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
