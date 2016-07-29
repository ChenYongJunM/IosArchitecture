//
//  CYBaseViewController.h
//  StructureProject
//
//  Created by ChenYJ on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GOCustomNaviBarView.h"
//#import "XBASIWrapper.h"

@interface CYBaseViewController : UIViewController

@property (nonatomic, strong) GOCustomNaviBarView *m_viewNaviBar;

- (void)bringNaviBarToTopmost;

/**
 *	@brief	获取导航的高度
 *
 *	@return
 */
-(float)GetviewNaviBarHeight;

/**
 *	@brief	隐藏导航
 *
 *	@param 	bIsHide 	是否隐藏
 *
 *	@return
 */
- (void)hideNaviBar:(BOOL)bIsHide;
/**
 *	@brief	设置导航标题
 *
 *	@param 	strTitle 	标题
 *
 *	@return
 */
- (void)setNaviBarTitle:(NSString *)strTitle;

/**
 *	@brief	设置导航左边按钮或者左视图
 *
 *	@param 	aleftview
 *	@param 	btn
 *
 *	@return
 */
- (void)setNaviBarLeftBtn:(UIView*)aleftview LeftButton:(UIButton *)btn;

/**
 *	@brief	设置导航右边按钮或者右视图
 *
 *	@param 	arightview
 *	@param 	btn
 *
 *	@return
 */
- (void)setNaviBarRightBtn:(UIView*)arightview RightButton:(UIButton *)btn;

/**
 *	@brief	设置导航中间按钮或者中间视图
 *
 *	@param 	acenterview
 *	@param 	btn
 *
 *	@return
 */
- (void)setNaviBarCenterBtn:(UIView*)acenterview CenterButton:(UIButton *)btn;

/**
 *	@brief	设置导航背景图片
 *
 *	@param 	aimagebg 	图片
 *
 *	@return
 */
- (void)setNarBarviewImagebg:(UIImage*)aimagebg;
/**
 *	@brief	设置导航背景颜色
 *
 *	@param 	aColor 	颜色
 *
 *	@return
 */
- (void)setNarBarviewColorbg:(UIColor*)aColor;

/**
 *	@brief	添加导航视图
 *
 *	@param 	view 	赋值视图
 *
 *	@return
 */
- (void)naviBarAddCoverView:(UIView *)view;
/**
 *	@brief  添加导航标题视图
 *
 *	@param 	view 	视图
 *
 *	@return
 */
- (void)naviBarAddCoverViewOnTitleView:(UIView *)view;
/**
 *	@brief	移除视图
 *
 *	@param 	view 	视图
 *
 *	@return
 */
- (void)naviBarRemoveCoverView:(UIView *)view;

/**
 *	@brief	隐藏系统导航
 *
 *	@param 	ahidden 	是否隐藏系统导航
 *
 *	@return
 */
-(void)setSystemNavigationnarHidden:(BOOL)ahidden;


@end
