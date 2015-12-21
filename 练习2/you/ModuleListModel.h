//
//  ModuleListModel.h
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleListModel : NSObject

@property(nonatomic,copy)NSString*module_comfig;
@property(nonatomic,copy)NSString*logoImg;
@property(nonatomic,copy)NSString*enabled;
@property(nonatomic,copy)NSString*module_version;
@property(nonatomic,copy)NSString*module_id;
@property(nonatomic,copy)NSString*ostype;
@property(nonatomic,copy)NSString*download_url;
@property(nonatomic,copy)NSString*ordernum;
@property(nonatomic,copy)NSString*link;
@property(nonatomic,copy)NSString*module_name;
@property(nonatomic,copy)NSString*module_desc;
@property (nonatomic,assign) int     numbers;


+(ModuleListModel*)needmodelWithDic:(NSDictionary*)dic;


@end
