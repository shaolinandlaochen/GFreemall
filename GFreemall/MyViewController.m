//
//  MyViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyViewController.h"
#import "MyAllCell.h"
#import "MyMessageCells.h"
#import "MyShippingAddress.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.navigationController.navigationBarHidden=YES;
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView=[[UITableView alloc]initWithFrame:frame(0, -50, 750, 1500) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    if (section==2){
        return 4;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
autoSize
    if (indexPath.section==0){
        return 0;
    }else{
        return 90*autoSizeScaleY;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize

    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==0) {
        return 548*autoSizeScaleY;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        MyInformationView *view=[[MyInformationView alloc]init];
        [view.iconBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490852754875&di=b9a1594e2fbf3199a448a7e85f00afa2&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fmobile%2F1%2F5260a24a48d1c.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        view.name.text=Localized(@"一个萝卜一个坑");
        view.level.backgroundColor=[TheParentClass colorWithHexString:@"fffbd4"];
        [view.levelIcon setBackgroundImage:[UIImage imageNamed:@"member_diamond"] forState:UIControlStateNormal];
        [view.levelName setTitle:@"黄金会员" forState:UIControlStateNormal];
        [view.orderName addTarget:self action:@selector(onOrderClick) forControlEvents:UIControlEventTouchUpInside];
        [view.GoOrderIcon addTarget:self action:@selector(onOrderClick) forControlEvents:UIControlEventTouchUpInside];
        [view.ForThePaymentBtn addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        [view.ForTheGoods addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        [view.ToEvaluate addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        [view.HasBeenCompleted addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        view.redOne.text=@"9";
        view.redTwo.text=@"9";
        view.redThree.text=@"9";
        view.redFour.text=@"9";
        
        return view;
    }
    
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section!=0) {
        MyMessageCells *cell=[MyMessageCells new];
        if (indexPath.section==1) {
            cell.icon.image=[UIImage imageNamed:@"icon_mews"];
            cell.name.text=Localized(@"我的消息");
        }else if (indexPath.section==2){
            if (indexPath.row==0) {
            cell.icon.image=[UIImage imageNamed:@"icon_information"];
                cell.name.text=Localized(@"基本信息");
            }else if (indexPath.row==1){
            cell.icon.image=[UIImage imageNamed:@"icon_wallete"];
                cell.name.text=Localized(@"钱包管理");
            }else if (indexPath.row==2){
            cell.icon.image=[UIImage imageNamed:@"icon_collect"];
                cell.name.text=Localized(@"我的收藏");
            }else if (indexPath.row==3){
            cell.icon.image=[UIImage imageNamed:@"icon_address"];
                cell.name.text=Localized(@"地址管理");
            }
        }else if (indexPath.section==3){
        cell.icon.image=[UIImage imageNamed:@"icon_setting"];
            cell.name.text=Localized(@"设置");
        }
        return cell;
    }
    
    NULLCell *celll=[NULLCell new];
    return celll;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==2&&indexPath.row==3) {
        MyShippingAddress *Address=[[MyShippingAddress alloc]init];
        [self.navigationController pushViewController:Address animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//查看全部订单
-(void)onOrderClick{
    NSLog(@"1111");
}
//代付款待收货待评价等等
-(void)myOrderAll:(MyButton *)btn{
    switch (btn.tag) {
        case 100:
        {
            NSLog(@"待付款");
        }
            break;
        case 101:
        {
            NSLog(@"待收货");
        }
            break;
        case 102:
        {
            NSLog(@"待评价");
        }
            break;
        case 103:
        {
            NSLog(@"已完成");
        }
            break;
            
        default:
            break;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:YES];
     self.navigationController.navigationBarHidden=YES;
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
