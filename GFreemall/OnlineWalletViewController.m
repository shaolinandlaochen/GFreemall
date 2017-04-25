//
//  OnlineWalletViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "OnlineWalletViewController.h"
#import "SetUpCell.h"
#import "WalletBalanceDisplayCell.h"
#import "PasswordManagement.h"
#import "WalletDetailsViewController.h"//钱包明细
#import "WalletRequestClass.h"
@interface OnlineWalletViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation OnlineWalletViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
    TheDrop_downRefresh(_tableView, @selector(RequestData))
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    autoSize
    self.title=Localized(@"在线钱包");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    
    // Do any additional setup after loading the view.
}
-(void)RequestData{
[WalletRequestClass  walletBalanceQueryblock:^(NSDictionary *dic) {
    
    WalletBaseClass *class=[[WalletBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
    if ([class.code isEqualToString:@"16"]) {
        self.dataDic=[self deleteEmpty:dic];
        [_tableView reloadData];
    }else{
        [FTIndicator showErrorWithMessage:class.msg];
    }
    
    [_tableView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}];
}
cancelClick
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled=NO;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.row==0) {
        return 326*autoSizeScaleY;
    }
    return 96*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize

    return 0;
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
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       WalletBaseClass *class=[[WalletBaseClass alloc]initWithDictionary:self.dataDic];
    if (indexPath.row==0) {
        WalletBalanceDisplayCell *cell=[WalletBalanceDisplayCell new];
        cell.pirce.text=[NSString stringWithFormat:@"¥%.2f",class.cremain];
        [cell.button addTarget:self action:@selector(onMoneyClick) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }else{
        SetUpCell *cell=[SetUpCell new];
        
        cell.img.image=[UIImage imageNamed:@"icon_right"];
        if (indexPath.row==1) {
           cell.name.text=Localized(@"充值记录");
        }else if (indexPath.row==2){
        cell.name.text=Localized(@"钱包明细");
        }else if (indexPath.row==3){
        cell.name.text=Localized(@"密码管理");
        }
        
        return cell;
    }
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==1) {
        WalletDetailsViewController *WalletDetails=[[WalletDetailsViewController alloc]init];
        WalletDetails.were=@"充值记录";
        WalletDetails.urlString=@"querycrecharge";
        [self.navigationController pushViewController:WalletDetails animated:YES];
    }else if (indexPath.row==2){//钱包明细
        WalletDetailsViewController *WalletDetails=[[WalletDetailsViewController alloc]init];
        WalletDetails.were=@"钱包明细";
        WalletDetails.urlString=@"querycdetail";
        [self.navigationController pushViewController:WalletDetails animated:YES];
    
    }else if (indexPath.row==3){//密码管理
        PasswordManagement *Password=[[PasswordManagement alloc]init];
        [self.navigationController pushViewController:Password animated:YES];
    }
    
}

//充值
-(void)onMoneyClick{

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
