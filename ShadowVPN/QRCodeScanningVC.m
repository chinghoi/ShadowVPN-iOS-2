//
//  QRCodeScanningVC.m
//  SGQRCodeExample
//
//  Created by apple on 17/3/21.
//  Copyright © 2017年 JP_lee. All rights reserved.
//

#import "QRCodeScanningVC.h"
#import "ScanSuccessJumpVC.h"

@interface QRCodeScanningVC ()

@end

@implementation QRCodeScanningVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 注册观察者
    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeAibum:) name:SGQRCodeInformationFromeAibum object:nil];
    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeScanning:) name:SGQRCodeInformationFromeScanning object:nil];
}

//相册
- (void)SGQRCodeInformationFromeAibum:(NSNotification *)noti {
    NSString *string = noti.object;
    
    ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
    jumpVC.jump_URL = string;
    [self.navigationController pushViewController:jumpVC animated:YES];
}
//扫描
- (void)SGQRCodeInformationFromeScanning:(NSNotification *)noti {
    NSString *string = noti.object;
    
    ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
    jumpVC.jump_URL = string;
    [self.navigationController pushViewController:jumpVC animated:YES];}

- (void)dealloc {
    SGQRCodeLog(@"QRCodeScanningVC - dealloc");
    [SGQRCodeNotificationCenter removeObserver:self];
}

@end
