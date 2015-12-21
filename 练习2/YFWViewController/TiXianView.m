//
//  TiXianView.m
//  you
//
//  Created by 优途 on 15-3-13.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "TiXianView.h"

@implementation TiXianView

- (id)initWithFrame:(CGRect)frame and:(tiXianState)state
{
    self = [super initWithFrame:frame];
    if (self) {
        _State = state;
        
        
        _firstLab = [[UILabel alloc] init];
        _firstLab.backgroundColor = UIColorFromRGB(0xffffff);
        _firstLab.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:_firstLab];
        _secendLab = [[UILabel alloc] init];
        _secendLab.backgroundColor = UIColorFromRGB(0xffffff);
        _secendLab.font = [UIFont boldSystemFontOfSize:14];

        [self addSubview:_secendLab];
        _threeLab = [[UILabel alloc] init];
        _threeLab.backgroundColor = UIColorFromRGB(0xffffff);
        _threeLab.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:_threeLab];
        _fourLab = [[UILabel alloc] init];
        _fourLab.backgroundColor = UIColorFromRGB(0xffffff);
        _fourLab.font = [UIFont boldSystemFontOfSize:14];

        [self addSubview:_fourLab];
        _fiveLab = [[UILabel alloc] init];
        _fiveLab.backgroundColor = UIColorFromRGB(0xffffff);
        _fiveLab.font = [UIFont boldSystemFontOfSize:14];

        [self addSubview:_fiveLab];
        
        _firstFiled = [[UITextField alloc] init];
        _firstFiled.delegate = self;
        _firstFiled.tag = 20;
        _firstFiled.backgroundColor = UIColorFromRGB(0xffffff);
        [self addSubview:_firstFiled];
        
        _secendFiled = [[UITextField alloc] init];
        _secendFiled.backgroundColor = UIColorFromRGB(0xffffff);
        _secendFiled.delegate = self;
        _secendFiled.tag = 21;
        [self addSubview:_secendFiled];

        _threeFiled = [[UITextField alloc] init];
        _threeFiled.delegate = self;
        _threeFiled.tag = 22;
        _threeFiled.backgroundColor = UIColorFromRGB(0xffffff);
        [self addSubview:_threeFiled];

        _fourFiled = [[UITextField alloc] init];
        _fourFiled.delegate = self;
        _fourFiled.tag = 23;
        _fourFiled.backgroundColor = UIColorFromRGB(0xffffff);
        [self addSubview:_fourFiled];

        _fiveFiled = [[UITextField alloc] init];
        _fiveFiled.delegate = self;
        _fiveFiled.tag = 24;
        _fiveFiled.backgroundColor = UIColorFromRGB(0xffffff);
        [self addSubview:_fiveFiled];
        
        _firstFiled.font = [UIFont systemFontOfSize:14];
        _firstFiled.keyboardType = UIKeyboardTypeDefault;
        _firstFiled.returnKeyType = UIReturnKeyDone;
        _secendFiled.font = [UIFont systemFontOfSize:14];
        _secendFiled.keyboardType = UIKeyboardTypeDefault;
        _secendFiled.returnKeyType = UIReturnKeyDone;

        _threeFiled.font = [UIFont systemFontOfSize:14];
        _threeFiled.keyboardType = UIKeyboardTypeDefault;
        _threeFiled.returnKeyType = UIReturnKeyDone;
        _fourFiled.font = [UIFont systemFontOfSize:14];
        _fourFiled.keyboardType = UIKeyboardTypeDefault;
        _fourFiled.returnKeyType = UIReturnKeyDone;

        _fiveFiled.font = [UIFont systemFontOfSize:14];
        _fiveFiled.keyboardType = UIKeyboardTypeDefault;
        _fiveFiled.returnKeyType = UIReturnKeyDone;

        
        _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, self.height -70, (self.width -40)/2, 30)];
        _leftBtn.backgroundColor = UIColorFromRGB(0xff6633);
        [_leftBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_leftBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(tixianBtn:) forControlEvents:UIControlEventTouchUpInside];
        _leftBtn.tag = 70;
        [self addSubview:_leftBtn];
        
        _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(25 +_leftBtn.width, _leftBtn.top, _leftBtn.width, _leftBtn.height)];
        [_rightBtn addTarget:self action:@selector(tixianBtn:) forControlEvents:UIControlEventTouchUpInside];
        _rightBtn.tag = 71;
        _rightBtn.backgroundColor = UIColorFromRGB(0xff6633);
        [_rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self addSubview:_rightBtn];

        
    }
    return self;
}
//委托方法
-(void)textFieldDidBeginEditing:(UITextField *)textField{//当开始点击textField会调用的方法
    [textField becomeFirstResponder];
    if ([_tiDelegate respondsToSelector:@selector(begenField: and:) ]) {
        [_tiDelegate begenField:textField and:self];
    }

}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    [textField resignFirstResponder];

    if ([_tiDelegate respondsToSelector:@selector(endField:)]) {
        [_tiDelegate endField:textField];
    }
    return YES;

}
-(void)textFieldDidEndEditing:(UITextField *)textField{//当textField编辑结束时调用的方法

//    [textField resignFirstResponder];
//
//    if ([_tiDelegate respondsToSelector:@selector(endField:)]) {
//        [_tiDelegate endField:textField];
//    }
    
}


