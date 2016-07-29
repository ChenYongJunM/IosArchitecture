//
//  CYModelTableViewController.h
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYBaseViewController.h"

@interface CYModelTableViewController : CYBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
/**
 *  All the models should be put in this array. 
 *  PS: We only support one section tableview currently.
 */
@property (nonatomic, strong) NSMutableArray *models;

- (instancetype)initWithStyle:(UITableViewStyle)style;

/**
 *  配置Cell
 *
 */
- (void)configureCell:(UITableViewCell<CYModelBinding> *)cell forIndexPath:(NSIndexPath *)indexPath __attribute__((objc_requires_super));
/**
 *  映射模型和Cell-子类重写
 */
- (void)loadCellModelMapping;
/**
 *  注册模型Cell映射
 *
 *  @param modelClass      数据模型
 *  @param cellClass       Cell
 *  @param reuseIdentifier 标示
 */
- (void)registerModelClass:(Class)modelClass mappedCellClass:(Class)cellClass reuseIdentifier:(NSString *)reuseIdentifier;

@end
