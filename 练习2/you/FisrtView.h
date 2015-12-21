//
//  FisrtView.h
//  you
//
//  Created by 优途 on 15-2-28.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _FistrViewState
{
    OneState,//一行
    TwoState,//两行
    scrollState
}FistrViewState;


@protocol YTFistViewDelegate <NSObject>
@optional
- (void)fisrtViewBtnEventTouch:(UIButton*)btn;
- (void)rightBtnEvet:(UIButton *)btn;
@end

@interface FisrtView : UIView
{
    id<YTFistViewDelegate>_pubDelegate;

}


- (id)initWithFrame:(CGRect)frame and:(FistrViewState)state;

@property (nonatomic,strong) id<YTFistViewDelegate>pubDelegate;
@property (nonatomic,assign) FistrViewState   State;



@property (nonatomic,strong) UIImageView    *rightImg;
@property (nonatomic,strong) UIImageView    *leftImg;
@property (nonatomic,strong) UILabel        *rightLab;
@property (nonatomic,strong) UILabel        *leftLab;
@property (nonatomic,strong) UIButton       *rightBtn;
@property (nonatomic,strong) UIButton       *leftBtn;
@property (nonatomic,strong) UIImageView *lineShuImg;//shu
@property (nonatomic,strong)     UILabel       *leftlab1;



@end
