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
#import "OrderDetailsRequest.h"
@interface ConfirmTheGoodsViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation ConfirmTheGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    if ([self.ASuccess isEqualToString:@"成功"]) {
        self.title=Localized(@"确认收货成功");
    }else{
    self.title=Localized(@"待评价订单列表");
    }
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
//加载数据
-(void)QequestData{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [OrderDetailsRequest OrderDetails:self.serial block:^(NSDictionary *dics) {
        self.dataDic=[self deleteEmpty:dics];
        OrderDetailsBaseClass *class=[[OrderDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"51"]) {
            [_tableView reloadData];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        [_tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    }];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    TheDrop_downRefresh(_tableView, @selector(QequestData))
  
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
      [SVProgressHUD dismiss];
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
    OrderDetailsBaseClass *classData=[[OrderDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    OrderDetailsCommodity *commodity=classData.map.commodity[indexPath.row];
    if (commodity.commodityIscomment==0) {
        return 238*autoSizeScaleY;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if ([self.ASuccess isEqualToString:@"成功"]) {
         return 380*autoSizeScaleY;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if ([self.ASuccess isEqualToString:@"成功"]) {
        ReceivingASuccessfulShow *view=[[ReceivingASuccessfulShow alloc]init];
        view.backgroundColor=[UIColor whiteColor];
        view.img.image=[UIImage imageNamed:@"icon_success"];
        view.name.text=@"确认收货成功";
        
        return view;
    }

    
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    OrderDetailsBaseClass *classData=[[OrderDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    return classData.map.commodity.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     OrderDetailsBaseClass *classData=[[OrderDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    OrderDetailsCommodity *commodity=classData.map.commodity[indexPath.row];
    if (commodity.commodityIscomment==0) {
        StayEvaluationListCell *cell=[StayEvaluationListCell new];
        [cell.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",classData.imgSrc,commodity.commodityImagesPath,commodity.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
        cell.title.text=commodity.commodityName;
        [cell.btn setTitle:@"去评价" forState:UIControlStateNormal];
        cell.btn.indexPath=indexPath;
        [cell.btn addTarget:self action:@selector(onButtonCLIck:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    NULLCell *cell=[NULLCell new];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
}
//去评价
-(void)onButtonCLIck:(MyButton *)btn{
    OrderDetailsBaseClass *classData=[[OrderDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    OrderDetailsCommodity *commodity=classData.map.commodity[btn.indexPath.row];
    EvaluationOfTheViewViewController *EvaluationOfTheView=[[EvaluationOfTheViewViewController alloc]init];
    EvaluationOfTheView.order_serial=[NSString stringWithFormat:@"%.0f",classData.map.orderSerial];
    EvaluationOfTheView.commodity_serial=[NSString stringWithFormat:@"%.0f",commodity.commoditySerial];
    EvaluationOfTheView.order_commodity_id=[NSString stringWithFormat:@"%.0f",commodity.commodityIdentifier];
    EvaluationOfTheView.iconImage=[NSString stringWithFormat:@"%@%@%@",classData.imgSrc,commodity.commodityImagesPath,commodity.commodityCoverImage];
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
