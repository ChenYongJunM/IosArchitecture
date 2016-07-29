//
//  CYModelTableViewController.m
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "CYModelTableViewController.h"
#import "Masonry.h"

@interface CYModelTableViewController ()
{
    UITableViewStyle _style;
    BOOL isHiddenNav;
}

/**
 *  模型Cell映射表
 */
@property (nonatomic, strong) NSMutableDictionary *modelCellClassMap;
@property (nonatomic, strong) NSMutableDictionary *modelReuseIdentifierMap;

- (NSArray *)registeredModelClasses;
- (Class)mappedCellClassForModelClass:(Class)modelClass;
- (NSString *)mappedReuseIdentifierForModelClass:(Class)modelClass;

@end

@implementation CYModelTableViewController

- (void)dealloc
{
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = NO;
            self.modalPresentationCapturesStatusBarAppearance = NO;
        }
#endif
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        _style = style;
    }
    return self;
}

- (NSMutableDictionary *)modelCellClassMap
{
    if (_modelCellClassMap == nil) {
        _modelCellClassMap = [[NSMutableDictionary alloc] init];
    }
    return _modelCellClassMap;
}

- (NSMutableDictionary *)modelReuseIdentifierMap
{
    if (_modelReuseIdentifierMap == nil) {
        _modelReuseIdentifierMap = [[NSMutableDictionary alloc] init];
    }
    return _modelReuseIdentifierMap;
}

- (NSMutableArray *)models
{
    if (_models == nil) {
        _models = [[NSMutableArray alloc] init];
    }
    return _models;
}

- (NSArray *)registeredModelClasses
{
    return self.modelCellClassMap.allKeys;
}

#pragma mark - UIViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    //
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:_style];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:self.tableView];
    
    [self loadCellModelMapping];
}

#pragma mark - APIs

- (void)configureCell:(UITableViewCell<CYModelBinding> *)cell forIndexPath:(NSIndexPath *)indexPath
{
    // should be implemented by subclass
}

- (void)loadCellModelMapping
{
    // should be implemented by subclass
}

- (void)registerModelClass:(Class)modelClass mappedCellClass:(Class)cellClass reuseIdentifier:(NSString *)reuseIdentifier
{
    if (![cellClass isSubclassOfClass:[UITableViewCell class]] || reuseIdentifier.length == 0) {
        NSLog(@"Failed to register model and cell classes to ModelTableViewController. %@ is not the subclass of XIMModel or %@ is illegal.", modelClass, reuseIdentifier);
        return;
    }
    if (![cellClass conformsToProtocol:@protocol(CYModelBinding)]) {
        NSLog(@"Failed to register model and cell classes. %@ doesn't conform to XIMModelBinding protocol", cellClass);
        return;
    }
    
    NSString *modelClassString = NSStringFromClass(modelClass);
    self.modelCellClassMap[modelClassString] = NSStringFromClass(cellClass);
    self.modelReuseIdentifierMap[modelClassString] = reuseIdentifier;
    
    //FDTemplateLayoutCell(需要tableView知道初始化哪个类)    如果是storyBoard拖Cell则不需要
    [self.tableView registerClass:cellClass forCellReuseIdentifier:reuseIdentifier];
}

- (Class)mappedCellClassForModelClass:(Class)modelClass
{
    NSString *cellClassName = self.modelCellClassMap[NSStringFromClass(modelClass)];
    if (cellClassName == nil) NSLog(@"%@ not registered with a cellClass", modelClass);
    return NSClassFromString(cellClassName);
}

- (NSString *)mappedReuseIdentifierForModelClass:(Class)modelClass
{
    NSString *reuseIdentifier = self.modelReuseIdentifierMap[NSStringFromClass(modelClass)];
    if (reuseIdentifier == nil) NSLog(@"%@ not registered with a reuseIdentifier", modelClass);
    return reuseIdentifier;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //We only support one section tableview currently.
    return self.models.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject *model = self.models[indexPath.row];
//    NSString *cellIdentifier = [self mappedReuseIdentifierForModelClass:model.class];
//使用缓存高度
//    return [tableView
//            fd_heightForCellWithIdentifier:cellIdentifier
//            cacheByIndexPath:indexPath
//            configuration:^(UITableViewCell<CYModelBinding> *cell) {
//                cell.model = (BaseModel *)model;
//            }];

    //未添加缓存高度
    Class cellClass = [self mappedCellClassForModelClass:model.class];
    return [cellClass heightWithModel:self.models[indexPath.row]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject *model = self.models[indexPath.row];
    
    NSString *cellIdentifier = [self mappedReuseIdentifierForModelClass:model.class];
    UITableViewCell<CYModelBinding> *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        Class cellClass = [self mappedCellClassForModelClass:model.class];
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.model = (BaseModel *)model;
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // should be implemented by subclass
}


//#pragma 滑动隐藏导航栏
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
////    self.automaticallyAdjustsScrollViewInsets = NO;
//    
//    UIEdgeInsets insets = self.tableView.contentInset;
//    
//    insets.top =self.navigationController.navigationBar.bounds.size.height;
//    
//    self.tableView.contentInset =insets;
//    
//    self.tableView.scrollIndicatorInsets = insets;
//
//    self.tableView.frame =CGRectMake(0, isHiddenNav == YES ? 20 : self.m_viewNaviBar.cyj_height+20, self.view.bounds.size.width, self.view.bounds.size.height);
//}
//
//-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
//{
//    NSLog(@"%f",velocity.y);
//    if(velocity.y > 0){
//        self.m_viewNaviBar.hidden = isHiddenNav = YES;
//    }else if(velocity.y < 0){
//        self.m_viewNaviBar.hidden = isHiddenNav = NO;
//    }
//}


@end
