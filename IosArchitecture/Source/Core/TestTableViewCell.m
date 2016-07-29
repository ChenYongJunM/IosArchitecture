//
//  TestTableViewCell.m
//  FDTest
//
//  Created by CYJ on 16/4/14.
//  Copyright © 2016年 CYJ. All rights reserved.
//

#import "TestTableViewCell.h"
#import "TestObj.h"
@implementation TestTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:@"TestTableViewCell" owner:self options:nil][0];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(BaseModel *)model
{
    TestObj *obj = (TestObj *)model;
    _myLab.text = obj.name;
    
    UIView *la = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    la.backgroundColor = [UIColor redColor];
    [self addSubview:la];
}

+(CGFloat)heightWithModel:(BaseModel *)model
{
    return 100;
}

@end
