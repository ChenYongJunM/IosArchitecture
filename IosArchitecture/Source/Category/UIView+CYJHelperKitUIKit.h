//
//  UIView+CYJHelperKitUIKit.h
//
//  Created by ChenYJ on 16/3/26.
//  Copyright © 2016年 ChenYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CYJHelperKitUIKit)

#pragma mark - Convenience frame api
/**
 * view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat cyj_originX;

/**
 * view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat cyj_originY;

/**
 * view.frame.origin
 */
@property (nonatomic, assign) CGPoint cyj_origin;

/**
 * view.center.x
 */
@property (nonatomic, assign) CGFloat cyj_centerX;

/**
 * view.center.y
 */
@property (nonatomic, assign) CGFloat cyj_centerY;

/**
 * view.center
 */
@property (nonatomic, assign) CGPoint cyj_center;

/**
 * view.frame.size.width
 */
@property (nonatomic, assign) CGFloat cyj_width;

/**
 * view.frame.size.height
 */
@property (nonatomic, assign) CGFloat cyj_height;

/**
 * view.frame.size
 */
@property (nonatomic, assign) CGSize  cyj_size;

/**
 * view.frame.size.height + view.frame.origin.y
 */
@property (nonatomic, assign) CGFloat cyj_bottomY;

/**
 * view.frame.size.width + view.frame.origin.x
 */
@property (nonatomic, assign) CGFloat cyj_rightX;

@end



/**
 UIView category relevant with UI
 */
@interface UIView (alert)

//center alert lable
@property (nonatomic, strong, readonly) UILabel *alertLable;
//center alert text
@property (nonatomic, strong) NSString *alert;

@end

