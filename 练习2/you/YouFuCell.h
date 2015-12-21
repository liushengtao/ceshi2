//
//  YouFuCell.h
//  you
//
//  Created by 优途 on 15-3-9.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _youFuCellState{
    actionState,//有服务页面
    noActionState
} youFuCellState;

@interface YouFuCell : UITableViewCell

@property (nonatomic,assign) youFuCellState State;

@property(nonatomic,strong)UIImageView*leftView;
@property(nonatomic,strong)UILabel*titlelabel;
@property(nonatomic,strong)UILabel*subTitle;
@property(nonatomic,strong)UILabel*nubTitle;

@property(nonatomic,strong)UIButton*leftBtn;
@property(nonatomic,strong)UIButton*rightBtn;




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(youFuCellState)state;
@end
