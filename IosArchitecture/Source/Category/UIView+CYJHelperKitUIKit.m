//
//  UIView+CYJHelperKitUIKit.h
//
//  Created by ChenYJ on 16/3/26.
//  Copyright © 2016年 ChenYJ. All rights reserved.
//

#import "UIView+CYJHelperKitUIKit.h"

@implementation UIView (CYJHelperKitUIKit)

- (void)setCyj_origin:(CGPoint)cyj_origin {
  CGRect frame = self.frame;
  frame.origin = cyj_origin;
  self.frame = frame;
}

- (CGPoint)cyj_origin {
  return self.frame.origin;
}

- (void)setCyj_originX:(CGFloat)cyj_originX {
  [self setCyj_origin:CGPointMake(cyj_originX, self.cyj_originY)];
}

- (CGFloat)cyj_originX {
  return self.cyj_origin.x;
}

- (void)setCyj_originY:(CGFloat)cyj_originY {
  [self setCyj_origin:CGPointMake(self.cyj_originX, cyj_originY)];
}

- (CGFloat)cyj_originY {
  return self.cyj_origin.y;
}

- (void)setCyj_center:(CGPoint)hyb_center {
  self.center = hyb_center;
}

- (CGPoint)cyj_center {
  return self.center;
}

- (void)setCyj_centerX:(CGFloat)cyj_centerX {
  [self setCyj_center:CGPointMake(cyj_centerX, self.cyj_centerY)];
}

- (CGFloat)cyj_centerX {
  return self.cyj_center.x;
}

- (void)setCyj_centerY:(CGFloat)cyj_centerY {
  [self setCyj_center:CGPointMake(self.cyj_centerX, cyj_centerY)];
}

- (CGFloat)cyj_centerY {
  return self.cyj_center.y;
}

- (void)setCyj_size:(CGSize)cyj_size {
  CGRect frame = self.frame;
  frame.size = cyj_size;
  self.frame = frame;
}

- (CGSize)cyj_size {
  return self.frame.size;
}

- (void)setCyj_width:(CGFloat)cyj_width {
  self.cyj_size = CGSizeMake(cyj_width, self.cyj_height);
}

- (CGFloat)cyj_width {
  return self.cyj_size.width;
}

- (void)setCyj_height:(CGFloat)cyj_height {
  self.cyj_size = CGSizeMake(self.cyj_width, cyj_height);
}

- (CGFloat)cyj_height {
  return self.cyj_size.height;
}

- (CGFloat)cyj_bottomY {
  return self.cyj_originY + self.cyj_height;
}

- (void)setCyj_bottomY:(CGFloat)cyj_bottomY {
  self.cyj_originY = cyj_bottomY - self.cyj_height;
}

- (CGFloat)cyj_rightX {
  return self.cyj_originX + self.cyj_width;
}

- (void)setCyj_rightX:(CGFloat)cyj_rightX {
  self.cyj_originX = cyj_rightX - self.cyj_width;
}

@end


#import <objc/runtime.h>

static char alertKey, alertLableKey;

@implementation UIView (alert)

- (void)setAlertLable:(UILabel *)alertLable
{
    objc_setAssociatedObject(self, &alertLableKey, alertLable, OBJC_ASSOCIATION_RETAIN);
}

- (UILabel *)alertLable
{
    if (objc_getAssociatedObject(self, &alertLableKey) == nil) {
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.cyj_width, 35)];
        lable.font = [UIFont systemFontOfSize:15];
        lable.textColor = RGB(127, 127, 127);
        lable.textAlignment = NSTextAlignmentCenter;
        lable.backgroundColor = [UIColor clearColor];
        lable.numberOfLines = 0;
        lable.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
        self.alertLable = lable;
        [self addSubview:lable];
    }
    return objc_getAssociatedObject(self, &alertLableKey);
}

- (void)setAlert:(NSString *)alert
{
    objc_setAssociatedObject(self, &alertKey, alert, OBJC_ASSOCIATION_RETAIN);
    self.alertLable.text = alert;
    self.alertLable.cyj_height = [self.alertLable sizeThatFits:CGSizeMake(self.alertLable.cyj_width, self.cyj_height)].height;
    self.alertLable.cyj_centerY = self.cyj_height / 2;
    self.alertLable.cyj_centerX = self.cyj_width / 2;
    if (alert == nil) {
        [self.alertLable removeFromSuperview];
        self.alertLable = nil;
    }
}

- (NSString *)alert
{
    return objc_getAssociatedObject(self, &alertKey);
}

@end


