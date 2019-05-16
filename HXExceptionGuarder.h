//
//  HXExceptionHandler.h
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSInteger, HXExceptionGuardType) {
    HXExceptionGuardTypeContainer         = 1 << 0,
    HXExceptionGuardTypeString            = 1 << 1,
    HXExceptionGuardTypeTimer             = 1 << 2,
    HXExceptionGuardTypeNull              = 1 << 3,
    HXExceptionGuardTypeNotification      = 1 << 4,
    HXExceptionGuardTypeAll               = HXExceptionGuardTypeContainer | HXExceptionGuardTypeString | HXExceptionGuardTypeTimer | HXExceptionGuardTypeNull | HXExceptionGuardTypeNotification,
};

@protocol HXExceptionGuardDelegate <NSObject>

@optional
- (void)handleExcepton:(NSException *)exception;
@end

@interface HXExceptionGuarder : NSObject

@property (nonatomic, weak)     id<HXExceptionGuardDelegate>  delegate;



+ (instancetype)exceptionGuarder;

- (void)startExceptionGuardWithGuardType:(HXExceptionGuardType)guardType;

- (void)handleExcepton:(nullable NSException *)exception;
@end

NS_ASSUME_NONNULL_END
