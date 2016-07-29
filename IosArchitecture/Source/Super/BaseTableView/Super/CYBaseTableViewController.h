//
//  CYVSModelTableViewController.h
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "CYModelTableViewController.h"
#import "MJRefresh.h"

typedef NS_ENUM (NSUInteger, CORefreshType) {
    CORefreshTypeNormal = 0,
    CORefreshTypeDownPush = 1,
    CORefreshTypeUpPush = 2,
};

@interface CYBaseTableViewController : CYModelTableViewController

/**
 *  分也标志
 */
@property (nonatomic, strong) NSString *currentOffSet;
@property (nonatomic, strong, readonly) NSString *offset;

/**
 *  上拉、下拉开关
 */
@property (nonatomic, assign) BOOL enablePullDownToRefresh;
@property (nonatomic, assign) BOOL enablePullUpToRefresh;

/**
 *  列表无数据提示
 */
//@property (nonatomic, strong) NSString *enablePullUpToRefreshLoadingText;     // <设置启用上拉刷新后
//@property (nonatomic, strong) NSString *enablePullUpToRefreshBeforeLoadText;  //  在刷新前、刷新时和刷新后刷新控
//@property (nonatomic, strong) NSString *enablePullUpToRefreshNilDataText;     //  件分别显示的文字。

/**
 *  列表无数据提示---文字
 */
@property (nonatomic, strong) NSString *enableNilModelsAlertTest;

/**
 *  列表无数据提示---图片
 */
@property (nonatomic, copy) NSString *enableNilModelsImageName;
/**
 *  列表无数据提示---距离顶部距离
 */
@property (nonatomic, assign) CGFloat enableNilModelsTop;

/**
 *  请求方法-子类必须调用super
 *
 *  @param offset 当前分页数
 */
- (void)fetchDataWithOffset:(NSString *)offset __attribute__((objc_requires_super));
/**
 *  配置列表界面
 *
 *  @param models
 *  @param hasMore       是否有分页
 *  @param currentOffset
 */
- (void)finishDataFetchWithModels:(NSArray *)models currentOffset:(NSString *)currentOffset __attribute__((objc_requires_super));

/**
 *  刷新界面
 */
- (void)beginRefresh;
/**
 *  关闭下拉刷新
 */
- (void)stopRefresh;
/**
 *  刷新界面-带下拉
 */
- (void)beginDownPushRefreshing;

/**
 *  下拉刷新
 */
//- (void)beginDownPushRefreshing __attribute__((objc_requires_super));

#pragma mark - extension archive list
/**
 *  是否开始缓存
 *  default is No.
 */
@property (nonatomic, assign) BOOL isUseArchive;

/**
 *  加载缓存数据
 */
- (void)loadArchiveList;
///**
// *  自定义动画
// */
//- (void)showMainLoadAnimation;


@end
