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
#import "SetThPasswordAgainViewController.h"
#import "PasswordManagementSecurityVerification.h"
#import "TheBasicInformationRequest.h"
#import "CountryCodeViewController.h"
#import "LoginRequuestClass.h"
@interface ReplaceAPhoneNumberViewController ()<UITableViewDataSource,UITableViewDelegate,BaseInputBoxDelegate,CountryCodeDelegate>

{
    UITableView *_tableView;
    UIButton *_button;
    NSString *_nameString;//名字
    NSString *_IdentityDocumentNumber;//证件号码
    NSString *_originalPayThePassword;//原支付密码
    NSString *_newPassword;//原支付密码
    NSString *_ToNewPassword;//原支付密码
    NSString *_codeString;
    NSString *_phoneString;
    NSString *_codeTitle;
    NSTimer *timer;//定时器
    NSInteger seconds;
    NSArray *_CountriesArray;//装有国家名称
    NSArray *_CountriesNumberArray;//装有国家编码
    NSInteger _ChooseTheCountr;
    NSString *_Psw;//交易密码设置
    NSString *_ToPsw;//交易密码设置
    NSString *_email;//邮箱
    
    
}

@end

@implementation ReplaceAPhoneNumberViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
    if ([self.were isEqualToString:@"安全验证"]) {
        [self GetAPhoneNumber];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(self.were);
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    _ChooseTheCountr=0;//默认中国
    //国家名称
    _CountriesArray=@[@"中国",@"中国香港",@"中国澳门",@"中国台湾",@"America",@"Singapore",@"Vietnam",@"Korea",@"Malaysia",@"Thailand",@"Indonesia",@"Philippines"];
    _CountriesNumberArray=@[@"86",@"852",@"853",@"886",@"1",@"65",@"84",@"82",@"60",@"66",@"62",@"63"];
    _codeTitle=@"获取验证码";
    [self CreatView];
    // Do any additional setup after loading the view.
}
//获取手机号
-(void)GetAPhoneNumber{
    [SVProgressHUD showWithStatus:Localized(@"正在获取手机号码")];
[TheBasicInformationRequest GetAPhoneNumber:^(NSDictionary *disa) {
    NSDictionary *data=[self deleteEmpty:disa];
    if ([[NSString stringWithFormat:@"%@",[data objectForKey:@"code"]] isEqualToString:@"30"]) {
        _phoneString=[NSString stringWithFormat:@"%@",[data objectForKey:@"phone"]];
    }
    [_tableView reloadData];
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
    return 20*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if ([self.were isEqualToString:@"更换手机号"]) {
        return 2;
    }else if ([self.were isEqualToString:@"绑定手机号"]||[self.were isEqualToString:@"更换邮箱"]||[self.were isEqualToString:@"实名认证"]||[self.were isEqualToString:@"用户名设置"]||[self.were isEqualToString:@"交易密码设置"]||[self.were isEqualToString:@"忘记密码"]||[self.were isEqualToString:@"修改支付密码"]||[self.were isEqualToString:@"安全验证"]){
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
            if ([self.were isEqualToString:@"绑定手机号"]||[self.were isEqualToString:@"实名认证"]||[self.were isEqualToString:@"用户名设置"]||[self.were isEqualToString:@"修改支付密码"]) {
                [_button setTitle:Localized(@"确定") forState:UIControlStateNormal];
            }else if ([self.were isEqualToString:@"更换邮箱"]||[self.were isEqualToString:@"邮箱绑定"]||[self.were isEqualToString:@"忘记密码"]||[self.were isEqualToString:@"安全验证"]){
             [_button setTitle:Localized(@"下一步") forState:UIControlStateNormal];
            }else if ([self.were isEqualToString:@"交易密码设置"]){
             [_button setTitle:Localized(@"提交登录") forState:UIControlStateNormal];
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
    if ([self.were isEqualToString:@"更换手机号"]||[self.were isEqualToString:@"绑定手机号"]||[self.were isEqualToString:@"更换邮箱"]||[self.were isEqualToString:@"实名认证"]||[self.were isEqualToString:@"交易密码设置"]||[self.were isEqualToString:@"忘记密码"]||[self.were isEqualToString:@"安全验证"]) {
        return 2;
    }else if ([self.were isEqualToString:@"修改支付密码"]){
        return 3;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseInputBoxCell *cell=[BaseInputBoxCell new];
    cell.delegate=self;
    [cell.btn.layer setBorderColor:[UIColor clearColor].CGColor];
    cell.btn.indexPath=indexPath;
    cell.tf.indexPath=indexPath;
    if ([self.were isEqualToString:@"更换手机号"]) {
        
        if (indexPath.section==0) {
            if (indexPath.row==0) {
                cell.tf.userInteractionEnabled = NO;
                cell.tf.text=Localized(@"原手机号码:123456789");
                [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
                [cell.btn setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
                [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                
            }else if (indexPath.row==1){
                cell.tf.placeholder=Localized(@"请输入手机验证码");
            }
        
        }else if (indexPath.section==1){
            if (indexPath.row==0) {
                 cell.tf.placeholder=Localized(@"请输入新手机号");
                [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
                [cell.btn setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
                [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                
            }else if (indexPath.row==1){
                cell.tf.placeholder=Localized(@"请输入手机验证码");
               
                
            }
        
        }
        
    }else if ([self.were isEqualToString:@"绑定手机号"]){
        if (indexPath.row==0) {
            cell.tf.placeholder=Localized(@"请输入手机号");
            [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
            [cell.btn setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
            [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (indexPath.row==1){
            cell.tf.placeholder=Localized(@"请输入手机验证码");
            
            
        }
        
    
    }else if ([self.were isEqualToString:@"更换邮箱"]){
        
        if (indexPath.row==0) {
            cell.tf.text=@"账户:707144471@qq.com";
            [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
            [cell.btn setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
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
    }else if ([self.were isEqualToString:@"交易密码设置"]){
        cell.tf.secureTextEntry=YES;
        if (indexPath.row==0) {
            cell.tf.placeholder=Localized(@"请输入您的账户交易密码");
        }else if (indexPath.row==1){
        cell.tf.placeholder=Localized(@"请再次输入您的账户交易密码");
        }
    
    }else if ([self.were isEqualToString:@"忘记密码"]){
        if (indexPath.row==0) {
            self.delegate=cell;
            [cell.CHOOSE addTarget:self action:@selector(onChooseTheCountryCodeClick) forControlEvents:UIControlEventTouchUpInside];
            
            cell.stringBtnTitle=_CountriesArray[_ChooseTheCountr];
            cell.tf.placeholder=Localized(@"请输入手机号");
            [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
            [cell.btn setTitle:_codeTitle forState:UIControlStateNormal];
            [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }else if (indexPath.row==1){
            cell.tf.placeholder=Localized(@"请输入手机验证码");
            
            
        }
    }else if ([self.were isEqualToString:@"修改支付密码"]){
        cell.tf.secureTextEntry=YES;
        if (indexPath.row==0) {
        cell.tf.placeholder=Localized(@"原支付密码");
        }else if (indexPath.row==1){
        cell.tf.placeholder=Localized(@"新支付密码");
        }else if (indexPath.row==2){
        cell.tf.placeholder=Localized(@"确认支付密码");
        }
    }else if ([self.were isEqualToString:@"安全验证"]){
      
        if (indexPath.row==0) {
              self.delegate=cell;
            if (_phoneString!=nil) {
              
                if ([_phoneString length]>10) {
                    NSString *stringOne = [_phoneString substringToIndex:5];//截取掉下标7之后的字符串
                    // NSLog(@"截取的值为：%@",string);
                    NSString *stringtwo=[_phoneString substringFromIndex:9];//截取掉下标2之前的字符串
                    //NSLog(@"截取的值为：%@",string);
                    cell.tf.text=[NSString stringWithFormat:@"%@****%@",stringOne,stringtwo];
                }else{
                      cell.tf.text=_phoneString;
                }
                
            }
            cell.tf.userInteractionEnabled = NO;
            [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
            [cell.btn setTitle:_codeTitle forState:UIControlStateNormal];
            [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }else if (indexPath.row==1){
         cell.tf.placeholder=Localized(@"请输入手机验证码");
        }
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
//点击获取验证码
-(void)onButtonClick:(MyButton *)btnn{
    if ([self.were isEqualToString:@"安全验证"]) {
        [SVProgressHUD showWithStatus:Localized(@"loading")];
        [TheBasicInformationRequest GetVerificationCodeblock:^(NSDictionary *disa) {
            BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
            if ([class.code isEqualToString:@"21"]) {
                seconds=[[NSString stringWithFormat:@"%@",[[self deleteEmpty:disa]objectForKey:@"time"]]integerValue];
                //获取验证码成功
                [timer invalidate];
                timer = nil;
                timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
            }
            [FTIndicator showInfoWithMessage:class.msg];
            [SVProgressHUD dismiss];
        }];
    }else if([self.were isEqualToString:@"忘记密码"]){
        if ([_phoneString length]<1) {
            [FTIndicator showInfoWithMessage:Localized(@"请输入手机号码")];
        }else{
            
            NSString *string;
            string=[TheParentClass country:_CountriesArray[_ChooseTheCountr]];
          
            
            [SVProgressHUD showWithStatus:Localized(@"loading")];
        [TheBasicInformationRequest LoginRegistrationVerificationCodecountry:string phone:_phoneString type:@"pwd" block:^(NSDictionary *disa) {
            BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
            if ([class.code isEqualToString:@"21"]) {
                seconds=[[NSString stringWithFormat:@"%@",[[self deleteEmpty:disa]objectForKey:@"time"]]integerValue];
                //获取验证码成功
                [timer invalidate];
                timer = nil;
                timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action) userInfo:nil repeats:YES];
            }
            [FTIndicator showInfoWithMessage:class.msg];
            [SVProgressHUD dismiss];

        }];
        
        }
    
    }

}
-(void)action{
   
    if (seconds>0) {
        seconds-=1;
        _codeTitle=[NSString stringWithFormat:@"%lds",seconds];
        [_delegate ButtonTitleString:_codeTitle];
    }else{
        _codeTitle=@"获取验证码";
        [_delegate ButtonTitleString:_codeTitle];
        [timer invalidate];
        timer = nil;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [timer invalidate];
    timer = nil;
}
-(void)dealloc{
    [timer invalidate];
    timer = nil;
}
//确定或者下一步
-(void)onGoClick:(UIButton *)btn{
    
    if ([self.were isEqualToString:@"邮箱绑定"]) {//
        if ([_email length]<1) {
            [FTIndicator showErrorWithMessage:Localized(@"请输入邮箱账号")];
        }else{
            BOOL isEmail=[self validateEmail:_email];
            if (isEmail) {
                [SVProgressHUD showWithStatus:Localized(@"loading")];
                [TheBasicInformationRequest QueryWhetherEmailAlreadyExistsbase_email:_email block:^(NSDictionary *disa) {
                    BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
                    if ([class.code isEqualToString:@"69"]) {
                        MailNextViewController *mailNext=[[MailNextViewController alloc]init];
                        mailNext.email=_email;
                        [self.navigationController pushViewController:mailNext animated:YES];
                    }else{
                        [FTIndicator showErrorWithMessage:class.msg];
                    }
                    
                    [SVProgressHUD dismiss];
                }];
            }else{
             [FTIndicator showErrorWithMessage:Localized(@"邮箱格式错误,请正确输入邮箱!")];
            }
            
        }

    }else if ([self.were isEqualToString:@"忘记密码"]){
        if ([_phoneString length]<1||[_codeString length]<1) {
            [FTIndicator showErrorWithMessage:Localized(@"请完整填写信息")];
        }else{
            
            SetThPasswordAgainViewController *setTThePasWord=[[SetThPasswordAgainViewController alloc]init];
            setTThePasWord.phone=_phoneString;
            setTThePasWord.captcha=_codeString;
            setTThePasWord.country=[TheParentClass country:_CountriesArray[_ChooseTheCountr]];
            [self.navigationController pushViewController:setTThePasWord animated:YES];
        }

    }else if ([self.were isEqualToString:@"安全验证"]){
        if (_codeString==nil||[_codeString length]!=6) {
             [FTIndicator showInfoWithMessage:Localized(@"请正确填写验证码")];
        }else{
            PasswordManagementSecurityVerification *PasswordManagement=[[PasswordManagementSecurityVerification alloc]init];
            PasswordManagement.code=_codeString;
            [self.navigationController pushViewController:PasswordManagement animated:YES];
        }
        

    
    }else if ([self.were isEqualToString:@"实名认证"]){
        if ([_nameString length]<1||[_IdentityDocumentNumber length]<1) {
            [FTIndicator showInfoWithMessage:Localized(@"请完整填写信息")];
        }else{
            [SVProgressHUD showWithStatus:Localized(@"loading")];
        [TheBasicInformationRequest Real_NameAuthenticationName:_nameString idcard:_IdentityDocumentNumber block:^(NSDictionary *disa) {
            BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
            if ([class.code isEqualToString:@"11"]) {
                [self.navigationController popViewControllerAnimated:YES];
            }
             [FTIndicator showInfoWithMessage:class.msg];
            [SVProgressHUD dismiss];
        }];
        }
    
    }else if ([self.were isEqualToString:@"修改支付密码"]){
        if ([_originalPayThePassword length]<1||[_newPassword length]<1||[_ToNewPassword length]<1) {
            [FTIndicator showErrorWithMessage:Localized(@"信息填写不完整")];
        }else if(_newPassword!=_ToNewPassword){
            [FTIndicator showErrorWithMessage:Localized(@"新密码不一致")];
        }else{
            [SVProgressHUD showWithStatus:Localized(@"loading")];
        [TheBasicInformationRequest ModifyPaymentPassword:_originalPayThePassword third_newpwd:_newPassword block:^(NSDictionary *disa) {
            BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
            if ([class.code isEqualToString:@"18"]) {
                    [FTIndicator showSuccessWithMessage:class.msg];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [FTIndicator showErrorWithMessage:class.msg];
            }
        
            [SVProgressHUD dismiss];
        }];
        }
    
    }else if ([self.were isEqualToString:@"交易密码设置"]){
        if ([_Psw length]<1||[_ToPsw length]<1) {
            [FTIndicator showErrorWithMessage:Localized(@"请填写交易密码")];
        }else if (![_Psw isEqualToString:_ToPsw]){
         [FTIndicator showErrorWithMessage:Localized(@"交易密码不一致")];
        }else{
            [SVProgressHUD showWithStatus:Localized(@"loading")];
            [LoginRequuestClass TradingPassword:_Psw confirmThird_pwd:_ToPsw block:^(NSDictionary *dic) {
                LoginBaseClass *class=[[LoginBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([class.code isEqualToString:@"63"]) {
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"TheMoneyPasswordSet" object:nil];
                    [FTIndicator showSuccessWithMessage:class.msg];
                }else{
                    [FTIndicator showErrorWithMessage:class.msg];
                }
                
                [SVProgressHUD dismiss];
            }];
        }

     
    }

}
//获取输入框内容
-(void)ToObtainInputBox:(MyTextField *)TextField{
  
    
    
    if ([self.were isEqualToString:@"更换手机号"]) {
        
     
    }else if ([self.were isEqualToString:@"绑定手机号"]){
       
        
        
    }else if ([self.were isEqualToString:@"更换邮箱"]){
        
     
    }else if ([self.were isEqualToString:@"实名认证"]){
        if (TextField.indexPath.row==0) {
            _nameString=TextField.text;
        }else if (TextField.indexPath.row==1){
            _IdentityDocumentNumber=TextField.text;
        }
        
    }else if ([self.were isEqualToString:@"用户名设置"]){
        
        
    }else if ([self.were isEqualToString:@"邮箱绑定"]){
        _email=TextField.text;
        
    }else if ([self.were isEqualToString:@"交易密码设置"]){
        
        if (TextField.indexPath.row==0){
            _Psw=TextField.text;
        }else if (TextField.indexPath.row==1){
            _ToPsw=TextField.text;
        }
    }else if ([self.were isEqualToString:@"忘记密码"]){
       if (TextField.indexPath.row==0){
            _phoneString=TextField.text;
        }else if (TextField.indexPath.row==1){
            _codeString=TextField.text;
        }
      
    }else if ([self.were isEqualToString:@"修改支付密码"]){
        if (TextField.indexPath.row==0) {
            _originalPayThePassword=TextField.text;
        }else if (TextField.indexPath.row==1){
            _newPassword=TextField.text;
        }else if (TextField.indexPath.row==2){
            _ToNewPassword=TextField.text;
        }
        
        
    }else if ([self.were isEqualToString:@"安全验证"]){//忘记支付密码
        _codeString=TextField.text;
     
    }
    

}
//选择国家区号
-(void)onChooseTheCountryCodeClick{
    CountryCodeViewController *CountryCode=[[CountryCodeViewController alloc]init];
    CountryCode.delegate=self;
    CountryCode.array=_CountriesArray;
    CountryCode.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:CountryCode animated:YES completion:^{
        CountryCode.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:.5];
    }];
    
}
-(void)codes:(NSInteger)index{
    autoSize
    _ChooseTheCountr=index;
    [_tableView reloadData];
    
}
//判定邮箱格式
- (BOOL)validateEmail:(NSString *)name
{
    NSString *userNameRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:name];
    return B;
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
