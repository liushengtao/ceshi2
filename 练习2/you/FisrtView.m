//
//  FisrtView.m
//  you
//
//  Created by 优途 on 15-2-28.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "FisrtView.h"

@implementation FisrtView
{
    UIImageView  *_lineImag;
//    UIImageView *_lineShuImg;//shu
    UILabel       *rightLab1;
}


- (id)initWithFrame:(CGRect)frame and:(FistrViewState)state
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _State = state;
        
        self.backgroundColor = UIColorFromRGB(0xffffff);
        _leftLab = [[UILabel alloc] init];
        _leftLab.font = [UIFont systemFontOfSize:12];
        _leftLab.backgroundColor = [UIColor clearColor];
        _leftLab.textAlignment = NSTextAlignmentRight;
        [self addSubview:_leftLab];
        
        _rightLab = [[UILabel alloc] init];
        _rightLab.backgroundColor = [UIColor clearColor];
        [self addSubview:_rightLab];
        
        rightLab1 = [[UILabel alloc] init];
//        rightLab1.textAlignment = NSTextAlignmentLeft;
        [self addSubview:rightLab1];
        
        _leftlab1 = [[UILabel alloc] init];
        _leftlab1.font = [UIFont systemFontOfSize:12];
        _leftlab1.backgroundColor = [UIColor clearColor];
//        leftlab1.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_leftlab1];

        
        
        _lineImag = [[UIImageView alloc] init];
        _lineImag.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:_lineImag];
        _lineShuImg = [[UIImageView alloc] init];
        _lineShuImg.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:_lineShuImg];
        
        
        _rightImg = [[UIImageView alloc] init];
        [self addSubview:_rightImg];
        _leftImg = [[UIImageView alloc] init];
        [self addSubview:_leftImg];
        
        _rightBtn = [[UIButton alloc] init];
        _rightBtn.backgroundColor = [UIColor clearColor];
        [_rightBtn addTarget:self action:@selector(rightViewEventBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightBtn];

        _leftBtn = [[UIButton alloc] init];
        _leftBtn.backgroundColor = [UIColor clearColor];
        [_leftBtn addTarget:self action:@selector(publishViewEventBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftBtn];


    }
    return self;

}

- (void)rightViewEventBtn:(UIButton *)btn
{
    if ([_pubDelegate respondsToSelector:@selector(rightBtnEvet:)]) {
        [_pubDelegate rightBtnEvet:btn];
    }else{
        NSLog(@"dfsdfdsa");
    }
    
}


- (void)publishViewEventBtn:(UIButton *)btn
{
    if ([_pubDelegate respondsToSelector:@selector(fisrtViewBtnEventTouch:)]) {
        [_pubDelegate fisrtViewBtnEventTouch:btn ];
    }
    
}

- (void)layoutSubviews
{
     
    if (_State == OneState) {
        self.backgroundColor = UIColorFromRGB(0xffefef);
        _lineImag.frame = CGRectMake(0, 0, self.width, 1);
        _lineImag.backgroundColor = UIColorFromRGB(0xe75b2c);

        _lineShuImg.frame = CGRectMake(self.width/2, 5, 1, self.height - 5);
        _lineShuImg.backgroundColor = UIColorFromRGB(0xf5d5d5);

        _rightImg.frame = CGRectMake(self.width/5-10 - 25/2, (self.height -35)/2, 25, 30);
        _rightImg.image = [UIImage imageNamed:@"bills"];
        _rightLab.frame = CGRectMake(_rightImg.right +10, self.height/2-10, 50, 20);
        _rightLab.font = [UIFont systemFontOfSize:12];
        _rightLab.text = @"历史记录";
        _rightLab.textColor = UIColorFromRGB(0x3e3e3e);
        
        _leftImg.frame = CGRectMake(self.width/2+self.width/5 -15, (self.height -35)/2, 25, 30);
        _leftImg.image = [UIImage imageNamed:@"moneys"];
        _leftLab.frame = CGRectMake(_leftImg.right+10, self.height/2-10, 50, 20);
        _leftLab.textAlignment = NSTextAlignmentLeft;
        _leftLab.textColor =UIColorFromRGB(0x3e3e3e);
        _leftLab.font = [UIFont systemFontOfSize:12];
        _leftLab.text = @"我的财富";
        
        _rightBtn.frame = CGRectMake(0, 0, self.width/2, 50);
        _rightBtn.tag = 10;
        _leftBtn.frame = CGRectMake(self.width/2, 0, self.width/2, 50);
        _leftBtn.tag = 11;
    }else if (_State == TwoState){
//        self.backgroundColor = [UIColor redColor];
        _leftLab.frame = CGRectMake(10, 10, 70, 20);
//        _leftLab.text = @"全城招募";
        _leftLab.textAlignment = NSTextAlignmentLeft;
        _leftLab.textColor = UIColorFromRGB(0xe89c22);
        _leftLab.font = [UIFont systemFontOfSize:14];
        
        _leftlab1.frame = CGRectMake(10, _leftLab.bottom-3, 100, 20);
        _leftlab1.font = [UIFont boldSystemFontOfSize:12];
//        _leftlab1.text = @"万名圈主";
        _leftlab1.textAlignment = NSTextAlignmentLeft;
        _leftlab1.textColor = UIColorFromRGB(0x909090);
        _rightImg.frame = CGRectMake(self.width - 50, (self.height -35)/2, 35, 35);
        _leftBtn.frame = CGRectMake(0, 0, self.width, self.height);
        _lineShuImg.frame = CGRectMake(self.width-1, 0, 1, self.height );
        _lineShuImg.image = [UIImage imageNamed:@"border2@2x.jpg"];

        
    }else if (_State == scrollState){
        _leftLab.frame = CGRectMake(10, 10, 70, 20);
        _leftLab.textAlignment = NSTextAlignmentLeft;
        _leftLab.textColor = UIColorFromRGB(0xe89c22);
        _leftLab.font = [UIFont systemFontOfSize:12];
        
        _leftlab1.frame = CGRectMake(10, _leftLab.bottom-3, 100, 20);
        _leftlab1.font = [UIFont boldSystemFontOfSize:10];
        _leftlab1.textAlignment = NSTextAlignmentLeft;
        _leftlab1.textColor = UIColorFromRGB(0x909090);
        _rightImg.frame = CGRectMake(self.width - 60, (self.height -35)/2, 35, 35);
        _leftBtn.frame = CGRectMake(0, 0, self.width, self.height);
        _lineShuImg.frame = CGRectMake(self.width-1, 0, 1, self.height );
        _lineShuImg.image = [UIImage imageNamed:@"border2@2x.jpg"];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
