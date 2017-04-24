//
//  CommodityListViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/5.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "CommodityListViewController.h"
#import "InventoryListCell.h"
#import "GoodsDetailsViewController.h"
@interface CommodityListViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@end

@implementation CommodityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"商品清单");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    

    
    [self CreatView];
    // Do any additional setup after loading the view.
}
-(void)CreatView{
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
     _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 260*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
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
     ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:self.dataDic];
    return class.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InventoryListCell *cell=[InventoryListCell new];
    
    ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:self.dataDic];
    
    ShoppingSettlementList *list=class.list[indexPath.row];
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.attr.commodityImagesPath,list.attr.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
    cell.list=list;

    
    
    
    return cell;

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GoodsDetailsViewController *GoodsDetails=[[GoodsDetailsViewController alloc]init];
    ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:self.dataDic];
    ShoppingSettlementList *list=class.list[indexPath.row];
    if (list.attr.commoditySerial==0) {
        list.attr.commoditySerial=list.carts.commodityId;
    }
    //[self.navigationController pushViewController:GoodsDetails animated:YES];
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
