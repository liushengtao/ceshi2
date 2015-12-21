//
//  HistoryCell.h
//  you
//
//  Created by 优途 on 15-3-11.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _HistoryCellState{
    historyState,//历史页面
    wealthTouxiang,
    wealthInfo,//资金账户
    wealthAction
} HistoryCellState;



@interface HistoryCell : UITableViewCell

@property (nonatomic,assign) HistoryCellState State;

@property (nonatomic,strong) UIImageView *touxiangImg;

@property (nonatomic,strong) UILabel    *titleLeft;
@property (nonatomic,strong) UILabel    *subtitleLefe;
@property (nonatomic,strong) UILabel    *titleRight;
@property (nonatomic,strong) UILabel    *subtitleRight;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(HistoryCellState)state;


@end
