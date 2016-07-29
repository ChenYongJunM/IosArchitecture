//
//  GOCustomNaviBarView.m
//  Cooking
//
//  Created by GOGO on 14/12/12.
//  Copyright (c) 2014年 gogotown. All rights reserved.
//
/**
 *	@brief 导航视图
 */

#import "GOCustomNaviBarView.h"
//#import "Constants.h"

@interface GOCustomNaviBarView ()

@property (nonatomic, readonly) UILabel *m_labelTitle;   //标题
@property (nonatomic, retain)   UIImageView *m_imgViewBg;//导航图片背景
@property (nonatomic, readonly) UIButton *m_btnCenter;   //中间button
@property (nonatomic, readonly) UIButton *m_btnLeft;     //左边button
@property (nonatomic, readonly) UIButton *m_btnRight;    //右边button
@property (nonatomic, retain)   UIView *m_ViewBg;        //导航view

@property (nonatomic, retain)   UIView *m_LeftView;    //左边view
@property (nonatomic, retain)   UIView *m_RightView;   //右边view
@property (nonatomic, retain)   UIView *m_CenterView;  //中间view

@end

@implementation GOCustomNaviBarView

@synthesize m_labelTitle =  _labelTitle;
@synthesize m_imgViewBg  =  _imgViewBg;
@synthesize m_btnCenter  =  _btnCenter;
@synthesize m_btnLeft    =  _btnLeft;
@synthesize m_btnRight   =  _btnRight;
@synthesize m_ViewBg     =  _ViewBg;
@synthesize m_LeftView     =  _LeftView;
@synthesize m_RightView    =  _RightView;
@synthesize m_CenterView   =  _CenterView;

+ (CGRect)rightBtnFrame
{
    return Rect((ScreenWidth-[[self class] barBtnSize].width)-20, (StateNaviBarHeight-[[self class] barBtnSize].height)/2, [[self class] barBtnSize].width, [[self class] barBtnSize].height);
}

+ (CGSize)barCenterBtnSize
{
    return Size(160.0f, 64.0f);
}

+ (CGSize)barBtnSize
{
    return Size(64.0f, 64.0f);
}

+ (CGSize)barSize
{
    return Size(ScreenWidth, 64.0f);
}

+ (CGRect)titleViewFrame
{
    return Rect(0.0f, (NaviBarHeight-30)/2+20, ScreenWidth, 30.0f);
}

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
+(UIButton *)createImgCenterNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected buttonsize:(CGSize)asize target:(id)target action:(SEL)action

