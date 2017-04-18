//
//  EvaluationViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/1.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "EvaluationViewController.h"
#import "TheEvaluationListCell.h"
#import "DistrictHeadView.h"
#import "MyScreeningView.h"
#import "GoodsDetailsRequest.h"
@interface EvaluationViewController ()<UITableViewDelegate,UITableViewDataSource,MyScreeningViewDelegate>
{

    UITableView *_tableView;
    MyScreeningView *_MyScreening;
}
@end

@implementation EvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    [self MyScreening];//天机筛选条
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(_MyScreening, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    [self GetAllTheEvaluation:nil serial:self.commodity_serial];
    // Do any additional setup after loading the view.
}
//获取评价列表
-(void)GetAllTheEvaluation:(NSString *)queryType serial:(NSString *)serial{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [GoodsDetailsRequest ToObtainAListEvaluationqueryType:queryType serial:serial block:^(NSDictionary *dics) {
        self.dataDic=[self deleteEmpty:dics];
        ProductEvaluationBaseClass *class=[[ProductEvaluationBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"6"]) {
             [_tableView reloadData];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
       
        [SVProgressHUD dismiss];
    
    }];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
  
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
  
        ProductEvaluationBaseClass *class=[[ProductEvaluationBaseClass alloc]initWithDictionary:self.dataDic];
        ProductEvaluationResultList *list=class.listComment.resultList[indexPath.section];
        return [tableView cellHeightForIndexPath:indexPath model:list keyPath:@"model" cellClass:[TheEvaluationListCell class] contentViewWidth:self.view.frame.size.width];
    

}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
  
    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
   
    return 98*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
 
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  ProductEvaluationBaseClass *class=[[ProductEvaluationBaseClass alloc]initWithDictionary:self.dataDic];
    DistrictHeadView *view=[[DistrictHeadView alloc]init];
    view.model=class.listComment.resultList[section];
    return view;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    ProductEvaluationBaseClass *class=[[ProductEvaluationBaseClass alloc]initWithDictionary:self.dataDic];
    
    return class.listComment.resultList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     ProductEvaluationBaseClass *class=[[ProductEvaluationBaseClass alloc]initWithDictionary:self.dataDic];
    TheEvaluationListCell *cell=[TheEvaluationListCell new];
    cell.model=class.listComment.resultList[indexPath.section];
    cell.userInteractionEnabled = NO;
    return cell;

}
-(void)MyScreening{
    autoSize
    _MyScreening=[[MyScreeningView alloc]init];
    _MyScreening.delegate=self;
    [self.view addSubview:_MyScreening];
    _MyScreening.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(110*autoSizeScaleY);
}
//点击筛选按钮
-(void)index:(NSInteger)idx{
    NSLog(@"%ld",idx);
    NSString *queryType;
    switch (idx) {
        case 0://全部
        {
            queryType=nil;
        }
            break;
        case 1://好评
        {
            queryType=@"good";
        }
            break;
        case 2://中平
        {
            queryType=@"comm";
        }
            break;
        case 3://差评
        {
            queryType=@"bad";
        }
            break;
            
        default:
            break;
    }
    
     [self GetAllTheEvaluation:queryType serial:self.commodity_serial];

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
