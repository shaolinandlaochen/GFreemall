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
#import "AttributeSelectionViewController.h"
#import "OrderInformationViewController.h"
#import "GoodsDetailsRequest.h"
@interface GoodsDetailsViewController ()<ProductScreeningDelegate,UITableViewDelegate,UITableViewDataSource,GoodsScrollViewDelegate,HTMLContextDelegate,UIScrollViewDelegate,ShutDownDelegate>
{
    MyoptionsView *optionsView;
    UITableView *_tableView;
    float _htmlHeight;
    purchaseOfGoods *goods;
    UIScrollView *_scrollView;
    NSInteger _page;
    GoodsDetailsHTMLContextViewController *goodsDetailHtmlContextView;
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
    
    [self ForProductInformationClick];
    
   
    // Do any additional setup after loading the view.
}
-(void)ForProductInformationClick{//获取商品信息
    [SVProgressHUD showWithStatus:@"正在加载"];
[GoodsDetailsRequest ForProductInformationc:self.commodity_serial block:^(NSDictionary *dics) {
    self.dataDic=[self deleteEmpty:dics];
    GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    if ([class.code isEqualToString:@"7"]) {
        goodsDetailHtmlContextView.context=class.comm.commodityDesc;
        goods.isCollect=class.isCollect;
        [_tableView reloadData];
    }else{
        [FTIndicator showErrorWithMessage:class.msg];
    }
    [SVProgressHUD dismiss];
}];

}

