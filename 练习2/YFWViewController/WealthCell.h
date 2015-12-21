//
//  WealthCell.h
//  you
//
//  Created by 优途 on 15-3-11.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _wealthCellState{
    actionState,//有服务页面
    noActionState
} wealthCellState;


@interface WealthCell : UITableViewCell

@property (nonatomic,assign) wealthCellState State;

@property (nonatomic,strong) UIImageView *touxiangImg;
@property (nonatomic,strong) UILabel     *rightLab;
@property (nonatomic,strong) UILabel     *subRightLab;

@property (nonatomic,strong) UILabel     *leftLab;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(wealthCellState)state;

@end
