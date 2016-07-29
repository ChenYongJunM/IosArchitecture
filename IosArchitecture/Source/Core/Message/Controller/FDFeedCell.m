//
//  FDFeedCell.m
//  Demo
//
//  Created by sunnyxx on 15/4/17.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedCell.h"

@interface FDFeedCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *contentLabel;
@property (nonatomic, weak) IBOutlet UIImageView *contentImageView;
@property (nonatomic, weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

@end

@implementation FDFeedCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"FDFeedCell" owner:self options:nil][0];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setModel:(BaseModel *)model
{
    FDFeedEntity *entity = model;
    self.titleLabel.text = entity.title;
    self.contentLabel.text = entity.content;
    self.contentImageView.image = entity.imageName.length > 0 ? [UIImage imageNamed:entity.imageName] : nil;
    self.usernameLabel.text = entity.username;
    self.timeLabel.text = entity.time;
}

+ (CGFloat)heightWithModel:(BaseModel *)model
{
    return 150;
}

//- (void)setEntity:(FDFeedEntity *)entity
//{
//    _entity = entity;
//    
//
//}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
//- (CGSize)sizeThatFits:(CGSize)size {
//    CGFloat totalHeight = 0;
//    totalHeight += [self.titleLabel sizeThatFits:size].height;
//    totalHeight += [self.contentLabel sizeThatFits:size].height;
//    totalHeight += [self.contentImageView sizeThatFits:size].height;
//    totalHeight += [self.usernameLabel sizeThatFits:size].height;
//    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}


@end
