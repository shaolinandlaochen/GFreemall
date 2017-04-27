//
//  SearchViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/31.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchForGoodsCell.h"
#import "SearchRequest.h"
@interface SearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *imgbg;//搜索框背景
    UITextField *searchField;//搜索框
    UILabel *lineTwo;//搜索框下面第二条线
    UITableView *_tableView;//商品列表
    
    
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    leftCancel
    [self SetTheNavigationBar];
    [self AddTheSearch];//添加搜索框
    [self ThUserNavigationBar];//添加筛选条件
    _tableView=[[UITableView alloc]init];
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
//    [self EmptyTheShoppingCart];//没有搜索到相关商品
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(lineTwo, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0);
    if (![self.where isEqualToString:@"搜索"]) {
        [self GetTheRequestData:@"" priceType:@"" brandSerial:@"" categorySerial:self.categorySerial];
    }
    // Do any additional setup after loading the view.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 182*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if ([self.where isEqualToString:@"搜索"]) {
        return 88*autoSizeScaleY;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MyView *view=[[MyView alloc]init];
    if ([searchField.text length]>0) {
        NSString *string=[NSString stringWithFormat:@"为您找到'%@'商品",searchField.text];
        view.lbl.text=string;
    }
  
    return view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    SearchBaseClass *class=[[SearchBaseClass alloc]initWithDictionary:self.dataDic];
    return class.pagingList.resultList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   SearchBaseClass *class=[[SearchBaseClass alloc]initWithDictionary:self.dataDic];
    SearchForGoodsCell *cell=[SearchForGoodsCell new];
    SearchResultList *list=class.pagingList.resultList[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,list.commodityImagesPath,list.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
    cell.title.text=list.commodityName;
    cell.picre.text=[NSString stringWithFormat:@"¥%.2f",list.commoditySellprice];
    return cell;
  
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SearchBaseClass *class=[[SearchBaseClass alloc]initWithDictionary:self.dataDic];
    SearchResultList *list=class.pagingList.resultList[indexPath.row];
    GoodsDetailsViewController *goodsDetails=[[GoodsDetailsViewController alloc]init];
    goodsDetails.commodity_serial=[NSString stringWithFormat:@"%.0f",list.commoditySerial];
    [self.navigationController pushViewController:goodsDetails animated:YES];
}



