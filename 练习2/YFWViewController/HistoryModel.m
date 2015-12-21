//
//  HistoryModel.m
//  you
//
//  Created by 优途 on 15-3-12.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "HistoryModel.h"

@implementation HistoryModel
+ (HistoryModel *)modelWithDic:(NSDictionary*)dic
{
    HistoryModel *model = [[HistoryModel alloc] init];
    model.operatetype = [NSString stringWithFormat:@"%@",[dic objectForKey:@"operatetype"]];
    model.operatetime = [NSString stringWithFormat:@"%@",[dic objectForKey:@"operatetime"]];

    model.currentbalance = [NSString stringWithFormat:@"%@",[dic objectForKey:@"currentbalance"]];
    model.operateamount = [dic objectForKey:@"operateamount"];
    

    model.operateamount=[NSString stringWithFormat:@"%0.2f",[[dic objectForKey:@"operateamount"] doubleValue]];
    
    
    
    return model;
}
@end
