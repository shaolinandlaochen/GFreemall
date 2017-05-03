//
//  WalletDetailsViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "WalletDetailsViewController.h"
#import "walletDetailsCell.h"//钱包明细
#import "MonthView.h"//筛选时间
#import "PrepaidPhoneRecordsTableViewCell.h"//充值记录
#import "TimeViewController.h"
#import "PaymentStatusViewController.h"
#import "TransferRecordCell.h"//转出记录
#import "WalletRequestClass.h"
@interface WalletDetailsViewController ()<UITableViewDataSource,UITableViewDelegate,ToChooseTimeIsDelegate,PaymentStatusDelegate>

{
    UITableView *_tableView;
    UIView *_timeView;
    UIView *_PaymentStatusView;
}

@end

@implementation WalletDetailsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    TheDrop_downRefresh(_tableView, @selector(ToGetTheData))
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    autoSize
    
    
    
    
    self.title=Localized(self.were);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    
    
    // Do any additional setup after loading the view.
}

//获取数据
-(void)ToGetTheData{
[WalletRequestClass PrepaidPhoneRecordsDicpage:@"1" pageSize:@"1000" start:self.timeBegin end:self.timeEnd type:self.type url:self.urlString block:^(NSDictionary *dic) {
    if ([self.were isEqualToString:@"充值记录"]) {
        Top_UpBaseClass *class=[[Top_UpBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([class.code isEqualToString:@"17"]) {
            self.dataDic=[self deleteEmpty:dic];
            if (class.pagingList.resultList.count<1) {
                 [FTIndicator showToastMessage:Localized(@"暂无记录")];
            }
            [_tableView reloadData];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
    }else if ([self.were isEqualToString:@"钱包明细"]){
        WalletDetailsBaseClass *class=[[WalletDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([class.code isEqualToString:@"17"]) {
            self.dataDic=[self deleteEmpty:dic];
            if (class.pagingList.resultList.count<1) {
                 [FTIndicator showToastMessage:Localized(@"暂无记录")];
            }
            [_tableView reloadData];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
    }
    
    [SVProgressHUD dismiss];
    [_tableView.mj_header endRefreshing];
}];
    
    
}
cancelClick
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"筛选") style:UIBarButtonItemStylePlain target:self action:@selector(onrightItemButtonClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
    [self.navigationItem.rightBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    [self PaymentStatus];
    
}
//支付状态筛选
-(void)PaymentStatus{
autoSize
//PaymentStatusViewController
    _PaymentStatusView=[[UIView alloc]init];
    _PaymentStatusView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.3];
    [self.view addSubview:_PaymentStatusView];
     _PaymentStatusView.frame=CGRectMake(0, 2000, self.view.frame.size.width, self.view.frame.size.height);
    
    PaymentStatusViewController *pay=[[PaymentStatusViewController alloc]init];
    pay.delegate=self;
    [_PaymentStatusView addSubview:pay.view];
    pay.view.sd_layout.leftSpaceToView(_PaymentStatusView, 0).rightSpaceToView(_PaymentStatusView, 0).bottomSpaceToView(_PaymentStatusView, 0).heightIs(400*autoSizeScaleY);
    [self addChildViewController:pay];
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if ([self.were isEqualToString:@"钱包明细"]) {
        return 414*autoSizeScaleY;
    }else if ([self.were isEqualToString:@"转出记录"]){
        return 386*autoSizeScaleY;
    }
    return 332*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 86*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MonthView *view=[[MonthView alloc]init];
    if (self.inStr !=nil) {
    view.MonthTitle.text=Localized(self.inStr);
    }
   
    [view.btn addTarget:self action:@selector(onTimeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.were isEqualToString:@"充值记录"]) {
        Top_UpBaseClass *class=[[Top_UpBaseClass alloc]initWithDictionary:self.dataDic];
        return class.pagingList.resultList.count;
    }else if ([self.were isEqualToString:@"钱包明细"]){
        WalletDetailsBaseClass *class=[[WalletDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        return class.pagingList.resultList.count;
    }else if ([self.were isEqualToString:@"转出记录"]){
        
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([self.were isEqualToString:@"钱包明细"]) {
        WalletDetailsBaseClass *class=[[WalletDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        WalletDetailsResultList *list=class.pagingList.resultList[indexPath.row];
        PrepaidPhoneRecordsTableViewCell *cell=[PrepaidPhoneRecordsTableViewCell new];
        cell.time.text=list.cwalletTime;
        cell.type.text=list.cwalletType;
        cell.money.text=[NSString stringWithFormat:@"¥%.2f",list.cwalletAmount];
        cell.balance.text=[NSString stringWithFormat:@"¥%.2f",list.cwalletRemain];
        cell.context.text=list.remark;
        return cell;
        
    }else if ([self.were isEqualToString:@"充值记录"]){
        Top_UpBaseClass *class=[[Top_UpBaseClass alloc]initWithDictionary:self.dataDic];
        Top_UpResultList *list=class.pagingList.resultList[indexPath.row];
        walletDetailsCell *cell=[walletDetailsCell new];
        cell.userInteractionEnabled = NO;
        cell.money.text=[NSString stringWithFormat:@"¥%.2f",list.rechargeAmount];
        if (list.rechargeState==0) {
             cell.state.text=Localized(@"待支付");
        }else if (list.rechargeState==1){
             cell.state.text=Localized(@"成功");
        }else if (list.rechargeState==-1){
             cell.state.text=Localized(@"失败");
        }
        cell.time.text=[NSString stringWithFormat:@"%@",list.rechargeTime];
        cell.orderNumber.text=[NSString stringWithFormat:@"%@",list.rechargeSerial];
        return cell;
    
    }else if ([self.were isEqualToString:@"转出记录"]){
        TransferRecordCell *cell=[TransferRecordCell new];
        cell.userInteractionEnabled = NO;
        cell.numberName.text=Localized(@"印人民");
        cell.money.text=@"¥99999";
        cell.state.text=Localized(@"待支付");
        cell.time.text=Localized(@"2017-12-12 12:00:12");
        cell.orderNumber.text=Localized(@"65465464646");
        
        
        return cell;
        
    
    }
        
    
    NULLCell *cell=[NULLCell new];
    return cell;

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
//区头选择时间
-(void)onTimeBtnClick:(MyButton *)btn{
    
    TimeViewController *time=[[TimeViewController alloc]init];
    time.delegate=self;
    time.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:time animated:YES completion:^{
        time.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:.5];
    }];
    

}
//点击筛选执行该方法
-(void)onrightItemButtonClick{
    PaymentStatusViewController *pay=[[PaymentStatusViewController alloc]init];
    pay.delegate=self;
    if ([self.were isEqualToString:@"充值记录"]) {
        pay.typeArray=@[@"0",@"1",@"-1"];
        pay.nameArray=@[@"待支付",@"成功",@"失败"];
    }else if ([self.were isEqualToString:@"钱包明细"]){
       pay.typeArray=@[@"Repeat",@"Buy",@"Recharge"];
        pay.nameArray=@[@"重消预扣",@"购买",@"充值"];
    }
    pay.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:pay animated:YES completion:^{
        pay.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:.5];
    }];
    


}
//选择时间完毕
-(void)ToChooseTime:(BOOL)WHY String:(NSString *)time{
    self.timeBegin=[NSString stringWithFormat:@"%@-01",time];
     self.timeEnd=[NSString stringWithFormat:@"%@-31",time];
    self.inStr=time;
    [SVProgressHUD showWithStatus:Localized(@"loading")];
    [self ToGetTheData];
    
}
//帅选支付状态
-(void)PaymentStatus:(BOOL)why String:(NSString *)time{

    NSLog(@"tye--%@",time);
    self.type=time;
    [SVProgressHUD showWithStatus:Localized(@"loading")];
    [self ToGetTheData];

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
