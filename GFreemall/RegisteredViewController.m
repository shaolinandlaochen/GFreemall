//
//  RegisteredViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "RegisteredViewController.h"
#import "ReplaceAPhoneNumberViewController.h"
#import "UserRegistrationAgreementViewController.h"
#import "TheBasicInformationRequest.h"
#import "CountryCodeViewController.h"
#import "LoginRequuestClass.h"
@interface RegisteredViewController ()<UITextFieldDelegate,CountryCodeDelegate>
{
    UITextField *name;//用户名
    UITextField *Phonenumber;//手机号
    UITextField *code;//验证码
    UITextField *pswd;//密码
    UITextField *InviteCode;//邀请码
    NSInteger seconds;
    NSArray *_CountriesArray;//装有国家名称
    NSArray *_CountriesNumberArray;//装有国家编码
    NSInteger _ChooseTheCountr;
    NSTimer *timer;//定时器
    UIButton *codeNumber;
    UIButton *CHOOSE;
    
}
@end

@implementation RegisteredViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _ChooseTheCountr=0;
    _CountriesArray=@[@"中国",@"中国香港",@"中国澳门",@"中国台湾",@"America",@"Singapore",@"Vietnam",@"Korea",@"Malaysia",@"Thailand",@"Indonesia",@"Philippines"];
    _CountriesNumberArray=@[@"86",@"852",@"853",@"886",@"1",@"65",@"84",@"82",@"60",@"66",@"62",@"63"];
    autoSize
    self.title=Localized(@"注册");
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
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    
    name=[[UITextField alloc]init];
    name.backgroundColor=[UIColor whiteColor];
    name.borderStyle = UITextBorderStyleRoundedRect;
    name.layer.cornerRadius = 6*autoSizeScaleX;
    name.layer.masksToBounds = 6*autoSizeScaleX;
    name.delegate=self;
    name.placeholder=Localized(@"  由字母开头，6-20位字母或数字");
    name.textColor=[TheParentClass colorWithHexString:@"#242424"];
    name.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [self.view addSubview:name];
    name.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(self.view,navheight+rectStatus.size.height+( 26*autoSizeScaleY)).heightIs(96*autoSizeScaleY);
    
    
    
    pswd=[[UITextField alloc]init];
    pswd.backgroundColor=[UIColor whiteColor];
    pswd.borderStyle = UITextBorderStyleRoundedRect;
    pswd.layer.cornerRadius = 6*autoSizeScaleX;
    pswd.layer.masksToBounds = 6*autoSizeScaleX;
    pswd.delegate=self;
    pswd.placeholder=Localized(@"  请设置登录密码");
    pswd.textColor=[TheParentClass colorWithHexString:@"#242424"];
    pswd.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [self.view addSubview:pswd];
    pswd.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(name,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
   
    
    
    
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    
    [view.layer setBorderColor:[TheParentClass colorWithHexString:@"#d7d7d7"].CGColor];
    [view.layer setBorderWidth:1];
    [view.layer setMasksToBounds:YES];
    view.layer.cornerRadius = 10*autoSizeScaleX;
    view.layer.masksToBounds = 10*autoSizeScaleX;
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(pswd,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    
    
    
     CHOOSE=[UIButton buttonWithType:UIButtonTypeCustom];
     [CHOOSE setTitle:_CountriesArray[_ChooseTheCountr] forState:UIControlStateNormal];
     [CHOOSE setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateNormal];
     CHOOSE.titleLabel.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
     [CHOOSE addTarget:self action:@selector(onChooseTheCountryCodeClick) forControlEvents:UIControlEventTouchUpInside];
     [view addSubview:CHOOSE];
     CGSize sizes=[TheParentClass StringHeight:_CountriesArray[_ChooseTheCountr] Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
     CHOOSE.sd_layout.leftSpaceToView(view, 5).topSpaceToView(view, 0).bottomSpaceToView(view, 0).widthIs(sizes.width);
     
     
     UIImageView *imgTopBo=[[UIImageView alloc]init];
     imgTopBo.image=[UIImage imageNamed:@"icon_select_country"];
     [view addSubview:imgTopBo];
     imgTopBo.sd_layout.leftSpaceToView(CHOOSE, 2).topSpaceToView(view, 37*autoSizeScaleY).widthIs(17*autoSizeScaleX).heightIs(22*autoSizeScaleY);
    
    
    
    Phonenumber=[[UITextField alloc]init];
    Phonenumber.backgroundColor=[UIColor whiteColor];
    Phonenumber.delegate=self;
    Phonenumber.placeholder=Localized(@"  请输入手机号");
    Phonenumber.textColor=[TheParentClass colorWithHexString:@"#242424"];
    Phonenumber.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [view addSubview:Phonenumber];
    Phonenumber.sd_layout.leftSpaceToView(imgTopBo, 5).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view,0).heightIs(96*autoSizeScaleY);
    
    
    
    
    code=[[UITextField alloc]init];
    code.backgroundColor=[UIColor whiteColor];
    code.borderStyle = UITextBorderStyleRoundedRect;
    code.layer.cornerRadius = 6*autoSizeScaleX;
    code.layer.masksToBounds = 6*autoSizeScaleX;
    code.delegate=self;
    code.placeholder=Localized(@"  请输入手机验证码");
    code.textColor=[TheParentClass colorWithHexString:@"#242424"];
    code.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [self.view addSubview:code];
    code.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(view,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    //获取短信验证码
    codeNumber=[UIButton buttonWithType:UIButtonTypeCustom];
    [codeNumber setTitle:Localized(@"获取短信验证码") forState:UIControlStateNormal];
    codeNumber.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [codeNumber setTitleColor:[TheParentClass colorWithHexString:@"#d3385e"] forState:UIControlStateNormal];
    [codeNumber addTarget:self action:@selector(onCodeNumerClick) forControlEvents:UIControlEventTouchUpInside];
    [code addSubview:codeNumber];
    codeNumber.sd_layout.rightSpaceToView(code, 10*autoSizeScaleX).topSpaceToView(code, 0).bottomSpaceToView(code, 0).widthIs(220*autoSizeScaleX);
    
    
    
    
    
    
    
    InviteCode=[[UITextField alloc]init];
    InviteCode.backgroundColor=[UIColor whiteColor];
    InviteCode.borderStyle = UITextBorderStyleRoundedRect;
    InviteCode.layer.cornerRadius = 6*autoSizeScaleX;
    InviteCode.layer.masksToBounds = 6*autoSizeScaleX;
    InviteCode.delegate=self;
    InviteCode.placeholder=Localized(@"  请输入邀请码");
    InviteCode.textColor=[TheParentClass colorWithHexString:@"#242424"];
    InviteCode.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [self.view addSubview:InviteCode];
    InviteCode.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(code,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    

    

    

    
    
    UIButton *icon_check_sBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [icon_check_sBtn setBackgroundImage:[UIImage imageNamed:@"icon_check_s"] forState:UIControlStateSelected];
    [icon_check_sBtn setBackgroundImage:[UIImage imageNamed:@"icon_check"] forState:UIControlStateNormal];
    icon_check_sBtn.selected=YES;
    [icon_check_sBtn addTarget:self action:@selector(onIconCheckCick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:icon_check_sBtn];
    icon_check_sBtn.sd_layout.leftSpaceToView(self.view, 51*autoSizeScaleX).topSpaceToView(InviteCode, 56*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
    
    UILabel *Agreed=[[UILabel alloc]init];
    Agreed.text=Localized(@"同意");
    Agreed.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    Agreed.textColor=[TheParentClass colorWithHexString:@"#242424"];
    [self.view addSubview:Agreed];
    CGSize size=[TheParentClass StringHeight:Agreed.text Lblfont:28*autoSizeScaleY heightOfTheMinus:0];
    Agreed.sd_layout.leftSpaceToView(icon_check_sBtn, 10*autoSizeScaleX).topEqualToView(icon_check_sBtn).widthIs(size.width).heightIs(44*autoSizeScaleY);
    
    UIButton *agreement=[UIButton buttonWithType:UIButtonTypeCustom];
    [agreement addTarget:self action:@selector(onagreement) forControlEvents:UIControlEventTouchUpInside];
    [agreement setTitle:Localized(@"<<用户注册协议>>") forState:UIControlStateNormal];
    agreement.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [agreement setTitleColor:[TheParentClass colorWithHexString:@"#164cd4"] forState:UIControlStateNormal];
    [self.view addSubview:agreement];
    agreement.sd_layout.leftSpaceToView(Agreed, 0*autoSizeScaleX).topEqualToView(icon_check_sBtn).widthIs(300*autoSizeScaleX).heightIs(44*autoSizeScaleY);
    
    
    
    
    UIButton *nextStepBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [nextStepBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextStepBtn.backgroundColor=[UIColor blackColor];
    nextStepBtn.layer.cornerRadius = 6*autoSizeScaleX;
    nextStepBtn.layer.masksToBounds = 6*autoSizeScaleX;
    nextStepBtn.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
    [nextStepBtn setTitle:Localized(@"下一步") forState:UIControlStateNormal];
    [nextStepBtn addTarget:self action:@selector(onNextStepButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextStepBtn];
    nextStepBtn.sd_layout.leftEqualToView(name).rightEqualToView(name).topSpaceToView(agreement, 56*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//获取验证码
-(void)onCodeNumerClick{
    if ([Phonenumber.text length]<1) {
        [FTIndicator showErrorWithMessage:@"请完整填写手机号"];
    }else{
        [SVProgressHUD showWithStatus:@"正在加载"];
        NSString *string;
        string=[TheParentClass country:_CountriesArray[_ChooseTheCountr]];
        [TheBasicInformationRequest LoginRegistrationVerificationCodecountry:string phone:Phonenumber.text type:@"reg"  block:^(NSDictionary *disa) {
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
-(void)action{
    
    if (seconds>0) {
        codeNumber.userInteractionEnabled=NO;
        seconds-=1;
        [codeNumber setTitle:[NSString stringWithFormat:@"%lds",seconds] forState:UIControlStateNormal];
    }else{
        [codeNumber setTitle:@"获取验证码" forState:UIControlStateNormal];
        codeNumber.userInteractionEnabled=YES;
        [timer invalidate];
        timer = nil;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
    [timer invalidate];
    timer = nil;
}
-(void)dealloc{
    [timer invalidate];
    timer = nil;
}
//是否同意条款
-(void)onIconCheckCick:(UIButton *)btn{
    if (btn.selected==YES) {
        btn.selected=NO;
    }else{
        btn.selected=YES;
    }
}
//用户注册写信
-(void)onagreement{
    UserRegistrationAgreementViewController *UserRegistrationAgreement=[[UserRegistrationAgreementViewController alloc]init];
    [self.navigationController pushViewController:UserRegistrationAgreement animated:YES];

}
//下一步
-(void)onNextStepButtonClick{
    //Registeredbase_username
    if ([name.text length]<1||[pswd.text length]<1||[Phonenumber.text length]<1||[code.text length]<1||[InviteCode.text length]<1) {
        [FTIndicator showErrorWithMessage:@"信息填写不完整"];
    }else{
        BOOL isName=[self validateUserName:name.text];
        if (isName) {
            
            NSString *string=[TheParentClass country:_CountriesArray[_ChooseTheCountr]];
            [SVProgressHUD showWithStatus:@"正在加载"];
            
            [LoginRequuestClass Registeredbase_username:name.text password:pswd.text confirmPassword:pswd.text base_recommend:InviteCode.text phone:Phonenumber.text captcha:code.text country:string block:^(NSDictionary *dic) {
                LoginBaseClass *class=[[LoginBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
                if ([class.code isEqualToString:@"62"]) {
                    
                    [SVProgressHUD showWithStatus:@"正在登录"];
                    [LoginRequuestClass LoginUsername:name.text password:pswd.text block:^(NSDictionary *dic) {
                        LoginBaseClass *login=[[LoginBaseClass alloc]initWithDictionary:dic];
                        if ([login.code isEqualToString:@"1"]) {//登录成功
                            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                            [defaults setObject:login.token forKey:@"token"];
                            //同步数据
                            [defaults synchronize];
                            
                            //注册完成开始登录
                            ReplaceAPhoneNumberViewController *ReplaceAPhoneNumber=[[ReplaceAPhoneNumberViewController alloc]init];
                            ReplaceAPhoneNumber.were=@"交易密码设置";
                            [self.navigationController pushViewController:ReplaceAPhoneNumber animated:YES];
                            
                            
                        }else{
                            [TheParentClass YouNeedToLogIn:login.msg];
                        }
                        
                        [SVProgressHUD dismiss];
                        
                        
                    }];
                    
                    
                }else{
                    [FTIndicator showErrorWithMessage:class.msg];
                }
                
                [SVProgressHUD dismiss];
            }];

        }else{
            [FTIndicator showErrorWithMessage:@"用户名格式错误"];
        }
    
    }
    
  

}
//选择国家编码
-(void)onChooseTheCountryCodeClick{
    CountryCodeViewController *CountryCode=[[CountryCodeViewController alloc]init];
    CountryCode.delegate=self;
    CountryCode.array=_CountriesArray;
    CountryCode.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:CountryCode animated:YES completion:^{
        CountryCode.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:.5];
    }];
}
//用户选择国家编码
-(void)codes:(NSInteger)index{
    autoSize
    _ChooseTheCountr=index;
    NSString *string=_CountriesArray[_ChooseTheCountr];
    CGSize sizes=[TheParentClass StringHeight:string Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
    CHOOSE.sd_layout.widthIs(sizes.width);
    [CHOOSE setTitle:string forState:UIControlStateNormal];

}
//用户名
- (BOOL) validateUserName:(NSString *)nameString
{
    NSString *userNameRegex = @"^[a-zA-Z]{1}[0-9a-zA-Z]{5,15}+$";
    NSPredicate *userNamePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameRegex];
    BOOL B = [userNamePredicate evaluateWithObject:nameString];
    return B;
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
