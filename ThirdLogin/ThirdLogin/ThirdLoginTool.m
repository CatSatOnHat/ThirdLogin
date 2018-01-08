//
//  ThirdLoginTool.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/13.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "ThirdLoginTool.h"
#import "ThirdLoginManager.h"

@implementation ThirdLoginTool

+ (BOOL)handleOpenURL:(NSURL *)url {
    if ([url.scheme hasPrefix:@"tencent"]) {
        //QQ
        return [TencentOAuth HandleOpenURL:url];
    } else if ([url.scheme hasPrefix:@"wx"]){
        //微信
        return [WXApi handleOpenURL:url delegate:[ThirdLoginManager sharaManager].weChatLogin.weChatHandle];
    } else if ([url.scheme hasPrefix:@"wb"]) {
        //微博
        return [WeiboSDK handleOpenURL:url delegate:[ThirdLoginManager sharaManager].weiboLogin.weiboHandle];
    }
    return YES;
}

@end