//按下Done按钮的调用方法，我们让键盘消失

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    
    [textField resignFirstResponder];
    if ([_tiDelegate respondsToSelector:@selector(keyDone: and:)]) {
        [_tiDelegate keyDone:textField and:self];
    }
    
    return YES;
    
}
- (void)tixianBtn:(UIButton *)btn
{
    if ([_tiDelegate respondsToSelector:@selector(tiXianViewBtnEventTouch: and: and:)]) {
        [_tiDelegate tiXianViewBtnEventTouch:btn and:_State and:self];
    }
}

- (void)layoutSubviews
{
    if (_State == zhifubaoSate) {
        _firstLab.frame = CGRectMake(0, 0, 100, 40);
        _firstLab.text = @"   支付宝账号:";
        
        _firstFiled.frame = CGRectMake(_firstLab.right, _firstLab.top,screenWidth- _firstLab.width, _firstLab.height);
        _firstFiled.placeholder = @"请输入支付宝账号";
        
        UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, _firstLab.bottom, screenWidth, 1)];
        line1.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:line1];
        _secendLab.frame = CGRectMake(0, line1.bottom, _firstLab.width, _firstLab.height);
        _secendLab.text = @"   真实姓名:";
        
        _secendFiled.frame = CGRectMake(_secendLab.right, _secendLab.top, _firstFiled.width, _firstLab.height);
        _secendFiled.placeholder = @"请输入真实姓名";
        
        _threeLab.frame = CGRectMake(0, _secendFiled.bottom +20, _firstLab.width, _firstLab.height);
        _threeLab.text = @"   提现金额:";
        _threeFiled.frame = CGRectMake(_threeLab.right, _threeLab.top, _firstFiled.width, _firstLab.height);
        _threeFiled.placeholder = @"请输入金额";
        UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, _threeLab.bottom, screenWidth, 1)];
        line2.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:line2];
        _fourLab.frame = CGRectMake(0, line2.bottom , _firstLab.width, _firstLab.height);
        _fourLab.text =@"   提现密码:";
        
        _fourFiled.frame = CGRectMake(_fourLab.right, _fourLab.top, _firstFiled.width, _firstLab.height);
        _fourFiled.placeholder = @"请输入密码";
        
        
    }else{
        _firstLab.frame = CGRectMake(0, 0, 100, 40);
        _firstLab.text = @"   收款方户名:";
        
        _firstFiled.frame = CGRectMake(_firstLab.right, _firstLab.top,screenWidth- _firstLab.width, _firstLab.height);
        _firstFiled.placeholder = @"请输入收款方户名";
        
        UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, _firstLab.bottom, screenWidth, 1)];
        line1.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:line1];
        _secendLab.frame = CGRectMake(0, line1.bottom, _firstLab.width, _firstLab.height);
        _secendLab.text = @" 收款方开户行:";
        
        _secendFiled.frame = CGRectMake(_secendLab.right, _secendLab.top, _firstFiled.width, _firstLab.height);
        _secendFiled.placeholder = @"请输入开户行信息";
        
        UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, _secendFiled.bottom, screenWidth, 1)];
        line2.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:line2];

        
        
        
        _threeLab.frame = CGRectMake(0, line2.bottom , _firstLab.width, _firstLab.height);
        _threeLab.text = @"   收款方账号:";
        _threeFiled.frame = CGRectMake(_threeLab.right, _threeLab.top, _firstFiled.width, _firstLab.height);
        _threeFiled.placeholder = @"请输入收款方账号";
        
        
        _fourLab.frame = CGRectMake(0, _threeFiled.bottom +20, _firstLab.width, _firstLab.height);
        _fourLab.text =@"   提现金额:";
        _fourFiled.frame = CGRectMake(_fourLab.right, _fourLab.top, _firstFiled.width, _firstLab.height);
        _fourFiled.placeholder =@"请输入金额";
        UIImageView *line3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, _fourLab.bottom, screenWidth, 1)];
        line3.backgroundColor = UIColorFromRGB(0xe7e7e7);
        [self addSubview:line3];

        _fiveLab.frame = CGRectMake(0, line3.bottom , _firstLab.width, _firstLab.height);
        _fiveLab.text =@"   提现密码:";
        _fiveFiled.frame = CGRectMake(_fiveLab.right, _fiveLab.top, _firstFiled.width, _firstLab.height);
        _fiveFiled.placeholder = @"请输入密码";
        

    }
}
@end
