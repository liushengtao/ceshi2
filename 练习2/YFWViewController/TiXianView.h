//
//  TiXianView.h
//  you
//
//  Created by 优途 on 15-3-13.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum _tiXianState
{
    zhifubaoSate,

    yinHangState
}tiXianState;

@class TiXianView;
@protocol TiXianViewDelegate <NSObject>

- (void)tiXianViewBtnEventTouch:(UIButton *)btn and:(tiXianState)state and:(TiXianView *)view;
- (void)begenField:(UITextField *)field and:(UIView*)view;
- (void)endField:(UITextField *)field;
- (void)keyDone:(UITextField *)field and:(UIView*)views;

@end

@interface TiXianView : UIView<UITextFieldDelegate>
{
    id<TiXianViewDelegate>_tiDelegate;
    
}

- (id)initWithFrame:(CGRect)frame and:(tiXianState)state;

@property (nonatomic,strong) id<TiXianViewDelegate>tiDelegate;
@property (nonatomic,assign) tiXianState   State;

@property (nonatomic,strong) UILabel        *firstLab;
@property (nonatomic,strong) UITextField        *firstFiled;
@property (nonatomic,strong) UILabel        *secendLab;
@property (nonatomic,strong) UITextField        *secendFiled;
@property (nonatomic,strong) UILabel        *threeLab;
@property (nonatomic,strong) UITextField        *threeFiled;
@property (nonatomic,strong) UILabel        *fourLab;
@property (nonatomic,strong) UITextField        *fourFiled;
@property (nonatomic,strong) UILabel        *fiveLab;
@property (nonatomic,strong) UITextField        *fiveFiled;
@property (nonatomic,strong) UIButton        *rightBtn;
@property (nonatomic,strong) UIButton        *leftBtn;





@end
