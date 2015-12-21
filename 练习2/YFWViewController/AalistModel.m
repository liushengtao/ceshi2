//
//  AalistModel.m
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "AalistModel.h"

@implementation AalistModel


+(AalistModel*)needmodelWithDic:(NSDictionary*)dic
{
    AalistModel *alistModel = [[AalistModel alloc] init];
    alistModel.adlistID = [NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]];
    alistModel.location = [NSString stringWithFormat:@"%@",[dic objectForKey:@"location"]];
    alistModel.linkURl = [dic objectForKey:@"link"];
    alistModel.state   = [dic objectForKey:@"state"];
    alistModel.imageUrl = [dic objectForKey:@"image"];
    alistModel.orderNum = [dic objectForKey:@"ordernum"];
    
    return alistModel;
}
@end
