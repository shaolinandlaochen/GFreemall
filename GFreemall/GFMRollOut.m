//
//  GFMRollOut.m
//  GFreemall
//
//  Created by 123 on 2017/4/12.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GFMRollOut.h"
#import "RollOutTableViewCell.h"
#import "GFMConvertibleOutOfBalanceCell.h"
#import "MyButtonCell.h"
#import "WalletDetailsViewController.h"
@interface GFMRollOut ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;

}

@end

@implementation GFMRollOut

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"转出");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"转出记录") style:UIBarButtonItemStylePlain target:self action:@selector(onrightItemButtonClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
    [self.navigationItem.rightBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    [self CreatView];
    // Do any additional setup after loading the view.
}
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //_tableView.scrollEnabled=NO;
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.section==0) {
        return 326*autoSizeScaleY;
    }
    if (indexPath.section==1&&indexPath.row==4) {
        return 136*autoSizeScaleY;
    }
    return 96*autoSizeScaleY;
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
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 5;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section==0) {
        GFMConvertibleOutOfBalanceCell *cell=[GFMConvertibleOutOfBalanceCell new];
        cell.monryStr.text=@"61651616161";
        return cell;
        
    }else{
        if (indexPath.row==4) {
            MyButtonCell *cell=[MyButtonCell new];
            [cell.btn addTarget:self action:@selector(onButtonGGoClick) forControlEvents:UIControlEventTouchUpInside];
            return cell;
            
            
        }else{
            RollOutTableViewCell *cell=[RollOutTableViewCell new];
            if (indexPath.row==0) {
                cell.name.text=Localized(@"用户名");
                cell.tetfield.placeholder=Localized(@"请输入GFreetrade交易用户名");
            }else if (indexPath.row==1){
                cell.name.text=Localized(@"转账金额");
                cell.tetfield.placeholder=Localized(@"输入转出金额");
            }else if (indexPath.row==2){
                cell.name.text=Localized(@"资金密码");
                cell.tetfield.placeholder=Localized(@"输入资金密码");
            }else if (indexPath.row==3){
                autoSize
                cell.name.text=Localized(@"验证码");
                cell.tetfield.placeholder=Localized(@"输入手机验证码");
                [cell.CodeBtn setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
                [cell.CodeBtn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
                [cell.CodeBtn.layer setBorderWidth:1];
                [cell.CodeBtn.layer setMasksToBounds:YES];
                cell.CodeBtn.layer.cornerRadius = 6*autoSizeScaleX;
                cell.CodeBtn.layer.masksToBounds = 6*autoSizeScaleX;
                [cell.CodeBtn addTarget:self action:@selector(onGoCodeClick) forControlEvents:UIControlEventTouchUpInside];
            }
            
            return cell;
        }
        
    
      
    }

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
cancelClick
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
//转出记录
-(void)onrightItemButtonClick{
    WalletDetailsViewController *WalletDetails=[[WalletDetailsViewController alloc]init];
    WalletDetails.were=@"转出记录";
    [self.navigationController pushViewController:WalletDetails animated:YES];

}
//获取验证码
-(void)onGoCodeClick{

}
//确定
-(void)onButtonGGoClick{

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
