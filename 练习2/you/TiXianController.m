//
//  TiXianController.m
//  you
//
//  Created by 优途 on 15-3-13.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "TiXianController.h"
#import "ZhiFuBaoController.h"

@interface TiXianController ()
{
    NSMutableDictionary      *_fieldDic;
    UIView                *_backView;
    
    
}

@end

@implementation TiXianController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:@"提现"];
    
    self.view.backgroundColor = UIColorFromRGB(0xe7e7e7);
    
    _fieldDic = [[NSMutableDictionary alloc] init];
    [self addBackView];
}
- (void)addBackView
{
    NSArray *btnTitl = @[@"支付宝",@"银行卡"];
    
    UIView * aview = [[UIView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHTS +20, screenWidth, 55)];
    aview.backgroundColor = UIColorFromRGB(0xffffff);
    [self.view addSubview:aview];
    
    UILabel *titLav = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 100, 20)];
    titLav.backgroundColor = [UIColor clearColor];
    titLav.text = @"当前余额";
    titLav.font = [UIFont systemFontOfSize:14];
    [aview addSubview:titLav];
    
    UILabel *alab = [[UILabel alloc] initWithFrame:CGRectMake(20, titLav.bottom, 100, 25)];
    alab.backgroundColor = [UIColor clearColor];
    alab.textColor = UIColorFromRGB(0xff6633);
    alab.text = _moneyStr;
    alab.font = [UIFont systemFontOfSize:20];
    [aview addSubview:alab];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, aview.bottom +10, 150, 20)];
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.text = @"请选择提现方式:";
    titleLab.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:titleLab];
    int   btnHignt = 40;
    for (int i =0; i<2; i++) {
        UIButton *btns = [[UIButton alloc] initWithFrame:CGRectMake(20, titleLab.bottom +10 +i*(btnHignt -1), self.view.width -40, btnHignt)];
        btns.tag = 100 +i;
        [btns setTitle:[btnTitl objectAtIndex:i] forState:UIControlStateNormal];
        [btns addTarget:self action:@selector(btnsEventTouch:) forControlEvents:UIControlEventTouchUpInside];
        btns.titleLabel.font = [UIFont systemFontOfSize:14];
        [btns setTitleColor:UIColorFromRGB(0x848484) forState:UIControlStateNormal];
        btns.backgroundColor = [UIColor whiteColor];
        btns.layer.borderWidth = 1;
        btns.layer.borderColor = UIColorFromRGB(0x848484).CGColor;
        [self.view addSubview:btns];
    }

}
- (void)btnsEventTouch:(UIButton *)bt
{
    ZhiFuBaoController *zhifuCtr = [[ZhiFuBaoController alloc] init];
    zhifuCtr.tixianSate = [NSString stringWithFormat:@"%ld",bt.tag];
    [self.navigationController pushViewController:zhifuCtr animated:YES];
}

- (void)requestTiXian:(NSString *)typeStr
{
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

        }else{
            NSLog(@"失败");
        }
    }];
    
    
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
