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
#import "ClearingInformationDisplayCell.h"
@interface OrderInformationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *_Button;
    UILabel *_money;
    NSInteger MethodOfPayment;
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
    MethodOfPayment=0;
    leftCancel
    if (self.dataDic!=nil) {
         [self CreatView];
    }
   
    // Do any additional setup after loading the view.
}
//构建视图
-(void)CreatView{
    autoSize
    ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:self.dataDic];
   
    ShoppingSettlementMapAddress *address=class.mapAddress;
    self.address_address=address.addressAddress;
    self.address_area=address.addressArea;
    self.address_city=address.addressCity;
    self.address_country=address.addressCountry;
    self.address_isdefault=address.addressIsdefault;
    self.address_name=address.addressName;
    self.address_phone=address.addressPhone;
    self.address_province=address.addressProvince;
    self.address_zipcode=address.addressZipcode;
    
    
    
    
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
    return 110*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==3) {
        return 80*autoSizeScaleY;
    }
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==3) {
        autoSize
        UIView *view=[[UIView alloc]init];
        view.backgroundColor=[UIColor whiteColor];
        
        UILabel *lbl=[[UILabel alloc]init];
        lbl.text=Localized(@"选择支付方式");
        lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        [view addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 0).bottomSpaceToView(view, 0).widthIs(200);
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [view addSubview:line];
        line.sd_layout.leftSpaceToView(view, 0).rightSpaceToView(view, 0).bottomSpaceToView(view, 0).heightIs(1);
        
        
        return view;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 2;
    }else if (section==2){
        return 1;
    }else if (section==3){
        return 3;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:self.dataDic];
    if (indexPath.section==0) {
        OrderAddressCell *cell=[ OrderAddressCell new];
        if ([self.address_name length]>0) {
            if (self.address_isdefault==1) {
                cell.defaultStr.text=@"默认";
                cell.defaultStr.backgroundColor=[UIColor redColor];
            }
            cell.strings=[NSString stringWithFormat:@"%@     %@",self.address_name,self.address_phone];
            cell.context.text=[NSString stringWithFormat:@"%@%@%@%@",self.address_province,self.address_city,self.address_area,self.address_address];
            
        }
       
        cell.go.image=[UIImage imageNamed:@"icon_right"];
        cell.img_line.image=[UIImage imageNamed:@"jiesuan_line"];
        return cell;
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            OrdersForGoodsListCell *cell=[OrdersForGoodsListCell new];
            cell.dic=self.dataDic;
            return cell;
        }else if (indexPath.row==1){
            OrderLogisticsCell *cell=[OrderLogisticsCell new];
             cell.userInteractionEnabled = NO;
            return cell;
        }
    
    }else if (indexPath.section==2){
        OrderMoneyCell *cell=[OrderMoneyCell new];
        cell.picOne.text=[NSString stringWithFormat:@"¥%.2f",class.amountTotal];
        cell.picTwo.text=[NSString stringWithFormat:@"¥%.2f",class.freight];
         cell.userInteractionEnabled = NO;
        
        return cell;
    }else if (indexPath.section==3){
        ClearingInformationDisplayCell *cell=[ClearingInformationDisplayCell new];
        cell.lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        if (indexPath.row==MethodOfPayment) {

            cell.go.image=[UIImage imageNamed:@"icon_selected"];
        }
        
        if (indexPath.row==0) {
            cell.icon.image=[UIImage imageNamed:@"icon_gfm22"];
            cell.name.text=@"爱积分支付";
        }else if (indexPath.row==1){
            cell.name.text=@"在线钱包";
            cell.icon.image=[UIImage imageNamed:@"payment_wallet"];
        }else if (indexPath.row==2){
            cell.icon.image=[UIImage imageNamed:@"payment_online"];
            cell.name.text=@"在线支付";
        }
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
    }else if (indexPath.section==3){
        MethodOfPayment=indexPath.row;
        [_tableView reloadData];
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
     ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:self.dataDic];
    _money.text=[NSString stringWithFormat:@"支付金额:¥%.2f",class.amountTotal];
    

}
//提交订单
-(void)onSubmitOrdersClick{
    
    
    BillingInfo *Billing=[[BillingInfo alloc]init];
    if (MethodOfPayment==0) {
        Billing.were=@"爱积分支付";
    }else if (MethodOfPayment==1){
    Billing.were=@"在线钱包";
    }else if (MethodOfPayment==2){
    Billing.were=@"在线支付";
    }
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
