//
//  GoodsDetailsViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "GoodsDetailsViewController.h"
#import "MyoptionsView.h"
#import "GoodsScrollViewCell.h"
#import "ProductDetailsDescriptionCell.h"
#import "CostCalculationCell.h"
#import "SKUCell.h"
#import "EvaluationOfTheHeadView.h"
#import "UserCommentsCell.h"
#import "AllEvaluationView.h"
#import "HTMLContextCell.h"
#import "purchaseOfGoods.h"
#import "GoodsDetailsHTMLContextViewController.h"
#import "EvaluationViewController.h"
@interface GoodsDetailsViewController ()<ProductScreeningDelegate,UITableViewDelegate,UITableViewDataSource,GoodsScrollViewDelegate,HTMLContextDelegate,UIScrollViewDelegate>
{
    MyoptionsView *optionsView;
    UITableView *_tableView;
    float _htmlHeight;
    purchaseOfGoods *goods;
    UIScrollView *_scrollView;
    NSInteger _page;
}
@end

@implementation GoodsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _htmlHeight=0;
    _page=0;
     self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    autoSize
    leftCancel
    [self SetTheNavigationBar];
    [self PurchaseOfGoodsView];
    [self BuildView];
    

    
   
    // Do any additional setup after loading the view.
}
-(void)htmlHeight:(float)height{
    if (height>_htmlHeight) {
        _htmlHeight=height;
    
        [_tableView reloadData];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (indexPath.section==0&&indexPath.row==0) {
        /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
        NSString *txt=@"a";
        return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[GoodsScrollViewCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==0&&indexPath.row==1){
        NSString *txt=@"a";
        return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[ProductDetailsDescriptionCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==0&&indexPath.row==2){
        NSString *txt=@"a";
        return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[CostCalculationCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==1){
        return 114*autoSizeScaleY;
    }else if (indexPath.section==2){
        NSString *txt=@"a";
        return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[UserCommentsCell class] contentViewWidth:self.view.frame.size.width];
    }else if (indexPath.section==3){
        return _htmlHeight;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    if (section==2) {
        return 110*autoSizeScaleY;
    }else if (section==3){
        return 0;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==2){
        return 80*autoSizeScaleY;
    }else if (section==3){
        return 10;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section==2) {
        AllEvaluationView *view=[[AllEvaluationView alloc]init];
        [view.button addTarget:self action:@selector(onAllEvaluationClick) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==2) {
        EvaluationOfTheHeadView *view=[[EvaluationOfTheHeadView alloc]init];
        [view.icon addTarget:self action:@selector(onRatingClick) forControlEvents:UIControlEventTouchUpInside];
        [view.percentageNumber addTarget:self action:@selector(onRatingClick) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 3;
    }else if (section==1){
        return 1;
    }else if (section==2){
        return 3;
    }else if(section==3){
        return 1;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            GoodsScrollViewCell *cell=[GoodsScrollViewCell new];
            cell.delegate=self;
            cell.scroll.imageURLStringsGroup=@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490962388422&di=699eff8380ac100ebae0644858d461b5&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Fa%2F57a0131036064.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490962388808&di=7208e5784e83401b8974c309a0ae9d75&imgtype=0&src=http%3A%2F%2Fimg.pconline.com.cn%2Fimages%2Fupload%2Fupc%2Ftx%2Fitbbs%2F1702%2F10%2Fc23%2F37092600_1486715381472_mthumb.jpg"];
            return cell;
        }else if (indexPath.row==1){
            ProductDetailsDescriptionCell *cell=[ProductDetailsDescriptionCell new];
            cell.userInteractionEnabled = NO;
            return cell;
        }else if (indexPath.row==2){
            CostCalculationCell *cell=[CostCalculationCell new];
            cell.userInteractionEnabled = NO;
            return cell;
        }
    }else if (indexPath.section==1){
        SKUCell *cell=[SKUCell new];
        return cell;
    }else if (indexPath.section==2){
        UserCommentsCell *cell=[UserCommentsCell new];
        cell.userInteractionEnabled = NO;
        return cell;
    }else if (indexPath.section==3){
        HTMLContextCell *cell=[HTMLContextCell new];
        cell.delegate=self;
        cell.width=self.view.frame.size.width;
        return cell;
    }
    
    NULLCell *celll=[NULLCell new];
    return celll;
}
//点击滚动视图执行该方法
-(void)GoodsScroll:(NSInteger)index{
    NSLog(@"%ld",index);

}



cancelClick
//添加logo以及购物车图标
-(void)SetTheNavigationBar{
    autoSize
    //logo
     CGRect navheight = self.navigationController.navigationBar.frame;//导航栏目高度
    optionsView =[[MyoptionsView alloc]init];
    optionsView.delegate=self;
    optionsView.frame=CGRectMake(0, 0, navheight.size.width, navheight.size.height);
    self.navigationItem.titleView = optionsView;
    //右按钮项
    UIView *view=[[UIView alloc]initWithFrame:frame(0, 0, 50, 80)];
    view.backgroundColor=[UIColor clearColor];
    UIButton *BarButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [BarButton setBackgroundImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    BarButton.frame=frame(0, 20, 50, 50);
    [BarButton addTarget:self action:@selector(onshareClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:BarButton];
    
    //右按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItem=item;
    
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    
}
///代理方法//用户点击详情评论或者商品执行该方法
-(void)ProductScreening:(MyButton *)btn{
    NSLog(@"我是代理===%ld",btn.tag);
    //点击方法滚动到指定位置
    _page=btn.tag-1;
    CGPoint position = CGPointMake(_page*self.view.frame.size.width, 0);
    [_scrollView setContentOffset:position animated:YES];
}
//分享
-(void)onshareClick{

}
//好评度
-(void)onRatingClick{

}

//全部评论
-(void)onAllEvaluationClick{

}
//构建立即购买按钮
-(void)PurchaseOfGoodsView{
    autoSize
    goods=[[purchaseOfGoods alloc]init];
    [self.view addSubview:goods];
    goods.sd_layout.leftSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(96*autoSizeScaleY);
    
}
//构建视图
-(void)BuildView{
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _scrollView=[[UIScrollView alloc]init];
    _scrollView.delegate=self;
    // 是否分页
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = FALSE;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    _scrollView.backgroundColor=[TheParentClass colorWithHexString:@"f3f5f7"];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize=CGSizeMake(self.view.frame.size.width*3, 0);
    _scrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height).bottomSpaceToView(goods, 0);
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"f3f5f7"];
    [_scrollView addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(_scrollView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    //详情
    GoodsDetailsHTMLContextViewController *goodsDetailHtmlContextView=[[GoodsDetailsHTMLContextViewController alloc]init];
    [_scrollView addSubview:goodsDetailHtmlContextView.view];
    goodsDetailHtmlContextView.view.sd_layout.leftSpaceToView(_tableView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    [self addChildViewController:goodsDetailHtmlContextView];
    
    //评价
    EvaluationViewController *evaluation=[[EvaluationViewController alloc]init];
    [_scrollView addSubview:evaluation.view];
    evaluation.view.sd_layout.leftSpaceToView(_tableView, self.view.frame.size.width).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    [self addChildViewController:evaluation];

}
//结束滚动时执行该方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    optionsView.ScrollPage=_page;
}


- (void) scrollViewDidScroll:(UIScrollView *)sender {
    // 得到每页宽度
    CGFloat pageWidth = sender.frame.size.width;
    // 根据当前的x坐标和页宽度计算出当前页数
    int currentPage = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (currentPage!=_page) {//然后再改变上面按钮的大小以及红条的坐标
        _page=currentPage;
        
    }
  
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
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
