//
//  FirstModel.h
//  you
//
//  Created by 优途 on 15-3-2.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstModel : NSObject

@property(nonatomic,copy)NSString*title;
@property(nonatomic,copy)NSString*smallTitle;
@property(nonatomic,copy)NSString*imgUrl;
+(FirstModel*)needmodelWithDic:(NSDictionary*)dic;


@end
