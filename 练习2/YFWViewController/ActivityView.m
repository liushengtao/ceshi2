//
//  ActivityView.m
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "ActivityView.h"
#import "ModuleListModel.h"

@implementation ActivityView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftLab = [[UILabel alloc] init];
        _leftLab.font = [UIFont systemFontOfSize:12];
        _leftLab.backgroundColor = [UIColor clearColor];
        _leftLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_leftLab];
        _leftlab1 = [[UILabel alloc] init];
        _leftlab1.font = [UIFont systemFontOfSize:12];
        _leftlab1.backgroundColor = [UIColor clearColor];
        //        leftlab1.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_leftlab1];
        _leftImg = [[UIImageView alloc] init];
        [self addSubview:_leftImg];
        _rightBtn = [[UIButton alloc] init];
        //        [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        //        _rightButton.titleLabel.font = FONT_13;
        _rightBtn.backgroundColor = [UIColor clearColor];
        [_rightBtn addTarget:self action:@selector(rightViewEventBtn:) forControlEvents:UIControlEventTouchUpInside];
        //        _rightBtn.tag = 10;
        //        _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //        _rightBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
        //        _rightBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_rightBtn];
    }
    return self;

}
- (void)rightViewEventBtn:(UIButton *)btn
{
    if ([_Delegae respondsToSelector:@selector(rightBtnEvet:)]) {
        [_Delegae rightBtnEvet:btn];
    }else{
        NSLog(@"dfsdfdsa");
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.backgroundColor = UIColorFromRGB(0xf7f7f7);
    _leftImg.frame = CGRectMake(self.width/2-40/2, 10, 40, 40);
    
    _leftLab.frame = CGRectMake(0, _leftImg.bottom +5, self.width, 20);
    _leftLab.textAlignment = NSTextAlignmentCenter;
    _leftLab.textColor = UIColorFromRGB(0x3e3e3e);
    _leftLab.font = [UIFont systemFontOfSize:12];
    
//    _leftlab1.frame = CGRectMake(0, _leftLab.bottom-3, self.width, 20);
//    _leftlab1.font = [UIFont boldSystemFontOfSize:10];
//    //        _leftlab1.text = @"众多美味等你选";
//    _leftlab1.textAlignment = NSTextAlignmentCenter;
//    _leftlab1.textColor = UIColorFromRGB(0x868585);
    
    _rightBtn.frame = CGRectMake(0, 0, self.width, self.height);
    //        _rightBtn.backgroundColor = [UIColor blueColor];

}

- (void)showActivityViewInfo:(ModuleListModel *)model
{
    NSString *urlstr;
    if ([model.logoImg rangeOfString:@"http"].location !=NSNotFound) {
        urlstr = [NSString stringWithFormat:@"%@",model.logoImg];
    }else{
        urlstr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,model.logoImg];
    }
//    NSString *urlstr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,model.logoImg];
    [_leftImg setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:@""]];
    
    _leftLab.text = [NSString stringWithFormat:@"%@",model.module_name];
//    _leftlab1.text = [NSString stringWithFormat:@"%@",model.module_desc];
    
    
    [self setNeedsLayout];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
