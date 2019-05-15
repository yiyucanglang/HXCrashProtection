//
//  NSMutableArray+HXCPArray.h
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HXCrashProtectionProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// 对于NSMutableArray ：
//__NSArrayM

@interface NSMutableArray (HXCPArray)<HXCrashProtectionProtocol>

@end

NS_ASSUME_NONNULL_END
