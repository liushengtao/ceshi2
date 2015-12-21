//
//  AalistModel.h
//  you
//
//  Created by 优途 on 15-3-3.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AalistModel : NSObject
@property(nonatomic,copy)NSString*adlistID;
@property(nonatomic,copy)NSString*location;
@property(nonatomic,copy)NSString*linkURl;
@property(nonatomic,copy)NSString*state;
@property(nonatomic,copy)NSString*imageUrl;
@property(nonatomic,copy)NSString*orderNum;

+(AalistModel*)needmodelWithDic:(NSDictionary*)dic;

@end
