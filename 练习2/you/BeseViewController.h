//
//  BeseViewController.h
//  TaoChe
//
//  Created by 优途 on 14-11-8.
//  Copyright (c) 2014年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationView.h"

@interface BeseViewController : UIViewController<NavigationViewDelegate>
{
    NavigationView *navBar;
    UIImageView*backgrundView;
    UIButton *beseBtn ;
}
@property (nonatomic,strong)    UIButton *beseBtn ;

@property(nonatomic,strong)NavigationView*navBar;
@property(nonatomic,strong)UIImageView*backgrundView;
//设置导航
//lImg: 左按钮图片名称
//rImg: 右按钮图片名称
//content: 页面标题
//draw: 页面是否滑动
- (void)setNavBarleftBtn:(NSString *)lImg andlDimg:(NSString*)ldimag
                rightBtn:(NSString *)rImg andrImg:(NSString*)rdImg
                   title:(NSString *)content;
//-(void)endRefresh;
- (void)beseBtnHidden;
-(void)buildNavBar;
- (void)bulidBtn;
- (void)beseCtrBtnClike;

@end
