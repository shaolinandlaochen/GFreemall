//
//  BillingInfo.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "BillingInfo.h"
#import "ClearingInformationDisplayCell.h"
#import "BillingInfoNumberCell.h"
#import "paymentInformationView.h"
#import "PayRequest.h"
#import "ReplaceAPhoneNumberViewController.h"
#import "MyOrderViewController.h"
@interface BillingInfo ()<UITableViewDataSource,UITableViewDelegate,CancelTheViewDelegate>
{
    UITableView *_tableView;
}

@end

@implementation BillingInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"结算信息");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)CreatView{
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
     _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.section==0) {
        return 80*autoSizeScaleY;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    if (section==0) {
        return 100*autoSizeScaleY;
    }
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
  
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *view=[[UIView alloc]init];
    autoSize
    view.backgroundColor=[UIColor whiteColor];
    UIButton * _button=[UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    _button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    _button.backgroundColor=[UIColor blackColor];
    [_button addTarget:self action:@selector(onGoClick) forControlEvents:UIControlEventTouchUpInside];
    _button.layer.cornerRadius = 6*autoSizeScaleX;
    _button.layer.masksToBounds = 6*autoSizeScaleX;
    [view addSubview:_button];
    _button.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).bottomSpaceToView(view, 0*autoSizeScaleY);
    
    [_button setTitle:Localized(@"去支付") forState:UIControlStateNormal];
    
    
    return view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 2;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        BillingInfoNumberCell *cell=[BillingInfoNumberCell new];
        cell.userInteractionEnabled = NO;
        cell.lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        if (indexPath.row==0) {
            cell.name.text=Localized(@"订单号");
            cell.numbber.text=self.orderNumber;
            cell.numbber.textColor=[TheParentClass colorWithHexString:@"#292929"];
            
        }else if (indexPath.row==1){
            cell.name.text=Localized(@"订单金额");
            cell.numbber.text=[NSString stringWithFormat:@"¥%@",self.money];
            cell.numbber.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            
        }
        return cell;
  
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        //弹出支付信息
        if (indexPath.row==0) {
        [self PopUpThePaymentInformation:@"在线钱包"];
        
        }else if (indexPath.row==1){
       [self PopUpThePaymentInformation:@"爱积分支付"];
        }
       
        
    }
}
-(void)PopUpThePaymentInformation:(NSString *)str{
    
    
    paymentInformationView *pay=[[paymentInformationView alloc]init];
    pay.delegate=self;
    pay.were=str;
    pay.orderNumber=self.orderNumber;
    if ([str isEqualToString:@"在线钱包"]) {
        pay.money=self.money;
    }else{
    pay.money=@"";
    }
    
    pay.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:pay animated:YES completion:^{
        pay.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:.5];
    }];
    
    

}

//充值
-(void)oTop_UpGo{


}

//开始支付
-(void)BeginToPayPsw:(NSString *)pswString{
    if ([self.were isEqualToString:@"在线钱包"]) {
        [SVProgressHUD showWithStatus:Localized(@"正在支付")];
        [PayRequest OnlineWalletPaymentthird_pwd:pswString block:^(NSDictionary *dics) {
            NSDictionary *data=[self deleteEmpty:dics];
            if (![[data objectForKey:@"code"]isEqual:[NSNull null]]){
                NSString *code=[NSString stringWithFormat:@"%@",[data objectForKey:@"code"]];
                if (![[data objectForKey:@"msg"]isEqual:[NSNull null]]) {
                    NSString *msg=[NSString stringWithFormat:@"%@",[data objectForKey:@"msg"]];
                    if ([code isEqualToString:@"27"]) {
                        [FTIndicator showSuccessWithMessage:msg];
                        ReturnToSpecifyTheController(ShoppingCartViewController)
                        ReturnToSpecifyTheController(GoodsDetailsViewController)
                        ReturnToSpecifyTheController(MyOrderViewController)
                    }else{
                        [FTIndicator showErrorWithMessage:msg];
                    }
                    
                }
               
            
            }
          
            
            [SVProgressHUD dismiss];
        }];
    }else if ([self.were isEqualToString:@"爱积分支付"]){
        [SVProgressHUD showWithStatus:Localized(@"正在支付")];
        [PayRequest LovePointsToPaythird_pwd:pswString block:^(NSDictionary *dics) {
            NSDictionary *data=[self deleteEmpty:dics];
            if (![[data objectForKey:@"code"]isEqual:[NSNull null]]){
                NSString *code=[NSString stringWithFormat:@"%@",[data objectForKey:@"code"]];
                if (![[data objectForKey:@"msg"]isEqual:[NSNull null]]) {
                    NSString *msg=[NSString stringWithFormat:@"%@",[data objectForKey:@"msg"]];
                    if ([code isEqualToString:@"27"]) {
                        [FTIndicator showSuccessWithMessage:msg];
                        ReturnToSpecifyTheController(ShoppingCartViewController)
                        ReturnToSpecifyTheController(GoodsDetailsViewController)
                        ReturnToSpecifyTheController(MyOrderViewController)
                    }else{
                         [FTIndicator showErrorWithMessage:msg];
                    }

                }
                
               
            }
          
            
            [SVProgressHUD dismiss];
        }];
    }

}

//忘记支付密码
-(void)ForgotPassword{
    ReplaceAPhoneNumberViewController *ReplaceAPhoneNumber=[[ReplaceAPhoneNumberViewController alloc]init];
    ReplaceAPhoneNumber.were=@"安全验证";
    [self.navigationController pushViewController:ReplaceAPhoneNumber animated:YES];

}
//去支付
-(void)onGoClick{
[self PopUpThePaymentInformation:self.were];
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
