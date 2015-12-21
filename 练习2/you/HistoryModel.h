//
//  HistoryModel.h
//  you
//
//  Created by 优途 on 15-3-12.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryModel : NSObject


@property (nonatomic,strong) NSString  * operatetype;
@property (nonatomic,strong) NSString  * operatetime;
@property (nonatomic,strong) NSString  * currentbalance;
@property (nonatomic,strong) NSString  * operateamount;

+ (HistoryModel *)modelWithDic:(NSDictionary*)dic;
@end
