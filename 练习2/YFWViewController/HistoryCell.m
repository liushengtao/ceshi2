//
//  HistoryCell.m
//  you
//
//  Created by 优途 on 15-3-11.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "HistoryCell.h"

@implementation HistoryCell
{
    UIImageView *lineImge ;
    UIImageView *imge;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(HistoryCellState)state
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _State = state;
        lineImge = [[UIImageView alloc] init];
//        lineImge.image = [UIImage imageNamed:@"border1@2x.jpg"];
        lineImge.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:lineImge];
        imge = [[UIImageView alloc] init];
        [self addSubview:imge];
        _titleLeft = [[UILabel alloc] init];
        _titleLeft.backgroundColor = [UIColor clearColor];
        [self addSubview:_titleLeft];
        _subtitleLefe = [[UILabel alloc] init];
        _subtitleLefe.backgroundColor = [UIColor clearColor];
        [self addSubview:_subtitleLefe];
        
        _titleRight = [[UILabel alloc] init];
        _titleRight.backgroundColor = [UIColor clearColor];
        [self addSubview: _titleRight];
        _subtitleRight = [[UILabel alloc] init];
        _subtitleRight.backgroundColor = [UIColor clearColor];
        [self addSubview:_subtitleRight];
        _touxiangImg = [[UIImageView alloc] init];
        [self addSubview:_touxiangImg];

    }
    return self;
}

- (void)layoutSubviews{
    if (_State == historyState) {
        self.height = 50;

        lineImge.frame  = CGRectMake(0, self.height-1, screenWidth, 1);
        _titleLeft.frame = CGRectMake(20, 5, 150, 20);
        _titleLeft.textColor = UIColorFromRGB(0x3e3e3e);
        _titleLeft.font = [UIFont boldSystemFontOfSize:14];
        
        _subtitleLefe.frame = CGRectMake(20, _titleLeft.bottom, 100, 20);
        _subtitleLefe.textColor = UIColorFromRGB(0x969696);
        _subtitleLefe.font = [UIFont systemFontOfSize:10];
        
        _titleRight.frame = CGRectMake(screenWidth - 70, 10, 50, 20);
//        _titleRight.textColor = UIColorFromRGB(0x50c38c);
        _titleRight.font = [UIFont systemFontOfSize:14];
        _titleRight.textAlignment = NSTextAlignmentRight;
        
        _subtitleRight.frame = CGRectMake(screenWidth -120, _titleLeft.bottom, 100, 20);
        _subtitleRight.textColor = UIColorFromRGB(0x969696);
        _subtitleRight.textAlignment = NSTextAlignmentRight;
        _subtitleRight.font = [UIFont systemFontOfSize:10];
    }
    else if (_State == wealthTouxiang){
        self.height = 60;
        imge.frame = CGRectMake(self.width - 30, (self.height -30)/2, 25, 30);
        imge.image = [UIImage imageNamed:@"inter@2x.png"];
        _touxiangImg.frame = CGRectMake(10, 10, 40, 40);
        _titleLeft.frame = CGRectMake(_touxiangImg.right+10, 15, 100, 20);
        _titleLeft.font = [UIFont boldSystemFontOfSize:14];
        _subtitleLefe.frame = CGRectMake(_titleLeft.left, _titleLeft.bottom, 100, 20);
        _subtitleLefe.font = [UIFont systemFontOfSize:12];
        _subtitleLefe.textColor = UIColorFromRGB(0x969696);
        _titleLeft.textColor = UIColorFromRGB(0x3e3e3e);
        _subtitleRight.frame = CGRectMake(self.width - 100, self.width/2 -10, 75, 20);
        _subtitleRight.textAlignment = NSTextAlignmentRight;
        _subtitleRight.textColor = UIColorFromRGB(0x969696);
        lineImge.frame  = CGRectMake(0, self.height-1, screenWidth, 1);
        
        
        
    }else if (_State == wealthInfo){
        _titleLeft.frame = CGRectMake(0, 0, self.width/3, self.height);
        _titleLeft.font = [UIFont systemFontOfSize:12];
        _subtitleRight.frame = CGRectMake(_titleLeft.right, 0, _titleLeft.width, _titleLeft.height);
        _titleRight.frame = CGRectMake(_subtitleRight.right, 0, _titleLeft.width, _titleLeft.height);
        _subtitleRight.font = [UIFont systemFontOfSize:12];
        _titleRight.font = [UIFont systemFontOfSize:12];
        _titleLeft.textAlignment = NSTextAlignmentCenter;
        _subtitleRight.textAlignment = NSTextAlignmentCenter;
        _titleRight.textAlignment = NSTextAlignmentCenter;
        UIImageView *lintei = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/3, 0, 0.5, self.height)];
        lintei.backgroundColor = UIColorFromRGB(0xe4e4e4);
        [self addSubview:lintei];
        UIImageView *linteis = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/3*2, 0, 0.5, self.height)];
        linteis.backgroundColor = UIColorFromRGB(0xe4e4e4);
        [self addSubview:linteis];

        
    }else if (_State == wealthAction){
        self.height = 44;
        _touxiangImg.frame = CGRectMake(10, (self.height-30)/2, 30, 30);
        lineImge.frame = CGRectMake(50, self.height , screenWidth-44, 1);
        lineImge.backgroundColor = UIColorFromRGB(0xe4e4e4);
        _titleLeft.frame = CGRectMake(50, 0, 60, self.height);
        _titleLeft.textColor = UIColorFromRGB(0x3e3e3e);
        _titleLeft.font = [UIFont boldSystemFontOfSize:13];
        imge.frame = CGRectMake(self.width - 30, (self.height -30)/2, 25, 30);
        imge.image = [UIImage imageNamed:@"inter@2x.png"];

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
