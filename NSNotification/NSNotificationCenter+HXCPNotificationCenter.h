//
//  NSNotificationCenter+HXCPNotificationCenter.h
//  ParentDemo
//
//  Created by James on 2019/5/15.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HXCrashProtectionProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (HXCPNotificationCenter)<HXCrashProtectionProtocol>

@end

NS_ASSUME_NONNULL_END