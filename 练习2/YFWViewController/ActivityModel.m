//
//  ActivityModel.m
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

+(ActivityModel*)needmodelWithDic:(NSDictionary*)dic
{
    ActivityModel *model  = [[ActivityModel alloc] init];
    model.ID = [dic objectForKey:@"id"];
    model.logoImg      = [dic objectForKey:@"logo"];
    model.addtime      = [dic objectForKey:@"addtime"];
    model.desc = [dic objectForKey:@"desc"];
    model.name     = [dic objectForKey:@"name"];
    model.ostype        = [dic objectForKey:@"ostype"];
    model.state = [dic objectForKey:@"state"];
    model.ordernum      = [dic objectForKey:@"ordernum"];
    model.link          = [dic objectForKey:@"link"];
    model.version   = [dic objectForKey:@"version"];
    return model;
    
}





































@end
