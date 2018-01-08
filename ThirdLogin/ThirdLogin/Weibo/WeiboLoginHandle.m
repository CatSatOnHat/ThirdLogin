//
//  WeiboLoginHandle.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/14.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "WeiboLoginHandle.h"

@implementation WeiboLoginHandle

/**
 收到一个来自微博客户端程序的响应
 
 收到微博的响应后，第三方应用可以通过响应类型、响应的数据和 WBBaseResponse.userInfo 中的数据完成自己的功能
 @param response 具体的响应对象
 */
- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
    NSLog(@"response---%@----%ld", response.userInfo, (long)response.statusCode);
    switch (response.statusCode) {
        case WeiboSDKResponseStatusCodeSuccess:
        {
            // .userInfo   .status
        }
            break;
        case WeiboSDKResponseStatusCodeUserCancel:
        {
            NSLog(@"用户取消发送");
        }
            break;
        case WeiboSDKResponseStatusCodeSentFail:
        {
            NSLog(@"发送失败");
        }
            break;
        case WeiboSDKResponseStatusCodeAuthDeny:
        {
            NSLog(@"授权失败");
        }
            break;
        case WeiboSDKResponseStatusCodeUserCancelInstall:
        {
            NSLog(@"用户取消安装微博客户端");
        }
            break;
        case WeiboSDKResponseStatusCodePayFail:
        {
            NSLog(@"支付失败");
        }
            break;
        case WeiboSDKResponseStatusCodeShareInSDKFailed:
        {
            NSLog(@"分享失败");
        }
            break;
        case WeiboSDKResponseStatusCodeUnsupport:
        {
            NSLog(@"不支持的请求");
        }
            break;
        case WeiboSDKResponseStatusCodeUnknown:
        {
            NSLog(@"未知错误");
        }
            break;
            
        default:
            break;
    }
}
/**
 收到一个来自微博客户端程序的请求
 
 收到微博的请求后，第三方应用应该按照请求类型进行处理，处理完后必须通过 [WeiboSDK sendResponse:] 将结果回传给微博
 @param request 具体的请求对象
 */
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}

@end
