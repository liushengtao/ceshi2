//
//  chongZhiViewcontroller.m
//  you
//
//  Created by BLapple on 15-3-14.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "chongZhiViewcontroller.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

#import "APAuthV2Info.h"
@interface chongZhiViewcontroller ()<UIAlertViewDelegate>

@end

@implementation chongZhiViewcontroller
@synthesize moneystirng;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = UIColorFromRGB(0xe7e7e7);
    [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:@"充值"];
    
    [self addViews];
}
-(void)addViews
{
     scroll=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    scroll.contentSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+60);
    scroll.backgroundColor=UIColorFromRGB(0xe7e7e7);
    [self.view bringSubviewToFront:self.navBar];
    
    
    zhanghuyue=[[UILabel alloc] initWithFrame:CGRectMake(20, 28, 280, 33)];
    zhanghuyue.font=[UIFont systemFontOfSize:26.0];
    zhanghuyue.text=moneystirng;
    [scroll addSubview:zhanghuyue];
    UILabel* zhanghuyuetitle=[[UILabel alloc] initWithFrame:CGRectMake(20, 8, 69, 13)];
    UIView* titleback=[[UIView alloc] initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 70)];
    titleback.backgroundColor=[UIColor whiteColor];
    
    zhanghuyuetitle.text=@"当前余额";
    zhanghuyuetitle.font=[UIFont systemFontOfSize:12.0];
    [scroll addSubview:titleback];
    [titleback addSubview:zhanghuyuetitle];
    [titleback addSubview:zhanghuyue];
    
    
    
    
    UIView* alert=[[UIView alloc] init];
    UILabel* bigtitle=[[UILabel alloc] init];
    UILabel* smalltitle=[[UILabel alloc] init];
    UIButton* quxiaobutton=[UIButton buttonWithType:UIButtonTypeContactAdd];
    quxiaobutton.backgroundColor=[UIColor orangeColor];
//    UIButtonTypeDetailDisclosure,
//    UIButtonTypeInfoLight,
//    UIButtonTypeInfoDark,
//    UIButtonTypeContactAdd
   
    
    UIView* tabbackview=[[UIView alloc] init];
    UILabel* tablable=[[UILabel alloc] init];
    jineField=[[UITextField alloc] init];
    UIButton* querenbutton=[[UIButton alloc] init];
    
    
    CGRect alertlocation=CGRectMake(20, 165, [UIScreen mainScreen].bounds.size.width-40, 45);
    
    CGRect bigtitlelocation=CGRectMake(8, 8, 30, 29);
    CGRect  smalltitlelocation=CGRectMake(31, 13, 74, 21);
    CGRect quxiaobuttonlocation=CGRectMake(alertlocation.size.width-30, 13,22, 22);
    
    CGRect tabbackviewlocation=CGRectMake(20, 223, [UIScreen mainScreen].bounds.size.width-40, 45);
    CGRect tablablelocation=CGRectMake(8, 12, 76, 21);
    CGRect jineFieldlocation=CGRectMake(92, 8, 180, 30);
    CGRect qurenbuttonlocation=CGRectMake(20, 285, [UIScreen mainScreen].bounds.size.width-40, 35);
    
    bigtitle.text=@"付";
    smalltitle.text=@"资金帐户";
    tablable.text=@"输入金额";
    [querenbutton setTitle:@"确认支付" forState:UIControlStateNormal];
    
    
    
    alert.layer.cornerRadius=6;
    alert.layer.masksToBounds=YES;
    alert.backgroundColor=[UIColor whiteColor];
    alert.layer.cornerRadius=6;
    alert.layer.masksToBounds=YES;
    
    bigtitle.textColor=[UIColor orangeColor];
    bigtitle.font=[UIFont boldSystemFontOfSize:22.0];
    tabbackview.backgroundColor=[UIColor whiteColor];
    tabbackview.layer.cornerRadius=6;
    tabbackview.layer.masksToBounds=YES;
    
