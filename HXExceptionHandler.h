//
//  HXExceptionHandler.h
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, HXCrashExceptionType) {
    HXCrashExceptionTypeContainer         = 1 << 0,
    HXCrashExceptionTypeString            = 1 << 1,
    HXCrashExceptionTypeTimer             = 1 << 2,
    HXCrashExceptionTypeNull              = 1 << 3,
    HXCrashExceptionTypeNotification      = 1 << 4,
    HXCrashExceptionTypeAll               = HXCrashExceptionTypeContainer | HXCrashExceptionTypeString | HXCrashExceptionTypeTimer | HXCrashExceptionTypeNull | HXCrashExceptionTypeNotification,
};

@protocol HXExceptionHandlerDelegate <NSObject>

@optional
- (void)handleExcepton:(NSException *)exception;
@end

@interface HXExceptionHandler : NSObject

@property (nonatomic, weak)     id<HXExceptionHandlerDelegate>  delegate;



+ (instancetype)exceptionManager;

- (void)startCrashExcptionWithExceptionType:(HXCrashExceptionType)exceptionType;

- (void)handleExcepton:(nullable NSException *)exception;
@end

NS_ASSUME_NONNULL_END
