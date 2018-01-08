//
//  TencentLogin.h
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/13.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TencentLoginSuccessHandle)(NSDictionary *userInfo);
typedef void(^TencentLoginFailedHandle)(NSString *errorStr);

@interface TencentLogin : NSObject

- (void)loginSuccessHandle:(TencentLoginSuccessHandle)successHandle failedHandle:(TencentLoginFailedHandle)failedHandle;

@end
