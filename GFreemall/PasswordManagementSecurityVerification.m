//
//  PasswordManagementSecurityVerification.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PasswordManagementSecurityVerification.h"
#import "BaseInputBoxCell.h"
#import "WalletRequestClass.h"
#import "PasswordManagement.h"
#import "BillingInfo.h"
@interface PasswordManagementSecurityVerification ()<UITableViewDataSource,UITableViewDelegate,BaseInputBoxDelegate>

{
    UITableView *_tableView;
    UIButton *_button;
    NSString *_psw;
     NSString *_Topsw;
}

@end

@implementation PasswordManagementSecurityVerification

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"设置支付密码");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
cancelClick
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 96*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    
    
    return 136*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    autoSize
    _button=[UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    _button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    _button.backgroundColor=[UIColor blackColor];
    [_button addTarget:self action:@selector(onGoClick:) forControlEvents:UIControlEventTouchUpInside];
    _button.layer.cornerRadius = 6*autoSizeScaleX;
    _button.layer.masksToBounds = 6*autoSizeScaleX;
    [view addSubview:_button];
    _button.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).bottomSpaceToView(view, 20*autoSizeScaleY);
    [_button setTitle:Localized(@"确定") forState:UIControlStateNormal];
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseInputBoxCell *cell=[BaseInputBoxCell new];
    cell.delegate=self;
    [cell.btn.layer setBorderColor:[UIColor clearColor].CGColor];
    cell.btn.indexPath=indexPath;
    cell.tf.indexPath=indexPath;
    cell.tf.secureTextEntry=YES;
    if (indexPath.row==0) {
        
        cell.tf.placeholder=Localized(@"支付密码");
        
    }else if (indexPath.row==1){
        cell.tf.placeholder=Localized(@"确认支付密码");
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

//确定或者下一步
-(void)onGoClick:(UIButton *)btn{
    if ([_psw length]<1||_psw==nil||[_Topsw length]<1||_Topsw==nil) {
        [FTIndicator showErrorWithMessage:Localized(@"请填写完整信息")];
    }else{
        [SVProgressHUD showWithStatus:Localized(@"loading")];
    [WalletRequestClass SetUpToPayThePassword:_psw validateCode:self.code block:^(NSDictionary *dic) {
        WalletBaseClass *class=[[WalletBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        [FTIndicator showInfoWithMessage:class.msg];
        [SVProgressHUD dismiss];
        ReturnToSpecifyTheController(PasswordManagement)//钱包进来
        ReturnToSpecifyTheController(BillingInfo)//正在支付界面进来的
    }];
    }
    
}
-(void)ToObtainInputBox:(MyTextField *)TextField{
    if (TextField.indexPath.row==0) {
        _psw=TextField.text;
    }else if (TextField.indexPath.row==1){
        _Topsw=TextField.text;
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
