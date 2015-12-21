//
//  NavigationView.h
//  TaoChe
//
//  Created by 优途 on 14-11-8.
//  Copyright (c) 2014年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NavigationViewDelegate;



@interface NavigationView : UIImageView
{
//    UIButton     *_left;
//    UIButton     *_right;
//    UILabel      *_title;
//    UILabel      *rightLable;
//    NTButton      *_right
    id <NavigationViewDelegate> _delegate;
    
}
@property (nonatomic,strong) UIButton *leftBTN;
@property (nonatomic,strong) UIButton *rightBTN;
@property (nonatomic,strong) UILabel  *title;
@property (nonatomic,strong) UILabel  *rightLable;
@property (nonatomic,strong) id <NavigationViewDelegate> delegate;

- (void)setleftBtn:(NSString *)leftImg andLD: (NSString *)ldImag rightBtn:(NSString *)rImg andrDImg:(NSString *)rdImg setTitle:(NSString *)content;


@end

@protocol NavigationViewDelegate <NSObject>

//导航左按钮触发事件
- (void)leftBtnAction;
//导航右按钮触发事件
- (void)rightBtnAction;

@end






