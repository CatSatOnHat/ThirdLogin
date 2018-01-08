//
//  TencentLogin.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/13.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "TencentLogin.h"

@interface TencentLogin () <TencentSessionDelegate>

@property (nonatomic, strong) TencentOAuth *tencentOAuth;

@property (nonatomic, copy) TencentLoginSuccessHandle successHandle;
@property (nonatomic, copy) TencentLoginFailedHandle failedHandle;

@end

@implementation TencentLogin

- (void)loginSuccessHandle:(TencentLoginSuccessHandle)successHandle failedHandle:(TencentLoginFailedHandle)failedHandle {
    _successHandle = successHandle;
    _failedHandle = failedHandle;
    NSArray *permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_USER_INFO,	//获取用户信息
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,	//移动端获取用户信息
//                            kOPEN_PERMISSION_GET_INFO,	//获取登录用户自己的详细信息
//                            kOPEN_PERMISSION_GET_VIP_RICH_INFO,	//获取会员用户详细信息
//                            kOPEN_PERMISSION_GET_VIP_INFO,	//获取会员用户基本信息
//                            kOPEN_PERMISSION_GET_OTHER_INFO,	//获取其他用户的详细信息
//                            kOPEN_PERMISSION_ADD_TOPIC,	//发表一条说说到QQ空间 (需要申请权限)
//                            kOPEN_PERMISSION_ADD_ONE_BLOG,	//发表一篇日志到QQ空间 (需要申请权限)
//                            kOPEN_PERMISSION_ADD_ALBUM,	//创建一个QQ空间相册 (需要申请权限)
//                            kOPEN_PERMISSION_UPLOAD_PIC,	//上传一张照片到QQ空间相册 (需要申请权限)
//                            kOPEN_PERMISSION_LIST_ALBUM,	//获取用户QQ空间相册列表 (需要申请权限)
//                            kOPEN_PERMISSION_ADD_SHARE,	//同步分享到QQ空间、腾讯微博
//                            kOPEN_PERMISSION_CHECK_PAGE_FANS,	//验证是否认证空间粉丝
                            nil];
    [self.tencentOAuth authorize:permissions];
}
/**
 登录成功后的回调
 */
- (void)tencentDidLogin {
    if (_tencentOAuth.accessToken.length > 0) {
        // 获取用户信息
        if ([_tencentOAuth getUserInfo]) {
            NSLog(@"获取用户个人信息成功");
        } else {
            _failedHandle(@"获取用户个人信息失败");
        }
    } else {
        _failedHandle(@"登录不成功 没有获取accesstoken");
    }
}
/**
 登录失败后的回调

 @param cancelled 是否取消
 */
- (void)tencentDidNotLogin:(BOOL)cancelled {
    if (cancelled) {
        _failedHandle(@"用户取消登录");
    } else {
        _failedHandle(@"登录失败");
    }
}
/**
 登录时网路有问题
 */
- (void)tencentDidNotNetWork {
    _failedHandle(@"登录时网路有问题");
}
/**
 获取到用户信息的回调
 
 @param response API返回结果
 */
- (void)getUserInfoResponse:(APIResponse *)response {
    
    if (response && response.retCode == URLREQUEST_SUCCEED) {
        NSDictionary *userInfo = [response jsonResponse];
        NSLog(@"%@", userInfo);
        /*
         //提取有用的信息
            @"openid"
            @"access_token"
            @"type"
            @"pf"
         */
        
        _successHandle(userInfo);
    } else {
        NSLog(@"QQ auth fail ,getUserInfoResponse:%d", response.detailRetCode);
    }
}

- (TencentOAuth *)tencentOAuth {
    if (!_tencentOAuth) {
        _tencentOAuth = [[TencentOAuth alloc] initWithAppId:TENCENTAPPID andDelegate:self];
    }
    return _tencentOAuth;
}

@end
