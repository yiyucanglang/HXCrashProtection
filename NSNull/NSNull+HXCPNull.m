//
//  NSNull+HXCPNull.m
//  ParentDemo
//
//  Created by James on 2019/5/15.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSNull+HXCPNull.h"

#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"

@implementation NSNull (HXCPNull)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
        
        SEL sel       = @selector(forwardingTargetForSelector:);
        Method method = class_getInstanceMethod([self class], sel);
        if(NULL != method) {
            
            RSSwizzleInstanceMethod([self class], sel, RSSWReturnType(id), RSSWArguments(SEL aSelector), RSSWReplacement( {
                
                id object = nil;
                
                static NSArray *sTmpOutput = nil;
                if (sTmpOutput == nil) {
                    sTmpOutput = @[@"", @0, @[], @{}];
                }
                
                NSException *exception = [NSException exceptionWithName:@"Null object appear" reason:@"maybe error raise when convert" userInfo:nil];
                
                [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
                
                for (id tmpObj in sTmpOutput) {
                    if ([tmpObj respondsToSelector:aSelector]) {
                        return tmpObj;
                    }
                }
                return object;
                
            }), 0, NULL);
        }
        
#pragma clang diagnostic pop
    });
}

#pragma mark - Override

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc
@end
