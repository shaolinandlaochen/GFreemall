//
//  DetailsOfTheShoppingCart.m
//  GFreemall
//
//  Created by 123 on 2017/5/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "DetailsOfTheShoppingCart.h"
#import "ShoppingCartProductsCell.h"
#import "MyNewsViewController.h"
#import "ShoppingCarRequest.h"
#import "OrderInformationViewController.h"
#import "DataAccessPageRequest.h"
@interface DetailsOfTheShoppingCart ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *BarButton;
    UILabel *number;//未读消息
    MyButton *editorBtn;
    ShoppingCarViews *view;//合计等等
    BOOL _isState;
    BOOL request;
}

@end

@implementation DetailsOfTheShoppingCart


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[UIColor whiteColor];
    _isState=YES;//表示默认是非编辑状态
    request=YES;
    [self rightBaBarbtn];
    autoSize
    leftCancel
    //CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    //CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 99*autoSizeScaleY).topSpaceToView(self.view, 0);
    TemporarilyNotRefresh(_tableView, @selector(ToGetAShoppingCartGoodsList))
    // Do any additional setup after loading the view.
}
-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)ToGetAShoppingCartGoodsList{
    
    if ([tokenString length]<1) {
        UIAlertController  * alertController = [UIAlertController alertControllerWithTitle:Localized(@"温馨提示") message:Localized(@"请您先去登录") preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * sureAction = [UIAlertAction actionWithTitle:Localized(@"去登录") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [TheParentClass theLogin];
            
        }];
        
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:Localized(@"取消") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertController addAction:cancelAction];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }else{
        
        request=NO;
        [ShoppingCarRequest ToGetAShoppingCartGoodsListBlock:^(NSDictionary *dics) {
            self.shoppingCarArray=[[NSMutableArray alloc]init];
            self.dataDic=[self deleteEmpty:dics];
            ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:self.dataDic];
            
            if ([class.code isEqualToString:@"13"]) {
                if (class.list.count>0) {
                    [[self.view viewWithTag:1314521]removeFromSuperview];
                    [[self.view viewWithTag:1314520]removeFromSuperview];
                    
                    [self CreatePaymentButton];//创建支付按钮
                    for (int i=0; i<class.list.count; i++) {
                        ShoppingCarList *list=class.list[i];
                        [self.shoppingCarArray addObject:list];
                    }
                    if (_isState) {//非编辑状态
                        view.picle.text=@"合计:¥0.00";
                        
                    }else{
                        view.picle.text=@"";
                    }
                    view.selectedBtn.selected=NO;
                    
                }else{
                    [[self.view viewWithTag:15738803030]removeFromSuperview];
                    [self EmptyTheShoppingCart];//购物车是空的
                }
                [_tableView reloadData];
            }else{
                [FTIndicator showErrorWithMessage:class.msg];
            }
            [_tableView.mj_header endRefreshing];
            [SVProgressHUD dismiss];
            request=YES;
        }];

    }
    
    
    
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
    
    return self.shoppingCarArray.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:self.dataDic];
    if (self.shoppingCarArray.count>indexPath.row) {
        ShoppingCarList *list=self.shoppingCarArray[indexPath.row];
        ShoppingCarComm *comm=list.comm;
        ShoppingCartProductsCell *cell=[ShoppingCartProductsCell new];
        cell.selectedBtn.indexPath=indexPath;
        if (_isState) {
            cell.selectedBtn.selected=list.selected;
        }else{
            cell.selectedBtn.selected=list.EditorSelected;
        }
        
        [cell.selectedBtn addTarget:self action:@selector(TheSelectedClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.addBtn.indexPath=indexPath;
        [cell.addBtn addTarget:self action:@selector(ChangeTTheNumber:) forControlEvents:UIControlEventTouchUpInside];
        cell.deleteBtn.indexPath=indexPath;
        [cell.deleteBtn addTarget:self action:@selector(ChangeTTheNumber:) forControlEvents:UIControlEventTouchUpInside];
        [cell.icon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,comm.commodityImagesPath,comm.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        cell.icon.indexPath=indexPath;
        [cell.icon addTarget:self action:@selector(onGoodDetaileClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.name.text=list.commodityName;
        cell.describe.text=comm.commodityAttributes;
        cell.price.text=[NSString stringWithFormat:@"¥%.2f",comm.commoditySellprice];
        cell.bjImage.image=[UIImage imageNamed:@"edict"];
        cell.number.text=[NSString stringWithFormat:@"%.0f",list.count];
        
        return cell;
    }else{
        NULLCell *cell=[NULLCell new];
        return cell;
    }
    
    
}
//点击图片查看详情
-(void)onGoodDetaileClick:(MyButton *)btn{
    ShoppingCarList *list=self.shoppingCarArray[btn.indexPath.row];
    ShoppingCarComm *comm=list.comm;
    GoodsDetailsViewController *goodsDetails=[[GoodsDetailsViewController alloc]init];
    goodsDetails.commodity_serial=[NSString stringWithFormat:@"%.0f",comm.commoditySerial];
    [self.navigationController pushViewController:goodsDetails animated:YES];
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
    number.layer.cornerRadius = 13*autoSizeScaleX;
    number.layer.masksToBounds = 13*autoSizeScaleX;
    if ([number.text length]==1) {
        number.frame=frame(170, 10, 26, 26);
    }else if ([number.text length]>1){
        number.frame=frame(170, 10, 36, 26);
    }
    number.textColor=[UIColor whiteColor];
    number.textAlignment=NSTextAlignmentCenter;
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
    if (_isState) {//非编辑状态
        for (int i=0; i<self.shoppingCarArray.count; i++) {
            if (i==btn.indexPath.row) {
                ShoppingCarList *list=self.shoppingCarArray[i];
                list.selected=btn.selected;
                [self.shoppingCarArray replaceObjectAtIndex:btn.indexPath.row withObject:list];
            }
            
        }
        
        [ShoppingCarRequest DetermineWhetherToChooseSelection:self.shoppingCarArray Block:^(BOOL isSend) {
            view.selectedBtn.selected=isSend;
            
        } Block:^(NSString *price) {
            view.picle.text=[NSString stringWithFormat:@"合计:¥%@",price];
            
        }];
    }else{//编辑状态
        for (int i=0; i<self.shoppingCarArray.count; i++) {
            if (i==btn.indexPath.row) {
                ShoppingCarList *list=self.shoppingCarArray[i];
                list.EditorSelected=btn.selected;
                [self.shoppingCarArray replaceObjectAtIndex:btn.indexPath.row withObject:list];
            }
            
        }
        [ShoppingCarRequest EditStateSelection:self.shoppingCarArray Block:^(BOOL isSend) {
            view.selectedBtn.selected=isSend;
        }];
        
        
    }
    
    
    
    [_tableView reloadData];
    
    
    
}
//点击加件数量
-(void)ChangeTTheNumber:(MyButton *)btn{
    
    // [SVProgressHUD showWithStatus:@"正在加载"];
    [ShoppingCarRequest ModifyTheQuantity:1 isSeneld:btn.why idx:btn.indexPath.row array:self.shoppingCarArray Block:^(NSDictionary *dics) {
        ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
        if ([class.code isEqualToString:@"15"]) {//请求完成,在本地的也改变了
            ShoppingCarList *list=self.shoppingCarArray[btn.indexPath.row];
            if (btn.why) {
                list.count+=1;
            }else{
                list.count-=1;
            }
            
            [self.shoppingCarArray replaceObjectAtIndex:btn.indexPath.row withObject:list];
            
            
            if (_isState) {//非编辑状态
                
                [ShoppingCarRequest DetermineWhetherToChooseSelection:self.shoppingCarArray Block:^(BOOL isSend) {
                    
                } Block:^(NSString *price) {
                    view.picle.text=[NSString stringWithFormat:@"合计:¥%@",price];
                    
                }];
            }
            
            
            [_tableView reloadData];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        
        [SVProgressHUD dismiss];
    }];
    
    
}
//消息
-(void)onBarButtonClick:(MyButton *)btn{
    MyNewsViewController *news=[[MyNewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];
    
}
//编辑
-(void)onEditorBBtnClick:(MyButton *)btn{
    if (self.shoppingCarArray.count>0) {
        if (request) {
            if (_isState) {
                [editorBtn setTitle:Localized(@"完成") forState:UIControlStateNormal];
                _isState=NO;
                [_tableView reloadData];
                view.selectedBtn.selected=NO;
                view.picle.text=@"";
                
            }else{
                [editorBtn setTitle:Localized(@"编辑") forState:UIControlStateNormal];
                _isState=YES;
                [self ToGetAShoppingCartGoodsList];
                [SVProgressHUD showWithStatus:Localized(@"loading")];
            }
            view.state=_isState;
        }
    }
    
    
}
//全选
-(void)FutureGenerations:(MyButton *)btn{
    if (request) {
        btn.selected=!btn.selected;
        if (_isState) {//非编辑状态
            for (int i=0; i<self.shoppingCarArray.count; i++) {
                ShoppingCarList *list=self.shoppingCarArray[i];
                list.selected=btn.selected;
                [self.shoppingCarArray replaceObjectAtIndex:i withObject:list];
                
            }
            [ShoppingCarRequest AUserClicksOnFutureGenerations:btn.selected Array:self.shoppingCarArray block:^(NSString *priceString) {
                view.picle.text=[NSString stringWithFormat:@"合计:¥%@",priceString];
                
            }];
        }else{//编辑状态
            for (int i=0; i<self.shoppingCarArray.count; i++) {
                ShoppingCarList *list=self.shoppingCarArray[i];
                list.EditorSelected=btn.selected;
                [self.shoppingCarArray replaceObjectAtIndex:i withObject:list];
                
            }
            
            [ShoppingCarRequest EditStateSelection:self.shoppingCarArray Block:^(BOOL isSend) {
                view.selectedBtn.selected=isSend;
            }];
            
        }
        
        
        
        
        [_tableView reloadData];
        
    }
    
}
//点击支付或者删除
-(void)PaymentAndDeleteClick:(MyButton *)btn{
    if (btn.why) {
        NSLog(@"支付");
        [ShoppingCarRequest StitchingId:self.shoppingCarArray Block:^(NSString *IDS) {
            
            if ([IDS length]<1) {
                [FTIndicator showInfoWithMessage:Localized(@"选选择您要结算的商品")];
            }else{
                [SVProgressHUD showWithStatus:Localized(@"loading")];
                [ShoppingCarRequest TheShoppingCartAndSettlement:IDS Block:^(NSDictionary *dics) {
                    ShoppingSettlementBaseClass *class=[[ShoppingSettlementBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                    if ([class.code  isEqualToString:@"24"]) {
                        [TheParentClass ButtonAtTheBottomOfThesize:NO];
                        OrderInformationViewController *order=[[OrderInformationViewController alloc]init];
                        order.dataDic=[self deleteEmpty:dics];
                        order.where=@"购物车";
                        order.IDS=IDS;
                        [self.navigationController pushViewController:order animated:YES];
                        
                    }else{
                        [FTIndicator showErrorWithMessage:class.msg];
                    }
                    
                    
                    [SVProgressHUD dismiss];
                }];
            }
        }];
        
    }else{
        
        NSLog(@"删除");
        [ShoppingCarRequest DeleteShoppingCartOfGoods:self.shoppingCarArray block:^(NSString *IDString) {
            if ([IDString length]<1) {
                [FTIndicator showInfoWithMessage:Localized(@"请选择要删除的商品")];
            }else{
                [SVProgressHUD showWithStatus:Localized(@"正在删除")];
                [ShoppingCarRequest DeleteTheGoods:IDString Block:^(NSDictionary *dics) {
                    ShoppingCarBaseClass *class=[[ShoppingCarBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                    if ([class.code isEqualToString:@"14"]) {//删除成功需要把本地的也删除了
                        NSArray *idStrAry=[IDString componentsSeparatedByString:@","];//把拼接的字符串分割开
                        for (int i=0; i<idStrAry.count; i++) {
                            NSString *string=[NSString stringWithFormat:@"%@",idStrAry[i]];
                            for (int y=0; y<self.shoppingCarArray.count; y++) {
                                ShoppingCarList *list=self.shoppingCarArray[y];
                                if ([[NSString stringWithFormat:@"%.0f",list.listIdentifier]isEqualToString:string]) {//如果这个id跟已经删除的一致就把他删除掉
                                    [self.shoppingCarArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        if (obj ==list) {
                                            [self.shoppingCarArray removeObject:obj];
                                        }
                                    }];
                                }
                                
                                
                            }
                        }
                        [_tableView reloadData];
                        if (self.shoppingCarArray.count<1) {
                            [[self.view viewWithTag:15738803030]removeFromSuperview];
                            [self EmptyTheShoppingCart];//购物车是空的
                            [editorBtn setTitle:Localized(@"编辑") forState:UIControlStateNormal];
                            _isState=YES;
                            view.state=_isState;
                            
                            
                            
                        }
                        
                    }else{//删除失败
                        [FTIndicator showErrorWithMessage:class.msg];
                    }
                    
                    [SVProgressHUD dismiss];
                }];
            }
            
        }];
        
    }
}
-(void)EmptyTheShoppingCart{
    [[self.view viewWithTag:1314521]removeFromSuperview];
    [[self.view viewWithTag:1314520]removeFromSuperview];
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"pic_cart"];
    img.tag=1314521;
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 205*autoSizeScaleX).topSpaceToView(self.view, 500*autoSizeScaleY).widthIs(358*autoSizeScaleX).heightIs(139*autoSizeScaleY);
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag=1314520;
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
    SearchViewController *search=[[SearchViewController alloc]init];
    [self.navigationController pushViewController:search animated:YES];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
    if ([tokenString length]>0) {
        [self ToGetAShoppingCartGoodsList];
        [self messageNumber];
    }else{
        [self EmptyTheShoppingCart];//购物车是空的
        self.shoppingCarArray=[[NSMutableArray alloc]init];
        [_tableView reloadData];
    }
    
    
}
-(void)messageNumber{
    autoSize
    
    if ([tokenString length]>0) {
        [DataAccessPageRequest GetNumbeOfUnreadMessagesBlock:^(NSDictionary *dics) {
            MessageNumberBaseClass *class=[[MessageNumberBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            if ([class.code isEqualToString:@"51"]) {
                if (class.data>0) {
                    number.text=[NSString stringWithFormat:@"%.0f",class.data];
                    number.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
                    
                }else{
                    number.backgroundColor=[UIColor clearColor];
                    number.text=@"";
                }
                
                if ([number.text length]==1) {
                    number.frame=frame(180, 10, 26, 26);
                }else if ([number.text length]>1){
                    number.frame=frame(170, 10, 36, 26);
                }
            }
        }];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//创建支付按钮
-(void)CreatePaymentButton{
    autoSize
    view=[[ShoppingCarViews alloc]init];
    view.tag=15738803030;
    view.state=_isState;
    [view.PaymentAndDeleteBtn addTarget:self action:@selector(PaymentAndDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
    [view.selectedBtn addTarget:self action:@selector(FutureGenerations:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
    view.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0*autoSizeScaleY).heightIs(99*autoSizeScaleY);
    
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
