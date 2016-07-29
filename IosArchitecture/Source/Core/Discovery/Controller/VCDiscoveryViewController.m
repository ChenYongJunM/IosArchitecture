//
//  VCDiscoveryViewController.m
//  V_Cat
//
//  Created by my on 15/7/21.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "VCDiscoveryViewController.h"

@interface VCDiscoveryViewController ()

@end

@implementation VCDiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNaviBarTitle:@"发现"];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self beginDownPushRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
