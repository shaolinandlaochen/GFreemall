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
#import "ViewTheOrderDetailsButtonsView.h"
#import "OrderDetailsRequest.h"
#import "SubmitOrderRequest.h"
#import "BillingInfo.h"
#import "EvaluationOfTheViewViewController.h"
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
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    TheDrop_downRefresh(_tableView, @selector(QequestData))
}
//加载数据
-(void)QequestData{
[OrderDetailsRequest OrderDetails:self.serial block:^(NSDictionary *dics) {
    self.DataDic=[self deleteEmpty:dics];
    OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:self.DataDic];
    if ([class.code isEqualToString:@"51"]) {
        [_tableView reloadData];
    }else{
        [FTIndicator showErrorWithMessage:class.msg];
    }
    [_tableView.mj_header endRefreshing];
}];

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
            return 148*autoSizeScaleY;
        }
    }
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    if (section==3) {
        return 107*autoSizeScaleY;
    }
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
        OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:self.DataDic];
        OrderNumberView *view=[[OrderNumberView alloc]init];
        view.strNumber.text=[NSString stringWithFormat:@"订单号:%.0f",class.map.orderSerial];

        
        if (class.map.orderState==0) {//未付款
            view.state.text=Localized(@"待付款");
            view.state.textColor=[UIColor redColor];
            
        }else if (class.map.orderState==1){//已付款未发货
            view.state.text=Localized(@"待发货");
            view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
        }else if (class.map.orderState==2){//已发货
            view.state.text=Localized(@"发货中");
            view.state.textColor=[TheParentClass colorWithHexString:@"#718247"];
        }else if (class.map.orderState==3){//已收货未评价
            view.state.text=Localized(@"待评价");
            view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
        }else if (class.map.orderState==4){//已收货已评价
            view.state.text=Localized(@"已完成");
            view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
        }else if (class.map.orderState==-1){//撤销
            view.state.text=Localized(@"已完成");
            view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
        }else if (class.map.orderState==-2){//平台撤销
            view.state.text=Localized(@"已完成");
            view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
        }else if (class.map.orderState==-3){//有退货
            view.state.text=Localized(@"已完成");
            view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
            
        }
        return view;
    }
    

    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==3) {
        OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:self.DataDic];
        OrderButtonView *view=[[OrderButtonView alloc]init];
        [view.btnOne addTarget:self action:@selector(onButtonOneCLIck:) forControlEvents:UIControlEventTouchUpInside];
        [view.BtnTwo addTarget:self action:@selector(onButtonOneCLIck:) forControlEvents:UIControlEventTouchUpInside];
        view.map=class.map;
        view.line.backgroundColor=[UIColor whiteColor];

        return view;
    }
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.DataDic!=nil) {
        return 4;
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:self.DataDic];
    if (section==0) {
        return class.map.commodity.count;
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
    if (self.DataDic!=nil) {
        OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:self.DataDic];
       
        if (indexPath.section==0) {
             OrderDetailsCommodity *Commodity=class.map.commodity[indexPath.row];
            //商品
            OrderCell *cell=[OrderCell new];
            cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
            cell.Commodity=class.map.commodity[indexPath.row];
            [cell.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,Commodity.commodityImagesPath,Commodity.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
            return cell;
        }else if (indexPath.section==1){
            //收货地址
            OrderAddressCell *cell=[OrderAddressCell new];
            cell.userInteractionEnabled=NO;
            cell.strings=[NSString stringWithFormat:@"%@    %@",class.map.addressName,class.map.addressPhone];
            NSString *country=class.map.addressCountry;
            if ([class.map.addressCountry isEqualToString:@"China"]) {
                country=@"中国";
            }
            cell.addressString=[NSString stringWithFormat:@"%@ %@ %@ %@ %@",country,class.map.addressProvince,class.map.addressCity,class.map.addressArea,class.map.addressAddress];
            return cell;
            
        }else if (indexPath.section==2){
            if (indexPath.row==0) {//支付方式
                PaymentToShowCell *cell=[PaymentToShowCell new];
                cell.userInteractionEnabled=NO;
                cell.context.text=Localized(@"支付方式");
                if (class.map.orderPayment==0) {
                     cell.name.text=Localized(@"在线钱包");
                }else if (class.map.orderPayment==1){
                     cell.name.text=Localized(@"第三方付款");
                }else if (class.map.orderPayment==2){
                     cell.name.text=Localized(@"爱积分支付");
                }
               
                return cell;
            }else if (indexPath.row==1){//配送信息
                ShippingInformationTableViewCell *cell=[ShippingInformationTableViewCell new];
                cell.userInteractionEnabled=NO;
                cell.name.text=class.map.orderLogCompany;
                cell.numberString.text=[NSString stringWithFormat:@"快递单号:%@",class.map.orderLogOrder];
                return cell;
                
            }
            
        }else if (indexPath.section==3){
            if (indexPath.row==0) {//运费以及商品金额
                OrderAmountDetailCell *cell=[OrderAmountDetailCell new];
                cell.userInteractionEnabled=NO;
                cell.AmountOfGoods.text=[NSString stringWithFormat:@"¥%.2f",class.map.orderAmount-class.map.orderFreight];
                cell.freight.text=[NSString stringWithFormat:@"¥%.2f",class.map.orderFreight];
                return cell;
            }else if (indexPath.row==1){//实付款
                MoneyAnTimeCell *cell=[MoneyAnTimeCell new];
                cell.userInteractionEnabled=NO;
                cell.money.text=[NSString stringWithFormat:@"¥%.2f",class.map.orderAmount];
                
                cell.time.text=[NSString stringWithFormat:@"下单时间:%@",class.map.orderTime];
                return cell;
            }
        }
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
     _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//点击去支付等按钮执行
-(void)onButtonOneCLIck:(MyButton *)btn{
    
    OrderDetailsBaseClass *classData=[[OrderDetailsBaseClass alloc]initWithDictionary:self.DataDic];
    if (btn.tag==1) {//
        
        if (classData.map.orderState==0) {//未付款
            [SVProgressHUD showWithStatus:Localized(@"loading")];
            [OrderDetailsRequest OrderPaymentToJump:[NSString stringWithFormat:@"%.0f",classData.map.orderSerial] block:^(NSDictionary *dics) {
                OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                if ([class.code isEqualToString:@"60"]) {
                    BillingInfo *Billing=[[BillingInfo alloc]init];
                    if (classData.map.orderPayment==0) {
                        Billing.were=@"在线钱包";
                        Billing.orderNumber=[NSString stringWithFormat:@"%.0f",classData.map.orderSerial];
                        Billing.money=[NSString stringWithFormat:@"%.2f",classData.map.orderAmount];
                        [self.navigationController pushViewController:Billing animated:YES];
                    }else if (classData.map.orderPayment==2){
                        Billing.were=@"爱积分支付";
                        Billing.orderNumber=[NSString stringWithFormat:@"%.0f",classData.map.orderSerial];
                        Billing.money=[NSString stringWithFormat:@"%.2f",classData.map.orderAmount];
                        [self.navigationController pushViewController:Billing animated:YES];
                    }else if (classData.map.orderPayment==1){
                        [FTIndicator showInfoWithMessage:Localized(@"暂不支持该支付方式")];
                    }
                   
                }else{
                    [FTIndicator showErrorWithMessage:class.msg];
                }
                
                [SVProgressHUD dismiss];
            }];
            
            

            
        }else if (classData.map.orderState==1){//已付款未发货

        }else if (classData.map.orderState==2){//已发货
            [SVProgressHUD showWithStatus:Localized(@"loading")];
            [OrderDetailsRequest ConfirmTheGoods:self.serial block:^(NSDictionary *dics) {
                OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                if ([class.code isEqualToString:@"57"]) {//收货完毕去评价订单列表
                    ConfirmTheGoodsViewController *confirm=[[ConfirmTheGoodsViewController alloc]init];
                    confirm.serial=self.serial;
                    confirm.ASuccess=@"成功";
                    [self.navigationController pushViewController:confirm animated:YES];
                }
                [FTIndicator showInfoWithMessage:class.msg];
                
                [SVProgressHUD dismiss];
                
            }];
          
        }else if (classData.map.orderState==3){//已收货未评价
            ConfirmTheGoodsViewController *confirm=[[ConfirmTheGoodsViewController alloc]init];
            confirm.serial=self.serial;
            [self.navigationController pushViewController:confirm animated:YES];
          
        }else if (classData.map.orderState==4){//已收货已评价
           
        }else if (classData.map.orderState==-1){//撤销
           
        }else if (classData.map.orderState==-2){//平台撤销
           
        }else if (classData.map.orderState==-3){//有退货
            
            
        }
        
        
        
    }else if (btn.tag==2){//取订单
        [SVProgressHUD showWithStatus:Localized(@"loading")];
     [SubmitOrderRequest CancelTheOrderserial:[NSString stringWithFormat:@"%.0f",classData.map.orderSerial] block:^(NSDictionary *dics) {
         OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
         if ([class.code isEqualToString:@"56"]) {
             [self.navigationController popViewControllerAnimated:YES];
         }
    
         [FTIndicator showInfoWithMessage:class.msg];
         [SVProgressHUD dismiss];
     }];
    }
    
    
    
    
    
    
    
//    if ([btn.string isEqualToString:@"去支付"]) {
//        BillingInfo *Billing=[[BillingInfo alloc]init];
//        [self.navigationController pushViewController:Billing animated:YES];
//    }else if ([btn.string isEqualToString:@"确认收货"]){
//        ConfirmTheGoodsViewController *confirm=[[ConfirmTheGoodsViewController alloc]init];
//        [self.navigationController pushViewController:confirm animated:YES];
//    
//    }else if ([btn.string isEqualToString:@"去评价"]){
//    
//    
//    }

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
