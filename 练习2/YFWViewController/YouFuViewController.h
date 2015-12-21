//
//  YouFuViewController.h
//  you
//
//  Created by 优途 on 15-3-9.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "BeseViewController.h"

@interface YouFuViewController : BeseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView        *_tableview;
}
@end
