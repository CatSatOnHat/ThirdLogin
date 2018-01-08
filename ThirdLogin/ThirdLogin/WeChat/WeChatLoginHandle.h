//
//  WeChatLoginHandle.h
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/18.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeChatLoginHandle : NSObject <WXApiDelegate>

@property (nonatomic, copy) NSDictionary *UserInfo;

@end
