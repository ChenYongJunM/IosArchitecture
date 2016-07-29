//
//  UIViewController+Extension.h
//  IosArchitecture
//
//  Created by Chen on 16/7/26.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extension)

@property (nonatomic, strong) MBProgressHUD *hud;

- (void)showLoadHUD;
- (void)dismissLoadHUD;
- (void)dismissLoadHUDWithSuccessText:(NSString *)text;
- (void)dismissLoadHUDWithFailureText:(NSString *)text;
- (void)dismissLoadHUDWithSuccessText:(NSString *)text completion:(void(^)())completion;
- (void)dismissLoadHUDWithFailureText:(NSString *)text completion:(void(^)())completion;
- (void)dismissHudWithText:(NSString *)text textFont:(UIFont *)textFont interval:(CGFloat)interval yOffset:(CGFloat)yOffset completion:(void (^)())completion;

@end
