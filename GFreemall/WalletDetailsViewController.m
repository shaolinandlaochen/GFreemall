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
@interface WalletDetailsViewController ()<UITableViewDataSource,UITableViewDelegate,ToChooseTimeIsDelegate,PaymentStatusDelegate>

{
    UITableView *_tableView;
    UIView *_timeView;
    UIView *_PaymentStatusView;
}

@end

@implementation WalletDetailsViewController

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
    
    
    [self CreatTimeView];
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
//时间筛选
-(void)CreatTimeView{
autoSize
    _timeView=[[UIView alloc]init];
    _timeView.frame=CGRectMake(0, 2000, self.view.frame.size.width, self.view.frame.size.height);
    _timeView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.3];
    [self.view addSubview:_timeView];
    TimeViewController *time=[[TimeViewController alloc]init];
    time.delegate=self;
    [_timeView addSubview:time.view];
    time.view.sd_layout.leftSpaceToView(_timeView, 0).rightSpaceToView(_timeView, 0).bottomSpaceToView(_timeView, 0).heightIs(_timeView.frame.size.height/2);
    [self addChildViewController:time];
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if ([self.were isEqualToString:@"钱包明细"]) {
        return 414*autoSizeScaleY;
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
    view.MonthTitle.text=Localized(@"本月");
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
    
    return 14;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if ([self.were isEqualToString:@"钱包明细"]) {
        
        PrepaidPhoneRecordsTableViewCell *cell=[PrepaidPhoneRecordsTableViewCell new];
        cell.time.text=Localized(@"2020-02-01  12:21:12");
        cell.type.text=Localized(@"分红");
        cell.money.text=Localized(@"+123456元");
        cell.balance.text=Localized(@"1992元");
        cell.context.text=Localized(@"我是备注东方闪电分手方式发送到发送到");
        return cell;
        
    }else if ([self.were isEqualToString:@"充值记录"]){
        walletDetailsCell *cell=[walletDetailsCell new];
        cell.userInteractionEnabled = NO;
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
    [UIView animateWithDuration:0.5 animations:^{
        _timeView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
//点击筛选执行该方法
-(void)onrightItemButtonClick{
    [UIView animateWithDuration:0.5 animations:^{
        _PaymentStatusView.frame=self.view.frame;
    }];

}
//选择时间完毕
-(void)ToChooseTime:(BOOL)WHY String:(NSString *)time{
    [UIView animateWithDuration:0.5 animations:^{
        _timeView.frame=CGRectMake(0, 2000, self.view.frame.size.width, self.view.frame.size.height);
    }];
    
    if (WHY==NO) {
        
    }
    NSLog(@"%@",time);
}
//帅选支付状态
-(void)PaymentStatus:(BOOL)why String:(NSString *)time{
    [UIView animateWithDuration:0.5 animations:^{
        _PaymentStatusView.frame=CGRectMake(0, 2000, self.view.frame.size.width, self.view.frame.size.height);
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
