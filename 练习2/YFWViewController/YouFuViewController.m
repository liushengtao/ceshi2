//
//  YouFuViewController.m
//  you
//
//  Created by 优途 on 15-3-9.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "YouFuViewController.h"
#import "YouFuCell.h"
#import "FisrtView.h"
#import "MainController.h"
#import "ModuleListModel.h"
#import "WebController.h"
#import "ActivityModel.h"

@interface YouFuViewController ()<YTFistViewDelegate,UIAlertViewDelegate>
{
    NSArray   *_titleArr;
    NSMutableArray      *_modouAerr;
    NSMutableArray      *_aclistArr;
    NSString      *_totalIndex;//人品指数
    NSString       *_urlStr;

}

@end

@implementation YouFuViewController

- (void)initTableView
{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, navBar.bottom, screenWidth, screenHeight - navBar.bottom ) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = UIColorFromRGB(0xffffff);
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableview];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarleftBtn:nil andlDimg:nil rightBtn:nil andrImg:nil title:@"个人中心"];
    
    _modouAerr = [[NSMutableArray alloc] init];
    _aclistArr = [[NSMutableArray alloc] init];

    
    _titleArr = @[@"全城招募",@"敬请期待"];
    [self initTableView];
    [self requestinfo];
    [self huoquyonghuRenQi];

    
    // Do any additional setup after loading the view.
}

