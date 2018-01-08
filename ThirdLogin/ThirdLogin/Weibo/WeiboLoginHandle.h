//
//  WeiboLoginHandle.h
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/14.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiboLoginHandle : NSObject <WeiboSDKDelegate>

@property (nonatomic, copy) NSDictionary *UserInfo;

@end
