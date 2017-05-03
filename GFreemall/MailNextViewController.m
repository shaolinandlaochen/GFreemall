//
//  MailNextViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MailNextViewController.h"
#import "BaseInputBoxCell.h"
#import "TheBasicInformationRequest.h"
#import "MyBasicInformationViewController.h"
@interface MailNextViewController ()<UITableViewDataSource,UITableViewDelegate,BaseInputBoxDelegate>

{
    UITableView *_tableView;
    UIButton *_button;
    NSInteger seconds;
    NSTimer *timer;
    NSString *_code;
}

@end

@implementation MailNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"邮箱绑定");
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

    return 136*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 100*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    autoSize
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[TheParentClass colorWithHexString:@"#ffdfdf"];
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"icon_tip"];
    [view addSubview:img];
    img.sd_layout.leftSpaceToView(view, 24*autoSizeScaleX).topSpaceToView(view, 34*autoSizeScaleY).bottomSpaceToView(view, 34*autoSizeScaleY).widthIs(32*autoSizeScaleX);
    
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
    lbl.font=[UIFont systemFontOfSize:24*autoSizeScaleX];
    lbl.text=[NSString stringWithFormat:@"请登录%@邮箱查收验证代码,进行验证",self.email];
    [view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(img, 0).rightSpaceToView(view, 0).topSpaceToView(view, 0).bottomSpaceToView(view, 0);
    
    
    return view;
    

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    autoSize
    view.backgroundColor=[UIColor whiteColor];
    _button=[UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    _button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    _button.backgroundColor=[UIColor blackColor];
    [_button addTarget:self action:@selector(onGoClick:) forControlEvents:UIControlEventTouchUpInside];
    _button.layer.cornerRadius = 6*autoSizeScaleX;
    _button.layer.masksToBounds = 6*autoSizeScaleX;
    [view addSubview:_button];
    _button.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).bottomSpaceToView(view, 20*autoSizeScaleY);
  
    [_button setTitle:Localized(@"提交") forState:UIControlStateNormal];
    

    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseInputBoxCell *cell=[BaseInputBoxCell new];
    self.delegate=cell;
    cell.delegate=self;
    [cell.btn.layer setBorderColor:[UIColor clearColor].CGColor];
    cell.btn.indexPath=indexPath;
    cell.tf.indexPath=indexPath;
    cell.tf.placeholder=Localized(@"请输入邮箱验证码");
    [cell.btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
    [cell.btn setTitle:Localized(@"获取验证码") forState:UIControlStateNormal];
    [cell.btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
//点击获取验证码
-(void)onButtonClick:(MyButton *)btnn{
    [TheBasicInformationRequest E_mailVerificationCodeSentbase_email:self.email block:^(NSDictionary *disa) {
        BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
        if ([class.code isEqualToString:@"68"]) {
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
//提交
-(void)onGoClick:(UIButton *)btn{
    
    if ([_code length]>0) {
        [TheBasicInformationRequest BindingEmail:self.email captcha:_code block:^(NSDictionary *disa) {
             BasicInformationBaseClass *class=[[BasicInformationBaseClass alloc]initWithDictionary:[self deleteEmpty:disa]];
            if ([class.code isEqualToString:@"67"]) {
                ReturnToSpecifyTheController(MyBasicInformationViewController)
            }
            [FTIndicator showSuccessWithMessage:class.msg];
        }];
    }else{
        [FTIndicator showErrorWithMessage:@"请填写验证码"];
    }
    

    

}


-(void)action{
    
    if (seconds>0) {
        seconds-=1;
        [_delegate MailNextViewButtonTitleString:[NSString stringWithFormat:@"%lds",seconds]];
    }else{
        [_delegate MailNextViewButtonTitleString:@"获取验证码"];
        [timer invalidate];
        timer = nil;
    }
    
}
-(void)dealloc{
    [timer invalidate];
    timer = nil;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
//返回输入字符串
-(void)ToObtainInputBox:(MyTextField *)TextField{
    _code=TextField.text;
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
