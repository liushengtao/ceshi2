//
//  ZhiFuBaoController.m
//  you
//
//  Created by 优途 on 15-3-14.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "ZhiFuBaoController.h"
#import "TiXianView.h"

@interface ZhiFuBaoController ()<TiXianViewDelegate,UIAlertViewDelegate>
{
    NSMutableDictionary      *_fieldDic;
    
    UIScrollView* scroll;
}
@end

@implementation ZhiFuBaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    scroll=[[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scroll];
    scroll.contentSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+60);
    
    
    
    
    self.view.backgroundColor = UIColorFromRGB(0xe7e7e7);
    _fieldDic = [[NSMutableDictionary alloc] init];

    if ([_tixianSate isEqualToString:@"100"]) {//支付宝
        TiXianView *zhifuVie = [[TiXianView alloc] initWithFrame:CGRectMake(0,  NAVBAR_HEIGHTS+ 30,screenWidth, 280) and:zhifubaoSate];
        zhifuVie.tiDelegate =self;
        zhifuVie.tag = 11;
        [scroll addSubview:zhifuVie];
        //            [self.view insertSubview:zhifuVie atIndex:1];
        [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:@"支付宝"];

        [self.view bringSubviewToFront:self.navBar];

    }else{
        TiXianView *yinHVie = [[TiXianView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHTS +30,screenWidth, 330) and:yinHangState];
        yinHVie.tiDelegate = self;
        yinHVie.tag = 12;
        [scroll addSubview:yinHVie];
        [self.view bringSubviewToFront:self.navBar];
        [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:@"银行卡"];


    }
    

    
}



- (void)begenField:(UITextField *)field and:(UIView *)view
{
    
//    CGPoint point = view.origin;
    if (field.tag >= 22) {
        
        [UIView animateWithDuration:0.5 animations:^{
            scroll.contentOffset=CGPointMake(0, 60);
        }];
        
    }
//    else if (view.origin.y<44)
//    {
//        [UIView beginAnimations:nil context:nil];
//        //        view.frame.origin.y = ;
//        [UIView setAnimationDuration:0.5];
//        view.frame = CGRectMake(0, point.y+30, screenWidth ,view.height);
//        [UIView commitAnimations];
//        
//    }
}

- (void)keyDone:(UITextField *)field and:(UIView *)views
{
    if (views.tag == 11) {
        NSLog(@"fdsagd");
        views.frame = CGRectMake(0,  NAVBAR_HEIGHTS+ 30,screenWidth , 280);
        
    }else{
        views.frame =CGRectMake(0, NAVBAR_HEIGHTS +30,screenWidth , 330);
    }
}

- (void)endField:(UITextField *)field
{
    [_fieldDic setObject:field.text forKey:[[NSNumber numberWithInteger:field.tag] stringValue]];
}

- (void)tiXianViewBtnEventTouch:(UIButton *)btnss and:(tiXianState)state and:(TiXianView *)view
{
    if (btnss.tag == 70) {//确定
        if (state == zhifubaoSate) {
            if ([view.fourFiled.text length]!=0) {
                [view.fourFiled resignFirstResponder];
            }
            if ([view.firstFiled.text length] ==0) {
                ALERT_MSG(nil, @"请输入支付宝账号");
            }else if ([view.secendFiled.text length] ==0){
                ALERT_MSG(nil, @"请输入真实姓名");
            }else if ([view.threeFiled.text length] == 0){
                ALERT_MSG(nil, @"请输入提现金额");
            }else if ([view.fourFiled.text length] == 0){
                ALERT_MSG(nil, @"请输入提现密码");
            }else{
                [self requestTiXian:@"1"];
            }
        }else{
            if ([view.fiveFiled.text length]!=0) {
                [view.fiveFiled resignFirstResponder];
            }
            if ([view.firstFiled.text length] ==0) {
                ALERT_MSG(nil, @"请输入收款方户名");
            }else if ([view.secendFiled.text length] ==0){
                ALERT_MSG(nil, @"请输入开户行信息");
            }else if ([view.threeFiled.text length] == 0){
                ALERT_MSG(nil, @"请输入收款方账号");
            }else if ([view.fourFiled.text length] == 0){
                ALERT_MSG(nil, @"请输入提现金额");
            }else if ([view.fiveFiled.text length] == 0){
                ALERT_MSG(nil, @"请输入提现密码");
            }else{
                [self requestTiXian:@"2"];
            }

        }
        
    }else{//取消
        [_fieldDic removeAllObjects];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)alertViewDelayMothod:(UIAlertView *)alet
{
    [alet dismissWithClickedButtonIndex:1 animated:YES];
}
- (void)requestTiXian:(NSString *)typeStr
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"申请提现至支付宝账户成功",@"3",@"申请提现至银行账户成功",@"4",@"余额不足",@"9007",@"密码或账号错误",@"9011", nil];
    //有信号928612
    NSMutableDictionary *needDic = [[NSMutableDictionary alloc] init];
    if ([typeStr isEqualToString:@"1"]) {
        [needDic setObject:[_fieldDic objectForKey:@"20"] forKey:@"alipay_account"];
        [needDic setObject:[_fieldDic objectForKey:@"21"] forKey:@"realname"];
        [needDic setObject:[_fieldDic objectForKey:@"22"] forKey:@"money"];
        [needDic setObject:[_fieldDic objectForKey:@"23"] forKey:@"password"];
    }else{
        [needDic setObject:[_fieldDic objectForKey:@"20"] forKey:@"realname"];
        [needDic setObject:[_fieldDic objectForKey:@"21"] forKey:@"bank_branch"];
        [needDic setObject:[_fieldDic objectForKey:@"22"] forKey:@"bank_account"];
        [needDic setObject:[_fieldDic objectForKey:@"23"] forKey:@"money"];
        [needDic setObject:[_fieldDic objectForKey:@"24"] forKey:@"password"];
        
        
    }
    [needDic setObject:typeStr forKey:@"type"];
    [needDic setObject:[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"youxinid"] forKey:@"youxinid"];
    
    [needDic setObject:[_fieldDic objectForKey:@"21"] forKey:@"realname"];
    [needDic setObject:[_fieldDic objectForKey:@"21"] forKey:@"realname"];
    
    [DataSevice requestWithURL:@"applytocash" params:needDic httpMethod:@"GET" globalTimelinePostsWithBlock:^(NSDictionary*result,NSError*error){
        NSLog(@"error   %@   AND   %@",error ,result  );
        if (!error) {
            NSString *td = [[NSString alloc] initWithData:(NSData*)result encoding:NSUTF8StringEncoding];
            NSLog(@"%@",td);
            NSDictionary *infoDic = [self  getbackdata:td];
            NSString *infoStr = [dic objectForKey:[infoDic objectForKey:@"info"]];
            ALERT_MSG(nil, infoStr);
            
        }else{
            NSLog(@"失败");
        }
    }];
    
    
}

-(NSDictionary*)getbackdata:(NSString*)result
{
    NSData*datas = [result dataUsingEncoding: NSUTF8StringEncoding];
    JSONDecoder*jd=[[JSONDecoder alloc]init];
    NSDictionary*dic=[jd objectWithData:datas];
    return dic;
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
