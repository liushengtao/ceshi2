//
//  MainController.m
//  you
//
//  Created by 优途 on 15-2-28.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "MainController.h"
#import "FisrtView.h"
#import "JSONKit.h"
#import "AalistModel.h"
#import "ModuleListModel.h"
#import "ActivityModel.h"
#import "ActivityView.h"
#import "WebController.h"
#import "HistoryController.h"
#import "MyWealthController.h"

@interface MainController ()<YTFistViewDelegate,ActivityDelegate,UIWebViewDelegate,UIAlertViewDelegate>
{
    
    int                     _heights;
    UIScrollView             *_backScroll;
    UIScrollView             *_smallScroll;
    FisrtView *fisrtview;
    
    NSMutableArray          *_alistArray1;//上广告位
    NSMutableArray          *_alistArray2;//下广告位
    NSMutableArray          *_moduleArr;//活动
    NSMutableArray          *_activityArr;//活动2
    UIImageView              *imageView;
    NSTimer                  *_timer;
    NSArray                 *_compareArr;
    NSString *filename;

    NSMutableArray         *_moduArr;
}

@end

@implementation MainController




-(NSDictionary*)youfuwuUserinfos
{
    return [youfuwulastUserinfo Lastuserinfo];
}
-(void)setYoufuwuUserinfos:(NSMutableDictionary *)ayoufuwuUserinfos
{
    [youfuwulastUserinfo setLastuserinfo:ayoufuwuUserinfos];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBarleftBtn:@"back@2x.png" andlDimg:nil rightBtn:nil andrImg:nil title:@"优服务"];
    
    _alistArray1 = [[NSMutableArray alloc] init];

    _moduleArr = [[NSMutableArray alloc] init];
    _activityArr = [[NSMutableArray alloc] init];

    _moduArr  = [[NSMutableArray alloc] init];
    
    
    _backScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHTS, self.view.width, self.view.height)];
    
    _backScroll.backgroundColor = UIColorFromRGB(0xe7e7e7);
    [self.view addSubview:_backScroll];
    
    fisrtview = [[FisrtView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50) and:OneState];
    fisrtview.pubDelegate = self;
    [_backScroll addSubview:fisrtview];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pageChange) userInfo:nil repeats:YES];

    [self requestGetindexinfo];
}

#pragma mark - 轮播
//页面将要进入前台，开启定时器
-(void)viewWillAppear:(BOOL)animated
{
    [_timer setFireDate:[NSDate distantPast]];
}

//页面消失，进入后台不显示该页面，关闭定时器
-(void)viewDidDisappear:(BOOL)animated
{
    [_timer setFireDate:[NSDate distantFuture]];
}

//自动循环展示
- (void)pageChange
{
    [_adlistView scrollTimer:0];
}
- (void)dealloc
{
    _timer = nil;
}

