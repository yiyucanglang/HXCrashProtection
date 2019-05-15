//
//  NSDictionary+HXCPDic.h
//  ParentDemo
//
//  Created by James on 2019/5/13.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HXCrashProtectionProtocol.h"

//[NSDictionary dictionary];。 @{}; __NSDictionary0
// 其他一般是  __NSDictionaryI

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (HXCPDic)<HXCrashProtectionProtocol>

@end

NS_ASSUME_NONNULL_END
