//
//  ActivityView.h
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModuleListModel;

@protocol ActivityDelegate <NSObject>
- (void)rightBtnEvet:(UIButton *)btn;
@end

@interface ActivityView : UIView
{
    id<ActivityDelegate>_Delegate;

}

@property (nonatomic,strong) id<ActivityDelegate>Delegae;


@property (nonatomic,strong) UIImageView    *leftImg;
@property (nonatomic,strong) UILabel        *leftLab;
@property (nonatomic,strong) UIButton       *rightBtn;
@property (nonatomic,strong)     UILabel       *leftlab1;


- (void)showActivityViewInfo:(ModuleListModel *)model;

@end
