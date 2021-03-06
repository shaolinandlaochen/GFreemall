//
//  SetThPasswordAgainViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SetThPasswordAgainViewController.h"
#import "BaseInputBoxCell.h"
#import "LoginRequuestClass.h"
#import "TheLoginViewController.h"
@interface SetThPasswordAgainViewController ()<UITableViewDataSource,UITableViewDelegate,BaseInputBoxDelegate>

{
    UITableView *_tableView;
    UIButton *_button;
    NSString *_Psw;
    NSString *_ToPsw;
}

@end

@implementation SetThPasswordAgainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"忘记密码");
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
           if (indexPath.row==0) {
            cell.tf.placeholder=Localized(@"请输入密码");
            
        }else if (indexPath.row==1){
            cell.tf.placeholder=Localized(@"请再次输入密码");
        }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}
//捕捉输入框输入内容
-(void)ToObtainInputBox:(MyTextField *)TextField{
    if (TextField.indexPath.row==0) {
        _Psw=TextField.text;
    }else if (TextField.indexPath.row==1){
        _ToPsw=TextField.text;
    }

}
//点击获取验证码
-(void)onButtonClick:(MyButton *)btnn{
    
}
//确定或者下一步
-(void)onGoClick:(UIButton *)btn{

    if ([_Psw length]<1||[_ToPsw length]<1) {
        [FTIndicator showErrorWithMessage:Localized(@"请完整填写密码")];
    }else{
        [SVProgressHUD showWithStatus:Localized(@"loading")];
    [LoginRequuestClass ChangeThePassword:_Psw confirmPassword:_ToPsw phone:self.phone captcha:self.captcha country:self.country block:^(NSDictionary *dic) {
        LoginBaseClass *class=[[LoginBaseClass alloc]initWithDictionary:[self deleteEmpty:dic]];
        if ([class.code isEqualToString:@""]) {
            //返回登录界面
            ReturnToSpecifyTheController(TheLoginViewController)
            [FTIndicator showSuccessWithMessage:class.msg];
        }else{
             [FTIndicator showErrorWithMessage:class.msg];
        }
        
    [SVProgressHUD dismiss];
        
    }];
       
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
