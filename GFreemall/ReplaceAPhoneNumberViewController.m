//
//  ReplaceAPhoneNumberViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ReplaceAPhoneNumberViewController.h"
#import "BaseInputBoxCell.h"
#import "MailNextViewController.h"
@interface ReplaceAPhoneNumberViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
    UIButton *_button;
}

@end

@implementation ReplaceAPhoneNumberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(self.were);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
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
    if (section==0) {
        if ([self.were isEqualToString:@"更换手机号"]) {
            return 20*autoSizeScaleY;
        }else{
            return 136*autoSizeScaleY;
            
        }
    }else if (section==1){
        if ([self.were isEqualToString:@"更换手机号"]) {
            return 136*autoSizeScaleY;
        }
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self.were isEqualToString:@"更换手机号"]) {
        return 2;
    }else if ([self.were isEqualToString:@"绑定手机号"]||[self.were isEqualToString:@"更换邮箱"]||[self.were isEqualToString:@"实名认证"]||[self.were isEqualToString:@"用户名设置"]){
        return 1;
    }
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    autoSize
    if (section==0) {
        if (![self.were isEqualToString:@"更换手机号"]) {
            _button=[UIButton buttonWithType:UIButtonTypeCustom];
            [_button setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
            _button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
            _button.backgroundColor=[UIColor blackColor];
            [_button addTarget:self action:@selector(onGoClick:) forControlEvents:UIControlEventTouchUpInside];
            _button.layer.cornerRadius = 6*autoSizeScaleX;
            _button.layer.masksToBounds = 6*autoSizeScaleX;
            [view addSubview:_button];
            _button.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).bottomSpaceToView(view, 20*autoSizeScaleY);
            if ([self.were isEqualToString:@"绑定手机号"]||[self.were isEqualToString:@"实名认证"]||[self.were isEqualToString:@"用户名设置"]) {
                [_button setTitle:Localized(@"确定") forState:UIControlStateNormal];
            }else if ([self.were isEqualToString:@"更换邮箱"]||[self.were isEqualToString:@"邮箱绑定"]){
             [_button setTitle:Localized(@"下一步") forState:UIControlStateNormal];
            }
            
            
        }
    }else if (section==1){
        if ([self.were isEqualToString:@"更换手机号"]) {
            _button=[UIButton buttonWithType:UIButtonTypeCustom];
            [_button setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
            _button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
            _button.backgroundColor=[UIColor blackColor];
            [_button addTarget:self action:@selector(onGoClick:) forControlEvents:UIControlEventTouchUpInside];
            _button.layer.cornerRadius = 6*autoSizeScaleX;
            _button.layer.masksToBounds = 6*autoSizeScaleX;
            [_button setTitle:Localized(@"确定") forState:UIControlStateNormal];
            [view addSubview:_button];
            _button.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).bottomSpaceToView(view, 20*autoSizeScaleY);
            
        }
    }
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.were isEqualToString:@"更换手机号"]||[self.were isEqualToString:@"绑定手机号"]||[self.were isEqualToString:@"更换邮箱"]||[self.were isEqualToString:@"实名认证"]) {
        return 2;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseInputBoxCell *cell=[BaseInputBoxCell new];
    [cell.btn.layer setBorderColor:[UIColor clearColor].CGColor];
    cell.btn.indexPath=indexPath;
    cell.tf.indexPath=indexPath;
    if ([self.were isEqualToString:@"更换手机号"]) {
        
        if (indexPath.section==0) {
            if (indexPath.row==0) {
                cell.tf.userInteractionEnabled = NO;
                cell.tf.text=@"原手机号码:123456789";
                [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
                [cell.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                
            }else if (indexPath.row==1){
                cell.tf.placeholder=Localized(@"请输入手机验证码");
            }
        
        }else if (indexPath.section==1){
            if (indexPath.row==0) {
                 cell.tf.placeholder=Localized(@"请输入新手机号");
                [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
                [cell.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                
            }else if (indexPath.row==1){
                cell.tf.placeholder=Localized(@"请输入手机验证码");
               
                
            }
        
        }
        
    }else if ([self.were isEqualToString:@"绑定手机号"]){
        if (indexPath.row==0) {
            cell.tf.placeholder=Localized(@"请输入手机号");
            [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
            [cell.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
            [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (indexPath.row==1){
            cell.tf.placeholder=Localized(@"请输入手机验证码");
            
            
        }
        
    
    }else if ([self.were isEqualToString:@"更换邮箱"]){
        
        if (indexPath.row==0) {
            cell.tf.text=@"账户:707144471@qq.com";
            [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
            [cell.btn setTitle:@"获取验证码" forState:UIControlStateNormal];
            [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (indexPath.row==1){
            cell.tf.placeholder=Localized(@"请输入验证码");
            
            
        }
    
    }else if ([self.were isEqualToString:@"实名认证"]){
        if (indexPath.row==0) {
         cell.tf.placeholder=Localized(@"请输入真实姓名");
            
        }else if (indexPath.row==1){
            cell.tf.placeholder=Localized(@"请输入证件号号码");
            
            
        }
    
    }else if ([self.were isEqualToString:@"用户名设置"]){
        cell.tf.placeholder=Localized(@"请输入您要设置的用户名");
    }else if ([self.were isEqualToString:@"邮箱绑定"]){
        cell.tf.placeholder=Localized(@"请输入邮箱账号");
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
   
    
}
//点击获取验证码
-(void)onButtonClick:(MyButton *)btnn{

}
//确定或者下一步
-(void)onGoClick:(UIButton *)btn{
    
    if ([self.were isEqualToString:@"邮箱绑定"]) {
        MailNextViewController *mailNext=[[MailNextViewController alloc]init];
        [self.navigationController pushViewController:mailNext animated:YES];
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
