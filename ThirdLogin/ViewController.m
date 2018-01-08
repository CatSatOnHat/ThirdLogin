//
//  ViewController.m
//  ThirdLogin
//
//  Created by 李朕 on 2017/9/11.
//  Copyright © 2017年 datuhongan. All rights reserved.
//

#import "ViewController.h"
#import "ThirdLoginManager.h"

@interface ViewController ()

@property (nonatomic, strong) TencentOAuth *tencentOAuth;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)QQLogin:(id)sender {
    [[ThirdLoginManager sharaManager] loginWithType:kTencentLogin loginSuccessHandle:^(NSDictionary *userInfo) {
        NSLog(@"-------------%@", userInfo);
    } loginFailedHandle:^(NSString *errorStr) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:errorStr delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }];
}

- (IBAction)WeChatLogin:(id)sender {
    [[ThirdLoginManager sharaManager] loginWithType:kWxLogin loginSuccessHandle:^(NSDictionary *userInfo) {
        
    } loginFailedHandle:^(NSString *errorStr) {
        
    }];
}
- (IBAction)WeiboLogin:(id)sender {
    [[ThirdLoginManager sharaManager] loginWithType:kWeiboLogin loginSuccessHandle:^(NSDictionary *userInfo) {
        
    } loginFailedHandle:^(NSString *errorStr) {
        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
