//
//  NSMutableDictionary+HXCPDic.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSMutableDictionary+HXCPDic.h"

#import "RSSwizzle.h"
#import "HXExceptionHandler.h"

@implementation NSMutableDictionary (HXCPDic)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForCrashProtection {
    
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class dictionaryM = NSClassFromString(@"__NSDictionaryM");
        
        
        SEL sel       = @selector(setObject:forKey:);
        Method method = class_getInstanceMethod(dictionaryM, sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod(dictionaryM, sel, RSSWReturnType(void), RSSWArguments(id object, id key), RSSWReplacement( {
                
                @try {
                    RSSWCallOriginal(object, key);
                }
                @catch (NSException *exception) {
                    [[HXExceptionHandler exceptionManager] handleExcepton:exception];
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
