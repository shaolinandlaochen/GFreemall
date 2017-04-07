//
//  TheLoginViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "TheLoginViewController.h"
#import "RegisteredViewController.h"
#import "ReplaceAPhoneNumberViewController.h"
@interface TheLoginViewController ()<UITextFieldDelegate>
{
    UIView *_numberView;
    UIImageView *img;
    UIButton *lingBtn;
    UITextField *_phoneNumber;//手机号
    UITextField *_pswAndCode;
    UIView *phoneNumberView;
    UIView *pswAndCodeView;
    UIButton *ofCode;//获取验证码
    
    UIButton *_TheLoginButton;//登录按钮
    
    

}
@end

@implementation TheLoginViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    autoSize
    img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"bg001"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).heightIs(434*autoSizeScaleY);
    
    [self creatView];
    // Do any additional setup after loading the view.
}
-(void)creatView{
autoSize
    
    
    UIImageView *logoIcon=[[UIImageView alloc]init];
    logoIcon.image=[UIImage imageNamed:@"logo111"];
    [img addSubview:logoIcon];
    logoIcon.sd_layout.leftSpaceToView(img, 212*autoSizeScaleX).topSpaceToView(img, 166*autoSizeScaleY).widthIs(326*autoSizeScaleX).heightIs(153*autoSizeScaleY);
    
    _numberView=[[UIView  alloc]init];
    _numberView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_numberView];
    _numberView.sd_layout.leftEqualToView(img).rightEqualToView(img).topSpaceToView(img, 0).heightIs(96*autoSizeScaleY);
    for (int i=0; i<2; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i+1;
        btn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateSelected];
         [btn setTitleColor:[TheParentClass colorWithHexString:@"999999"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(onNumberClick:) forControlEvents:UIControlEventTouchUpInside];
        [_numberView addSubview:btn];
        if (i==0) {
            btn.selected=YES;
            [btn setTitle:Localized(@"密码登录") forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(_numberView, 0).topSpaceToView(_numberView, 0).widthIs(self.view.frame.size.width/2).bottomSpaceToView(_numberView, 3);
            
        }else{
            btn.selected=NO;
            [btn setTitle:Localized(@"验证码登录") forState:UIControlStateNormal];
            btn.sd_layout.leftSpaceToView(_numberView, self.view.frame.size.width/2).topSpaceToView(_numberView, 0).widthIs(self.view.frame.size.width/2).bottomSpaceToView(_numberView, 3);
        }
        
        
    }
     lingBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    lingBtn.backgroundColor=[UIColor blackColor];
    lingBtn.frame=frame(105, 92, 161, 4);
    [_numberView addSubview:lingBtn];
    
    //手机号输入框背景
    phoneNumberView=[[UIView alloc]init];
    phoneNumberView.backgroundColor=[UIColor whiteColor];
    phoneNumberView.layer.cornerRadius = 3*autoSizeScaleX;
    phoneNumberView.layer.masksToBounds = 3*autoSizeScaleX;
    [self.view addSubview:phoneNumberView];
    phoneNumberView.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(_numberView, 72*autoSizeScaleY).rightSpaceToView(self.view, 60*autoSizeScaleX).heightIs(96*autoSizeScaleY);
    
    _phoneNumber=[[UITextField alloc]init];
    _phoneNumber.delegate=self;
    _phoneNumber.placeholder=Localized(@"请输入手机号");
    _phoneNumber.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _phoneNumber.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [phoneNumberView addSubview:_phoneNumber];
    _phoneNumber.sd_layout.leftSpaceToView(phoneNumberView, 80*autoSizeScaleX).topSpaceToView(phoneNumberView, 0).bottomSpaceToView(phoneNumberView, 0).widthIs(300*autoSizeScaleX);
    UIImageView *oneImage=[[UIImageView alloc]init];
    oneImage.image=[UIImage imageNamed:@"icon_username"];
    [phoneNumberView addSubview:oneImage];
    oneImage.sd_layout.leftSpaceToView(phoneNumberView, 25*autoSizeScaleX).topSpaceToView(phoneNumberView, 32*autoSizeScaleY).widthIs(28*autoSizeScaleX).heightIs(32*autoSizeScaleY);
    
    
    
    //获取验证码
    ofCode=[UIButton buttonWithType:UIButtonTypeCustom];
    [ofCode setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
    ofCode.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [ofCode setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [ofCode addTarget:self action:@selector(onOfCodeClick) forControlEvents:UIControlEventTouchUpInside];
    [phoneNumberView addSubview:ofCode];
    ofCode.sd_layout.rightSpaceToView(phoneNumberView, 20*autoSizeScaleX).topSpaceToView(phoneNumberView, 0).bottomSpaceToView(phoneNumberView, 0).widthIs(150*autoSizeScaleX);
    
    
    
    
    
    //密码输入框背景
    pswAndCodeView=[[UIView alloc]init];
    pswAndCodeView.backgroundColor=[UIColor whiteColor];
    pswAndCodeView.layer.cornerRadius = 3*autoSizeScaleX;
    pswAndCodeView.layer.masksToBounds = 3*autoSizeScaleX;
    [self.view addSubview:pswAndCodeView];
    pswAndCodeView.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(phoneNumberView, 20*autoSizeScaleY).rightSpaceToView(self.view, 60*autoSizeScaleX).heightIs(96*autoSizeScaleY);
    
    _pswAndCode=[[UITextField alloc]init];
    _pswAndCode.delegate=self;
    _pswAndCode.secureTextEntry=YES;
    _pswAndCode.placeholder=Localized(@"请输入密码");
    _pswAndCode.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _pswAndCode.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [pswAndCodeView addSubview:_pswAndCode];
    _pswAndCode.sd_layout.leftSpaceToView(pswAndCodeView, 80*autoSizeScaleX).topSpaceToView(pswAndCodeView, 0).bottomSpaceToView(pswAndCodeView, 0).widthIs(300*autoSizeScaleX);
    UIImageView *TwoImage=[[UIImageView alloc]init];
    TwoImage.image=[UIImage imageNamed:@"icon_password"];
    [pswAndCodeView addSubview:TwoImage];
    TwoImage.sd_layout.leftSpaceToView(pswAndCodeView, 25*autoSizeScaleX).topSpaceToView(pswAndCodeView, 32*autoSizeScaleY).widthIs(28*autoSizeScaleX).heightIs(32*autoSizeScaleY);
    
    
    _TheLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _TheLoginButton.layer.cornerRadius = 6*autoSizeScaleX;
    _TheLoginButton.layer.masksToBounds = 6*autoSizeScaleX;
    [_TheLoginButton setTitle:Localized(@"登录") forState:UIControlStateNormal];
    _TheLoginButton.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    [_TheLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _TheLoginButton.backgroundColor=[UIColor blackColor];
    [_TheLoginButton addTarget:self action:@selector(onTheLognClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_TheLoginButton];
    _TheLoginButton.sd_layout.leftEqualToView(phoneNumberView).topSpaceToView(pswAndCodeView, 62*autoSizeScaleY).rightEqualToView(phoneNumberView).heightIs(96*autoSizeScaleY);
    
    
    
    //添加忘记密码  语言切换按钮
    for (int i=0; i<2; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
        btn.tag=i+100;
        [btn addTarget:self action:@selector(onPswAndLangsIngClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        if (i==0) {
            [btn setTitle:Localized(@"忘记密码?") forState:UIControlStateNormal];
            btn.sd_layout.leftEqualToView(pswAndCodeView).topSpaceToView(_TheLoginButton, 40*autoSizeScaleY).heightIs(50*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        }else{
            [btn setTitle:Localized(@"语言切换") forState:UIControlStateNormal];
            btn.sd_layout.rightEqualToView(pswAndCodeView).topSpaceToView(_TheLoginButton, 40*autoSizeScaleY).heightIs(50*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        }
    }
    
    
    UIButton *messagrsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [messagrsBtn addTarget:self action:@selector(registered) forControlEvents:UIControlEventTouchUpInside];
    [messagrsBtn setTitle:Localized(@"还没有账号? 现在去免费注册") forState:UIControlStateNormal];
    messagrsBtn.titleLabel.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
    [messagrsBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [self.view addSubview:messagrsBtn];
    messagrsBtn.sd_layout.leftEqualToView(pswAndCodeView).rightEqualToView(pswAndCodeView).bottomSpaceToView(self.view, 46*autoSizeScaleY).heightIs(40*autoSizeScaleY);
    
}
//点击账号登录或者手机号登录
-(void)onNumberClick:(UIButton *)btn{
    autoSize
    for (int i=0; i<2; i++) {
        UIButton *button=(UIButton *)[_numberView viewWithTag:i+1];
        button.selected=NO;
    }
    btn.selected=YES;
    UIButton *pswBtn=(UIButton *)[self.view viewWithTag:100];
    if (btn.tag==1) {
        
        [pswBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        _pswAndCode.placeholder=Localized(@"请输入密码");
          [ofCode setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            lingBtn.frame=frame(105, 92, 161, 4);
        }];
        
    }else{
         [pswBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        _pswAndCode.placeholder=Localized(@"请输入验证码");
          [ofCode setTitleColor:[TheParentClass colorWithHexString:@"#de0024"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            lingBtn.frame=frame(475, 92, 161, 4);
        }];
    }
    
    
 
    

}
//开始编辑执行该方法
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    return YES;
}
//结束编辑执行该方法
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//获取验证码
-(void)onOfCodeClick{

}
//登录
-(void)onTheLognClick{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
}
//忘记密码和语言切换
-(void)onPswAndLangsIngClick:(UIButton *)btn{
    if (btn.tag==100) {
        //忘记密码
        ReplaceAPhoneNumberViewController *ReplaceAPhoneNumber=[[ReplaceAPhoneNumberViewController alloc]init];
        ReplaceAPhoneNumber.were=@"忘记密码";
        [self.navigationController pushViewController:ReplaceAPhoneNumber animated:YES];

    }else if (btn.tag==101){
    //语言切换
    }

}
//注册
-(void)registered{
    RegisteredViewController *Registered=[[RegisteredViewController alloc]init];
    [self.navigationController pushViewController:Registered animated:YES];

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
