//
//  Constants.h
//  StructureProject
//
//  Created by my on 15/7/20.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#ifndef V_Cat_VCGlobalDefine_h
#define V_Cat_VCGlobalDefine_h


/**
 *	@brief 底部，导航的高度
 */
#define TabBarHeight                        49.0f
#define NaviBarHeight                       44.0f
/**
 *	@brief 导航条与系统状态栏的高度
 */
#define StateNaviBarHeight                  64.0f
/**
 *	@brief 状态栏的高度
 */
#define SystemstatusHeight                       20.0f
/**
 *	@brief 状态栏的左view的宽度
 */
#define NavLeftViewwidth                       66.0f
/**
 *	@brief 状态栏的右view的宽度
 */
#define NavRightViewwidth                      66.0f

/**
 *	@brief 左按钮距离左边的距离
 */
#define leftnarbuttonx                       10.0f
/**
 *	@brief 左按钮的宽高
 */
#define LeftViewWidth                      40.0f
/**
 *	@brief 右按钮距离右边的距离
 */
#define rightnarbuttonx                      258.0f

/**
 *	@brief 默认系统导航标题字体颜色
 */
#define Default_Title_RGB_TextDark               RGB(0, 0, 0)

/**
 *	@brief 导航标题字体颜色
 */

#define RGB_TitleNormal                          RGB(0, 0, 0)
/**
 *	@brief 导航标题字体大小
 */
#define FLOAT_TitleSizeNormal               18.0f




/**
 *	判断设备尺寸
 */
#define DEVICE_IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480.f)
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568.f)
#define DEVICE_IS_IPHONE6 ([[UIScreen mainScreen] bounds].size.height == 667.f)
#define DEVICE_IS_IPHONE6_Plus ([[UIScreen mainScreen] bounds].size.height == 736.f)

/**
 *	基于iPhone5的尺寸， autosize 系数
 */
#define AutoSize_Standard_ScreenWidth 320.f
#define AutoSize_Standard_ScreenHeight 568.f

/**
 *	基于iPhone5的尺寸， autosize 系数
 */
#define AutoSize_XScale_OnIPhong5 ([[UIScreen mainScreen] bounds].size.width / AutoSize_Standard_ScreenWidth)
#define AutoSize_YScale_OnIPhong5 ([[UIScreen mainScreen] bounds].size.height / AutoSize_Standard_ScreenHeight)

/**
 *	@brief rect以及高度
 */
#define ScreenRect                          [[UIScreen mainScreen] bounds]
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define StatusBarHeight                     [UIApplication sharedApplication].statusBarFrame.size.height
#define SelfNavBarHeight                    self.navigationController.navigationBar.bounds.size.height
#define SelfTabBarHeight                    self.tabBarController.tabBar.bounds.size.height
#define TouchHeightDefault                  44
#define TouchHeightSmall                    32
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y
#define SelfViewHeight                      self.view.bounds.size.height
#define RectX(f)                            f.origin.x
#define RectY(f)                            f.origin.y
#define RectWidth(f)                        f.size.width
#define RectHeight(f)                       f.size.height
#define RectSetWidth(f, w)                  CGRectMake(RectX(f), RectY(f), w, RectHeight(f))
#define RectSetHeight(f, h)                 CGRectMake(RectX(f), RectY(f), RectWidth(f), h)
#define RectSetX(f, x)                      CGRectMake(x, RectY(f), RectWidth(f), RectHeight(f))
#define RectSetY(f, y)                      CGRectMake(RectX(f), y, RectWidth(f), RectHeight(f))
#define RectSetSize(f, w, h)                CGRectMake(RectX(f), RectY(f), w, h)
#define RectSetOrigin(f, x, y)              CGRectMake(x, y, RectWidth(f), RectHeight(f))
#define Rect(x, y, w, h)                    CGRectMake(x, y, w, h)

#define Size(w, h)                          CGSizeMake(w, h)
#define Point(x, y)                         CGPointMake(x, y)





///////////////////////////////////////////////////////////////////////////////////
//MARK: 全局统一色

#define VCT_COLOR_RED_NAVIGATION RGB(56, 255, 57)
#define VCT_COLOR_RED_TEXT_AND_BUTTON RGB(221, 40, 114)

#define VCT_COLOR_GRAY_BORDER_AND_LINE RGB(220, 221, 221)
#define VCT_COLOR_GRAY_BACKGROUND RGB(239, 239, 239)
#define VCT_COLOR_GRAY_TEXT_MIDDLE RGB(137, 137, 137)
#define VCT_COLOR_GRAY_TEXT_DARK RGB(89, 87, 87)

///////////////////////////////////////////////////////////////////////////////////

#define SelfNavBar                          self.navigationController.navigationBar
#define SelfTabBar                          self.tabBarController.tabBar

#endif