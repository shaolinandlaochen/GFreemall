//
//  SetUpViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SetUpViewController.h"
#import "SetUpCell.h"
#import "FeedbackViewController.h"
#import "AboutViewController.h"
@interface SetUpViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation SetUpViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    autoSize
    self.title=Localized(@"设置");
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
    _tableView.scrollEnabled=NO;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
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
        return 20*autoSizeScaleY;
    }else if (section==1){
        return 136*autoSizeScaleY;
    }
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
    if (section==1) {
        UIView *view=[[UIView alloc]init];
        autoSize
        view.backgroundColor=[UIColor whiteColor];
        UIButton * _button=[UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _button.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
        _button.backgroundColor=[UIColor blackColor];
        [_button addTarget:self action:@selector(onGoClick) forControlEvents:UIControlEventTouchUpInside];
        _button.layer.cornerRadius = 6*autoSizeScaleX;
        _button.layer.masksToBounds = 6*autoSizeScaleX;
        [view addSubview:_button];
        _button.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).rightSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 20*autoSizeScaleY).bottomSpaceToView(view, 20*autoSizeScaleY);
        
        [_button setTitle:Localized(@"退出账号") forState:UIControlStateNormal];
        
        
        return view;
    }
    return nil;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }else if (section==1){
        return 1;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SetUpCell *cell=[SetUpCell new];
    if (indexPath.section==0&&indexPath.row==0) {
        cell.name.text=Localized(@"关于");
        cell.img.image=[UIImage imageNamed:@"icon_right"];

    }else if (indexPath.section==0&&indexPath.row==1){
        cell.userInteractionEnabled = NO;
        cell.name.text=Localized(@"当前版本号");
        cell.context.text=@"1.0";
    }else if (indexPath.section==1&&indexPath.row==0){
        cell.name.text=Localized(@"意见反馈");
        cell.img.image=[UIImage imageNamed:@"icon_right"];
    }
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {//意见反馈
        FeedbackViewController *Feedback=[[FeedbackViewController alloc]init];
        [self.navigationController pushViewController:Feedback animated:YES];
    }else if (indexPath.section==0&&indexPath.row==0){//关于
        AboutViewController *About=[[AboutViewController alloc]init];
        [self.navigationController pushViewController:About animated:YES];
    }
    
}
//退出账号
-(void)onGoClick{
    [FTIndicator showSuccessWithMessage:@"退出登录成功"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"" forKey:@"token"];
    //同步数据
    [defaults synchronize];

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
