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
@interface RegisteredViewController ()<UITextFieldDelegate>
{
    UITextField *name;//用户名
    UITextField *Phonenumber;//手机号
    UITextField *code;//验证码
    UITextField *pswd;//密码
    UITextField *InviteCode;//邀请码
    
}
@end

@implementation RegisteredViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
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
    name.placeholder=Localized(@"  请设置用户名,长度为6-20位由数字组成");
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
    
    
    
    
    Phonenumber=[[UITextField alloc]init];
    Phonenumber.backgroundColor=[UIColor whiteColor];
    Phonenumber.borderStyle = UITextBorderStyleRoundedRect;
    Phonenumber.layer.cornerRadius = 6*autoSizeScaleX;
    Phonenumber.layer.masksToBounds = 6*autoSizeScaleX;
    Phonenumber.delegate=self;
    Phonenumber.placeholder=Localized(@"  请输入手机号");
    Phonenumber.textColor=[TheParentClass colorWithHexString:@"#242424"];
    Phonenumber.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [self.view addSubview:Phonenumber];
    Phonenumber.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(pswd,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    
    
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
    InviteCode.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(Phonenumber,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    
    
    
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
    code.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).rightSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(InviteCode,26*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    //获取短信验证码
    UIButton *codeNumber=[UIButton buttonWithType:UIButtonTypeCustom];
    [codeNumber setTitle:Localized(@"获取短信验证码") forState:UIControlStateNormal];
    codeNumber.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [codeNumber setTitleColor:[TheParentClass colorWithHexString:@"#d3385e"] forState:UIControlStateNormal];
    [codeNumber addTarget:self action:@selector(onCodeNumerClick) forControlEvents:UIControlEventTouchUpInside];
    [code addSubview:codeNumber];
    codeNumber.sd_layout.rightSpaceToView(code, 10*autoSizeScaleX).topSpaceToView(code, 0).bottomSpaceToView(code, 0).widthIs(220*autoSizeScaleX);
    
    
    UIButton *icon_check_sBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [icon_check_sBtn setBackgroundImage:[UIImage imageNamed:@"icon_check_s"] forState:UIControlStateSelected];
    [icon_check_sBtn setBackgroundImage:[UIImage imageNamed:@"icon_check"] forState:UIControlStateNormal];
    icon_check_sBtn.selected=YES;
    [icon_check_sBtn addTarget:self action:@selector(onIconCheckCick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:icon_check_sBtn];
    icon_check_sBtn.sd_layout.leftSpaceToView(self.view, 51*autoSizeScaleX).topSpaceToView(code, 56*autoSizeScaleY).widthIs(44*autoSizeScaleX).heightIs(44*autoSizeScaleY);
    
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
    NSLog(@"ssssss");

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
    ReplaceAPhoneNumberViewController *ReplaceAPhoneNumber=[[ReplaceAPhoneNumberViewController alloc]init];
    ReplaceAPhoneNumber.were=@"交易密码设置";
    [self.navigationController pushViewController:ReplaceAPhoneNumber animated:YES];

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
