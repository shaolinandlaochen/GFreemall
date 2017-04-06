//
//  OrderInformationViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OrderInformationViewController.h"
#import "OrderAddressCell.h"
#import "OrdersForGoodsListCell.h"
#import "OrderLogisticsCell.h"
#import "OrderMoneyCell.h"
#import "MyShippingAddress.h"
#import "CommodityListViewController.h"
#import "BillingInfo.h"
@interface OrderInformationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *_Button;
    UILabel *_money;
}

@end

@implementation OrderInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"订单信息");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
//构建视图
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 100*autoSizeScaleY);
    [self creatsettlementvIEW];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.section==0) {
        return 148*autoSizeScaleY;
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            return 176*autoSizeScaleY;
        }else if (indexPath.row==1){
            return 90*autoSizeScaleY;
        }
    }else if (indexPath.section==2){
        return 150*autoSizeScaleY;
    }
    return 176*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 2;
    }else if (section==2){
        return 1;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
        OrderAddressCell *cell=[ OrderAddressCell new];
        cell.defaultStr.text=@"默认";
        cell.go.image=[UIImage imageNamed:@"icon_right"];
        cell.defaultStr.backgroundColor=[UIColor redColor];
        return cell;
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            OrdersForGoodsListCell *cell=[OrdersForGoodsListCell new];
            return cell;
        }else if (indexPath.row==1){
            OrderLogisticsCell *cell=[OrderLogisticsCell new];
             cell.userInteractionEnabled = NO;
            return cell;
        }
    
    }else if (indexPath.section==2){
        OrderMoneyCell *cell=[OrderMoneyCell new];
         cell.userInteractionEnabled = NO;
        
        return cell;
    }
    
    
    NULLCell *cell=[NULLCell new];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        MyShippingAddress *shppingAddress=[[MyShippingAddress alloc]init];
        [self.navigationController pushViewController:shppingAddress animated:YES];
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            CommodityListViewController *commodity=[[CommodityListViewController alloc]init];
            [self.navigationController pushViewController:commodity animated:YES];
        }
    }
    
}
//创建支付按钮
-(void)creatsettlementvIEW{
autoSize
    
    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(100*autoSizeScaleY);
    
    _Button =[[MyButton alloc]init];
    [_Button setTitle:Localized(@"提交订单") forState:UIControlStateNormal];
    [_Button addTarget:self action:@selector(onSubmitOrdersClick) forControlEvents:UIControlEventTouchUpInside];
    [_Button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _Button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    _Button.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.8];
    [self.view addSubview:_Button];
    _Button.sd_layout.rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).widthIs(240*autoSizeScaleX).heightIs(100*autoSizeScaleY);
    
    _money=[[UILabel alloc]init];
    _money.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _money.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
    _money.textAlignment=NSTextAlignmentRight;
    [self.view addSubview:_money];
    _money.sd_layout.rightSpaceToView(_Button, 22*autoSizeScaleX).bottomSpaceToView(self.view, 0).leftSpaceToView(self.view, 25*autoSizeScaleX).heightIs(100*autoSizeScaleY);
    _money.text=@"支付金额:¥9999999";
    

}
//提交订单
-(void)onSubmitOrdersClick{
    BillingInfo *Billing=[[BillingInfo alloc]init];
    [self.navigationController pushViewController:Billing animated:YES];
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
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
