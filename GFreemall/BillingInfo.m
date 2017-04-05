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
    }else if (indexPath.section==1){
        return 110*autoSizeScaleY;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    if (section==0) {
        return 20*autoSizeScaleY;
    }
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==1) {
        return 80*autoSizeScaleY;
    }
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        autoSize
        UIView *view=[[UIView alloc]init];
        UILabel *lbl=[[UILabel alloc]init];
        lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
        lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
        lbl.text=Localized(@"选择支付方式");
        [view addSubview:lbl];
        lbl.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 0).bottomSpaceToView(view, 0).rightSpaceToView(view, 0);
        
        
        UILabel *line=[[UILabel alloc]init];
        line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        [view addSubview:line];
        line.sd_layout.leftSpaceToView(view, 0).bottomSpaceToView(view, 0).rightSpaceToView(view, 0).heightIs(0.6);
        
        return view;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else{
        return 2;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        BillingInfoNumberCell *cell=[BillingInfoNumberCell new];
        cell.userInteractionEnabled = NO;
        cell.lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        if (indexPath.row==0) {
            cell.name.text=Localized(@"订单号");
            cell.numbber.text=@"646465464646464";
            cell.numbber.textColor=[TheParentClass colorWithHexString:@"#292929"];
            
        }else if (indexPath.row==1){
            cell.name.text=Localized(@"订单金额");
            cell.numbber.text=@"¥56461";
            cell.numbber.textColor=[TheParentClass colorWithHexString:@"#de0024"];
            
        }
        return cell;
    }else{
        
        ClearingInformationDisplayCell *cell=[ClearingInformationDisplayCell new];
         cell.lines.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
        if (indexPath.row==0) {
            cell.icon.image=[UIImage imageNamed:@"icon_gfm22"];
            cell.name.text=@"爱积分支付";
        }else if (indexPath.row==1){
            cell.name.text=@"在线钱包";
            cell.icon.image=[UIImage imageNamed:@"payment_wallet"];
        }
        return cell;
    }
    
    
    return nil;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        //弹出支付信息
        if (indexPath.row==0) {
        [self PopUpThePaymentInformation:@"爱积分支付"];
        }else if (indexPath.row==1){
         [self PopUpThePaymentInformation:@"在线钱包"];
        }
       
        
    }
}
-(void)PopUpThePaymentInformation:(NSString *)str{
    paymentInformationView *pay=[[paymentInformationView alloc]init];
    pay.delegate=self;
    pay.view.tag=987;
    pay.were=str;
    [self.view addSubview:pay.view];
    pay.view.frame=self.view.frame;
    [self addChildViewController:pay];
}
//点击叉号代理
-(void)CancelTheView{
    [[self.view viewWithTag:987]removeFromSuperview];
}
//充值
-(void)oTop_UpGo{


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