{
    UIImage *imgNormal = [UIImage imageNamed:strImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    
    CGFloat fDeltaWidth  = imgNormal.size.width;
    CGFloat fDeltaHeight = imgNormal.size.height;
    btn.exclusiveTouch = YES;
    
    btn.frame = CGRectMake((ScreenWidth-66), (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    return btn;
}

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
+ (UIButton *)createLeftNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action ButtonFont:(float)afont
{
    CGFloat fDeltaWidth  = asize.width;
    CGFloat fDeltaHeight = asize.height;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:Default_Title_RGB_TextDark forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:afont];
    [self label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    btn.exclusiveTouch = YES;
    
    btn.frame = CGRectMake(leftnarbuttonx, (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    
    return btn;
}


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
+ (UIButton *)createLeftNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action

{
    CGFloat fDeltaWidth  = asize.width;
    CGFloat fDeltaHeight = asize.height;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:Default_Title_RGB_TextDark forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [self label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    btn.exclusiveTouch = YES;
    
    btn.frame = CGRectMake(leftnarbuttonx, (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    
    return btn;
}
/**
 *	@brief	添加右按钮不带图片的按钮，只有button文字
 *
 *	@param 	strTitle
 *	@param 	asize
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createRightNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action ButtonFont:(float)afont
{
    CGFloat fDeltaWidth  = asize.width;
    CGFloat fDeltaHeight = asize.height;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:Default_Title_RGB_TextDark forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:afont];
    [self label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    btn.exclusiveTouch = YES;
    
    btn.frame = CGRectMake((ScreenWidth-fDeltaWidth)-leftnarbuttonx, (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    
    return btn;
}
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
+ (UIButton *)createRightNaviBarBtnByTitle:(NSString *)strTitle buttonsize:(CGSize)asize target:(id)target action:(SEL)action
{
    CGFloat fDeltaWidth  = asize.width;
    CGFloat fDeltaHeight = asize.height;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:Default_Title_RGB_TextDark forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [self label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    btn.exclusiveTouch = YES;
    
    btn.frame = CGRectMake((ScreenWidth-fDeltaWidth)-leftnarbuttonx, (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    
    return btn;
}

/**
 *	@brief  设置左按钮
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createLeftImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action

{
    return [[self class] createImgLeftNaviBarBtnByImgNormal:strImg imgHighlight:strImgHighlight imgSelected:strImg target:target action:action];
}

/**
 *	@brief	设置右按钮
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+ (UIButton *)createRightImgNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action

{
    return [[self class] createImgRightNaviBarBtnByImgNormal:strImg imgHighlight:strImgHighlight imgSelected:strImg target:target action:action];
}

/**
 *	@brief  设置右按钮
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	strImgSelected
 *	@param 	target
 *	@param 	action
 *
 *	@return
 */
+(UIButton *)createImgRightNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action

{
    UIImage *imgNormal = [UIImage imageNamed:strImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    btn.exclusiveTouch = YES;
    
    CGFloat fDeltaWidth  = LeftViewWidth;//imgNormal.size.width;
    CGFloat fDeltaHeight = LeftViewWidth;//imgNormal.size.height;
    
    btn.frame = CGRectMake((ScreenWidth-fDeltaWidth), (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    return btn;
}

/**
 *	@brief	设置左按钮
 *
 *	@param 	strImg
 *	@param 	strImgHighlight
 *	@param 	strImgSelected
 *	@param 	target
 *	@param 	action 	事件
 *
 *	@return	button
 */
+(UIButton *)createImgLeftNaviBarBtnByImgNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action
{
    UIImage *imgNormal = [UIImage imageNamed:strImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    btn.exclusiveTouch = YES;
    CGFloat fDeltaWidth  = LeftViewWidth;//imgNormal.size.width;
    CGFloat fDeltaHeight = LeftViewWidth;//imgNormal.size.height;
    
    btn.frame = CGRectMake(0, (NaviBarHeight-fDeltaHeight)/2+SystemstatusHeight, fDeltaWidth, fDeltaHeight);
    return btn;
}


-(UIView *)createLeftNavViewNormal:(NSString *)strImg imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action
{
    UIImage *imgNormal = [UIImage imageNamed:strImg];
    CGFloat fDeltaWidth  = imgNormal.size.width;
    CGFloat fDeltaHeight = imgNormal.size.height;
    
    UIView *aleftview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, StateNaviBarHeight)];
    [aleftview setBackgroundColor:[UIColor clearColor]];
    [self addSubview:aleftview];
    
    UIImageView *aimageview = [[UIImageView alloc] initWithFrame:CGRectMake((aleftview.frame.size.width-fDeltaWidth)/2, (aleftview.frame.size.height-fDeltaHeight)/2, fDeltaWidth, fDeltaHeight)];
    [aimageview setBackgroundColor:[UIColor clearColor]];
    [aleftview addSubview:aimageview];
    [aimageview setImage:imgNormal];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    //[btn setImage:[UIImage imageNamed:(strImgHighlight ? strImgHighlight : strImg)] forState:UIControlStateHighlighted];
    //[btn setImage:[UIImage imageNamed:(strImgSelected ? strImgSelected : strImg)] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, aleftview.cyj_width, aleftview.cyj_height);
    [aleftview addSubview:btn];
    
    return aleftview;
}

- (id)initWithFrame:(CGRect)frame Nartype:(IIViewNavType)atype
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI:atype];
    }
    return self;
}

-(void)setNarviewColorbg:(UIColor*)acolor
{
    [_ViewBg setBackgroundColor:acolor];
}
-(void)setNarImagebg:(UIImage*)aimage
{
    _imgViewBg.image = aimage;
}
- (void)initUI:(IIViewNavType)atype
{
    self.backgroundColor = [UIColor clearColor];
    
    if (atype == IIViewNavBarImage) {
        _imgViewBg = [[UIImageView alloc] initWithFrame:self.bounds];
        [_imgViewBg setBackgroundColor:[UIColor clearColor]];
        _imgViewBg.frame = self.bounds;
        _imgViewBg.alpha = 1.0f;
        [self addSubview:_imgViewBg];
    }
    else if (atype == IIViewNavBarView){
        _ViewBg = [[UIView alloc] initWithFrame:self.bounds];
        [_ViewBg setBackgroundColor:[UIColor whiteColor]];
        _imgViewBg.frame = self.bounds;
        _ViewBg.alpha = 1.0f;
        [self addSubview:_ViewBg];
    }
    
    _labelTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    _labelTitle.backgroundColor = [UIColor clearColor];
    _labelTitle.textColor = RGB_TitleNormal;
    _labelTitle.font = [UIFont systemFontOfSize:FLOAT_TitleSizeNormal];
    _labelTitle.textAlignment = NSTextAlignmentCenter;
    _labelTitle.frame = [[self class] titleViewFrame];
    
    [self addSubview:_labelTitle];
}


- (void)setTitle:(NSString *)strTitle
{
    [_labelTitle setText:strTitle];
}

- (void)setLeftView:(UIView*)aleftview Leftbutton:(UIButton *)btn
{
    if (_LeftView) {
        [_LeftView removeFromSuperview];
        _LeftView = nil;
    }
    if (_btnLeft){
        [_btnLeft removeFromSuperview];
        _btnLeft = nil;
    }
    
    if (aleftview) {
        _LeftView = aleftview;
        if (_LeftView){
            
            if(_LeftView.frame.size.width > 0){
                _LeftView.frame = CGRectMake(aleftview.frame.origin.x, aleftview.frame.origin.y, aleftview.frame.size.width, aleftview.frame.size.height);
            }
            else{
                _LeftView.frame = CGRectMake(0, SystemstatusHeight, NavLeftViewwidth, NaviBarHeight);
            }

            [self addSubview:_LeftView];
        }
    }
    else{
        _btnLeft = btn;
        _btnLeft.exclusiveTouch = YES;
        if (_btnLeft)
            [self addSubview:_btnLeft];
    }
}
- (void)setRightBtn:(UIView*)arightview Rightbutton:(UIButton *)btn
{
    if (_RightView) {
        [_RightView removeFromSuperview];
        _RightView = nil;
    }

    if (_btnRight){
        [_btnRight removeFromSuperview];
        _btnRight = nil;
    }
    
    if (arightview) {
        _RightView = arightview;
        if (_RightView){
            
            if(_RightView.frame.size.width > 0){
                _RightView.frame = CGRectMake(arightview.frame.origin.x, arightview.frame.origin.y, arightview.frame.size.width, arightview.frame.size.height);
            }
            else{
                _RightView.frame = CGRectMake((ScreenWidth-NavRightViewwidth)-leftnarbuttonx, SystemstatusHeight, NavRightViewwidth, NaviBarHeight);
            }
            
            [self addSubview:_RightView];
        }
    }
    else{
        _btnRight = btn;
        _btnRight.exclusiveTouch = YES;
        if (_btnRight)
            [self addSubview:_btnRight];
    }
}

- (void)setCenterBtn:(UIView*)acenterview centerbutton:(UIButton *)btn
{
    if (_CenterView) {
        [_CenterView removeFromSuperview];
        _CenterView = nil;
    }
    
    if (_btnCenter){
        [_btnCenter removeFromSuperview];
        _btnCenter = nil;
    }
    
    if (acenterview) {
        _CenterView = acenterview;
        if (_CenterView){
            if(acenterview.frame.size.width > 0){
                _CenterView.frame = CGRectMake(acenterview.frame.origin.x, acenterview.frame.origin.y, acenterview.frame.size.width, acenterview.frame.size.height);
            }
            else{
                _CenterView.frame = CGRectMake(NavRightViewwidth, SystemstatusHeight, (ScreenWidth-NavRightViewwidth-NavLeftViewwidth), NaviBarHeight);
            }
            [self addSubview:_CenterView];
        }
    }
    else{
        _btnCenter = btn;
        _btnCenter.exclusiveTouch = YES;
        if (_btnCenter)
            [self addSubview:_btnCenter];
    }
}


- (void)btnBack:(id)sender
{
    if (self.m_viewCtrlParent){
        [self.m_viewCtrlParent.navigationController popViewControllerAnimated:YES];
    }else{APP_ASSERT_STOP}
}
- (void)showCoverView:(UIView *)view
{
    [self showCoverView:view animation:NO];
}
- (void)showCoverView:(UIView *)view animation:(BOOL)bIsAnimation
{
    if (view)
    {
        [self hideOriginalBarItem:YES];
        
        [view removeFromSuperview];
        
        view.alpha = 0.4f;
        [self addSubview:view];
        if (bIsAnimation){
            [UIView animateWithDuration:0.2f animations:^()
             {
                 view.alpha = 1.0f;
             }completion:^(BOOL f){}];
        }
        else{
            view.alpha = 1.0f;
        }
    }else{APP_ASSERT_STOP}
}

- (void)showCoverViewOnTitleView:(UIView *)view
{
    if (view)
    {
        if (_labelTitle)
        {
            _labelTitle.hidden = YES;
        }
        
        [view removeFromSuperview];
        view.frame = _labelTitle.frame;
        
        [self addSubview:view];
    }else{APP_ASSERT_STOP}
}

- (void)hideCoverView:(UIView *)view
{
    [self hideOriginalBarItem:NO];
    if (view && (view.superview == self))
    {
        [view removeFromSuperview];
    }
}

#pragma mark -
- (void)hideOriginalBarItem:(BOOL)bIsHide
{
    if (_btnLeft)
    {
        _btnLeft.hidden = bIsHide;
    }
    
    if (_btnRight)
    {
        _btnRight.hidden = bIsHide;
    }
    
    if (_labelTitle)
    {
        _labelTitle.hidden = bIsHide;
    }
    
    if (_btnCenter)
    {
        _btnCenter.hidden = bIsHide;
    }
}
-(void)drawRect:(CGRect)rect
{
    // Drawing code
}



+ (void)label:(UILabel *)label setMiniFontSize:(CGFloat)fMiniSize forNumberOfLines:(NSInteger)iLines

{
    if (label){
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = fMiniSize/label.font.pointSize;
    }
}

@end
