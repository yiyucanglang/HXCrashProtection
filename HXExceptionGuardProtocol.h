//
//  HXExceptionGuardProtocol.h
//  ParentDemo
//
//  Created by 周义进 on 2019/5/10.
//  Copyright © 2019 DaHuanXiong. All rights reserved.
//

#ifndef HXExceptionGuardProtocol_h
#define HXExceptionGuardProtocol_h
#import <objc/runtime.h>
@protocol HXExceptionGuardProtocol <NSObject>

+ (void)hx_systemMethodExchangeForException;

@end


#endif /* HXExceptionGuardProtocol_h */
