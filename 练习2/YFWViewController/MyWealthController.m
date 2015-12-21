//
//  MyWealthController.m
//  you
//
//  Created by 优途 on 15-3-11.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "MyWealthController.h"
#import "HistoryCell.h"
#import "WealthModel.h"
#import "TiXianController.h"

@interface MyWealthController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView          *_tableview;
    NSMutableArray      *_wealThArr;
    WealthModel *_model ;
    NSArray               *_cellTile;
    NSArray               *_cellImg;
    NSString               *_moneystr;
}
@end

@implementation MyWealthController

- (void)initTableView
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, navBar.bottom, screenWidth, screenHeight - navBar.bottom ) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.hidden = YES;
        _tableview.backgroundColor = UIColorFromRGB(0xececec);
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableview];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(YoutuCaifuChongzhiChengGong) name:@"YoutuCaifuChongzhiChengGong" object:nil];
    }
}
-(void)YoutuCaifuChongzhiChengGong
{
    [self requestMyWealth];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:@"我的财富"];
    self.view.backgroundColor = UIColorFromRGB(0xe7e7e7);
    _wealThArr = [[NSMutableArray alloc] init];
    _cellTile = [NSArray arrayWithObjects:@"充值",@"提现",@"打赏",@"积分兑换", nil];
    _cellImg = [NSArray arrayWithObjects:@"top-ups@2x.png",@"withdrawal@2x.png",@"exceptional@2x.png",@"integral@2x.png", nil];
    [self initTableView];
    [self requestMyWealth];

    // Do any additional setup after loading the view.
}

-(NSDictionary*)getbackdata:(NSString*)result
{
    NSData*datas = [result dataUsingEncoding: NSUTF8StringEncoding];
    JSONDecoder*jd=[[JSONDecoder alloc]init];
    NSDictionary*dic=[jd objectWithData:datas];
    return dic;
}

- (void)requestMyWealth
{
    //有信号928612
    NSMutableDictionary *needDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[[youfuwulastUserinfo Lastuserinfo] objectForKey:@"youxinid"],@"youxinid",nil];
    
    [DataSevice requestWithURL:@"getuserfortune" params:needDic httpMethod:@"GET" globalTimelinePostsWithBlock:^(NSDictionary*result,NSError*error){
        NSLog(@"error   %@   AND   %@",error ,result  );
        if (!error) {
            NSString *td = [[NSString alloc] initWithData:(NSData*)result encoding:NSUTF8StringEncoding];
            NSLog(@"%@",td);
            NSDictionary *dic = [self  getbackdata:td];
            _tableview.hidden = NO;
            if ([[dic objectForKey:@"state"] intValue] ==1) {
            
                NSDictionary *listDic = [dic objectForKey:@"result"];
                
                _model = [WealthModel withDic:listDic];
//                [_wealThArr addObject:model];
                
            }
            
            [_tableview reloadData];
            
            
        }else{
            NSLog(@"失败");
        }
    }];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger secr = [indexPath section];
    if (secr == 0) {
        if (indexPath.row ==0) {
            return 60;
        }else{
            return 40;
        }
    }else{
        return 44;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else{
        return 4;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return 18;
    }else{
        return 0.1;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = [indexPath section];
    if (section ==0) {
        if (indexPath.row ==0) {
            static NSString  *cellIdentify = @"cellIdenti";
            HistoryCell *cell = (HistoryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentify];
            if (!cell) {
                cell = [[HistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify and:wealthTouxiang];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;

            }
            if (_model != nil) {
//                NSString *urlStr = [NSString stringWithFormat:@"%@",_model.userlogo];
                [cell.touxiangImg setImageWithURL:[NSURL URLWithString:_model.userlogo] placeholderImage:[UIImage imageNamed:@"servise@2x.png"]];
                cell.titleLeft.text = _model.realname;
                cell.subtitleLefe.text = @"13287985321";
            }
            return cell;

        }else{
            static NSString  *cellIdentifys = @"cellIdenti";
            HistoryCell *cell = (HistoryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifys];
            if (!cell) {
                cell = [[HistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifys and:wealthInfo];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            if (_model !=nil) {
                _moneystr = [NSString stringWithFormat:@"%@",_model.balance];
                cell.titleLeft.text = [NSString stringWithFormat:@"资金账户:%@",_model.balance];
                cell.subtitleRight.text = [NSString stringWithFormat:@"打赏账户:%@",_model.tipbalance];
                cell.titleRight.text = [NSString stringWithFormat:@"信用账户:%@",_model.creditbalance];

            }
            
            return cell;

        }
    }else{
        static NSString  *cellIdentify = @"cellIdenti";
        HistoryCell *cell = (HistoryCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentify];
        if (!cell) {
            cell = [[HistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify and:wealthAction];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        }
        cell.titleLeft.text = [_cellTile objectAtIndex:indexPath.row];
        cell.touxiangImg.image = [UIImage imageNamed:[_cellImg objectAtIndex:indexPath.row]];
        
        return cell;

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        
    }
    else
    {
        switch (indexPath.row) {
            case 0:{
                //充值
                
                chongZhiViewcontroller* controller=[[chongZhiViewcontroller alloc] init];
                controller.title=@"充值";
                
                
                [self.navigationController pushViewController:controller animated:YES];
                controller.moneystirng=_moneystr;
                
            }
                break;
            case 1:
                //提现
            {
                TiXianController *tixianCtr = [[TiXianController alloc] init];
                tixianCtr.moneyStr = _moneystr;
                [self.navigationController pushViewController:tixianCtr animated:YES];
                
            }
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
            default:
                break;
        }
    }

}
-(void)dealloc
{
    [[NSNotificationCenter
      defaultCenter] removeObserver:self];
    
}

@end
