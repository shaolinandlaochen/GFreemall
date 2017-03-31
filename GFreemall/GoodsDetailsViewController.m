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
@interface GoodsDetailsViewController ()<ProductScreeningDelegate,UITableViewDelegate,UITableViewDataSource,GoodsScrollViewDelegate>
{
    MyoptionsView *optionsView;
    UITableView *_tableView;
}
@end

@implementation GoodsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    autoSize
    leftCancel
    [self SetTheNavigationBar];
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    
   
    // Do any additional setup after loading the view.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0&&indexPath.row==0) {
        /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
        NSString *txt=@"a";
        return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[GoodsScrollViewCell class] contentViewWidth:self.view.frame.size.width];
    }
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }
    return 20;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
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
        }
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
}
//分享
-(void)onshareClick{

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
