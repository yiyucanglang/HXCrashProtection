//
//  NSTimer+HXCPTimer.m
//  ParentDemo
//
//  Created by James on 2019/5/14.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import "NSTimer+HXCPTimer.h"

#import "RSSwizzle.h"
#import "HXExceptionHandler.h"

@interface HXNSTimerIntercepter : NSObject
@property (nonatomic, weak)     id  target;
@property (nonatomic, weak)     NSTimer   *sourceTimer;
@property (nonatomic) SEL aSelector;
@property (nonatomic, copy)     NSString  *targerClassName;

@end

@implementation HXNSTimerIntercepter

- (void)trigger:(id)timer  {
    id strongTarget = self.target;
    if (strongTarget && ([strongTarget respondsToSelector:self.aSelector])) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [strongTarget performSelector:self.aSelector withObject:[timer userInfo]];
#pragma clang diagnostic pop
    } else {
        NSTimer *sourceTimer = self.sourceTimer;
        if (sourceTimer) {
            [sourceTimer invalidate];
        }
        
        NSString *reason = [NSString stringWithFormat:@"%@(timer method:%@) forget to release timer when dealloc ", self.targerClassName, NSStringFromSelector(self.aSelector)];
        
        NSException *exception = [NSException exceptionWithName:@"The timer did not release correctly" reason:reason userInfo:nil];
        [[HXExceptionHandler exceptionManager] handleExcepton:exception];
    }
}

@end


@interface NSTimer (HXNSTimerIntercepter)

@property (nonatomic, strong) HXNSTimerIntercepter *timerIntercepter;

@end

@implementation NSTimer (HXNSTimerIntercepter)

- (void)setTimerIntercepter:(HXNSTimerIntercepter *)timerIntercepter {
    objc_setAssociatedObject(self, @selector(timerIntercepter), timerIntercepter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (HXNSTimerIntercepter *)timerIntercepter {
    return objc_getAssociatedObject(self, @selector(timerIntercepter));
}

@end


@implementation NSTimer (HXCPTimer)
#pragma mark - Life Cycle

#pragma mark - System Method

#pragma mark - Public Method
+ (void)hx_systemMethodExchangeForCrashProtection {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL sel       = @selector(scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:);
        Method method = class_getClassMethod([self class], sel);
        if(NULL != method) {
            
            RSSwizzleClassMethod([self class], sel, RSSWReturnType(id), RSSWArguments(NSTimeInterval ti, id aTarget, SEL aSelector, id userInfo, BOOL yesOrNo),  {
                NSLog(@"ti:%@ aTarget:%@ aSelector:%@ yesOrNo:%@", @(ti), aTarget, NSStringFromSelector(aSelector), @(yesOrNo));
                if (yesOrNo) {
                    NSTimer *timer =  nil;
                    @autoreleasepool {
                        HXNSTimerIntercepter *interceptor = [HXNSTimerIntercepter new];
                        interceptor.target = aTarget;
                        interceptor.targerClassName = NSStringFromClass([aTarget class]);
                        interceptor.aSelector = aSelector;
                        timer = RSSWCallOriginal(ti, interceptor, @selector(trigger:), userInfo, yesOrNo);
                        timer.timerIntercepter = interceptor;
                        interceptor.sourceTimer = timer;
                    }
                    return  timer;
                }
                return RSSWCallOriginal(ti, aTarget, aSelector, userInfo, yesOrNo);
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
