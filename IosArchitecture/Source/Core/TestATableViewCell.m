//
//  TestATableViewCell.m
//  V_Cat
//
//  Created by ChenYJ on 16/3/26.
//  Copyright © 2016年 ChenYJ. All rights reserved.
//

#import "TestATableViewCell.h"

@implementation TestATableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(CGFloat)heightWithModel:(BaseModel *)model
{
    return 200;
}

- (void)setModel:(BaseModel *)model{
    
//    TestObj *obj = (TestObj *)model;
//    
//    _myLab.text = obj.name;
}

@end
