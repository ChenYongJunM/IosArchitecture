//
//  VCAboutAvatarCell.m
//  V_Cat
//
//  Created by my on 15/7/22.
//  Copyright (c) 2015年 ChenYJ. All rights reserved.
//

#import "VCAboutAvatarCell.h"

@implementation VCAboutAvatarCell

- (void)awakeFromNib {
    
//    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightWithModel:(BaseModel *)model
{
    return 90;
}

- (void)setModel:(BaseModel *)model
{
    
}

@end
