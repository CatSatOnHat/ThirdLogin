//
//  ThirdLoginManager.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/13.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "ThirdLoginManager.h"

@interface ThirdLoginManager ()

@property (nonatomic, strong, readwrite) TencentLogin *tencentLogin;

@property (nonatomic, strong, readwrite) WeChatLogin *weChatLogin;

@property (nonatomic, strong, readwrite) WeiboLogin *weiboLogin;

@end


@implementation ThirdLoginManager

+ (instancetype)sharaManager {
    static ThirdLoginManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ThirdLoginManager alloc] init];
    });
    return manager;
}

- (void)loginWithType:(ThirdLoginType)loginType
   loginSuccessHandle:(ThirdLoginSuccessHandle)loginSuccessHandle
    loginFailedHandle:(ThirdLoginFailedHandle)loginFailedHandle {
    if (loginType == kTencentLogin) {
        [self.tencentLogin loginSuccessHandle:loginSuccessHandle failedHandle:loginFailedHandle];
    } else if (loginType == kWxLogin) {
        [self.weChatLogin loginSuccessHandle:loginSuccessHandle failedHandle:loginFailedHandle];
    } else if (loginType == kWeiboLogin) {
        [self.weiboLogin loginSuccessHandle:loginSuccessHandle failedHandle:loginFailedHandle];
    }
}

- (TencentLogin *)tencentLogin {
    if (!_tencentLogin) {
        _tencentLogin = [[TencentLogin alloc] init];
    }
    return _tencentLogin;
}

- (WeChatLogin *)weChatLogin {
    if (!_weChatLogin) {
        _weChatLogin = [[WeChatLogin alloc] init];
    }
    return _weChatLogin;
}

- (WeiboLogin *)weiboLogin {
    if (!_weiboLogin) {
        _weiboLogin = [[WeiboLogin alloc] init];
    }
    return _weiboLogin;
}

@end
