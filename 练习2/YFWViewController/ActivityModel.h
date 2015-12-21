//
//  ActivityModel.h
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

@property(nonatomic,copy)NSString*ID;
@property(nonatomic,copy)NSString*logoImg;
@property(nonatomic,copy)NSString*addtime;
@property(nonatomic,copy)NSString*version;
@property(nonatomic,copy)NSString*state;
@property(nonatomic,copy)NSString*ostype;
@property(nonatomic,copy)NSString*ordernum;
@property(nonatomic,copy)NSString*link;
@property(nonatomic,copy)NSString*name;
@property(nonatomic,copy)NSString*desc;



+(ActivityModel*)needmodelWithDic:(NSDictionary*)dic;




@end
