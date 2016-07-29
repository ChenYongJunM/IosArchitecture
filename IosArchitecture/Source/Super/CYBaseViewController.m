//
//  CYBaseViewController.m
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//


#import "CYBaseViewController.h"

#import "VCMyStoreViewController.h"
#import "VCMessageViewController.h"
#import "VCDiscoveryViewController.h"
#import "VCAboutViewController.h"

@interface CYBaseViewController () 

@end

@implementation CYBaseViewController
@synthesize m_viewNaviBar = _viewNaviBar;

- (void)dealloc
{
    NSLog(@"%@__dealloc__",self);
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_viewNaviBar && !_viewNaviBar.hidden){
        [self.view bringSubviewToFront:_viewNaviBar];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self setSystemNavigationnarHidden:YES];
    
    //**添加NavView*/
    _viewNaviBar = [[GOCustomNaviBarView alloc] initWithFrame:Rect(0.0f, 0.0f, [GOCustomNaviBarView barSize].width, [GOCustomNaviBarView barSize].height) Nartype:IIViewNavBarView];
    _viewNaviBar.m_viewCtrlParent = self;
    [self.view addSubview:_viewNaviBar];
    
    //**导航背景色*/
    [self setNarBarviewColorbg:VCT_COLOR_RED_NAVIGATION];
    
    //设置导航栏返回按钮样式
    UIButton *leftBtn = [GOCustomNaviBarView createLeftImgNaviBarBtnByImgNormal:@"webArrowLeft" imgHighlight:@"webArrowLeft" target:self action:@selector(GOleftNavButtonClicked:)];
    
    //**是否有返回按钮*/
    if (self.navigationController.viewControllers.count > 1) {
        [self setNaviBarLeftBtn:nil LeftButton:leftBtn];// 若不需要默认的返回按钮，直接赋nil
    }
    
    
//**测试*/
    _viewNaviBar.layer.borderColor = [UIColor blackColor].CGColor;
    _viewNaviBar.layer.borderWidth = 2.0;
    self.view.layer.borderWidth = 2.0;
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
}

- (void)GOleftNavButtonClicked:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self.view endEditing:YES];
}






#pragma mark- navigation
-(float)GetviewNaviBarHeight
{
    return _viewNaviBar.frame.size.height;
}

- (void)bringNaviBarToTopmost
{
    if (_viewNaviBar){
        [self.view bringSubviewToFront:_viewNaviBar];
    }
}

/**
 *	@brief	隐藏导航
 *
 *	@param 	bIsHide 	是否隐藏
 *
 *	@return
 */
- (void)hideNaviBar:(BOOL)bIsHide
{
    _viewNaviBar.hidden = bIsHide;
}


/**
 *	@brief	设置导航背景图片
 *
 *	@param 	aimagebg 	图片
 *
 *	@return
 */
-(void)setNarBarviewImagebg:(UIImage*)aimagebg

{
    [_viewNaviBar setNarImagebg:aimagebg];
}

/**
 *	@brief	设置导航背景颜色
 *
 *	@param 	aColor 	颜色
 *
 *	@return
 */
-(void)setNarBarviewColorbg:(UIColor*)aColor

{
    [_viewNaviBar setNarviewColorbg:aColor];
}


/**
 *	@brief	隐藏系统导航
 *
 *	@param 	ahidden 	是否隐藏系统导航
 *
 *	@return
 */
-(void)setSystemNavigationnarHidden:(BOOL)ahidden
{
    self.navigationController.navigationBar.hidden = ahidden;
}

/**
 *	@brief	设置导航标题
 *
 *	@param 	strTitle 	标题
 *
 *	@return
 */
- (void)setNaviBarTitle:(NSString *)strTitle
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setTitle:strTitle];
    }
}


- (void)setNaviBarCenterBtn:(UIView*)acenterview CenterButton:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setCenterBtn:acenterview centerbutton:btn];
    }
}


- (void)setNaviBarLeftBtn:(UIView*)aleftview LeftButton:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setLeftView:aleftview Leftbutton:btn];
    }
}


- (void)setNaviBarRightBtn:(UIView*)arightview RightButton:(UIButton *)btn
{
    if (_viewNaviBar)
    {
        [_viewNaviBar setRightBtn:arightview Rightbutton:btn];
    }
}

/**
 *	@brief	添加导航试图
 *
 *	@param 	view 	赋值视图
 *
 *	@return
 */
- (void)naviBarAddCoverView:(UIView *)view

{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverView:view animation:YES];
    }
}

/**
 *	@brief  添加导航标题试图
 *
 *	@param 	view 	视图
 *
 *	@return
 */
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view

{
    if (_viewNaviBar && view)
    {
        [_viewNaviBar showCoverViewOnTitleView:view];
    }
}


/**
 *	@brief	移除视图
 *
 *	@param 	view 	视图
 *
 *	@return
 */
- (void)naviBarRemoveCoverView:(UIView *)view

{
    if (_viewNaviBar)
    {
        [_viewNaviBar hideCoverView:view];
    }
}


@end
