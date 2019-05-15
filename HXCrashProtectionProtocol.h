//
//  HXCrashProtectionProtocol.h
//  ParentDemo
//
//  Created by 周义进 on 2019/5/10.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#ifndef HXCrashProtectionProtocol_h
#define HXCrashProtectionProtocol_h
#import <objc/runtime.h>
@protocol HXCrashProtectionProtocol <NSObject>

+ (void)hx_systemMethodExchangeForCrashProtection;

@end


#endif /* HXCrashProtectionProtocol_h */
