//
//  ConfirmTheGoodsViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ConfirmTheGoodsViewController.h"
#import "StayEvaluationListCell.h"
#import "ReceivingASuccessfulShow.h"
#import "EvaluationOfTheViewViewController.h"
@interface ConfirmTheGoodsViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation ConfirmTheGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"确认收货成功");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
-(void)CreatView{

    _tableView =[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 238*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 380*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ReceivingASuccessfulShow *view=[[ReceivingASuccessfulShow alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    view.img.image=[UIImage imageNamed:@"icon_success"];
    view.name.text=@"确认收货成功";
    
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    StayEvaluationListCell *cell=[StayEvaluationListCell new];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491459623882&di=a59328062fe263027fb17f1727903f49&imgtype=0&src=http%3A%2F%2Fpic2.nipic.com%2F20090427%2F47541_171444055_2.jpg"] placeholderImage:[UIImage imageNamed:@""]];
    cell.title.text=@"电饭锅电饭锅电饭锅电饭锅电饭锅地方方法滚动固定队的";
    [cell.btn setTitle:@"去评价" forState:UIControlStateNormal];
    cell.btn.indexPath=indexPath;
    [cell.btn addTarget:self action:@selector(onButtonCLIck:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}
//去评价
-(void)onButtonCLIck:(MyButton *)btn{
    EvaluationOfTheViewViewController *EvaluationOfTheView=[[EvaluationOfTheViewViewController alloc]init];
    [self.navigationController pushViewController:EvaluationOfTheView animated:YES];
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
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
