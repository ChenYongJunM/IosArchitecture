//
//  XIMModelBinding.h
//  StructureProject
//
//  Created by ChenYJ on 14/5/20.
//  Copyright (c) 2014年 ChenYJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@protocol CYModelBinding <NSObject>

@property (nonatomic, strong) BaseModel *model;

@property (nonatomic, assign) NSUInteger idx;

@property (nonatomic, assign) NSUInteger sectionIdx;

@property (nonatomic, strong) UIImageView *separatorView;

@property (nonatomic, assign) CGFloat separatorViewLeft;

/** set display separatorView, default is YES */
@property (nonatomic, assign) BOOL isApearSeparatorView;

+ (CGFloat)heightWithModel:(BaseModel *)model;

@end
