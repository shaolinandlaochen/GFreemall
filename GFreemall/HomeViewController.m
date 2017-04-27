//
//  HomeViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//
#define AppLanguage @"appLanguage"


#import "HomeViewController.h"
#import "HomeCell.h"
#import "NULLCell.h"
#import "ScrollViewCell.h"
#import "MyView.h"
#import "ThreePictureCell.h"
#import "ImageCell.h"
#import "MoreAndMoreCell.h"
#import "MyNewsViewController.h"
#import "GFMViewController.h"
#import "DataAccessPageRequest.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,HomeScrollViewDelegate,MoreAndMoreeDelegate>
{
    UIButton *BarButton;//导航条按钮1
    UITableView *_tableView;
    UILabel * number;
    float _cellHeight;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize

    [self SetTheNavigationBar];//设置导航条
    float htight=98*autoSizeScaleY;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.frame.size.height-htight) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
//下拉刷新
  TheDrop_downRefresh(_tableView, @selector(DataAccessPageRequestClick))
    
    // Do any additional setup after loading the view.
}
-(void)DataAccessPageRequestClick{
[DataAccessPageRequest DataAccessPageRequestBlock:^(NSDictionary *dics) {
    self.dataDic=[self deleteEmpty:dics];
    //HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:self.dataDic];
    [_tableView reloadData];
    [_tableView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
}];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        HomeBaseClass *Class=[[HomeBaseClass alloc]initWithDictionary:self.dataDic];
        if (Class.ads.ad1.count>0) {//首页banne有广告
            return 2;
        }else{
            return 1;
        }
    }else if (section==1){
        return 1;
    }else if (section==2){
        return 1;
    }else if (section==3){
        return 1;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataDic!=nil) {
        return 4;
    }
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0&&indexPath.row==0) {
        SearchViewController *search=[[SearchViewController alloc]init];
        search.where=@"搜索";
        [self.navigationController pushViewController:search animated:YES];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
autoSize
    if (indexPath.section==0&&indexPath.row==0) {
        return 94*autoSizeScaleY;
    }else if (indexPath.section==0&&indexPath.row==1) {
        return 234*autoSizeScaleY;
    }else if (indexPath.section==1){
        HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:self.dataDic];
        return [tableView cellHeightForIndexPath:indexPath model:class keyPath:@"model" cellClass:[ThreePictureCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==2){
        HomeBaseClass *class=[[HomeBaseClass alloc]initWithDictionary:self.dataDic];
        return [tableView cellHeightForIndexPath:indexPath model:class keyPath:@"model" cellClass:[ImageCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==3){
        return _cellHeight;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
autoSize
    if (section==1||section==2||section==3) {
        return 88*autoSizeScaleY;
    }
    return 0;
}
-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
     MyView *view=[[MyView alloc]init];
    view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    if (section==1) {
        view.img.image=[UIImage imageNamed:@"icon_new99"];
        view.lbl.text=Localized(@"NEW GOODS 新品");
        return view;
    }else if (section==2){
         view.img1.image=[UIImage imageNamed:@"shape_tuijian_left"];
         view.img2.image=[UIImage imageNamed:@"shape_tuijian_right"];
         view.imgviiew.image=[UIImage imageNamed:@"icon_tuijian99"];
        view.context.textColor=[TheParentClass colorWithHexString:@"#0fa4f3"];
        view.string=@"人气推荐";
        
        return view;
    }else if (section==3){
        view.img1.image=[UIImage imageNamed:@"shape_hot_left"];
        view.img2.image=[UIImage imageNamed:@"shape_hot_right"];
        view.imgviiew.image=[UIImage imageNamed:@"icon_hot"];
         view.context.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        view.string=@"HOT热卖";
        return view;
    }
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0&&indexPath.row==0) {
        HomeCell *cell=[HomeCell new];
        return cell;
    }else if (indexPath.section==0&&indexPath.row==1){
        
        ScrollViewCell *cell=[ScrollViewCell new];
        cell.Dic=self.dataDic;
        cell.delegate=self;
        return cell;
    }else if (indexPath.section==1) {//新款
        ThreePictureCell *cell=[ThreePictureCell new];
        cell.model=self.dataDic;
        [cell.oneBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.twoBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.threeBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else if (indexPath.section==2){//推荐
        ImageCell *cell=[ImageCell new];
        cell.model=self.dataDic;
        return cell;
       
    }else if(indexPath.section==3){//热卖
        MoreAndMoreCell *cell=[MoreAndMoreCell new];
        cell.delegatte=self;
        cell.model=self.dataDic;
        return cell;
    }
    NULLCell *celll=[NULLCell new];
    

    return celll;
}
-(void)SetTheNavigationBar{
    autoSize
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"language") style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButtonClick)];
    self.navigationItem.leftBarButtonItem=leftItem;
    [self.navigationItem.leftBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    //logo
    UIImageView *img=[[UIImageView alloc]initWithFrame:frame(0, 0, 150, 60)];
    img.image=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView = img;
    //右按钮项
    UIView *view=[[UIView alloc]initWithFrame:frame(0, 0, 200, 80)];
    view.backgroundColor=[UIColor clearColor];
    BarButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [BarButton setBackgroundImage:[UIImage imageNamed:@"icon_news"] forState:UIControlStateNormal];
    BarButton.frame=frame(150, 20, 50, 50);
    [BarButton addTarget:self action:@selector(onBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:BarButton];
    
    number=[[UILabel alloc]init];
    number.text=@"99";
    number.layer.cornerRadius = 13*autoSizeScaleX;
    number.layer.masksToBounds = 13*autoSizeScaleX;
    if ([number.text length]==1) {
        number.frame=frame(170, 10, 26, 26);
    }else if ([number.text length]>1){
        number.frame=frame(170, 10, 36, 26);
    }
    number.textColor=[UIColor whiteColor];
    number.textAlignment=NSTextAlignmentCenter;
    number.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
    number.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
    [view addSubview:number];
    //右按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItem=item;
    
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];

}
//点击导航条左按钮执行该方法(选择语言)
-(void)onLeftButtonClick{
    [TheParentClass languaggeSwitch];
        
}
//点击右边导航条按钮执行该方法
-(void)onBarButtonClick:(UIButton *)btn{
//    MyNewsViewController *news=[[MyNewsViewController alloc]init];
//    [self.navigationController pushViewController:news animated:YES];
    GFMViewController *gfm=[[GFMViewController alloc]init];
    UINavigationController *navGFM=[[UINavigationController alloc]initWithRootViewController:gfm];
    [self presentViewController:navGFM animated:YES completion:^{
        
    }];

}
//点击滚动视图执行该方法
-(void)HomeScroll:(NSInteger)index{
    GoodsDetailsViewController *goodsDetails=[[GoodsDetailsViewController alloc]init];
    [self.navigationController pushViewController:goodsDetails animated:YES];
}
//点击第一区三个按钮执行该方法
-(void)onSectionOneMyButtonClick:(MyButton *)btn{
    SearchViewController *search=[[SearchViewController alloc]init];
    search.where=@"商品";
    [self.navigationController pushViewController:search animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)cellHeight:(float)height{
    if (_cellHeight<height) {
        _cellHeight=height;
        FormToUpdate(3, _tableView)
    }

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_tableView.mj_header endRefreshing];
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
