//
//  MainController.h
//  you
//
//  Created by 优途 on 15-2-28.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CusstomScrollView.h"
#import "AdlistScrollView.h"
#import "youfuwulastUserinfo.h"


@interface MainController : BeseViewController<CusstomScrollViewDatasource,CusstomScrollViewDelegate,AdlistScrollViewDatasource,AdlistScrollViewDelegate>
{
    
}
@property (strong, nonatomic) CusstomScrollView *csView;
@property (strong, nonatomic) AdlistScrollView *adlistView;



@property(strong,nonatomic)NSDictionary*youfuwuUserinfos;  //郑州接口(用户数据，默认保存最新数据)
//key:                      类型
//youxinid                  string
//youxinPassword            string
//longitude                 string
//latitude                  string
//citycode                  string

@end
