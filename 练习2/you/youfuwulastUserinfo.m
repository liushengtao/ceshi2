//
//  youfuwulastUserinfo.m
//  you
//
//  Created by BLapple on 15-3-16.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "youfuwulastUserinfo.h"

@implementation youfuwulastUserinfo

+(void)setLastuserinfo:(NSDictionary*)userinfo
{
if(userinfo !=nil && [userinfo count]>0)
{
    [[NSUserDefaults standardUserDefaults] setObject:userinfo forKey:@"youfuwulastuserinfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

}

+(NSDictionary*)Lastuserinfo
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"youfuwulastuserinfo"];
}


@end