-(void)htmlHeight:(float)height{
    if (height>_htmlHeight) {
        _htmlHeight=height;
    
        [_tableView reloadData];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    if (self.dataDic!=nil) {
          GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        if (indexPath.section==0&&indexPath.row==0) {
            /* model 为模型实例， keyPath 为 model 的属性名，通过 kvc 统一赋值接口 */
            NSString *txt=@"a";
            return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[GoodsScrollViewCell class] contentViewWidth:self.view.frame.size.width];
        }else if (indexPath.section==0&&indexPath.row==1){
            
          
            GoodsDetailsComm *comm=class.comm;
            return [tableView cellHeightForIndexPath:indexPath model:comm keyPath:@"model" cellClass:[ProductDetailsDescriptionCell class] contentViewWidth:self.view.frame.size.width];

        }else if (indexPath.section==0&&indexPath.row==2){
            NSString *txt=@"a";
            return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[CostCalculationCell class] contentViewWidth:self.view.frame.size.width];
        }else if (indexPath.section==1){
            if ([class.checkRes isEqualToString:@"NO_ATTR"]) {
                return 0;
            }else{
            return 114*autoSizeScaleY;
            }
            
        }else if (indexPath.section==2){
            GoodsDetailsListComment *comment=class.listComment[indexPath.row];
            return [tableView cellHeightForIndexPath:indexPath model:comment keyPath:@"model" cellClass:[UserCommentsCell class] contentViewWidth:self.view.frame.size.width];
        }else if (indexPath.section==3){
            return _htmlHeight;
        }
    }
   
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    if (section==2) {
        return 110*autoSizeScaleY;
    }else if (section==3){
        return 0;
    }else if (section==1){
          GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.checkRes isEqualToString:@"NO_ATTR"]) {
           
            return 0;
        }
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
        GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        EvaluationOfTheHeadView *view=[[EvaluationOfTheHeadView alloc]init];
        view.model=class;
        [view.icon addTarget:self action:@selector(onRatingClick) forControlEvents:UIControlEventTouchUpInside];
        [view.percentageNumber addTarget:self action:@selector(onRatingClick) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1) {
        [self BuildTheSkuSet];
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        if (section==0) {
            return 3;
        }else if (section==1){
            return 1;
        }else if (section==2){
            return class.listComment.count;
        }else if(section==3){
            return 1;
        }
    
    
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    if (self.dataDic!=nil) {
        if (indexPath.section==0) {
            if (indexPath.row==0) {
                GoodsScrollViewCell *cell=[GoodsScrollViewCell new];
                cell.delegate=self;
                cell.dic=self.dataDic;
                return cell;
            }else if (indexPath.row==1){
                ProductDetailsDescriptionCell *cell=[ProductDetailsDescriptionCell new];
                if (self.dataDic!=nil) {
                    cell.model=self.dataDic;
                }
                cell.userInteractionEnabled = NO;
                return cell;
            }else if (indexPath.row==2){
                CostCalculationCell *cell=[CostCalculationCell new];
                cell.discount.text=[NSString stringWithFormat:@"%.2f",classs.comm.commodityDiscount];
                cell.freight.text=[NSString stringWithFormat:@"%.2f",classs.comm.commodityFreight];
                cell.userInteractionEnabled = NO;
                return cell;
            }
        }else if (indexPath.section==1){
            if (![classs.checkRes isEqualToString:@"NO_ATTR"]) {
                SKUCell *cell=[SKUCell new];
                if (self.SKUString==nil) {
                    cell.string=Localized(@"请选择商品规格");
                }else{
                    cell.string=self.SKUString;
                }
                return cell;
            }
            
        }else if (indexPath.section==2){
            UserCommentsCell *cell=[UserCommentsCell new];
            cell.model=classs.listComment[indexPath.row];
            cell.userInteractionEnabled = NO;
            return cell;
        }else if (indexPath.section==3){
            HTMLContextCell *cell=[HTMLContextCell new];
            cell.context=classs.comm.commodityDesc;
            cell.delegate=self;
            cell.width=self.view.frame.size.width;
            return cell;
        }
        
    }
 
    NULLCell *celll=[NULLCell new];
    return celll;
}
//点击查看大图
-(void)BannerReviewImages:(NSArray *)imgArray idx:(NSInteger)idx{
    [TheParentClass ToSeeMorePictures:imgArray idx:idx Controller:self];

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
    [goods.buy addTarget:self action:@selector(onBuyClick) forControlEvents:UIControlEventTouchUpInside];
    [goods.CustomerService addTarget:self action:@selector(CallCustomerService) forControlEvents:UIControlEventTouchUpInside];
    [goods.collection addTarget:self action:@selector(CollectionOfGoods:) forControlEvents:UIControlEventTouchUpInside];
    [goods.shoppingCar addTarget:self action:@selector(IntoTheShoppingCart) forControlEvents:UIControlEventTouchUpInside];
    [goods.addShoppingCar addTarget:self action:@selector(onAddShopingCharClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goods];
    goods.sd_layout.leftSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(96*autoSizeScaleY);

    
}
//立即购买
-(void)onBuyClick{
    
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    if ([classs.checkRes isEqualToString:@"NO_ATTR"]) {//无属性
        [SVProgressHUD showWithStatus:@"正在加载"];
        [GoodsDetailsRequest BuyNowattr_input:@"" num:@"1" comm_serial:self.commodity_serial checkRes:classs.checkRes block:^(NSDictionary *dics) {
            ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            if ([class.code isEqualToString:@"23"]) {
                OrderInformationViewController *order=[[OrderInformationViewController alloc]init];
                order.dataDic=[self deleteEmpty:dics];
                order.where=@"商品";
                order.attribute=@"";
                order.number=@"1";
                order.checkRes=classs.checkRes;
                order.comm_serial=self.commodity_serial;

                [self.navigationController pushViewController:order animated:YES];
                
            }else{
                [FTIndicator showErrorWithMessage:class.msg];
            }
            [SVProgressHUD dismiss];
            
        }];
    }else{
        [self BuildTheSkuSet];
    }

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
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"f3f5f7"];
    [_scrollView addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(_scrollView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    //详情
    goodsDetailHtmlContextView=[[GoodsDetailsHTMLContextViewController alloc]init];
    [_scrollView addSubview:goodsDetailHtmlContextView.view];
    goodsDetailHtmlContextView.view.sd_layout.leftSpaceToView(_tableView, 0).topSpaceToView(_scrollView, 0).bottomSpaceToView(_scrollView, 0).widthIs(self.view.frame.size.width);
    [self addChildViewController:goodsDetailHtmlContextView];
    
    //评价
    EvaluationViewController *evaluation=[[EvaluationViewController alloc]init];
    evaluation.commodity_serial=self.commodity_serial;
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

//构建sku'集view
-(void)BuildTheSkuSet{

    AttributeSelectionViewController *vc=[[AttributeSelectionViewController alloc]init];
    vc.dataDic=self.dataDic;
    vc.deleghate=self;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:^{
        vc.view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:.5];
    }];
    
    
   
    
}

//查看图片
-(void)ReviewImagesUrl:(NSString *)url{
    [TheParentClass SeeAPicture:url Controller:self];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
}
//客服
-(void)CallCustomerService{

}
//收藏商品
-(void)CollectionOfGoods:(MyButton *)BTN{
    [SVProgressHUD showWithStatus:@"正在收藏"];
[GoodsDetailsRequest CollectionOrCancelThisCollection:self.commodity_serial block:^(NSDictionary *dics) {
    GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
    if ([class.code isEqualToString:@"9"]) {
        goods.isCollect=YES;
    }else if ([class.code isEqualToString:@"8"]){
        goods.isCollect=NO;
    
    }
    [FTIndicator showSuccessWithMessage:class.msg];
    [SVProgressHUD dismiss];
}];

}
//进入购物车
-(void)IntoTheShoppingCart{
   

}
//加入购物车
-(void)onAddShopingCharClick{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    if ([classs.checkRes isEqualToString:@"NO_ATTR"]) {//无属性
        [SVProgressHUD showWithStatus:@"正在加载"];
        [GoodsDetailsRequest AddTToCartvalues:@"" serial:self.commodity_serial num:@"1" checkRes:@"NO_ATTR" block:^(NSDictionary *dics) {
            GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            [FTIndicator showSuccessWithMessage:class.msg];
            [SVProgressHUD dismiss];
            
        }];
    }else{
        [self BuildTheSkuSet];
    }
   

}
//立即购买(代理)
-(void)BuyNowattr_input:(NSString *)attr_input message:(NSString *)Message number:(NSInteger)number{
    NSLog(@"%@............%@",attr_input,Message);
    [SVProgressHUD showWithStatus:@"正在加载"];
      GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    [GoodsDetailsRequest BuyNowattr_input:[NSString stringWithFormat:@"%@_%@",self.commodity_serial,attr_input] num:[NSString stringWithFormat:@"%ld",number] comm_serial:self.commodity_serial checkRes:classs.checkRes block:^(NSDictionary *dics) {
        ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
        if ([class.code isEqualToString:@"23"]) {
            OrderInformationViewController *order=[[OrderInformationViewController alloc]init];
            order.dataDic=[self deleteEmpty:dics];
            order.where=@"商品";
            order.attribute=[NSString stringWithFormat:@"%@_%@",self.commodity_serial,attr_input];
            order.number=[NSString stringWithFormat:@"%ld",number];
            order.checkRes=classs.checkRes;
            order.comm_serial=self.commodity_serial;
            [self.navigationController pushViewController:order animated:YES];

        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        [SVProgressHUD dismiss];
        
    }];
}
//加入购物车(代理)
-(void)AddToCart:(NSString *)attr_input message:(NSString *)Message number:(NSInteger)number{
    self.SKUString=[NSString stringWithFormat:@"已选:%@",Message];
    self.attr_input=attr_input;
    [_tableView reloadData];
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
       [SVProgressHUD showWithStatus:@"正在加载"];
    [GoodsDetailsRequest AddTToCartvalues:[NSString stringWithFormat:@"%@_%@",self.commodity_serial,attr_input] serial:self.commodity_serial num:[NSString stringWithFormat:@"%ld",number] checkRes:classs.checkRes block:^(NSDictionary *dics) {
        GoodsDetailsBaseClass *class=[[GoodsDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
        [FTIndicator showSuccessWithMessage:class.msg];
        [SVProgressHUD dismiss];
        
    }];
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
