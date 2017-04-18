//
//  ShoppingCartViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "ShoppingCartProductsCell.h"
#import "MyNewsViewController.h"
#import "ShoppingCarRequest.h"
@interface ShoppingCartViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *BarButton;
    UILabel *number;//未读消息
    MyButton *editorBtn;
    ShoppingCarViews *view;//合计等等
    BOOL _isState;
}

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self rightBaBarbtn];
    [self CreatePaymentButton];//创建支付按钮
    _isState=YES;//表示默认是非编辑状态
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height);
    TheDrop_downRefresh(_tableView, @selector(ToGetAShoppingCartGoodsList))
   // [self EmptyTheShoppingCart];//购物车是空的
    // Do any additional setup after loading the view.
}
-(void)ToGetAShoppingCartGoodsList{
    [ShoppingCarRequest ToGetAShoppingCartGoodsListBlock:^(NSDictionary *dics) {
        self.dataDic=[self deleteEmpty:dics];
        ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"13"]) {
            if (class.list.count>0) {
                [_tableView reloadData];
            }else{
            [self EmptyTheShoppingCart];//购物车是空的
            }
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
         [_tableView.mj_header endRefreshing];
    }];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [_tableView.mj_header endRefreshing];
    [SVProgressHUD dismiss];
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
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
        return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:self.dataDic];
    return class.list.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:self.dataDic];
    ShoppingCarList *list=class.list[indexPath.row];
    ShoppingCarComm *comm=list.comm;
    
    ShoppingCartProductsCell *cell=[ShoppingCartProductsCell new];
    cell.selectedBtn.indexPath=indexPath;
    [cell.selectedBtn addTarget:self action:@selector(TheSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.addBtn.indexPath=indexPath;
    [cell.addBtn addTarget:self action:@selector(ChangeTTheNumber:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleteBtn.indexPath=indexPath;
    [cell.deleteBtn addTarget:self action:@selector(ChangeTTheNumber:) forControlEvents:UIControlEventTouchUpInside];
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,comm.commodityImagesPath,comm.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
    cell.name.text=comm.commodityName;
    cell.describe.text=comm.commodityDigest;
    cell.price.text=[NSString stringWithFormat:@"%.2f",comm.commoditySellprice];
    cell.bjImage.image=[UIImage imageNamed:@"edict"];
    cell.number.text=[NSString stringWithFormat:@"%.0f",list.count];
    
        return cell;

}

-(void)rightBaBarbtn{
    autoSize
    self.title=Localized(@"购物车");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    
    //右按钮项
    UIView *views=[[UIView alloc]initWithFrame:frame(0, 0, 200, 80)];
    views.backgroundColor=[UIColor clearColor];
    BarButton=[[MyButton alloc]init];
    [BarButton setBackgroundImage:[UIImage imageNamed:@"icon_news"] forState:UIControlStateNormal];
    BarButton.frame=frame(150, 20, 50, 50);
    [BarButton addTarget:self action:@selector(onBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [views addSubview:BarButton];
    
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
    [views addSubview:number];
    
    editorBtn=[[MyButton alloc]init];
    editorBtn.why=YES;
    [editorBtn setTitle:Localized(@"编辑") forState:UIControlStateNormal];
    [editorBtn setTitleColor:[TheParentClass colorWithHexString:@"#eeeeee"] forState:UIControlStateNormal];
    editorBtn.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [editorBtn addTarget:self action:@selector(onEditorBBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [views addSubview:editorBtn];
    editorBtn.sd_layout.rightSpaceToView(BarButton, 42*autoSizeScaleX).topSpaceToView(views, 20*autoSizeScaleY).widthIs(80*autoSizeScaleY).heightIs(40*autoSizeScaleY);
    
    //右按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:views];
    self.navigationItem.rightBarButtonItem=item;
}
//选择或者取消
-(void)TheSelectedClick:(MyButton *)btn{
    btn.selected=!btn.selected;

}
//点击加件数量
-(void)ChangeTTheNumber:(MyButton *)btn{

    NSLog(@"你点击了第%ld区第%ld行  ----%d",btn.indexPath.section,btn.indexPath.row,btn.why);
}
//消息
-(void)onBarButtonClick:(MyButton *)btn{
    MyNewsViewController *news=[[MyNewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];

}
//编辑
-(void)onEditorBBtnClick:(MyButton *)btn{
   
    if (_isState) {
        [editorBtn setTitle:Localized(@"完成") forState:UIControlStateNormal];
        _isState=NO;
    }else{
        [editorBtn setTitle:Localized(@"编辑") forState:UIControlStateNormal];
        _isState=YES;
    }
     [_tableView reloadData];
}
//全选
-(void)FutureGenerations:(MyButton *)btn{
    btn.selected=!btn.selected;

}
//点击支付或者删除
-(void)PaymentAndDeleteClick:(MyButton *)btn{
    if (btn.why) {
        NSLog(@"支付");
    }else{
        NSLog(@"删除");
    }
}
-(void)EmptyTheShoppingCart{
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"pic_cart"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 196*autoSizeScaleX).topSpaceToView(self.view, 597*autoSizeScaleY).widthIs(358*autoSizeScaleX).heightIs(139*autoSizeScaleY);
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:Localized(@"去逛逛") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onGoGoClik:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[TheParentClass colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    btn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleX];
    [btn.layer setBorderColor:[TheParentClass colorWithHexString:@"#999999"].CGColor];
    [btn.layer setBorderWidth:1];
    [btn.layer setMasksToBounds:YES];
    btn.layer.cornerRadius = 4*autoSizeScaleX;
    btn.layer.masksToBounds = 4*autoSizeScaleX;
    [self.view addSubview:btn];
    btn.sd_layout.rightSpaceToView(self.view, 282*autoSizeScaleX).topSpaceToView(img, 40*autoSizeScaleY).widthIs(186*autoSizeScaleX).heightIs(62*autoSizeScaleY);
    
}
//用户点击去逛逛
-(void)onGoGoClik:(UIButton *)btn{

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:YES];
    self.navigationController.navigationBarHidden=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//创建支付按钮
-(void)CreatePaymentButton{
    autoSize
    view=[[ShoppingCarViews alloc]init];
    view.picle.text=@"合计:¥9999";
    view.state=_isState;
    [view.PaymentAndDeleteBtn addTarget:self action:@selector(PaymentAndDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
    [view.selectedBtn addTarget:self action:@selector(FutureGenerations:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 98*autoSizeScaleY).heightIs(99*autoSizeScaleY);

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
