//
//  BeseViewController.m
//  TaoChe
//
//  Created by 优途 on 14-11-8.
//  Copyright (c) 2014年 YuanDaYouTu. All rights reserved.
//

#import "BeseViewController.h"

@interface BeseViewController ()

@end

@implementation BeseViewController
@synthesize navBar;
@synthesize backgrundView;
@synthesize beseBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=BLACK_COLOR;
    self.view.userInteractionEnabled=YES;
    [self buildNavBar];
//    [self bulidBtn];
}
- (void)bulidBtn
{
    if (!beseBtn) {
        beseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, screenHeight*0.3, screenWidth, screenHeight*0.4)];
        //    btn.backgroundColor = [UIColor redColor];
        [beseBtn setImage:[UIImage imageNamed:@"fail"] forState:UIControlStateNormal];
        [beseBtn addTarget:self action:@selector(jiazaiRuquest) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:beseBtn];

    }
}
- (void)beseBtnHidden{
    if (beseBtn!=nil) {
        [beseBtn removeFromSuperview];
    }
}
- (void)jiazaiRuquest
{
    [self beseCtrBtnClike];
}
- (void)beseCtrBtnClike
{
//    [self jiazaiRuquest];
}
- (void)buildNavBar
{
    
    if (navBar==nil) {
        
        if (IOS7) {
            navBar = [[NavigationView alloc] initWithFrame:
                      CGRectMake(0,0,screenWidth,64)];
        }
        else
        {
            navBar = [[NavigationView alloc] initWithFrame:
                      CGRectMake(0,0,screenWidth,HEADER_HEIGHTS)];
        }
        navBar.tag=1111;
        navBar.delegate = self;
        navBar.backgroundColor= UIColorFromRGB(0xe4393c);
        //        navBar.image=[UIImage imageNamed:@"tops.png"];
    }
    [self.view addSubview:navBar];
    
}

//设置导航按钮图案
- (void)setNavBarleftBtn:(NSString *)lImg andlDimg:(NSString*)ldimag
                rightBtn:(NSString *)rImg andrImg:(NSString*)rdImg
                   title:(NSString *)content
{
    [navBar setleftBtn:lImg andLD:ldimag rightBtn:rImg andrDImg:rdImg setTitle:content];
}

#pragma mark -- navBar代理
- (void)leftBtnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightBtnAction
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
