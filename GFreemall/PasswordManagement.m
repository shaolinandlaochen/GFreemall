//
//  PasswordManagement.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/7.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "PasswordManagement.h"
#import "SetUpCell.h"
#import "ReplaceAPhoneNumberViewController.h"
@interface PasswordManagement ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation PasswordManagement

- (void)viewDidLoad {
    [super viewDidLoad];
    
    autoSize
    self.title=Localized(@"密码管理");
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
    
    return nil;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
        SetUpCell *cell=[SetUpCell new];
        cell.img.image=[UIImage imageNamed:@"icon_right"];
        if (indexPath.row==0) {
            cell.name.text=Localized(@"修改支付密码");
        }else if (indexPath.row==1){
            cell.name.text=Localized(@"忘记支付密码");
        }
        
        return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
      ReplaceAPhoneNumberViewController *ReplaceAPhoneNumber=[[ReplaceAPhoneNumberViewController alloc]init];
    if (indexPath.row==0) {
      
        ReplaceAPhoneNumber.were=@"修改支付密码";
       
    }else if (indexPath.row==1){
         ReplaceAPhoneNumber.were=@"安全验证";
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