- (void)requestGetindexinfo
{
    NSMutableDictionary *needDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"ostype", nil];
       
    [DataSevice requestWithURL:@"getindexinfo" params:needDic httpMethod:@"GET" globalTimelinePostsWithBlock:^(NSDictionary*result,NSError*error){
        NSLog(@"error   %@   AND   %@",error ,result  );
        if (!error) {
            _alistArray2 = [[NSMutableArray alloc] init];

            NSString *td = [[NSString alloc] initWithData:(NSData*)result encoding:NSUTF8StringEncoding];
            NSLog(@"%@",td);
            NSDictionary *dic = [self  getbackdata:td];
            
            if ([[dic objectForKey:@"state"] intValue] ==1) {
                NSDictionary *listDic = [dic objectForKey:@"resultJson"];
                NSArray *listArr = [listDic objectForKey:@"adlist1"];//上广告位
                NSArray *moduleArr = [listDic objectForKey:@"modulelist"];//活动
                NSArray *listArr2 = [listDic objectForKey:@"adlist2"];
                NSArray *actiArr = [listDic objectForKey:@"activitylist"];

                
                for (NSDictionary *disc in listArr) {
                    AalistModel *alistmodel = [AalistModel needmodelWithDic:disc];
                    [_alistArray1 addObject:alistmodel];
                    NSLog(@"%@",alistmodel.state);
                }
                for (NSDictionary *disc in moduleArr) {
                    ModuleListModel *moduleModel = [ModuleListModel needmodelWithDic:disc];
                    [_moduleArr addObject:moduleModel];
                    NSLog(@"%@",moduleModel.ordernum);
                }
                for (NSDictionary *disc in listArr2) {
                    AalistModel *model2 = [AalistModel needmodelWithDic:disc];
                    [_alistArray2 addObject:model2];
                    NSLog(@"%@",model2.orderNum);
                }
                for (NSDictionary *disc in actiArr) {
                    ActivityModel *actiModel = [ActivityModel needmodelWithDic:disc];
                    [_activityArr addObject:actiModel];
                    NSLog(@"%@",actiModel.ordernum);
                }

                [self layoutsubView];
                
            }
            else
            {
                NSLog(@"链接失败，请重新链接");
            }
            
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

- (void)layoutsubView
{//广告图
    _csView = [[CusstomScrollView alloc] initWithFrame:CGRectMake(0, fisrtview.bottom, self.view.width, 50)];
    _csView.style=CusstomScrollViewStyleNomal;
    [_csView updateSytles];
    _csView.delegate = self;
    _csView.datasource = self;
    [_backScroll addSubview:_csView];
    [_csView reloadData];
    [_csView scrollTimer:0];
    
    
    
    [self laodViews];
    
    int alisView ;
    if ([_alistArray2 count] ==0) {
        alisView = _heights;
    }else{
        
        _adlistView = [[AdlistScrollView alloc] initWithFrame:CGRectMake(0,_heights +5, self.view.width, 50) and:[_alistArray2 count]];
        _adlistView.delegate = self;
        _adlistView.datasource = self;
        [_adlistView updateSytles];
        [_backScroll addSubview:_adlistView];
        [_adlistView reloadData];
        alisView = _adlistView.bottom;
    }    
    
    _smallScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, alisView+5, self.view.width, self.view.height - _adlistView.bottom -5)];

    _smallScroll.backgroundColor = UIColorFromRGB(0xffffff);
    [_backScroll addSubview:_smallScroll];
    
    [self laodviewss];

}

- (void)laodviewss
{
    //下面的活动
    int hang=0;
    int tag=0;
    int cellwidth= (screenWidth-2)/3;
    for (int i=0; i<[_moduleArr count]; i++) {
        hang= i/3;
        tag =i%3;
        CGRect cellframe=CGRectMake(0, 0, cellwidth, 80);
        switch (tag) {
            case 0:
                cellframe.origin.x=0;
                cellframe.origin.y=80*hang-hang;
                break;
            case 1:
                cellframe.origin.x=cellwidth-1;
                cellframe.origin.y=80*hang-hang;
                cellframe.size.width=cellwidth+4;
                break;
            case 2:
                cellframe.origin.x=cellwidth*2+2;
                cellframe.origin.y=80*hang-hang;
                break;
                
            default:
                break;
        }
        ModuleListModel *model = [_moduleArr objectAtIndex:i];
        ActivityView *btnview = [[ActivityView alloc] initWithFrame:cellframe];
        btnview.Delegae = self;
        btnview.layer.borderColor = UIColorFromRGB(0xe7e7e7).CGColor;
        btnview.layer.borderWidth = 1;
        [btnview showActivityViewInfo:model];
        btnview.rightBtn.tag = i +30;
        [_smallScroll addSubview:btnview];
    }
    _backScroll.contentSize = CGSizeMake(self.view.width, _smallScroll.bottom);

}

- (void)laodViews
{//活动2

    for (int i =0; i<[_activityArr count]; i++) {
        int x = i%2 * (self.view.width/2);
        int y = i/2 * (50 + 1) +_csView.bottom +5;

        ActivityModel *model = [_activityArr objectAtIndex:i];
        FisrtView *huodongVi = [[FisrtView alloc] initWithFrame:CGRectMake(x, y, self.view.width/2, 50) and:TwoState];
        NSString *urlstr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,model.logoImg];
        [huodongVi.rightImg setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:@""]];
        
        huodongVi.pubDelegate = self;
        huodongVi.leftBtn.tag = i +20;
        huodongVi.leftLab.text = model.name;
        huodongVi.leftlab1.text = model.desc;
        [_backScroll addSubview:huodongVi];
    }
    if ([_activityArr count] == 0) {
        _heights = _csView.bottom +5;
    }else{
        _heights = ([_activityArr count] -1)/2*(51)+50 +_csView.bottom +5;
    }


}
//btnView点击事件
- (void)rightBtnEvet:(UIButton *)btn
{
    if (btn.tag ==10) {
        NSLog(@" 财富   ");
        HistoryController *histore = [[HistoryController alloc] init];
        [self.navigationController pushViewController:histore animated:YES];
    }else{
        ModuleListModel *model = [_moduleArr objectAtIndex:btn.tag -30];
        model.numbers +=1;        

        if ([model.module_name isEqualToString:@"敬请期待"]) {
            ALERT_MSG(@"温馨提示", @"新活动筹备中，敬请期待！");
        }else{
            NSString *urlStr;
            if ([model.module_name isEqualToString:@"我要吃饭"]) {
                urlStr = [NSString stringWithFormat:@"%@?youxinid=%@&citycode=%@&longitude=%@&latitude=%@&userid=%@",model.link,[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"youxinid"],[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"citycode"],[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"longitude"],[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"latitude"],[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"youxinid"]];
            }else{
                urlStr = [NSString stringWithFormat:@"%@",model.link];
            }
            WebController *webCtr = [[WebController alloc] init];
            webCtr.urlStr = urlStr;
            webCtr.titleStr = model.module_name;
            [self.navigationController pushViewController:webCtr animated:YES];
        }

    }
}

