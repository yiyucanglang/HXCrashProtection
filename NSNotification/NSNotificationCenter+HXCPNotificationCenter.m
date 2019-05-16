//
//  NSNotificationCenter+HXCPNotificationCenter.m
//  ParentDemo
//
//  Created by James on 2019/5/15.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSNotificationCenter+HXCPNotificationCenter.h"

#import "RSSwizzle.h"
#import "HXExceptionGuarder.h"


@interface HXSystemNotificationAutoClearObserver : NSObject
@property (nonatomic, strong)   NSMutableArray  *centerArrs;
@property (nonatomic, unsafe_unretained)     id   observer;

@end

@implementation HXSystemNotificationAutoClearObserver

- (void)addCenter:(NSNotificationCenter *)center {
    [self.centerArrs addObject:center];
}

- (NSMutableArray *)centerArrs {
    if (!_centerArrs) {
        _centerArrs = [NSMutableArray array];
    }
    return _centerArrs;
}

- (void)dealloc
{
    @autoreleasepool {
        id observer = nil;
        
        @try {
            observer = self.observer;
        } @catch (NSException *exception) {
            observer = nil;
            [[HXExceptionGuarder exceptionGuarder] handleExcepton:exception];
        } @finally {
            
        }
        
        if (observer) {
            for (NSNotificationCenter *center in self.centerArrs) {
                [center removeObserver:observer];
            }
        }
        
    }
}

@end


@implementation NSNotificationCenter (HXCPNotificationCenter)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForException {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL sel       = @selector(addObserver:selector:name:object:);
        
        Method method = class_getInstanceMethod([self class], sel);
        if(NULL != method) {
            RSSwizzleInstanceMethod([self class], sel, RSSWReturnType(void), RSSWArguments(id observer, SEL aSelector, NSNotificationName aName, id anObject), RSSWReplacement( {
                
                HXSystemNotificationAutoClearObserver *autoClear = nil;
                static char hxAutoClearKey;
                RSSWCallOriginal(observer, aSelector, aName, anObject);
                @autoreleasepool {
                    autoClear = objc_getAssociatedObject(observer, &hxAutoClearKey);
                    if (!autoClear) {
                        autoClear = [HXSystemNotificationAutoClearObserver new];
                        autoClear.observer = observer;
                        objc_setAssociatedObject(observer, &hxAutoClearKey, autoClear, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                    }
                    [autoClear addCenter:self];
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
