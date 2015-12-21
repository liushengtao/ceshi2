//
//  AppDelegate.m
//  练习2
//
//  Created by youtu on 15/3/10.
//  Copyright (c) 2015年 youtu. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
//    [self openUrl];
    // unsigned long用lu来表示
//    NSLog(@"%d",NSNotFound);
    
    MainController *mainCtr = [[MainController alloc] init];
    mainCtr.youfuwuUserinfos=[NSDictionary dictionaryWithObjectsAndKeys:@"928612",@"youxinid",@"123456",@"youxinPassword",@"113.64964385",@"longitude",@"34.75661006",@"latitude",@"268",@"citycode", nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainCtr];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    return YES;
}

// 打开url
- (void)openUrl
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn setFrame:CGRectMake(100, 100, 100, 100)];
    [self.window addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick
{
    NSString *str = @"https://itunes.apple.com/cn/app/you-xin-zhi-jian/id906626284?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)zhishidian
{
    // 知识点总结
    /*
     compare 用来比较两个字符串，将接收到的对象和传递进来的字符串进行比较。返回一个NSComparisionResult的值来显示结果 -1升序 0等于 1降序
     
     */
}











@end
