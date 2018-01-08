//
//  WeChatLogin.h
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/14.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeChatLoginHandle.h"

typedef void(^WeChatLoginSuccessHandle)(NSDictionary *userInfo);
typedef void(^WeChatLoginFailedHandle)(NSString *errorStr);

@interface WeChatLogin : NSObject

@property (nonatomic, strong) WeChatLoginHandle<WXApiDelegate> *weChatHandle;

- (void)loginSuccessHandle:(WeChatLoginSuccessHandle)successHandle failedHandle:(WeChatLoginFailedHandle)failedHandle;

@end
