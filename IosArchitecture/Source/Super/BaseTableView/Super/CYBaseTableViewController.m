//
//  CYVSModelTableViewController.m
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "CYBaseTableViewController.h"

static NSString *defaultPage = @"1";

@interface CYBaseTableViewController ()

@property (nonatomic, strong, readwrite) NSString *offset;
/**
 *  是否有分页
 */
@property (nonatomic, assign) BOOL hasMore;
/**
 *  正在执行的进程数
 */
@property (nonatomic, assign) NSInteger fetchingNumber;
/**
 *  当前刷新控件状态
 */
@property (nonatomic, assign) CORefreshType currentRefreshType;

/**
 *  归档数据
 *
 *  @param path   保存路径
 *  @param models data
 */
- (void)archiveListWithPath:(NSString *)path models:(NSArray *)models;
/**
 *  decode数据
 *
 *  @param path 保存路径
 *
 *  @return 缓存数据
 */
- (NSArray *)unArchiveListWithPath:(NSString *)path;

@end

@implementation CYBaseTableViewController
@synthesize
isUseArchive = _isUseArchive;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        self.enableNilModelsAlertTest    = @"暂无数据";
        self.isUseArchive = NO;
        self.fetchingNumber = 0;
        
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.separatorColor = [UIColor clearColor];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.models = [NSMutableArray new];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (self.enablePullDownToRefresh) {
        // 下拉刷新
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                self.currentRefreshType = CORefreshTypeDownPush;
                self.offset = defaultPage;
                self.currentOffSet = defaultPage;
                [self fetchDataWithOffset:self.offset];
        }];
    }
    if (self.enablePullUpToRefresh) {
        // 上拉刷新
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                self.currentRefreshType = CORefreshTypeUpPush;
                self.currentOffSet = [NSString stringWithFormat:@"%ld",([self.currentOffSet integerValue] + 1)];
                if ([self.currentOffSet integerValue] != 1) {
                    [self fetchDataWithOffset:self.currentOffSet];
                }
        }];
    }
}

- (void)fetchDataWithOffset:(NSString *)offset
{
    self.offset = offset;
    self.fetchingNumber ++;
}

- (void)finishDataFetchWithModels:(NSArray *)models currentOffset:(NSString *)currentOffset
{
//----------处理上下拉--------------------------
    //上拉
    if (self.currentRefreshType == CORefreshTypeUpPush) {
        // 结束刷新
        [self.tableView.mj_footer endRefreshing];
    }
    //下拉
    if (self.currentRefreshType == CORefreshTypeDownPush) {
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
    }
    
    if (!models || models.count == 0) {
        /**
         *  如果此次请求返回为空就肯定到最后一页了
         */
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
        return;
    }
    
    
    
    //默认从第一个开始
    if ([currentOffset integerValue] == 1) {
        self.models = [NSMutableArray arrayWithArray:models];
    }else{
        [self.models addObjectsFromArray:models];
    }
    
    if (self.models.count == 0) {
        self.view.alert = _enableNilModelsAlertTest;
        //缓存数据
        if (self.isUseArchive == YES) {
            [self archiveListWithPath:[sandBoxPath stringByAppendingPathComponent:NSStringFromClass([self class])] models:models];
        }
    }
    self.view.alert = nil;
    [self.tableView reloadData];
}

- (void)beginRefresh
{
    self.currentRefreshType = CORefreshTypeNormal;
    [self.tableView.mj_footer resetNoMoreData];
    
    self.offset = defaultPage;
    self.currentOffSet = defaultPage;
    [self fetchDataWithOffset:self.offset];
}

- (void)beginDownPushRefreshing
{
    self.currentRefreshType = CORefreshTypeDownPush;
    [self.tableView.mj_header beginRefreshing];
}

- (void)stopRefresh
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark - Override Super.

- (void)configureCell:(UITableViewCell<CYModelBinding> *)cell forIndexPath:(NSIndexPath *)indexPath
{
    [super configureCell:cell forIndexPath:indexPath];
    CYBaseModelCell *modelCell = (CYBaseModelCell *)cell;
    modelCell.idx = indexPath.row;
    modelCell.sectionIdx = indexPath.section;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row == [self.models count] - 1 && self.enablePullUpToRefresh) {
//        if (self.hasMore && self.upPushType == COUpPushToRefreshTypeNormal && self.currentRefreshType == CORefreshTypeDone) {
//            [self beginUpPushToRefreshing];
//        }
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - help

- (void)archiveListWithPath:(NSString *)path models:(NSArray *)models
{
    [[NSFileManager defaultManager] createFileAtPath:path contents:[NSKeyedArchiver archivedDataWithRootObject:models] attributes:nil];
}

- (NSArray *)unArchiveListWithPath:(NSString *)path
{
    return [NSKeyedUnarchiver unarchiveObjectWithData:[[NSFileManager defaultManager] contentsAtPath:path]];
}

- (void)loadArchiveList
{
    if (self.models.count == 0) {
        NSArray *models = [self unArchiveListWithPath:[sandBoxPath stringByAppendingPathComponent:NSStringFromClass([self class])]];
        self.currentOffSet = @"1";
        [self finishDataFetchWithModels:models currentOffset:@"1"];
    }
}

//- (void)showMainLoadAnimation
//{
//    if (self.currentRefreshType == CORefreshTypeNormal) {
//        [self showLoadHUD];
//    }
//}

@end
