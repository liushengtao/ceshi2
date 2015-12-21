//
//  WealthCell.m
//  you
//
//  Created by 优途 on 15-3-11.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "WealthCell.h"

@implementation WealthCell
{
    UIImageView   *_lineImg;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(wealthCellState)state
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _State = state;
        
        _touxiangImg = [[UIImageView alloc] init];
        [self addSubview:_touxiangImg];
        
        _rightLab = [[UILabel alloc] init];
        _rightLab.backgroundColor = [UIColor clearColor];
        [self addSubview:_rightLab];
        _subRightLab = [[UILabel alloc] init];
        _subRightLab.backgroundColor = [UIColor clearColor];
        [self addSubview:_subRightLab];

        _leftLab = [[UILabel alloc] init];
        _leftLab.backgroundColor = [UIColor clearColor];
        [self addSubview:_leftLab];

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