- (void)alertViewDelayMothod:(UIAlertView *)alert
{
    [alert dismissWithClickedButtonIndex:1 animated:YES];
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始加载");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"完成加载");
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"开始加载%@",error);
    
}



- (void)fisrtViewBtnEventTouch:(UIButton *)btn{
    if (btn.tag ==11) {
        NSLog(@"  账单   ");
        MyWealthController *wealthCth = [[MyWealthController alloc] init];
        [self.navigationController pushViewController:wealthCth animated:YES];
    }else{
        NSString  *urlStrs;
        ActivityModel *model = [_activityArr objectAtIndex:btn.tag -20];
        if ([model.name isEqualToString:@"敬请期待"]) {
            ALERT_MSG(@"温馨提示", @"新活动筹备中，敬请期待！");
        }else{
            if ([model.name isEqualToString:@"兄弟加油"]) {
                urlStrs = [NSString stringWithFormat:@"%@",model.link];
            }else{
                urlStrs = [NSString stringWithFormat:@"%@?youxinid=%@",model.link,[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"youxinid"]];
                
            }
            WebController *webCtr = [[WebController alloc] init];
            webCtr.urlStr = urlStrs;
            webCtr.titleStr = model.name;
            [self.navigationController pushViewController:webCtr animated:YES];

        }
    }
}
- (void)relaod
{
    [_csView reloadData];
    [_csView scrollTimer:0];
}
- (NSInteger)numberOfPages
{
    return [_alistArray1 count];
}
- (UIView *)pageAtIndex:(NSInteger)index
{
    
    AalistModel *model = [_alistArray1 objectAtIndex:index];
    imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _csView.width, _csView.height)];

    imageView.contentMode =  UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds  = YES;
    NSString*urlstr;
    if ([model.imageUrl rangeOfString:@"http"].location != NSNotFound) {
        [imageView setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@""]];
    }else{
         urlstr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,model.imageUrl];
        [imageView setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:@""]];
    }
    
    return imageView;
    
}
- (void)didClickPage:(CusstomScrollView *)csView atIndex:(NSInteger)index
{
    AalistModel *model = [_alistArray1 objectAtIndex:index];

    NSString *urlStrs = [NSString stringWithFormat:@"%@",model.linkURl];
    WebController *webCtr = [[WebController alloc] init];
    webCtr.urlStr = urlStrs;
    webCtr.titleStr = @"活动";
    [self.navigationController pushViewController:webCtr animated:YES];
}
- (void)adlistdidClickPage:(AdlistScrollView *)csView atIndex:(NSInteger)index;
{
    AalistModel *model = [_alistArray2 objectAtIndex:index];
    
    
    NSString *urlStrs = [NSString stringWithFormat:@"%@",model.linkURl];
    WebController *webCtr = [[WebController alloc] init];
    webCtr.urlStr = urlStrs;
    webCtr.titleStr = @"活动";
    [self.navigationController pushViewController:webCtr animated:YES];
    
}

- (NSInteger)adlistNumberOfPages
{
    return [_alistArray2 count];
}
- (UIView*)adlistPageAtIndex:(NSInteger)index
{
    UIImageView *adlistImg = [[UIImageView alloc] init];
    AalistModel *model = [_alistArray2 objectAtIndex:index];
    [adlistImg setFrame:CGRectMake(0, 0, self.view.width, _adlistView.height)];
    adlistImg.backgroundColor = [UIColor redColor];
    adlistImg.contentMode =  UIViewContentModeScaleAspectFill;
    adlistImg.clipsToBounds  = YES;
    [adlistImg setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@""]];
    return adlistImg;
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
