//
//  ThirdLoginManager.h
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/13.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TencentLogin.h"
#import "WeChatLogin.h"
#import "WeiboLogin.h"

typedef enum : NSUInteger {
    kTencentLogin,
    kWxLogin,
    kWeiboLogin,
} ThirdLoginType;

typedef void(^ThirdLoginSuccessHandle)(NSDictionary *userInfo);
typedef void(^ThirdLoginFailedHandle)(NSString *errorStr);

@interface ThirdLoginManager : NSObject

@property (nonatomic, strong, readonly) TencentLogin *tencentLogin;

@property (nonatomic, strong, readonly) WeChatLogin *weChatLogin;

@property (nonatomic, strong, readonly) WeiboLogin *weiboLogin;


+ (instancetype)sharaManager;

/**
 第三方登录

 @param loginType 登录类型
 @param loginSuccessHandle 成功处理
 @param loginFailedHandle 失败的处理
 */
- (void)loginWithType:(ThirdLoginType)loginType loginSuccessHandle:(ThirdLoginSuccessHandle)loginSuccessHandle loginFailedHandle:(ThirdLoginFailedHandle)loginFailedHandle;


@end
