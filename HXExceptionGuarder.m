//
//  HXExceptionHandler.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "HXExceptionGuarder.h"

#import "NSArray+HXCPArray.h"
#import "NSMutableArray+HXCPArray.h"

#import "NSDictionary+HXCPDic.h"
#import "NSMutableDictionary+HXCPDic.h"

#import "NSString+HXCPString.h"
#import "NSMutableString+HXCPString.h"
#import "NSAttributedString+HXCPString.h"
#import "NSMutableAttributedString+HXCPString.h"

#import "NSTimer+HXCPTimer.h"

#import "NSNull+HXCPNull.h"

#import "NSNotificationCenter+HXCPNotificationCenter.h"

@implementation HXExceptionGuarder

#pragma mark - Life Cycle
+ (instancetype)exceptionGuarder {
    static dispatch_once_t onceToken;
    static HXExceptionGuarder *manage = nil;
    dispatch_once(&onceToken, ^{
        manage = [[HXExceptionGuarder alloc] init];
    });
    
    return manage;
}

#pragma mark - System Method

#pragma mark - Public Method
- (void)handleExcepton:(NSException *)exception {
    
    //堆栈数据
    NSArray *callStackSymbolsArr = [NSThread callStackSymbols];
    NSString *stackSymbolInfo = [callStackSymbolsArr componentsJoinedByString:@"\n"];//分隔符逗号
    NSString *customReason = [NSString stringWithFormat:@"%@ stackSymbolInfo:%@", exception.reason, stackSymbolInfo];
    
    NSException *customException = [[NSException alloc] initWithName:[NSString stringWithFormat:@"<HXExceptionGuard>:%@", exception.name] reason:customReason userInfo:exception.userInfo];
    
    if ([self.delegate respondsToSelector:@selector(handleExcepton:)]) {
        [self.delegate handleExcepton:customException];
    }
    else {
        NSLog(@"exception name:%@ reason:%@ userinfo:%@", customException.name, customException.reason, customException.userInfo);
    }
}

- (void)startExceptionGuardWithGuardType:(HXExceptionGuardType)guardType {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (guardType & HXExceptionGuardTypeContainer) {
            [NSArray hx_systemMethodExchangeForException];
            [NSMutableArray hx_systemMethodExchangeForException];
            
            [NSDictionary hx_systemMethodExchangeForException];
            [NSMutableDictionary hx_systemMethodExchangeForException];
        }
        
        if (guardType & HXExceptionGuardTypeString) {
            [NSString hx_systemMethodExchangeForException];
            [NSMutableString hx_systemMethodExchangeForException];
            [NSAttributedString hx_systemMethodExchangeForException];
            [NSMutableAttributedString hx_systemMethodExchangeForException];
        }
        
        if (guardType & HXExceptionGuardTypeTimer) {
            [NSTimer hx_systemMethodExchangeForException];
        }
        
        if (guardType & HXExceptionGuardTypeNull) {
            [NSNull hx_systemMethodExchangeForException];
        }
        
        if (guardType & HXExceptionGuardTypeNotification) {
            [NSNotificationCenter hx_systemMethodExchangeForException];
        }
        
        
    });
}

#pragma mark - Override

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc
@end
