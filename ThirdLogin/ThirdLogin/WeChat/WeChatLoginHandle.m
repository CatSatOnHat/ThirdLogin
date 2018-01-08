//
//  WeChatLoginHandle.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/18.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "WeChatLoginHandle.h"

@implementation WeChatLoginHandle

- (void)onReq:(BaseReq *)req {
    
}

- (void)onResp:(BaseResp *)resp {
    SendAuthResp *aresp = (SendAuthResp *)resp;
    NSLog(@"%@----%@----%@-----%@", aresp.code, aresp.state, aresp.lang, aresp.country);
}

@end
