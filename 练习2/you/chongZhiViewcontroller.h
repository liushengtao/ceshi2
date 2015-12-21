//
//  chongZhiViewcontroller.h
//  you
//
//  Created by BLapple on 15-3-14.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "BeseViewController.h"

@interface chongZhiViewcontroller : BeseViewController<UITextFieldDelegate>
{
    UITextField* jineField;
    UIScrollView* scroll;
    UILabel* zhanghuyue;
}

@property(strong)NSString* moneystirng;
@end
