//
//  ModuleListModel.m
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "ModuleListModel.h"

@implementation ModuleListModel

+(ModuleListModel*)needmodelWithDic:(NSDictionary*)dic
{
    ModuleListModel *model = [[ModuleListModel alloc] init];
    model.module_comfig = [dic objectForKey:@"module_config"];
    model.logoImg      = [dic objectForKey:@"logo"];
    model.enabled      = [dic objectForKey:@"enabled"];
    model.module_version = [dic objectForKey:@"module_version"];
    model.module_id     = [dic objectForKey:@"module_id"];
    model.ostype        = [dic objectForKey:@"ostype"];
    model.download_url = [dic objectForKey:@"download_url"];
    model.ordernum      = [dic objectForKey:@"ordernum"];
    model.link          = [dic objectForKey:@"link"];
    model.module_name   = [dic objectForKey:@"module_name"];
    model.module_desc   = [dic objectForKey:@"module_desc"];
    model.numbers       = 1;
    return model;
}
@end
