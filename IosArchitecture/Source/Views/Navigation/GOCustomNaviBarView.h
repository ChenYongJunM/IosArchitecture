//
//  GOCustomNaviBarView.h
//  Cooking
//
//  Created by GOGO on 14/12/12.
//  Copyright (c) 2014年 gogotown. All rights reserved.
//

/**
 *	@brief 导航视图
 */

#import <UIKit/UIKit.h>

/**
 *	@brief 导航条类型
 */
enum {
    IIViewNavBarImage,   //图片类型
    IIViewNavBarView     //视图
};
typedef UInt32 IIViewNavType;

@interface GOCustomNaviBarView : UIView

@property (nonatomic, weak) UIViewController *m_viewCtrlParent;
@property (nonatomic, readonly) BOOL m_bIsCurrStateMiniMode;


/**
 *	@brief	初始化导航视图
 *
 *	@param 	frame 	导航的大小
 *	@param 	atype 	导航类型
 *
 *	@return	id
 */
- (id)initWithFrame:(CGRect)frame Nartype:(IIViewNavType)atype;
/**
 *	@brief	设置右导航中button的大小
 *
 *	@return	rect
 */
+ (CGRect)rightBtnFrame;

/**
 *	@brief	设置按钮可点击区域
 *
 *	@return	size
 */
+ (CGSize)barBtnSize;

/**
 *	@brief	设置导航条的size
 *
 *	@return	size
 */
+ (CGSize)barSize;

/**
 *	@brief	设置导航中标题的size
 *
 *	@return	size
 */
+ (CGRect)titleViewFrame;

/**
 *	@brief	设置中间按钮的点击区域
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	strImgSelected
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+(UIButton *)createImgCenterNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected buttonsize:(CGSize)asize target:(id)target action:(SEL)action;


/**
 *	@brief	设置右边不带图片的button
 *
 *	@param 	strTitle 	字符串
 *	@param 	asize
 *	@param 	target
 *	@param 	action
 *	@param 	afont 	字体大小
 *
 *	@return
 */
+ (UIButton *)createRightNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action ButtonFont:(float)afont;


/**
 *	@brief	设置没有图片的按钮，不包含字体大小
 *
 *	@param 	strTitle
 *	@param 	asize
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createRightNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action;



/**
 *	@brief	设置没有图片的按钮
 *
 *	@param 	strTitle
 *	@param 	asize
 *	@param 	target
 *	@param 	action
 *	@param 	afont 	字体大小
 *
 *	@return	
 */
+ (UIButton *)createLeftNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action ButtonFont:(float)afont;

/**
 *	@brief	设置没有图片的button
 *
 *	@param 	strTitle
 *	@param 	asize
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createLeftNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action;

/**
 *	@brief  设置左按钮;自定义图片
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createLeftImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action;

/**
 *	@brief	设置右按钮;自定义图片
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createRightImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action;


-(UIView *)createLeftNavViewNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action;

/**
 *	@brief	设置导航背景图片
 *
 *	@return	void
 */
-(void)setNarImagebg:(UIImage*)aimage;

/**
 *	@brief	设置导航背景颜色
 *
 *	@return	void
 */
-(void)setNarviewColorbg:(UIColor*)acolor;

/**
 *	@brief	设置左按钮，或者左view
 *
 *	@param 	aleftview
 *	@param 	btn
 *
 *	@return
 */
- (void)setLeftView:(UIView*)aleftview Leftbutton:(UIButton *)btn;
/**
 *	@brief   设置右按钮，或者右view
 *
 *	@param 	arightview
 *	@param 	btn
 *
 *	@return
 */
- (void)setRightBtn:(UIView*)arightview Rightbutton:(UIButton *)btn;

/**
 *	@brief	用自定义的按钮替换中间按钮
 *
 *	@return	void
 */
- (void)setCenterBtn:(UIView*)acenterview centerbutton:(UIButton *)btn;

/**
 *	@brief	设置标题
 *
 *	@return	void
 */
- (void)setTitle:(NSString *)strTitle;

/**
 *	@brief	在导航条上覆盖一层自定义视图。比如：输入搜索关键字时，覆盖一个输入框在上面
 *
 *	@param 	view 	覆盖视图
 *
 *	@return	void
 */
- (void)showCoverView:(UIView *)view;

/**
 *	@brief	在导航条上覆盖一层自定义视图。比如：输入搜索关键字时，覆盖一个输入框在上面
 *
 *	@param 	view 	视图
 *	@param 	bIsAnimation 	是否有动画
 *
 *	@return
 */
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation;

/**
 *	@brief	显示标题view
 *
 *	@param 	view 	视图
 *
 *	@return
 */
- (void)showCoverViewOnTitleView:(UIView *)view;

/**
 *	@brief	隐藏标题view
 *
 *	@param 	view 	视图
 *
 *	@return
 */
- (void)hideCoverView:(UIView *)view;

@end
