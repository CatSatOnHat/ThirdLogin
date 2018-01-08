//
//  WeChatLogin.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/14.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "WeChatLogin.h"

@interface WeChatLogin ()

@property (nonatomic, copy) WeChatLoginSuccessHandle successHandle;
@property (nonatomic, copy) WeChatLoginFailedHandle failedHandle;

@end

@implementation WeChatLogin

- (instancetype)init
{
    self = [super init];
    if (self) {
        [WXApi registerApp:WECHATAPPID];
    }
    return self;
}

- (void)loginSuccessHandle:(WeChatLoginSuccessHandle)successHandle failedHandle:(WeChatLoginFailedHandle)failedHandle {
    _successHandle = successHandle;
    _failedHandle = failedHandle;
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.scope = @"snsapi_userinfo";
    req.state = @"123";
    [WXApi sendReq:req];
}

- (WeChatLoginHandle<WXApiDelegate> *)weChatHandle {
    if (!_weChatHandle) {
        _weChatHandle = [[WeChatLoginHandle alloc] init];
    }
    return _weChatHandle;
}



@end