//    jineField.borderStyle=UITextBorderStyleBezel;
    jineField.keyboardType=UIKeyboardTypeNumbersAndPunctuation;
    jineField.returnKeyType=UIReturnKeyDone;
    jineField.delegate=self;
    jineField.placeholder=@"请输入金额";
    
    querenbutton.layer.cornerRadius=6;
    querenbutton.layer.masksToBounds=YES;
    [querenbutton setBackgroundColor:[UIColor orangeColor]];
    
    
    
    alert.frame=alertlocation;
    bigtitle.frame=bigtitlelocation;
    smalltitle.frame=smalltitlelocation;
    quxiaobutton.frame=quxiaobuttonlocation;
    tabbackview.frame=tabbackviewlocation;
    tablable.frame=tablablelocation;
    jineField.frame=jineFieldlocation;
    querenbutton.frame=qurenbuttonlocation;
    
    
    [scroll addSubview:alert];
    [alert addSubview:bigtitle];
    [alert addSubview:smalltitle];
    [alert addSubview:quxiaobutton];
    [scroll addSubview:tabbackview];
    [tabbackview addSubview:tablable];
    [tabbackview addSubview:jineField];
    [scroll addSubview:querenbutton];

    quxiaobutton.transform=CGAffineTransformMakeRotation(M_PI_4);
    quxiaobutton.layer.cornerRadius=11;
    quxiaobutton.layer.masksToBounds=YES;
    
    [quxiaobutton addTarget:self action:@selector(quxiao) forControlEvents:UIControlEventTouchUpInside];
    [querenbutton addTarget:self action:@selector(qurenfukuan) forControlEvents:UIControlEventTouchUpInside];
    
    
}


-(void)qurenfukuan
{
    [jineField resignFirstResponder];
    float moneyCount=[jineField.text  floatValue];
    if(moneyCount<=0)
    {
         ALERT_MSG(nil, @"输入数值有误");
        return;
    }
    
    [self fukuan:moneyCount];
    
    

}
- (void)alertViewDelayMothod:(UIAlertView *)alet
{
    [alet dismissWithClickedButtonIndex:1 animated:YES];
}

-(void)fukuan:(float)moneycount
{
    float price=moneycount;
    NSString *partner =@"2088611010355152";
    NSString *seller = @"youxinzhijian@163.com";
    NSString *privateKey = @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAKlfzA3x3RWOXp2Gt6PaRJ9UsMdBMsJ5/zMkKgh6re+/+q0wrlDqfRMzaAVinWS6eWkxg+MRGWSZyZKtGF85LJyKMfDCp8F2Ls2VMT4fwlgB6MrX+wJGttXmhUJeHCA/H3iWLy67I7wTvJLO4e3P34mo7MhXVD5bi0XtPzxrgt0vAgMBAAECgYEAo1hEDt7G/NcE4J7f1CHYNGEU69UxAuVs/QFPmEXYIXPgac6dDmRWo4HcO/VTHaXJGW4rZ31CJAc8ozxUWOFm5y9j3U5wzSs2Z1BQbn5ro/RxSliceZgcCX21bsMjwC+eajLNU4ytFNbDQn5gO7YJYovg2f6lqQzo+Tp47C8iM0ECQQDYKbWdtHYQDaACKCKT+t6Z7l3cIttnoR8HZRhwUDg+UKWjbCxaiT77isUrrkhYFo2LqnVgzT+Lg+dGPI1V2vy5AkEAyJan2NwMBMKhyv8h3ocg4XwGxucQgs+F3wQ/JopK+w/hxIpwt7uMvuyBHHV/PUbqsUtwHI28hZdDSlAdygzFJwJBANYmpD4EDb8jsHTSjEcsj6HSi/xOMC1/az0pQ8fpQX9C6IZ54YskU1hjB6mZtSRH250Vl8n6LU0rtVFZJfB7zkkCQBNjtL/arXK8WaVkuiJnj38cXQ9XAJqUcs1W/L+9+HeCVoGIHFM2VumRtP1KQk1rEH6o2yJ3dPS45XFGg0qnp1sCQF0RLe8YvpuueiyLc+JnyEejpeianjxqQISnog7RTHk5ZplAfLGJPacIOYUE0PWNXBkfRqaGjC4Hu51I39Zuqgc=";
    
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家自行制定）
    order.productName = @"1"; //商品标题
    order.productDescription = @"充值"; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",price]; //商品价格
    order.notifyURL =  @"http://116.255.209.38:8080/YouServiceServer/"; //回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
            
            if(([[resultDic objectForKey:@"resultStatus"] intValue]==9000)&&([[resultDic objectForKey:@"result"]containsString:@"success=\"true\""])&&[[resultDic objectForKey:@"result"] containsString:@"sign="])
            {
                NSLog(@"chongzhi success");
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"YoutuCaifuChongzhiChengGong" object:nil];
                    [self quxiao];
                });
            }
        }];
    }
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
[UIView animateWithDuration:0.5 animations:^{
    scroll.contentOffset=CGPointMake(0, 60);
}];

    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self qurenfukuan];
    return YES;
}

-(void)quxiao
{
    [self exist];
}

-(void)exist
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -
#pragma mark   ==============产生随机订单号==============


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

@end
