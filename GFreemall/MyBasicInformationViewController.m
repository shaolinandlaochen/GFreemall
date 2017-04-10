//
//  MyBasicInformationViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyBasicInformationViewController.h"
#import "basicInformationCell.h"
#import "ReplaceAPhoneNumberViewController.h"
@interface MyBasicInformationViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation MyBasicInformationViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"基本信息");
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
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 90*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        basicInformationCell *cell=[basicInformationCell new];
        if (indexPath.row==0) {
            cell.name.text=Localized(@"账户ID");
            cell.userInteractionEnabled = NO;
            cell.string.text=@"56464646";
        }else if (indexPath.row==1){
            cell.name.text=Localized(@"账户手机");
            cell.string.text=@"137******89";
        }else if (indexPath.row==2){
            cell.name.text=Localized(@"用户名");
            cell.string.text=@"未设置";
            cell.imgName=@"icon_right";
        }else if (indexPath.row==3){
            cell.name.text=Localized(@"实名认证");
            cell.string.text=@"未认证";
            cell.imgName=@"icon_right";
            
        }else if (indexPath.row==4){
            cell.name.text=Localized(@"账户邮箱");
            cell.string.text=@"未设置";
            cell.imgName=@"icon_right";
            
        }
        return cell;
    }
    NULLCell *celll=[NULLCell new];
    return celll;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ReplaceAPhoneNumberViewController *ReplaceAPhoneNumber=[[ReplaceAPhoneNumberViewController alloc]init];
    
    if (indexPath.row==1) {//更换手机号
     ReplaceAPhoneNumber.were=@"更换手机号";
    }else if (indexPath.row==2){
     ReplaceAPhoneNumber.were=@"用户名设置";
    }else if (indexPath.row==3){
        ReplaceAPhoneNumber.were=@"实名认证";
    }else if (indexPath.row==4){
        ReplaceAPhoneNumber.were=@"邮箱绑定";
    }
    [self.navigationController pushViewController:ReplaceAPhoneNumber animated:YES];
    
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
