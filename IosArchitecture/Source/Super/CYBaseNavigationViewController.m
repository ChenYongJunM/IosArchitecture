//
//  XBBaseNavigationViewController.m
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "CYBaseNavigationViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface CYBaseNavigationViewController ()

@end

@implementation CYBaseNavigationViewController

- (void)dealloc
{
    NSLog(@"%@__dealloc__",self);
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        
        self.navigationBar.translucent = NO;
//        self.navigationBarHidden = NO;
//        self.hidesBottomBarWhenPushed = YES;
        NSDictionary *dic = @{
                              NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f],
                              NSForegroundColorAttributeName:[UIColor whiteColor],
                              NSShadowAttributeName:[UIColor whiteColor]
                              };
        self.navigationBar.titleTextAttributes = dic;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fd_fullscreenPopGestureRecognizer.enabled = YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    }
    return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
	return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        ///第二层viewcontroller 隐藏tabbar
        viewController.hidesBottomBarWhenPushed=YES;
    }
    [super pushViewController:viewController animated:YES];
}

@end
