//
//  VCAboutViewController.m
//  V_Cat
//
//  Created by my on 15/7/21.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "VCAboutViewController.h"
#import "TestTableViewCell.h"
#import "TestObj.h"

@interface VCAboutViewController ()


@end

@implementation VCAboutViewController

- (instancetype)init{
    if (self = [super init]) {
       
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setNaviBarTitle:@"我的"];

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

#pragma mark - Override Supper.

- (void)loadCellModelMapping
{
    [super registerModelClass:[TestObj class] mappedCellClass:[TestTableViewCell class] reuseIdentifier:@"TestTableViewCell"];
}

- (void)fetchDataWithOffset:(NSString *)offset
{
    [super fetchDataWithOffset:offset];
    
//    [self finishDataFetchWithModels:datas hasMore:NO currentOffset:0];
    
}

- (void)configureCell:(UITableViewCell<CYModelBinding> *)cell forIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
//    VCMessageViewController *net = [[VCMessageViewController alloc] init];
//    
//    [self.navigationController pushViewController:net animated:YES];
    //    [self GOpushViewController:[NextController new]];
}


@end
