//
//  NSDictionary+HXCPDic.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSDictionary+HXCPDic.h"

#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"

@implementation NSDictionary (HXCPDic)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL sel       = @selector(dictionaryWithObjects:forKeys:count:);
        Method method = class_getClassMethod([self class], sel);
        if(NULL != method) {
            
            RSSwizzleClassMethod([self class], sel, RSSWReturnType(id), RSSWArguments(const id  _Nonnull *objects, const id  _Nonnull *keys, NSUInteger cnt),  {
                
                id object = nil;
                
                @try {
                    object = RSSWCallOriginal(objects, keys, cnt);
                }
                @catch (NSException *exception) {
                    [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                }
                @finally {
                    return object;
                }
            });
        }
        
        
    });
}

#pragma mark - Override

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc
@end
