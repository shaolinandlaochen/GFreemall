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
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UIButton *BarButton;//导航条按钮1
    UITableView *_tableView;
    UILabel * number;
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
    
    [self.view addSubview:_tableView];

    [SVProgressHUD dismiss];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else if (section==1){
        return 1;
    }else if (section==2){
        return 1;
    }
    return 3;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
autoSize
    if (indexPath.section==0&&indexPath.row==0) {
        return 94*autoSizeScaleY;
    }else if (indexPath.section==0&&indexPath.row==1) {
        return 234*autoSizeScaleY;
    }else if (indexPath.section==1){
        return 567*autoSizeScaleY;
    }else if (indexPath.section==2){
        return 328*autoSizeScaleY;
    }else if (indexPath.section>2){
        return 360*autoSizeScaleY;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
autoSize
    if (section==1||section==2) {
        return 88*autoSizeScaleY;
    }
    return 0;
}
-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==1) {
        MyView *view=[[MyView alloc]init];
        return view;
    }else if (section==2){
        MyView *view=[[MyView alloc]init];
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
        [cell.MyBtn addTarget:self action:@selector(onScrollButtonCkick:) forControlEvents:UIControlEventTouchUpInside];
        cell.Array=@[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490760588936&di=9cca48297ec4287d0156df10b575178d&imgtype=0&src=http%3A%2F%2Fimg.tuku.cn%2Ffile_big%2F201502%2Fd130653bfb884152b8a5ba9e846362d1.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490760588936&di=9e037dbdca9c38c8de8142b07acfda55&imgtype=0&src=http%3A%2F%2Fsoft.luobou.com%2Fbizhi%2Ffengjing%2F1473141512150.jpg"];
        return cell;
    }else if (indexPath.section==1) {
        ThreePictureCell *cell=[ThreePictureCell new];
        [cell.oneBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.oneBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490765107052&di=a2d05e5f5a9a5823fd6fdfdfd9c60ff3&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fbaike%2Fpic%2Fitem%2F8c1001e93901213fb7af127e51e736d12e2e95f7.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        
        [cell.twoBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
         [cell.smallOneBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.smallOneBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490897310699&di=57d518cff33e7e2a8d1fe0b0791fcad9&imgtype=0&src=http%3A%2F%2Fup.ekoooo.com%2Fuploads2%2Ftubiao%2F2%2F20088663030703778010.png"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        
        [cell.threeBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
         [cell.smallTwoBtn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.smallTwoBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490897468757&di=01657cb7da33cd9474d1ff43131515f5&imgtype=0&src=http%3A%2F%2Fimg.article.pchome.net%2F00%2F37%2F47%2F30%2Fpic_lib%2Fwm%2Fc157b278a76dc9a72bf76fb5fd53599d.JPG"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        return cell;
    }else if (indexPath.section==2){
        ImageCell *cell=[ImageCell new];
        [cell.btn addTarget:self action:@selector(onSectionOneMyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.btn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1490768069021&di=b97514714244229da8020dad454502dc&imgtype=0&src=http%3A%2F%2Fpic66.nipic.com%2Ffile%2F20150511%2F13629256_135451223000_2.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        return cell;
    }else if(indexPath.section>2){
        MoreAndMoreCell *cell=[MoreAndMoreCell new];
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
   

}
//点击滚动视图执行该方法
-(void)onScrollButtonCkick:(MyButton *)btn{
    
}
//点击第一区三个按钮执行该方法
-(void)onSectionOneMyButtonClick:(MyButton *)btn{

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
