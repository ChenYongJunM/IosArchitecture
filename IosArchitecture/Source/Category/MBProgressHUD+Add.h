//
//  MBProgressHUD+Add.h
//
//  Created by ChenYJ on 16/3/26.
//  Copyright © 2016年 ChenYJ. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;
@end
