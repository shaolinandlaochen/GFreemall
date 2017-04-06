//
//  MyOrderDetails.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyOrderDetails.h"
#import "OrderNumberView.h"
#import "OrderCell.h"
#import "OrderAddressCell.h"
#import "PaymentToShowCell.h"
#import "ShippingInformationTableViewCell.h"
#import "OrderAmountDetailCell.h"
#import "MoneyAnTimeCell.h"
#import "InternalOrderButtonCell.h"
#import "ConfirmTheGoodsViewController.h"
#import "BillingInfo.h"
@interface MyOrderDetails ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}

@end

@implementation MyOrderDetails

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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.section==0) {
          return 176*autoSizeScaleY;
    }else if (indexPath.section==1){
        return 148*autoSizeScaleY;
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            return 90*autoSizeScaleY;
        }else if (indexPath.row==1){
            return 140*autoSizeScaleY;
        }
    }else if (indexPath.section==3){
        if (indexPath.row==0) {
            return 150*autoSizeScaleY;
        }else if (indexPath.row==1){
            return 118*autoSizeScaleY;
        }
    }else if (indexPath.section==4){
        return 107*autoSizeScaleY;
    }
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==0) {
        return 80*autoSizeScaleY;
    }
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        OrderNumberView *view=[[OrderNumberView alloc]init];
        view.strNumber.text=@"订单号:123456789";
        view.state.text=@"待付款";
        view.state.textColor=[UIColor redColor];
        return view;
    }
    

    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else if (section==1){
        return 1;
    }else if (section==2){
        return 2;
    }else if (section==3){
        return 2;
    }else if (section==4){
        return 1;
    }
    
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        //商品
        OrderCell *cell=[OrderCell new];
        cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
        return cell;
    }else if (indexPath.section==1){
        //收货地址
        OrderAddressCell *cell=[OrderAddressCell new];
        cell.userInteractionEnabled=NO;
        return cell;
    
    }else if (indexPath.section==2){
        if (indexPath.row==0) {//支付方式
            PaymentToShowCell *cell=[PaymentToShowCell new];
            cell.userInteractionEnabled=NO;
            cell.context.text=Localized(@"支付方式");
            cell.name.text=@"GFM支付";
            return cell;
        }else if (indexPath.row==1){//配送信息
            ShippingInformationTableViewCell *cell=[ShippingInformationTableViewCell new];
            cell.userInteractionEnabled=NO;
            cell.name.text=@"中通快递";
            cell.numberString.text=@"快递单号:123456789";
            return cell;
        
        }
      
    }else if (indexPath.section==3){
        if (indexPath.row==0) {//运费以及商品金额
            OrderAmountDetailCell *cell=[OrderAmountDetailCell new];
            cell.userInteractionEnabled=NO;
            cell.AmountOfGoods.text=@"¥789";
            cell.freight.text=@"¥852";
            return cell;
        }else if (indexPath.row==1){//实付款
            MoneyAnTimeCell *cell=[MoneyAnTimeCell new];
            cell.userInteractionEnabled=NO;
            return cell;
        }
    }else if (indexPath.section==4){
        InternalOrderButtonCell *cell=[InternalOrderButtonCell new];
        if ([self.state isEqualToString:@"待收货"]) {
            cell.OrderView.strOne=@"确认收货";
            [cell.OrderView.btnOne addTarget:self action:@selector(onButtonOneCLIck:) forControlEvents:UIControlEventTouchUpInside];

        }else if ([self.state isEqualToString:@"待评价"]){
        
            cell.OrderView.strOne=@"去评价";
            [cell.OrderView.btnOne addTarget:self action:@selector(onButtonOneCLIck:) forControlEvents:UIControlEventTouchUpInside];

        }else if ([self.state isEqualToString:@"待付款"]){
            cell.OrderView.strOne=@"去支付";
            [cell.OrderView.btnOne addTarget:self action:@selector(onButtonOneCLIck:) forControlEvents:UIControlEventTouchUpInside];
            cell.OrderView.strTwo=@"取消";
            [cell.OrderView.BtnTwo addTarget:self action:@selector(onButtonOneCLIck:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
        
        return cell;
    }
    
    NULLCell *cell=[NULLCell new];
 
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)CreatView{
autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    // _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//点击去支付等按钮执行
-(void)onButtonOneCLIck:(MyButton *)btn{
    if ([btn.string isEqualToString:@"去支付"]) {
        BillingInfo *Billing=[[BillingInfo alloc]init];
        [self.navigationController pushViewController:Billing animated:YES];
    }else if ([btn.string isEqualToString:@"确认收货"]){
        ConfirmTheGoodsViewController *confirm=[[ConfirmTheGoodsViewController alloc]init];
        [self.navigationController pushViewController:confirm animated:YES];
    
    }else if ([btn.string isEqualToString:@"去评价"]){
    
    
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