- (void) huoquyonghuRenQi
{
    NSMutableDictionary *needDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"426834",@"youxinid",nil];
    [DataSevice requestWithURL:@"getuserindex" params:needDic httpMethod:@"GET" globalTimelinePostsWithBlock:^(NSDictionary*result,NSError*error){
        NSLog(@"error   %@   AND   %@",error ,result  );
        if (!error) {
            NSString *td = [[NSString alloc] initWithData:(NSData*)result encoding:NSUTF8StringEncoding];
            NSLog(@"%@",td);
            NSDictionary *dic = [self  getbackdata:td];
            
            if ([[dic objectForKey:@"status"] isEqualToString:@"success"]) {
                NSDictionary *discc = [dic objectForKey:@"result"];
                _totalIndex = [NSString stringWithFormat:@"%@",[discc objectForKey:@"totalindex"]];
            }else{
                NSLog(@"%@",[dic objectForKey:@"info"]);
            }
            
            [_tableview reloadData];
            
            
        }else{
            
        }
    }];

    
}
- (void)requestinfo
{
    NSMutableDictionary *needDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"4",@"ostype", nil];

    [DataSevice requestWithURL:@"getindexinfo" params:needDic httpMethod:@"GET" globalTimelinePostsWithBlock:^(NSDictionary*result,NSError*error){
        NSLog(@"error   %@   AND   %@",error ,result  );
        if (!error) {
            NSString *td = [[NSString alloc] initWithData:(NSData*)result encoding:NSUTF8StringEncoding];
            NSLog(@"%@",td);
            NSDictionary *dic = [self  getbackdata:td];

            if ([[dic objectForKey:@"state"] intValue] ==1) {
                NSDictionary *listDic = [dic objectForKey:@"resultJson"];
                NSArray *module = [listDic objectForKey:@"modulelist"];
                NSArray *actiArr = [listDic objectForKey:@"activitylist"];

                for (NSDictionary *dic in module) {
                    ModuleListModel *model = [ModuleListModel needmodelWithDic:dic];
                    [_modouAerr addObject:model];
                }
                for (NSDictionary *disc in actiArr) {
                    ActivityModel *actiModel = [ActivityModel needmodelWithDic:disc];
                    [_aclistArr addObject:actiModel];
                    NSLog(@"%@",actiModel.ordernum);
                }

            }

            [_tableview reloadData];


        }else{
            
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_aclistArr count] == 0) {
        return 44;
    }else{
        if (indexPath.row == 1) {
            return 60;
        }else{
            return 44;
        }
    }
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_modouAerr count] +[_aclistArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *cellIdentify = @"identifiyeCell";
        YouFuCell *cell = (YouFuCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentify];
        
        if (!cell) {
            cell = [[YouFuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify and:noActionState];
            
//            cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
//        cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;

        cell.leftView.image = [UIImage imageNamed:@"oil"];
        cell.titlelabel.text = @"服务";
        cell.subTitle.text = @"我的人品指数:";
        if ([_totalIndex length] != 0) {
            cell.nubTitle.text = _totalIndex;
        }
        return cell;

    }else if ([_aclistArr count] ==0) {
        static NSString *cellIdentifys = @"identifiyeCell";
        YouFuCell *cell = (YouFuCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifys];
        
        if (!cell) {
            cell = [[YouFuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifys and:actionState];
            
            //            cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        NSString *urlstr;
        if ([_modouAerr count] != 0) {
            ModuleListModel *models = [_modouAerr objectAtIndex:indexPath.row -1];
            if ([models.logoImg rangeOfString:@"http"].location !=NSNotFound) {
                urlstr = [NSString stringWithFormat:@"%@",models.logoImg];
            }else{
                urlstr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,models.logoImg];
            }
            
            
            [cell.leftView setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:@""]];
            //            cell.leftView.image = [UIImage imageNamed:@"servise@2x.png"];
            cell.titlelabel.text = models.module_name;
            cell.subTitle.text = models.module_desc;
            
        }
        
        return cell;

    }else{
        if (indexPath.row == 1){
            static NSString *cellIdentify = @"identifiyeCell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
            
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
                
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
            }
            if ([_aclistArr count]!=0) {
                for (int i =0; i< [_aclistArr count]; i++) {
                    int x = i%2 * (self.view.width/2);
                    int y = i/2 * (50 + 1) +5;
                    
                    ActivityModel *model = [_aclistArr objectAtIndex:i];
                    FisrtView *huodongVi = [[FisrtView alloc] initWithFrame:CGRectMake(x, y, self.view.width/2, 55) and:scrollState];
                    if ([model.logoImg rangeOfString:@"http"].location !=NSNotFound) {
                        _urlStr = [NSString stringWithFormat:@"%@",model.logoImg];
                    }else{
                        _urlStr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,model.logoImg];
                    }
                    [huodongVi.rightImg setImageWithURL:[NSURL URLWithString:_urlStr] placeholderImage:[UIImage imageNamed:@""]];
                    huodongVi.pubDelegate = self;
                    huodongVi.leftBtn.tag = i +50;
                    huodongVi.leftLab.text = model.name;
                    huodongVi.leftlab1.text = model.desc;
                    [cell addSubview:huodongVi];
                    
                }
                UIImageView *imagess = [[UIImageView alloc] initWithFrame:CGRectMake(0, 59, cell.width, 1)];
                imagess.backgroundColor = UIColorFromRGB(0xe4e4e4);
                [cell addSubview:imagess];
            }
            return cell;
            
        }else{
            static NSString *cellIdentifys = @"identifiyeCell";
            YouFuCell *cell = (YouFuCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifys];
            
            if (!cell) {
                cell = [[YouFuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifys and:actionState];
                
                //            cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            NSString *urlstr;
            if ([_modouAerr count] != 0) {
                ModuleListModel *models = [_modouAerr objectAtIndex:indexPath.row -2];
                if ([models.logoImg rangeOfString:@"http"].location !=NSNotFound) {
                    urlstr = [NSString stringWithFormat:@"%@",models.logoImg];
                }else{
                    urlstr = [NSString stringWithFormat:@"%@%@",BaseRequestURL,models.logoImg];
                }
                
                
                [cell.leftView setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:@""]];
                //            cell.leftView.image = [UIImage imageNamed:@"servise@2x.png"];
                cell.titlelabel.text = models.module_name;
                cell.subTitle.text = models.module_desc;
                
            }
            
            return cell;
            
            
        }

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        MainController *mainCtr = [[MainController alloc] init];
        mainCtr.youfuwuUserinfos=[NSDictionary dictionaryWithObjectsAndKeys:@"928612",@"youxinid",@"123456",@"youxinPassword",@"113.64964385",@"longitude",@"34.75661006",@"latitude",@"268",@"citycode", nil];
        
        [self.navigationController pushViewController:mainCtr animated:YES];
    }else{
        YouFuCell *cell = (YouFuCell *)[tableView cellForRowAtIndexPath:indexPath];
        if ([cell.titlelabel.text isEqualToString:@"敬请期待"]) {
            ALERT_MSG(@"温馨提示", @"新活动筹备中,敬请期待");
        }else{
            ModuleListModel *model = [_modouAerr objectAtIndex:indexPath.row -2];
            NSString *urlStrs = [NSString stringWithFormat:@"%@",model.link];
            WebController *webCtr = [[WebController alloc] init];
            webCtr.urlStr = urlStrs;
            webCtr.titleStr = model.module_name;
            [self.navigationController pushViewController:webCtr animated:YES];

        }
        

    }
}
- (void)alertViewDelayMothod:(UIAlertView *)alet
{
    [alet dismissWithClickedButtonIndex:1 animated:YES];
}
- (void)fisrtViewBtnEventTouch:(UIButton *)btn
{
    NSLog(@"bnt  == %ld",btn.tag);
    ActivityModel *model = [_aclistArr objectAtIndex:btn.tag -50];
    if ([model.name isEqualToString:@"敬请期待"]) {
        ALERT_MSG(@"温馨提示", @"新活动筹备中,敬请期待");
//        btn.userInteractionEnabled = NO;
    }else{
        NSString *urlStrs = [NSString stringWithFormat:@"%@?youxinid=928612",model.link];
        WebController *webCtr = [[WebController alloc] init];
        webCtr.urlStr = urlStrs;
        webCtr.titleStr = model.name;
        [self.navigationController pushViewController:webCtr animated:YES];

    }

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
