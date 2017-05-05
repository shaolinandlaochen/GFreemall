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
#import "LoginRequuestClass.h"
#import "CountryCodeViewController.h"
@interface TheLoginViewController ()<UITextFieldDelegate,UIScrollViewDelegate,CountryCodeDelegate>
{
    UIView *_numberView;
    UIImageView *img;
    UIButton *lingBtn;
    UITextField *_phoneNumber;//手机号
    UITextField *_psw;
    UITextField *_MobilePhoneNumber;//手机号码
    UITextField *_code;

    UIButton *ofCode;//获取验证码
    
    UIButton *_TheLoginButton;//登录按钮
    BOOL PswAndCode;//判断是账号密码登录还是验证码登录
    NSArray *_CountriesArray;//装有国家名称
    NSArray *_CountriesNumberArray;//装有国家编码
    UIScrollView *_ScrollView;
    NSInteger _ChooseTheCountr;
    UIButton *CHOOSE;//选择国家按钮
    NSTimer *timer;//定时器
    NSInteger seconds;
    

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
    _ChooseTheCountr=0;
    //国家名称
    _CountriesArray=@[@"中国",@"中国香港",@"中国澳门",@"中国台湾",@"America",@"Singapore",@"Vietnam",@"Korea",@"Malaysia",@"Thailand",@"Indonesia",@"Philippines"];
    _CountriesNumberArray=@[@"86",@"852",@"853",@"886",@"1",@"65",@"84",@"82",@"60",@"66",@"62",@"63"];
    [self creatView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(MoneyPassword) name:@"TheMoneyPasswordSet" object:nil];
    // Do any additional setup after loading the view.
}
-(void)creatView{
autoSize
    PswAndCode=YES;
    
    UIImageView *logoIcon=[[UIImageView alloc]init];
    logoIcon.image=[UIImage imageNamed:@"logo111"];
    [img addSubview:logoIcon];
    logoIcon.sd_layout.leftSpaceToView(img, 212*autoSizeScaleX).topSpaceToView(img, 166*autoSizeScaleY).widthIs(326*autoSizeScaleX).heightIs(153*autoSizeScaleY);
    
    UIButton *cancelLogin=[UIButton buttonWithType:UIButtonTypeCustom];
    [cancelLogin setTitle:Localized(@"返回") forState:UIControlStateNormal];
    [cancelLogin addTarget:self action:@selector(onReturnClick) forControlEvents:UIControlEventTouchUpInside];
    [cancelLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cancelLogin.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [self.view addSubview:cancelLogin];
    cancelLogin.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(self.view, 50*autoSizeScaleY).widthIs(100*autoSizeScaleX).heightIs(50*autoSizeScaleY);
    
    
    
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
    
    
    
    [self CreateTheInputBox];

    
    
}
//创建输入框
-(void)CreateTheInputBox{
    autoSize
    _ScrollView=[[UIScrollView alloc]init];
    _ScrollView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _ScrollView.delegate=self;
     //是否分页
    _ScrollView.pagingEnabled = YES;
     //是否滚动
    _ScrollView.scrollEnabled = NO;
    _ScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_ScrollView];
    _ScrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(_numberView, 72*autoSizeScaleY).heightIs(212*autoSizeScaleY);
    _ScrollView.contentSize=CGSizeMake(self.view.frame.size.width*2, 0);
    
    
    
    
    
    
    //手机号输入框背景
    UIView *phoneNumberView=[[UIView alloc]init];
    phoneNumberView.backgroundColor=[UIColor whiteColor];
    phoneNumberView.layer.cornerRadius = 3*autoSizeScaleX;
    phoneNumberView.layer.masksToBounds = 3*autoSizeScaleX;
    [_ScrollView addSubview:phoneNumberView];
    phoneNumberView.sd_layout.leftSpaceToView(_ScrollView, 60*autoSizeScaleX).topSpaceToView(_ScrollView, 0*autoSizeScaleY).widthIs(630*autoSizeScaleX).heightIs(96*autoSizeScaleY);
    
    _phoneNumber=[[UITextField alloc]init];
    _phoneNumber.delegate=self;
    _phoneNumber.keyboardType=UIKeyboardTypeNamePhonePad;
    _phoneNumber.placeholder=Localized(@"请输入用户名");
    _phoneNumber.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _phoneNumber.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [phoneNumberView addSubview:_phoneNumber];
    _phoneNumber.sd_layout.leftSpaceToView(phoneNumberView, 80*autoSizeScaleX).topSpaceToView(phoneNumberView, 0).bottomSpaceToView(phoneNumberView, 0).widthIs(300*autoSizeScaleX);
    UIImageView *oneImage=[[UIImageView alloc]init];
    oneImage.image=[UIImage imageNamed:@"icon_username"];
    [phoneNumberView addSubview:oneImage];
    oneImage.sd_layout.leftSpaceToView(phoneNumberView, 25*autoSizeScaleX).topSpaceToView(phoneNumberView, 32*autoSizeScaleY).widthIs(28*autoSizeScaleX).heightIs(32*autoSizeScaleY);
    
    

    
    
    //密码输入框背景
    UIView  * pswAndCodeView=[[UIView alloc]init];
    pswAndCodeView.backgroundColor=[UIColor whiteColor];
    pswAndCodeView.layer.cornerRadius = 3*autoSizeScaleX;
    pswAndCodeView.layer.masksToBounds = 3*autoSizeScaleX;
    [_ScrollView addSubview:pswAndCodeView];
    pswAndCodeView.sd_layout.leftSpaceToView(_ScrollView, 60*autoSizeScaleX).topSpaceToView(phoneNumberView, 20*autoSizeScaleY).widthIs(630*autoSizeScaleX).heightIs(96*autoSizeScaleY);
    
    _psw=[[UITextField alloc]init];
    _psw.delegate=self;
    _psw.keyboardType=UIKeyboardTypeURL;
    _psw.secureTextEntry=YES;
    _psw.placeholder=Localized(@"请输入密码");
    _psw.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _psw.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [pswAndCodeView addSubview:_psw];
    _psw.sd_layout.leftSpaceToView(pswAndCodeView, 80*autoSizeScaleX).topSpaceToView(pswAndCodeView, 0).bottomSpaceToView(pswAndCodeView, 0).widthIs(300*autoSizeScaleX);
    UIImageView *TwoImage=[[UIImageView alloc]init];
    TwoImage.image=[UIImage imageNamed:@"icon_password"];
    [pswAndCodeView addSubview:TwoImage];
    TwoImage.sd_layout.leftSpaceToView(pswAndCodeView, 25*autoSizeScaleX).topSpaceToView(pswAndCodeView, 32*autoSizeScaleY).widthIs(28*autoSizeScaleX).heightIs(32*autoSizeScaleY);
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    //手机号输入框背景
    UIView *phoneView=[[UIView alloc]init];
    phoneView.backgroundColor=[UIColor whiteColor];
    phoneView.layer.cornerRadius = 3*autoSizeScaleX;
    phoneView.layer.masksToBounds = 3*autoSizeScaleX;
    [_ScrollView addSubview:phoneView];
    phoneView.frame=frame(810, 0, 630, 96);
    
    CHOOSE=[UIButton buttonWithType:UIButtonTypeCustom];
    [CHOOSE setTitle:_CountriesArray[_ChooseTheCountr] forState:UIControlStateNormal];
    [CHOOSE setTitleColor:[TheParentClass colorWithHexString:@"292929"] forState:UIControlStateNormal];
    CHOOSE.titleLabel.font=[UIFont systemFontOfSize:32*autoSizeScaleY];
    [CHOOSE addTarget:self action:@selector(onChooseTheCountryCodeClick) forControlEvents:UIControlEventTouchUpInside];
    [phoneView addSubview:CHOOSE];
    CGSize size=[TheParentClass StringHeight:_CountriesArray[_ChooseTheCountr] Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
    CHOOSE.sd_layout.leftSpaceToView(phoneView, 60*autoSizeScaleX).topSpaceToView(phoneView, 0).bottomSpaceToView(phoneView, 0).widthIs(size.width);
    
    
    UIImageView *imgTopBo=[[UIImageView alloc]init];
    imgTopBo.image=[UIImage imageNamed:@"icon_select_country"];
    [phoneView addSubview:imgTopBo];
    imgTopBo.sd_layout.leftSpaceToView(CHOOSE, 2).topSpaceToView(phoneView, 37*autoSizeScaleY).widthIs(17*autoSizeScaleX).heightIs(22*autoSizeScaleY);
    
    
    
    _MobilePhoneNumber=[[UITextField alloc]init];
    _MobilePhoneNumber.delegate=self;
    _MobilePhoneNumber.keyboardType=UIKeyboardTypeNamePhonePad;
    _MobilePhoneNumber.placeholder=Localized(@"请输入手机号");
    _MobilePhoneNumber.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _MobilePhoneNumber.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [phoneView addSubview:_MobilePhoneNumber];
    _MobilePhoneNumber.sd_layout.leftSpaceToView(imgTopBo, 10*autoSizeScaleX).topSpaceToView(phoneView, 0).bottomSpaceToView(phoneView, 0).widthIs(300*autoSizeScaleX);
    UIImageView *phoneImage=[[UIImageView alloc]init];
    phoneImage.image=[UIImage imageNamed:@"icon_username"];
    [phoneView addSubview:phoneImage];
    phoneImage.sd_layout.leftSpaceToView(phoneView, 25*autoSizeScaleX).topSpaceToView(phoneView, 32*autoSizeScaleY).widthIs(28*autoSizeScaleX).heightIs(32*autoSizeScaleY);
    
    
    

    
    
    
    
    
    //密码输入框背景
    UIView  * CodeView=[[UIView alloc]init];
    CodeView.backgroundColor=[UIColor whiteColor];
    CodeView.layer.cornerRadius = 3*autoSizeScaleX;
    CodeView.layer.masksToBounds = 3*autoSizeScaleX;
    [_ScrollView addSubview:CodeView];
    CodeView.frame=frame(810, 116, 630, 96);
    _code=[[UITextField alloc]init];
    _code.delegate=self;
    _code.keyboardType=UIKeyboardTypeURL;
    _code.secureTextEntry=YES;
    _code.placeholder=Localized(@"请输入密码");
    _code.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _code.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [CodeView addSubview:_code];
    _code.sd_layout.leftSpaceToView(CodeView, 80*autoSizeScaleX).topSpaceToView(CodeView, 0).bottomSpaceToView(CodeView, 0).widthIs(300*autoSizeScaleX);
    UIImageView *codeImage=[[UIImageView alloc]init];
    codeImage.image=[UIImage imageNamed:@"icon_password"];
    [CodeView addSubview:codeImage];
    codeImage.sd_layout.leftSpaceToView(CodeView, 25*autoSizeScaleX).topSpaceToView(CodeView, 32*autoSizeScaleY).widthIs(28*autoSizeScaleX).heightIs(32*autoSizeScaleY);
    
    //获取验证码
    ofCode=[UIButton buttonWithType:UIButtonTypeCustom];
    [ofCode setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
    ofCode.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [ofCode setTitleColor:[TheParentClass colorWithHexString:@"#de0024"] forState:UIControlStateNormal];
    [ofCode addTarget:self action:@selector(onOfCodeClick) forControlEvents:UIControlEventTouchUpInside];
    [CodeView addSubview:ofCode];
    ofCode.sd_layout.rightSpaceToView(CodeView, 20*autoSizeScaleX).topSpaceToView(CodeView, 0).bottomSpaceToView(CodeView, 0).widthIs(150*autoSizeScaleX);
    
    
    
    
    
    _TheLoginButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _TheLoginButton.layer.cornerRadius = 6*autoSizeScaleX;
    _TheLoginButton.layer.masksToBounds = 6*autoSizeScaleX;
    [_TheLoginButton setTitle:Localized(@"登录") forState:UIControlStateNormal];
    _TheLoginButton.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    [_TheLoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _TheLoginButton.backgroundColor=[UIColor blackColor];
    [_TheLoginButton addTarget:self action:@selector(onTheLognClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_TheLoginButton];
    _TheLoginButton.sd_layout.leftSpaceToView(self.view, 60*autoSizeScaleX).topSpaceToView(_ScrollView, 62*autoSizeScaleY).rightSpaceToView(self.view, 60*autoSizeScaleX).heightIs(96*autoSizeScaleY);
    
    
    
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
            btn.sd_layout.leftEqualToView(_TheLoginButton).topSpaceToView(_TheLoginButton, 40*autoSizeScaleY).heightIs(50*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        }else{
            [btn setTitle:Localized(@"语言切换") forState:UIControlStateNormal];
            btn.sd_layout.rightEqualToView(_TheLoginButton).topSpaceToView(_TheLoginButton, 40*autoSizeScaleY).heightIs(50*autoSizeScaleY).widthIs(150*autoSizeScaleX);
        }
    }
    
    
    UIButton *messagrsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [messagrsBtn addTarget:self action:@selector(registered) forControlEvents:UIControlEventTouchUpInside];
    [messagrsBtn setTitle:Localized(@"还没有账号? 现在去免费注册") forState:UIControlStateNormal];
    messagrsBtn.titleLabel.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
    [messagrsBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [self.view addSubview:messagrsBtn];
    messagrsBtn.sd_layout.leftEqualToView(_TheLoginButton).rightEqualToView(_TheLoginButton).bottomSpaceToView(self.view, 46*autoSizeScaleY).heightIs(40*autoSizeScaleY);

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
        _ScrollView.contentOffset=CGPointMake(0, 0);
        PswAndCode=YES;
        [pswBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.5 animations:^{
            lingBtn.frame=frame(105, 92, 161, 4);
        }];
        
    }else{
        _ScrollView.contentOffset=CGPointMake(self.view.frame.size.width, 0);
        PswAndCode=NO;
         [pswBtn setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
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
    if ([_MobilePhoneNumber.text length]<1) {
         [FTIndicator showErrorWithMessage:@"请正确输入手机号"];
    }else{
        NSString *string;
        string=_CountriesArray[_ChooseTheCountr];
        if ([string isEqualToString:@"中国"]) {
            string=@"China";
        }else if ([string isEqualToString:@"中国香港"]){
            string=@"Hongkong";
        }else if ([string isEqualToString:@"中国澳门"]){
            string=@"Macau";
        }else if ([string isEqualToString:@"中国台湾"]){
            string=@"Taiwan";
        }
        [SVProgressHUD showWithStatus:Localized(@"正在获取验证码")];
    [LoginRequuestClass LogInToGeVerificationCode:_MobilePhoneNumber.text country:string block:^(NSDictionary *dic) {
        BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([class.code isEqualToString:@"21"]) {
            seconds=[[NSString stringWithFormat:@"%@",[[self deleteEmpty:dic]objectForKey:@"time"]]integerValue];
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
        seconds-=1;
        [ofCode setTitle:[NSString stringWithFormat:@"%lds",seconds] forState:UIControlStateNormal];
    }else{
        [ofCode setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
        [timer invalidate];
        timer = nil;
    }
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
   
    [timer invalidate];
    timer = nil;
}
-(void)dealloc{
    [timer invalidate];
    timer = nil;
}
//登录
-(void)onTheLognClick{
    if (PswAndCode) {//账号密码登录
        if ([_phoneNumber.text length]<1||[_psw.text length]<1) {
            [FTIndicator showErrorWithMessage:Localized(@"请正确输入手机号和密码")];
        }else{
            [SVProgressHUD showWithStatus:Localized(@"正在登录")];
            [LoginRequuestClass LoginUsername:_phoneNumber.text password:_psw.text block:^(NSDictionary *dic) {
                LoginBaseClass *login=[[LoginBaseClass alloc]initWithDictionary:dic];
                if ([login.code isEqualToString:@"1"]) {//登录成功
                    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:login.token forKey:@"token"];
                    //同步数据
                    [defaults synchronize];
                    NSLog(@"token====%@",tokenString);
                    [self dismissViewControllerAnimated:YES completion:^{
                         [[NSNotificationCenter defaultCenter] removeObserver:self];
                    }];
                    [FTIndicator showSuccessWithMessage:login.msg];
                }else{
                [TheParentClass YouNeedToLogIn:login.msg];
                }
                
                [SVProgressHUD dismiss];
                
                
            }];
        }
        
       
    }else{//手机验证码登录
        if ([_MobilePhoneNumber.text length]<1||[_code.text length]<1) {
             [FTIndicator showErrorWithMessage:Localized(@"请输入手机号码和验证码")];
        }else{
            NSString *string;
            string=_CountriesArray[_ChooseTheCountr];
            if ([string isEqualToString:@"中国"]) {
                string=@"China";
            }else if ([string isEqualToString:@"中国香港"]){
                string=@"Hongkong";
            }else if ([string isEqualToString:@"中国澳门"]){
                string=@"Macau";
            }else if ([string isEqualToString:@"中国台湾"]){
                string=@"Taiwan";
            }
            [SVProgressHUD showWithStatus:Localized(@"正在登录")];
        [LoginRequuestClass MobilePhoneLogin:_MobilePhoneNumber.text country:string validateCode:_code.text block:^(NSDictionary *dic) {
            LoginBaseClass *login=[[LoginBaseClass alloc]initWithDictionary:dic];
            if ([login.code isEqualToString:@"1"]) {//登录成功
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:login.token forKey:@"token"];
                //同步数据
                [defaults synchronize];
                [self dismissViewControllerAnimated:YES completion:^{
                    
                }];
                [FTIndicator showSuccessWithMessage:login.msg];
            }else{
                [TheParentClass YouNeedToLogIn:login.msg];
            }

            [SVProgressHUD dismiss];
        }];
            
            
        }
        
        
    
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
    CGSize size=[TheParentClass StringHeight:_CountriesArray[index] Lblfont:32*autoSizeScaleY heightOfTheMinus:0];
    [CHOOSE setTitle:_CountriesArray[index] forState:UIControlStateNormal];
    CHOOSE.sd_layout.widthIs(size.width);

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
        
        [self TheLanguageWwitchBox];
        
    }

}

//注册
-(void)registered{
    RegisteredViewController *Registered=[[RegisteredViewController alloc]init];
    [self.navigationController pushViewController:Registered animated:YES];

}
//资金密码设置完毕  要返回了
-(void)MoneyPassword{
[self dismissViewControllerAnimated:YES completion:^{
     [[NSNotificationCenter defaultCenter] removeObserver:self];
}];

}

-(void)TheLanguageWwitchBox{
    NSString *language=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]];
    
    UIAlertController *aler=[UIAlertController alertControllerWithTitle:Localized(@"prompt") message:Localized(@"choose") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:Localized(@"cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [aler addAction:action];
    //2.
    UIAlertAction *languageOne=[UIAlertAction actionWithTitle:@"简体中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if (![language isEqualToString:@"zh-Hans"]) {//目前不是简体中文需要切换
            //简体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
            //切换语言
            [self dismissViewControllerAnimated:YES completion:^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"InTheLoginScreenClickSwitchLanguageNeeds" object:nil];
            }];
            
        }
    }];
    [aler addAction:languageOne];
    UIAlertAction *languageTwo=[UIAlertAction actionWithTitle:@"繁體中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![language isEqualToString:@"zh-Hant"]) {//目前不是繁体中文需要切换
            //繁体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
            //切换语言
            [self dismissViewControllerAnimated:YES completion:^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"InTheLoginScreenClickSwitchLanguageNeeds" object:nil];
            }];
        }
        
    }];
    [aler addAction:languageTwo];
    UIAlertAction *languageThree=[UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![language isEqualToString:@"en"]) {//目前不是英文需要切换
            //英文
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            //切换语言
            [self dismissViewControllerAnimated:YES completion:^{
                [[NSNotificationCenter defaultCenter]postNotificationName:@"InTheLoginScreenClickSwitchLanguageNeeds" object:nil];
            }];
        }
        
    }];
    [aler addAction:languageThree];
    //最后一步
    [self presentViewController:aler animated:YES completion:nil];
}
//取消登录  返回
-(void)onReturnClick{
[self dismissViewControllerAnimated:YES completion:^{
    
}];
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
