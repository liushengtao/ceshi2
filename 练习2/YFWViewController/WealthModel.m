//
//  WealthModel.m
//  you
//
//  Created by 优途 on 15-3-12.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "WealthModel.h"



@implementation WealthModel

+(WealthModel *)withDic:(NSDictionary *)dic
{
    WealthModel *mode = [[WealthModel alloc] init];
    mode.totalbalance = [dic objectForKey:@"totalbalance"];
    mode.balance     = [dic objectForKey:@"balance"];
    mode.userlogo     = [dic objectForKey:@"userlogo"];
    mode.creditbalance     = [dic objectForKey:@"creditbalance"];
    mode.score     = [dic objectForKey:@"score"];
    mode.tipamount     = [dic objectForKey:@"tipamount"];
    mode.realname     = [dic objectForKey:@"realname"];
    mode.tipbalance     = [dic objectForKey:@"tipbalance"];
    mode.creditamount  = [dic objectForKey:@"creditamount"];
    return mode;

}


@end
