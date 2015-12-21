//
//  YouFuCell.m
//  you
//
//  Created by 优途 on 15-3-9.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "YouFuCell.h"

#define imageHight  30

@implementation YouFuCell
{
    UIImageView       *identiImg;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier and:(youFuCellState)state
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _State = state;
        UIImageView *lineImge = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.height-1, self.width, 1)];
        lineImge.backgroundColor = UIColorFromRGB(0xe4e4e4);
        [self addSubview:lineImge];
        
        identiImg = [[UIImageView alloc] init];
        [self addSubview:identiImg];
        
        UIImageView*imageview=[[UIImageView alloc]init];
        _leftView=imageview;
        [self addSubview:_leftView];
        
        UILabel*titlelable=[[UILabel alloc]init];
        titlelable.backgroundColor=[UIColor clearColor];
        _titlelabel=titlelable;
//        titlelable.font=FONT_14;
        [self addSubview:_titlelabel];
        
        UILabel*pricelabel=[[UILabel alloc]init];
        pricelabel.backgroundColor=[UIColor clearColor];
        _subTitle=pricelabel;
        [self addSubview:_subTitle];
        
        UILabel*nubs=[[UILabel alloc]init];
        nubs.backgroundColor=[UIColor clearColor];
        _nubTitle=nubs;
        [self addSubview:_nubTitle];
        
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(btnEventTouch:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = 200;
        _leftBtn = btn;
        [self addSubview:_leftBtn];
        UIButton *btn1 = [[UIButton alloc] init];
        [btn1 addTarget:self action:@selector(btnEventTouch:) forControlEvents:UIControlEventTouchUpInside];
        btn1.backgroundColor = [UIColor clearColor];
        btn1.tag = 201;
        _leftBtn = btn1;
        [self addSubview:_leftBtn];


        
    }
    return self;
}

- (void)layoutSubviews
{
    if (_State == noActionState) {
        _leftView.frame = CGRectMake(10,(self.height -imageHight)/2,imageHight, imageHight);
        _titlelabel.frame = CGRectMake(_leftView.right +10, (self.height - 20)/2, 50, 20);
        _titlelabel.textColor = UIColorFromRGB(0x3e3e3e);
        _titlelabel.font = [UIFont systemFontOfSize:12];
        _subTitle.frame = CGRectMake(self.width/2, (self.height -20)/2, self.width/2 -50, 20);
        _subTitle.textAlignment = NSTextAlignmentRight;
        _subTitle.font = [UIFont systemFontOfSize:10];
        _subTitle.textColor = UIColorFromRGB(0x959595);
        
        _nubTitle.frame = CGRectMake(self.width - 55, (self.height -20)/2, 20, 20);
        _nubTitle.textAlignment = NSTextAlignmentRight;

        _nubTitle.textColor = UIColorFromRGB(0xff667a);
        _nubTitle.font = [UIFont systemFontOfSize:10];
        
        identiImg.frame = CGRectMake(self.width - 25, (self.height/2 -10), 20, 20);
        identiImg.image = [UIImage imageNamed:@"inter@2x.png"];
    }else if (_State == actionState){
        
        _leftView.frame = CGRectMake(10,(self.height -imageHight)/2,imageHight, imageHight);
        _titlelabel.frame = CGRectMake(_leftView.right +10, (self.height - 20)/2, 50, 20);
        _titlelabel.textColor = UIColorFromRGB(0x3e3e3e);
        _titlelabel.font = [UIFont systemFontOfSize:12];
        _subTitle.frame = CGRectMake(self.width/2, (self.height -20)/2, self.width/2 -30, 20);
        _subTitle.textAlignment = NSTextAlignmentRight;
        _subTitle.textColor = UIColorFromRGB(0x959595);
        _subTitle.font = [UIFont systemFontOfSize:10];
        identiImg.frame = CGRectMake(self.width - 25, (self.height/2 -10), 20, 20);
        identiImg.image = [UIImage imageNamed:@"inter@2x.png"];


        
    }
}

- (void)btnEventTouch:(UIButton *)btn
{
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
