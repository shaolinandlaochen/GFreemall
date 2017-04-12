//
//  GFMS.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GFMS.h"
#import "GFMCell.h"
@interface GFMS ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation GFMS
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];

    [self CreatView];
    // Do any additional setup after loading the view.
}
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, 0).bottomSpaceToView(self.view, 98*autoSizeScaleY);
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 360*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
 
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 0;
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

    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    GFMCell *cell=[GFMCell new];
    cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    cell.bgImage.image=[UIImage imageNamed:@"bg_aijifen"];
    cell.typeImg.image=[UIImage imageNamed:@"logo_aijifen"];
    cell.type.text=Localized(@"爱积分");
    [cell.CheckTheDetailsBtn addTarget:self action:@selector(onCheckTheDetailBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.TotalAssets.text=@"9999999";
    cell.FreezeMone.text=@"100000000";
    cell.availableMoney.text=@"6516565";
    [cell.RollOutBtn addTarget:self action:@selector(onRollOutClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}
//查看明细
-(void)onCheckTheDetailBtnClick:(MyButton *)btn{
    NSLog(@"查看明细");

}
-(void)onRollOutClick:(MyButton *)btn{


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