//没有搜索到商品
-(void)EmptyTheShoppingCart{
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"pic_cart"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 196*autoSizeScaleX).topSpaceToView(self.view, 597*autoSizeScaleY).widthIs(358*autoSizeScaleX).heightIs(139*autoSizeScaleY);
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:Localized(@"没有搜索到相关商品") forState:UIControlStateNormal];
    [btn setTitleColor:[TheParentClass colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleX];
    [self.view addSubview:btn];
    btn.sd_layout.rightSpaceToView(self.view, 0).topSpaceToView(img, 40*autoSizeScaleY).widthIs(self.view.frame.size.width).heightIs(62*autoSizeScaleY);
    
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
    searchField.borderStyle = UIKeyboardTypeDefault;
    searchField.returnKeyType=UIReturnKeySearch;
    searchField.clearButtonMode = UITextFieldViewModeAlways;//右侧添加叉号
    searchField.adjustsFontSizeToFitWidth = YES;//文本自适应
    if ([self.where isEqualToString:@"搜索"]) {
        [searchField becomeFirstResponder];//立即进入编辑状态
    }
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
 //   UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
   // self.navigationItem.rightBarButtonItem=item;
    
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];

}
//进入购物车
-(void)onshoppingCraClick{

}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    NSLog(@"结束编辑");
   
    return YES;
}
//点击return执行
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"结束编辑*--*");
    
    [textField endEditing:YES];
    if ([textField.text length]>0) {
          [self GetTheRequestData:@"" priceType:@"" brandSerial:@"" categorySerial:@""];
    }
    
    return YES;
}
//用户导航条,价格,综合,评级
-(void)ThUserNavigationBar{
    autoSize
    UILabel *lineOne=[[UILabel alloc]init];//搜索狂下面第一条线
    lineOne.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
    [self.view addSubview:lineOne];
    lineOne.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(imgbg, 12*autoSizeScaleY).rightSpaceToView(self.view, 0).heightIs(0.7);
    
    lineTwo=[[UILabel alloc]init];//搜索狂下面第一条线
    lineTwo.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
    [self.view addSubview:lineTwo];
    lineTwo.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(lineOne, 90*autoSizeScaleY).rightSpaceToView(self.view, 0).heightIs(0.7);
    
    
    
    NSArray *titleArray=@[@"综合",@"销量",@"价格",@"评分",@"新品"];
    for (int i=0; i<5; i++) {
        MyButton *btn=[[MyButton alloc]init];
        [btn setTitle:Localized(titleArray[i]) forState:UIControlStateNormal];
        if (i==0) {
             [btn setTitleColor:[TheParentClass colorWithHexString:@"de0024"] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];

        }
        btn.selected=NO;
        btn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleX];
        btn.tag=1000+i;
        [btn addTarget:self action:@selector(onScreeningClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        float xx=self.view.frame.size.width/5;
        btn.sd_layout.leftSpaceToView(self.view, xx*i).topSpaceToView(lineOne, 20*autoSizeScaleY).widthIs(xx).heightIs(50*autoSizeScaleY);
        
    }
    
}
//点击筛选按钮执行该方法
-(void)onScreeningClick:(MyButton *)btn{
    autoSize
    for (int i=0; i<5; i++) {
        MyButton *button=(MyButton *)[self.view viewWithTag:i+1000];
        [button setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    }
     [btn setTitleColor:[TheParentClass colorWithHexString:@"de0024"] forState:UIControlStateNormal];
     [[self.view viewWithTag:2017]removeFromSuperview];
    switch (btn.tag) {
        case 1000://综合
        {
             [self GetTheRequestData:@"" priceType:@"" brandSerial:@"" categorySerial:self.categorySerial];
        }
            break;
        case 1001://销量
        {
             [self GetTheRequestData:@"count" priceType:@"" brandSerial:@"" categorySerial:self.categorySerial];
        }
            break;
        case 1002://价格
        {
            MyButton *button=(MyButton *)[self.view viewWithTag:1002];
            UIImageView *img=[[UIImageView alloc]init];
            if (button.selected==YES) {
                [self GetTheRequestData:@"price" priceType:@"0" brandSerial:@"" categorySerial:self.categorySerial];
                img.image=[UIImage imageNamed:@"triangle_down_red"];
                button.selected=NO;
            }else{
                [self GetTheRequestData:@"price" priceType:@"1" brandSerial:@"" categorySerial:self.categorySerial];
                button.selected=YES;
                img.image=[UIImage imageNamed:@"triangle_up_red-"];
            }
            
            img.tag=2017;
            [self.view addSubview:img];
            img.sd_layout.leftSpaceToView(self.view,420*autoSizeScaleX).bottomSpaceToView(lineTwo, 40*autoSizeScaleY).widthIs(14*autoSizeScaleX).heightIs(9*autoSizeScaleY);
        }
            break;
        case 1003://评分
        {
             [self GetTheRequestData:@"grade" priceType:@"" brandSerial:@"" categorySerial:self.categorySerial];
        }
            break;
        case 1004://新品
        {
             [self GetTheRequestData:@"time" priceType:@"" brandSerial:@"" categorySerial:self.categorySerial];
        }
            break;
            
        default:
            break;
    }


}
-(void)GetTheRequestData:(NSString *)queryType priceType:(NSString *)priceType brandSerial:(NSString *)brandSerial categorySerial:(NSString *)categorySerial{
    [SVProgressHUD showWithStatus:@"正在加载"];
    [SearchRequest AccessToSearchData:searchField.text page:@"1" pageSize:@"999" queryType:queryType priceType:priceType brandSerial:brandSerial categorySerial:categorySerial bolck:^(NSDictionary *dic) {
        self.dataDic=[self deleteEmpty:dic];
        SearchBaseClass *class=[[SearchBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"5"]) {
            [_tableView reloadData];
        }else{
            [FTIndicator showInfoWithMessage:class.msg];
        }
        [SVProgressHUD dismiss];
    }];
    
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
