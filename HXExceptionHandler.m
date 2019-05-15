//
//  HXExceptionHandler.m
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "HXExceptionHandler.h"

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

@implementation HXExceptionHandler

#pragma mark - Life Cycle
+ (instancetype)exceptionManager {
    static dispatch_once_t onceToken;
    static HXExceptionHandler *manage = nil;
    dispatch_once(&onceToken, ^{
        manage = [[HXExceptionHandler alloc] init];
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
    
    NSException *customException = [[NSException alloc] initWithName:exception.name reason:customReason userInfo:exception.userInfo];
    
    if ([self.delegate respondsToSelector:@selector(handleExcepton:)]) {
        [self.delegate handleExcepton:customException];
    }
    else {
        NSLog(@"exception name:%@ reason:%@ userinfo:%@", customException.name, customException.reason, customException.userInfo);
    }
}

- (void)startCrashExcptionWithExceptionType:(HXCrashExceptionType)exceptionType {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        if (exceptionType & HXCrashExceptionTypeContainer) {
            [NSArray hx_systemMethodExchangeForCrashProtection];
            [NSMutableArray hx_systemMethodExchangeForCrashProtection];
            
            [NSDictionary hx_systemMethodExchangeForCrashProtection];
            [NSMutableDictionary hx_systemMethodExchangeForCrashProtection];
        }
        
        if (exceptionType & HXCrashExceptionTypeString) {
            [NSString hx_systemMethodExchangeForCrashProtection];
            [NSMutableString hx_systemMethodExchangeForCrashProtection];
            [NSAttributedString hx_systemMethodExchangeForCrashProtection];
            [NSMutableAttributedString hx_systemMethodExchangeForCrashProtection];
        }
        
        if (exceptionType & HXCrashExceptionTypeTimer) {
            [NSTimer hx_systemMethodExchangeForCrashProtection];
        }
        
        if (exceptionType & HXCrashExceptionTypeNull) {
            [NSNull hx_systemMethodExchangeForCrashProtection];
        }
        
        if (exceptionType & HXCrashExceptionTypeNotification) {
            [NSNotificationCenter hx_systemMethodExchangeForCrashProtection];
        }
        
        
    });
}

#pragma mark - Override

#pragma mark - Private Method

#pragma mark - Delegate

#pragma mark - Setter And Getter

#pragma mark - Dealloc
@end
