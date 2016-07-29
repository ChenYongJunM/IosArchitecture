//
//  UIViewController+Extension.m
//  IosArchitecture
//
//  Created by Chen on 16/7/26.
//  Copyright © 2016年 Chen. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>

static const void *showhudkey = "showhudkey";

@implementation UIViewController (Extension)

- (void)setHud:(MBProgressHUD *)hud
{
    objc_setAssociatedObject(self, showhudkey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)hud
{
    MBProgressHUD *hud = objc_getAssociatedObject(self, &showhudkey);
    return hud;
}

- (void)showLoadHUD
{
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.removeFromSuperViewOnHide = YES;
}

- (void)showLoadHUDOnWinow
{
    self.hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window animated:YES];
    self.hud.removeFromSuperViewOnHide = YES;
}

- (void)dismissLoadHUD
{
    self.hud.hidden = YES;
    self.hud = nil;
}

- (void)dismissLoadHUDWithSuccessText:(NSString *)text
{
    if (!self.hud) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    self.hud.removeFromSuperViewOnHide = YES;
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = text;
    [self.hud hide:YES afterDelay:1.2];
    __weak typeof (self) weakSelf = self;
    [self.hud setCompletionBlock:^{
        weakSelf.hud = nil;
    }];
}

- (void)dismissLoadHUDWithFailureText:(NSString *)text
{
    [self dismissLoadHUDWithSuccessText:text];
}

- (void)dismissLoadHUDWithFailureText:(NSString *)text completion:(void (^)())completion
{
    if (!self.hud) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    self.hud.removeFromSuperViewOnHide = YES;
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = text;
    [self.hud hide:YES afterDelay:1.5];
    __weak typeof (self) weakSelf = self;
    [self.hud setCompletionBlock:^{
        weakSelf.hud = nil;
        if (completion) {
            completion();
        }
    }];

    //关闭全局动画...do...
}

- (void)dismissLoadHUDWithSuccessText:(NSString *)text completion:(void (^)())completion
{
    [self dismissLoadHUDWithFailureText:text completion:completion];
}

- (void)dismissHudWithText:(NSString *)text textFont:(UIFont *)textFont interval:(CGFloat)interval yOffset:(CGFloat)yOffset completion:(void (^)())completion
{
    if (!self.hud) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    self.hud.removeFromSuperViewOnHide = YES;
    self.hud.mode = MBProgressHUDModeText;
    self.hud.labelText = text;
    self.hud.labelFont = textFont;
    self.hud.yOffset   = yOffset;
    [self.hud hide:YES afterDelay:interval];
    __weak typeof (self) weakSelf = self;
    [self.hud setCompletionBlock:^{
        weakSelf.hud = nil;
        if (completion) {
            completion();
        }
    }];
    //开启全局动画...do...
}

@end
