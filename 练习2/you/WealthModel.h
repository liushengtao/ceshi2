//
//  WealthModel.h
//  you
//
//  Created by 优途 on 15-3-12.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WealthModel : NSObject

@property (nonatomic,strong) NSString  * totalbalance;
@property (nonatomic,strong) NSString  * balance;
@property (nonatomic,strong) NSString  * userlogo;
@property (nonatomic,strong) NSString  * score;
@property (nonatomic,strong) NSString  * realname;
@property (nonatomic,strong) NSString  * tipbalance;
@property (nonatomic,strong) NSString  * creditamount;
@property (nonatomic,strong) NSString  * tipamount;
@property (nonatomic,strong) NSString  * creditbalance;

+(WealthModel *)withDic:(NSDictionary *)dic;



@end
