//
//  WeiboLogin.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/14.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "WeiboLogin.h"

@interface WeiboLogin ()

@property (nonatomic, copy) WeiboLoginSuccessHandle successHandle;
@property (nonatomic, copy) WeiboLoginFailedHandle failedHandle;

@end

@implementation WeiboLogin

- (instancetype)init
{
    self = [super init];
    if (self) {
        [WeiboSDK enableDebugMode:YES];
        [WeiboSDK registerApp:WEIBOAPPID];
    }
    return self;
}

- (void)loginSuccessHandle:(WeiboLoginSuccessHandle)successHandle failedHandle:(WeiboLoginFailedHandle)failedHandle {
    _successHandle = successHandle;
    _failedHandle = failedHandle;
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://sns.whalecloud.com/sina2/callback";
    request.scope = @"all";
    request.userInfo = nil;
    [WeiboSDK sendRequest:request];
}

- (WeiboLoginHandle<WeiboSDKDelegate> *)weiboHandle {
    if (!_weiboHandle) {
        _weiboHandle = [[WeiboLoginHandle alloc] init];
    }
    return _weiboHandle;
}

@end
