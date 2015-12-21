//
//  HistoryController.m
//  you
//
//  Created by 优途 on 15-3-11.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "HistoryController.h"
#import "HistoryCell.h"
#import "HistoryModel.h"
#define btnWith  (screenWidth - 20)/5
@interface HistoryController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView          *_tableview;
    NSArray    *_titleRighA;
    NSArray  *_subRighta;
    NSArray  *titLeft;
    NSArray  *subLeft;
    NSMutableArray      *_zijinArr;
    NSDictionary       *_zijinDic;
}

@end

@implementation HistoryController

- (void)initTableView
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, navBar.bottom +60, screenWidth, screenHeight - navBar.bottom -60) style:UITableViewStylePlain];
        
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = UIColorFromRGB(0xffffff);
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableview];
    }
}

- (void)layoutButtonView
{
    NSInteger topheight=60;//原来是40
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, navBar.bottom, screenWidth, topheight)];
    topView.backgroundColor = UIColorFromRGB(0xffefef);
    [self.view addSubview:topView];
    NSArray *titleArr = @[@"资金账户",@"打赏账户",@"信用账户",@"优积分",@"人品指数"];
    for (int i=0; i <5; i ++) {
        NSInteger topOrEndspace=10;
        NSInteger buttonheight=topheight-topOrEndspace*2;//原来是20
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*(btnWith -1) +10, topOrEndspace, (screenWidth - 20)/5, buttonheight);
        switch (i) {
            case 0:
                btn.tag=1;
                break;
            case 1:
                btn.tag=5;
                break;
            case 2:
                btn.tag=2;
                break;
            case 3:
                btn.tag=6;
                break;
            case 4:
                btn.tag=0;
                break;
                
            default:
                btn.tag=0;
                break;
        }
        
        
        //        btn.backgroundColor = [UIColor redColor];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = UIColorFromRGB(0x848484).CGColor;
        [btn setExclusiveTouch:YES];
        btn.titleLabel.font = [UIFont systemFontOfSize:10];
        [btn setTitle:[titleArr objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:UIColorFromRGB(0x848484) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(topButtonEventTouch:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:btn];
        
        if(i==0)
        {
            currentButton=btn;
        }
    }
    
}

//static __block UIButton *currentButton;
- (void)topButtonEventTouch:(UIButton *)btn
{
    if (btn != currentButton) {
        currentButton.selected = NO;
        currentButton.backgroundColor = UIColorFromRGB(0xffefef);
        [currentButton setTitleColor:UIColorFromRGB(0x848484) forState:UIControlStateNormal];
        NSLog(@"11");
        currentButton = btn;
    }
    currentButton.selected = YES;
    [currentButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    currentButton.backgroundColor = UIColorFromRGB(0x848484);
    NSLog(@"btn.tag == %ld",btn.tag);
    [self requesUserData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:@"历史记录"];
    self.view.backgroundColor = UIColorFromRGB(0xe7e7e7);
    [self layoutButtonView];
    [self topButtonEventTouch:currentButton];
    _zijinDic = [NSDictionary dictionaryWithObjectsAndKeys:@"支付",@"1",@"充值",@"2",@"提现",@"3",@"管理员授信",@"4",@"兄弟加油提现",@"5",@"兄弟加油提现二期",@"6",@"资金帐户转移打赏帐户",@"7",@"有权限圈子充值15元",@"8",@"管提现至支付宝",@"9",@"提现至银行卡",@"10", nil];
    //    titLeft = @[@"充值",@"红包",@"快餐",@"洗车",@"红包",@"红包",@"快餐"];
    //    _subRighta = @[@"2015-03-10",@"2015-03-10",@"2015-03-10",@"2015-03-10车",@"2015-03-10",@"2015-03-10",@"2015-03-10"];
    //
    //    subLeft = @[@"余额：96.24",@"余额：96.24",@"余额：96.24",@"余额：96.24车",@"余额：96.24",@"余额：96.24",@"余额：96.24"];
    //    _titleRighA = @[@"+50.00",@"+50.00",@"+50.00",@"+50.00",@"+50.00",@"+50.00",@"+50.00"];
    
    _zijinArr =[[NSMutableArray alloc] init];
    
    [self initTableView];
    
    //    [self requestHistory];
    [self requesUserData];
}

-(NSDictionary*)getbackdata:(NSString*)result
{
    NSData*datas = [result dataUsingEncoding: NSUTF8StringEncoding];
    JSONDecoder*jd=[[JSONDecoder alloc]init];
    NSDictionary*dic=[jd objectWithData:datas];
    return dic;
}

-(void)requesUserData
{
    //有信号928612
    if(currentButton.tag==0)
    {
        [_zijinArr removeAllObjects];
        [_tableview reloadData];
        return;
    }
    int typenumber=(int)currentButton.tag;
    NSString* datatype=[NSString stringWithFormat:@"%d",typenumber];
    NSMutableDictionary *needDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"youxinid"],@"youxinid", datatype,@"type",@"1",@"pageno",nil];
   
    
    
    
    [DataSevice requestWithURL:@"gethistoryrecord" params:needDic httpMethod:@"GET" globalTimelinePostsWithBlock:^(NSDictionary*result,NSError*error){
        NSLog(@"error   %@   AND   %@",error ,result  );
        if(typenumber!=currentButton.tag)
        {
            return ;
        }
        
        if (!error) {
            NSString *td = [[NSString alloc] initWithData:(NSData*)result encoding:NSUTF8StringEncoding];
            NSLog(@"%@",td);
            NSDictionary *dic = [self  getbackdata:td];
            
            if ([[dic objectForKey:@"state"] intValue] ==1) {
                NSDictionary *listDic = [dic objectForKey:@"result"];
                NSArray *module = [listDic objectForKey:@"recordlist"];
                [_zijinArr removeAllObjects];
                for (NSDictionary *dic in module) {
                    HistoryModel *model = [HistoryModel  modelWithDic:dic];
                    [_zijinArr addObject:model];
                }
                
            }
            //            [self initTableView];
            
            [_tableview reloadData];
            
            
        }else{
            NSLog(@"失败");
        }
    }];
}






- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_zijinArr count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, 16)];
    view.backgroundColor = UIColorFromRGB(0xe7e7e7);
    
    UILabel *titLb = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 50, 20)];
    titLb.textColor = UIColorFromRGB(0x3e3e3e);
    //    ti/
    titLb.font = [UIFont systemFontOfSize:12];
    titLb.text = @"本月";
    [view addSubview:titLb];
    return view;
    
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString  *cellIdentify = @"cellIdenti";
    HistoryCell *cell = (HistoryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[HistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify and:historyState];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    if ([_zijinArr count]!=0) {
        HistoryModel *model = [_zijinArr objectAtIndex:indexPath.row];
        cell.titleLeft.text = [_zijinDic objectForKey:model.operatetype];
        cell.subtitleLefe.text = [NSString stringWithFormat:@"余额: %@",model.currentbalance];
        if ([model.operatetype isEqualToString:@"1"] || [model.operatetype isEqualToString:@"3"]|| [model.operatetype isEqualToString:@"9"] || [model.operatetype isEqualToString:@"10"]) {
            cell.titleRight.text = [NSString stringWithFormat:@"- %@",model.operateamount];
            cell.titleRight.textColor = UIColorFromRGB(0xf35e52);
        }else{
            cell.titleRight.text = [NSString stringWithFormat:@"+ %@",model.operateamount];
            cell.titleRight.textColor = UIColorFromRGB(0x50c38c);
            
        }
        cell.subtitleRight.text = model.operatetime;
        
    }
    return cell;
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
