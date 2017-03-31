//
//  SearchViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITextFieldDelegate>
{
    UIImageView *imgbg;//搜索框背景
    UITextField *searchField;//搜索框
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self SetTheNavigationBar];
    [self AddTheSearch];//添加搜索框
    // Do any additional setup after loading the view.
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//添加搜索框
-(void)AddTheSearch{
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    //背景
    imgbg=[[UIImageView alloc]init];
    imgbg.image=[UIImage imageNamed:@"search_bg"];
    [self.view addSubview:imgbg];
    imgbg.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(self.view, (12*autoSizeScaleY)+navheight+rectStatus.size.height).rightSpaceToView(self.view, 25*autoSizeScaleX).heightIs(70*autoSizeScaleY);
    //放大镜
    UIImageView *imgSearch=[[UIImageView alloc]init];
    imgSearch.image=[UIImage imageNamed:@"icon_search"];
    [imgbg addSubview:imgSearch];
    imgSearch.sd_layout.leftSpaceToView(imgbg, 20*autoSizeScaleX).topSpaceToView(imgbg, 20*autoSizeScaleY).bottomSpaceToView(imgbg, 20*autoSizeScaleY).widthIs(30*autoSizeScaleY);
    //搜索框
    searchField=[[UITextField alloc]init];
    searchField.textColor=[TheParentClass colorWithHexString:@"#999999"];
    searchField.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    searchField.delegate=self;
    searchField.keyboardType=UIKeyboardTypeDefault;
    searchField.borderStyle = UIKeyboardTypeEmailAddress;
    searchField.returnKeyType=UIReturnKeyGo;
    searchField.placeholder=Localized(@"搜索您想找的商品");
    [self.view addSubview:searchField];
    searchField.sd_layout.leftSpaceToView(imgSearch, 55*autoSizeScaleX).topSpaceToView(self.view, (22*autoSizeScaleY)+navheight+rectStatus.size.height).heightIs(50*autoSizeScaleY).widthIs(600*autoSizeScaleX);
    
    
   
}
//添加logo以及购物车图标
-(void)SetTheNavigationBar{
    autoSize
    
    
    //logo
    UIImageView *img=[[UIImageView alloc]initWithFrame:frame(0, 0, 150, 60)];
    img.image=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView = img;
    //右按钮项
    UIView *view=[[UIView alloc]initWithFrame:frame(0, 0, 200, 80)];
    view.backgroundColor=[UIColor clearColor];
    UIButton *BarButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [BarButton setBackgroundImage:[UIImage imageNamed:@"icon_cart_white"] forState:UIControlStateNormal];
    BarButton.frame=frame(150, 20, 50, 50);
    [BarButton addTarget:self action:@selector(onshoppingCraClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:BarButton];
    
    //右按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItem=item;
    
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    
}
-(void)onshoppingCraClick{

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
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
