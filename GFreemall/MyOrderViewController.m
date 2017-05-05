//
//  MyOrderViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderCell.h"
#import "OrderNumberView.h"
#import "OrderButtonView.h"
#import "OrderViewS.h"
#import "OrderInformationViewController.h"
#import "MyOrderDetails.h"
#import "SubmitOrderRequest.h"
#import "OrderDetailsRequest.h"
#import "BillingInfo.h"
#import "ConfirmTheGoodsViewController.h"
@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource,OrderViewSDelegate>
{
    UITableView *_tableView;
    OrderViewS *_OrderView;
}

@end

@implementation MyOrderViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
    TheDrop_downRefresh(_tableView, @selector(RequestData))
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_tableView.mj_header endRefreshing];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"我的订单");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    
    leftCancel
    [self cartOrderView];
    
    
    // Do any additional setup after loading the view.
}
-(void)RequestData{
    if (self.OrderType==nil) {
        self.OrderType=@"all";
    }
    [SubmitOrderRequest ToObtainAListOrder:self.OrderType page:1 pageSize:200 block:^(NSDictionary *dics) {
        self.DataDic=[self deleteEmpty:dics];
        OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
        if ([class.code isEqualToString:@"51"]) {
            [[self.view viewWithTag:963]removeFromSuperview];
            [[self.view viewWithTag:564]removeFromSuperview];
            if (class.pagingList.resultList.count<1) {
                [self BuildNoOrderView];//没有订单
            }
            [_tableView reloadData];

            
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        
        [_tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    }];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 176*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 102*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 80*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
    OrderListResultList *list=class.pagingList.resultList[section];
    OrderNumberView *view=[[OrderNumberView alloc]init];
    
    view.strNumber.text=[NSString stringWithFormat:@"订单号:%.0f",list.orderSerial];
    if (list.orderState==0) {//未付款
        view.state.text=Localized(@"待付款");
        view.state.textColor=[UIColor redColor];
        
    }else if (list.orderState==1){//已付款未发货
        view.state.text=Localized(@"待发货");
        view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
    }else if (list.orderState==2){//已发货
        view.state.text=Localized(@"发货中");
        view.state.textColor=[TheParentClass colorWithHexString:@"#718247"];
    }else if (list.orderState==3){//已收货未评价
        view.state.text=Localized(@"待评价");
        view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
    }else if (list.orderState==4){//已收货已评价
        view.state.text=Localized(@"已完成");
        view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
    }else if (list.orderState==-1){//撤销
        view.state.text=Localized(@"已完成");
        view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
    }else if (list.orderState==-2){//平台撤销
        view.state.text=Localized(@"已完成");
        view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
    }else if (list.orderState==-3){//有退货
        view.state.text=Localized(@"已完成");
        view.state.textColor=[TheParentClass colorWithHexString:@"#e6671a"];
        
    }

    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
    OrderListResultList *list=class.pagingList.resultList[section];
    OrderButtonView *view=[[OrderButtonView alloc]init];
    view.btnOne.section=section;
    view.BtnTwo.section=section;
    [view.btnOne addTarget:self action:@selector(onOrderEventClick:) forControlEvents:UIControlEventTouchUpInside];
    [view.BtnTwo addTarget:self action:@selector(onOrderEventClick:) forControlEvents:UIControlEventTouchUpInside];
    view.list=list;

    return view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.DataDic!=nil) {
        OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
        if (class.pagingList.resultList.count>0) {
            return class.pagingList.resultList.count;
        }
    }
    return 0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
    OrderListResultList *list=class.pagingList.resultList[section];
    
    return list.commodity.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
    OrderListResultList *list=class.pagingList.resultList[indexPath.section];
    OrderListCommodity *Commodity =list.commodity[indexPath.row];
    OrderCell *cell=[OrderCell new];
    cell.Commodity=Commodity;
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,Commodity.commodityImagesPath,Commodity.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
  
    
    cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
    OrderListResultList *list=class.pagingList.resultList[indexPath.section];
    MyOrderDetails *MyOrder=[[MyOrderDetails alloc]init];
    MyOrder.serial=[NSString stringWithFormat:@"%.0f",list.orderSerial];
    [self.navigationController pushViewController:MyOrder animated:YES];

}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)cartOrderView{
autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _OrderView=[[OrderViewS alloc]init];
    if ([self.OrderType isEqualToString:@"all"]||self.OrderType==nil) {
        _OrderView.type=0;
    }else if ([self.OrderType isEqualToString:@"nopay"]){
         _OrderView.type=1;
    }else if ([self.OrderType isEqualToString:@"noreceiving"]){
        _OrderView.type=2;
    }else if ([self.OrderType isEqualToString:@"iscomment"]){
        _OrderView.type=3;
    }
    
    _OrderView.delegate=self;
    [self.view addSubview:_OrderView];
    _OrderView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height).heightIs(78*autoSizeScaleY);
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
     _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftEqualToView(_OrderView).topSpaceToView(_OrderView, 0).rightEqualToView(_OrderView).bottomSpaceToView(self.view, 0);
  

}
-(void)BuildNoOrderView{
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"无订单"];
    img.tag=963;
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 195*autoSizeScaleX).rightSpaceToView(self.view, 195*autoSizeScaleX).topSpaceToView(self.view, 500*autoSizeScaleY).heightIs(141*autoSizeScaleY);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.tag=564;
    lbl.text=Localized(@"您还没有相关订单");
    lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
    lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 10).heightIs(35*autoSizeScaleY);
    
    
}
-(void)OrderTypeSwitch:(NSInteger)idx{
    if (idx==1) {
        self.OrderType=@"all";
    }else if (idx==2){
        self.OrderType=@"nopay";
    }else if (idx==3){
        self.OrderType=@"noreceiving";
    }else if (idx==4){
        self.OrderType=@"iscomment";
    }
    [SVProgressHUD showWithStatus:Localized(@"loading")];
    [self RequestData];
}
//点击取消订单或者去支付或者收货或者评价
-(void)onOrderEventClick:(MyButton *)btn{
    
    
    OrderListBaseClass *class=[[OrderListBaseClass alloc]initWithDictionary:self.DataDic];
    OrderListResultList *list=class.pagingList.resultList[btn.section];
    if (btn.tag==1) {//
        if (list.orderState==0) {//未付款
            [SVProgressHUD showWithStatus:Localized(@"loading")];
            [OrderDetailsRequest OrderPaymentToJump:[NSString stringWithFormat:@"%.0f",list.orderSerial] block:^(NSDictionary *dics) {
                OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                if ([class.code isEqualToString:@"60"]) {
                    BillingInfo *Billing=[[BillingInfo alloc]init];
                    if (list.orderPayment==0) {
                        Billing.were=@"在线钱包";
                        Billing.orderNumber=[NSString stringWithFormat:@"%.0f",list.orderSerial];
                        Billing.money=[NSString stringWithFormat:@"%.2f",list.orderAmount];
                        [self.navigationController pushViewController:Billing animated:YES];

                    }else if (list.orderPayment==2){
                        Billing.were=@"爱积分支付";
                        Billing.orderNumber=[NSString stringWithFormat:@"%.0f",list.orderSerial];
                        Billing.money=[NSString stringWithFormat:@"%.2f",list.orderAmount];
                        [self.navigationController pushViewController:Billing animated:YES];

                    }else if (list.orderPayment==1){
                        [FTIndicator showInfoWithMessage:Localized(@"暂不支持该支付方式")];
                    }
                    
                }else{
                    [FTIndicator showErrorWithMessage:class.msg];
                }
                
                [SVProgressHUD dismiss];
            }];
            
            
            
            
        }else if (list.orderState==1){//已付款未发货
            
        }else if (list.orderState==2){//已发货
            [SVProgressHUD showWithStatus:Localized(@"loading")];
            [OrderDetailsRequest ConfirmTheGoods:[NSString stringWithFormat:@"%.0f",list.orderId] block:^(NSDictionary *dics) {
                OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                if ([class.code isEqualToString:@"57"]) {//收货完毕去评价订单列表
                    ConfirmTheGoodsViewController *confirm=[[ConfirmTheGoodsViewController alloc]init];
                    confirm.serial=[NSString stringWithFormat:@"%.0f",list.orderSerial];
                    confirm.ASuccess=@"成功";
                    [self.navigationController pushViewController:confirm animated:YES];
                }
                [FTIndicator showInfoWithMessage:class.msg];
                
                [SVProgressHUD dismiss];
                
            }];
            
        }else if (list.orderState==3){//已收货未评价
            
            ConfirmTheGoodsViewController *confirm=[[ConfirmTheGoodsViewController alloc]init];
            confirm.serial=[NSString stringWithFormat:@"%.0f",list.orderSerial];
            [self.navigationController pushViewController:confirm animated:YES];
            
        }else if (list.orderState==4){//已收货已评价
            
        }else if (list.orderState==-1){//撤销
            
        }else if (list.orderState==-2){//平台撤销
            
        }else if (list.orderState==-3){//有退货
            
            
        }
        
        
        
    }else if (btn.tag==2){//取订单
        [SVProgressHUD showWithStatus:Localized(@"loading")];
        [SubmitOrderRequest CancelTheOrderserial:[NSString stringWithFormat:@"%.0f",list.orderSerial] block:^(NSDictionary *dics) {
            OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            if ([class.code isEqualToString:@"56"]) {
                [SVProgressHUD showWithStatus:Localized(@"loading")];
                [self RequestData];
            }
            
            [FTIndicator showInfoWithMessage:class.msg];
            [SVProgressHUD dismiss];
        }];
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
