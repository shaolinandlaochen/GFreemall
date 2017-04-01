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
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(_MyScreening, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    // Do any additional setup after loading the view.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
  
    /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
    if (indexPath.section<10) {
        NSString *txt=@"a";
        return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[TheEvaluationListCell class] contentViewWidth:self.view.frame.size.width];
    }
   
    return 0;
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
    if (section<10) {
        DistrictHeadView *view=[[DistrictHeadView alloc]init];
        return view;
    }
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section<10) {
        TheEvaluationListCell *cell=[TheEvaluationListCell new];
         cell.userInteractionEnabled = NO;
        return cell;
    }
    NULLCell *celll=[NULLCell new];
    return celll;
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
    switch (idx) {
        case 0://全部
        {
        
        }
            break;
        case 1://好评
        {
            
        }
            break;
        case 2://中平
        {
            
        }
            break;
        case 3://差评
        {
            
        }
            break;
            
        default:
            break;
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
