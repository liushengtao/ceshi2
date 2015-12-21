//
//  NavigationView.m
//  TaoChe
//
//  Created by 优途 on 14-11-8.
//  Copyright (c) 2014年 YuanDaYouTu. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView
//@synthesize title = _title,delegate = _delegate,right = _right,left = _left,rightLable = _rightLable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self buildView];
    }
    return self;
}

- (void)setleftBtn:(NSString *)leftImg andLD:(NSString *)ldImag rightBtn:(NSString *)rImg andrDImg:(NSString *)rdImg setTitle:(NSString *)content
{
    if ([leftImg length] != 0){
        [_leftBTN setImage :[UIImage imageNamed:leftImg] forState:UIControlStateNormal];
    }
    if (ldImag.length!=0)
    {
        
        [_leftBTN setImage:[UIImage imageNamed:ldImag] forState:UIControlStateHighlighted];
        
    }
    
    if ([leftImg length]==0&&[ldImag length]==0) {
        
        _leftBTN.hidden = YES;
    }
    if ([rImg length] != 0)
    {
        [_rightBTN setImage:[UIImage imageNamed:rImg] forState:UIControlStateNormal];
        
    }
    if (rdImg.length!=0)
    {
        [_rightBTN setImage:[UIImage imageNamed:rdImg] forState:UIControlStateHighlighted];
        
    }
    if (rImg.length==0&&rdImg.length==0) {
        _rightBTN.hidden = YES;
    }
    if ([content length] != 0)
        _title.text = content;
    else
        _title.hidden = YES;

}

- (void)buildView
{
    _leftBTN = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftBTN addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    [_leftBTN setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    _leftBTN.backgroundColor = [UIColor redColor];
    _rightBTN = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightLable=[[UILabel alloc]init];
    [_rightBTN addTarget:self action:@selector(rightButton) forControlEvents:UIControlEventTouchUpInside];
//    _rightBTN.backgroundColor = [UIColor redColor];

    
    _title = [[UILabel alloc] init];
    _title.backgroundColor = [UIColor clearColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.font = [UIFont boldSystemFontOfSize:18];
    _title.textColor =[UIColor whiteColor];
    
    _title.frame = CGRectMake(50,self.height - HEADER_HEIGHTS,(screenWidth-100),HEADER_HEIGHTS);
    _leftBTN.frame = CGRectMake(4, self.height -HEADER_HEIGHTS, 50/1.2 ,50/1.2);
    _rightBTN.frame = CGRectMake(screenWidth - 50/1.2, self.height - HEADER_HEIGHTS, 50/1.2, 50/1.2);
    _rightLable.height = YES;
//    _leftBTN.imageEdgeInsets = UIEdgeInsetsMake(-5, -5, -5, -5);

    _rightBTN.imageEdgeInsets = UIEdgeInsetsMake(-5, -5, -5, -5);
    [self addSubview:_rightLable];
    [self addSubview:_leftBTN];
    [self addSubview:_rightBTN];
    [self addSubview:_title];

}

- (void)leftButton
{
    if ([_delegate respondsToSelector:@selector(leftBtnAction)]) {
        [_delegate leftBtnAction];
    }
}

- (void)rightButton
{
    if ([_delegate respondsToSelector:@selector(rightBtnAction)]) {
        [_delegate rightBtnAction];
    }
}

- (void)dealloc
{
    _delegate = nil;
}


@end
