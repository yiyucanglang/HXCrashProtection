//
//  NSArray+HXCPArray.h
//  ParentDemo
//
//  Created by 周义进 on 2019/5/10.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "HXExceptionGuardProtocol.h"

NS_ASSUME_NONNULL_BEGIN

// 对于NSarray ：
//[NSarray array] 和 @[] 的类型是__NSArray0
//只有一个元素的数组类型 __NSSingleObjectArrayI,
// 其他的大部分是//__NSArrayI,



@interface NSArray (HXCPArray)<HXExceptionGuardProtocol>
@end

NS_ASSUME_NONNULL_END
