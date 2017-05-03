//
//  AttributeSelectionViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/2.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AttributeSelectionViewController.h"
#import "AttributeSkuCell.h"
#import "SKUCollectionReusableView.h"
#import "GoodsDetailsRequest.h"

@interface AttributeSelectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIView *_view;
    UILabel *line;//基准
    UICollectionView *_CollectionView;
    UICollectionViewFlowLayout *flowLayout;
    MyButton *_buyBtn;//立即购买
    MyButton *_carShopping;
    NSInteger numberCount;//数量
    MyImageView *_bjImage;
    UILabel *_number;
    MyButton *_addBtn;
    MyButton *_deleteBtn;
    
}
@end

@implementation AttributeSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    numberCount=1;
    [self BuildView];
    // Do any additional setup after loading the view.
}
-(void)buildCollectionView{
autoSize
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(140*autoSizeScaleX, 198*autoSizeScaleY);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 25*autoSizeScaleY;
    ////上,左,下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(25*autoSizeScaleX, 25*autoSizeScaleY, 25*autoSizeScaleX, 25*autoSizeScaleY);
    _CollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:flowLayout];
    _CollectionView.delegate=self;
    _CollectionView.dataSource=self;
    _CollectionView.backgroundColor=[UIColor whiteColor];
    [_CollectionView registerClass:[AttributeSkuCell class] forCellWithReuseIdentifier:@"321"];
    [_CollectionView registerClass:[SKUCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeader"];
    [_view addSubview:_CollectionView];
    _CollectionView.sd_layout.leftSpaceToView(_view, 0).topSpaceToView(line, 0).rightSpaceToView(_view, 0).bottomSpaceToView(_bjImage, 50*autoSizeScaleY);
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    GoodsDetailsListAttribute *Attribute=classs.listAttribute[indexPath.section];
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
        reuseIdentifier = @"cellHeader";
    }
    
    SKUCollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        view.name.text=[NSString stringWithFormat:@"%@",Attribute.attributeName];
    }
    return view;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    autoSize
    CGSize size={_CollectionView.frame.size.width,50*autoSizeScaleY};
    return size;
}

//返回区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    return classs.listAttribute.count;
}
//每区返回的行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    GoodsDetailsListAttribute *Attribute=classs.listAttribute[section];
    return Attribute.eAttributeVal.count;

}
//构建单元格
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    autoSize
    AttributeSkuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"321" forIndexPath:indexPath];
    [cell.string addTarget:self action:@selector(onSelectTheSkuClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.string.indexPath=indexPath;
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    GoodsDetailsListAttribute *Attribute=classs.listAttribute[indexPath.section];
    NSArray *array=[self deleteEmptyArr:Attribute.eAttributeVal];
    NSArray *strArray=[[NSString stringWithFormat:@"%@",array[indexPath.row]] componentsSeparatedByString:@"_"];
    if (strArray.count>1) {
          [cell.string setTitle:[NSString stringWithFormat:@"%@",strArray[1]] forState:UIControlStateNormal];
    }
    
    
    NSArray *arrayKey=self.array[indexPath.section];
    NSDictionary *dics=arrayKey[indexPath.row];
    if ([[dics objectForKey:@"why"]isEqualToString:@"yes"]) {
        [cell.string setTitleColor:[TheParentClass colorWithHexString:@"#de0024"] forState:UIControlStateNormal];
         [cell.string.layer setBorderColor:[TheParentClass colorWithHexString:@"#de0024"].CGColor];
    }else{
     [cell.string setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
         [cell.string.layer setBorderColor:[TheParentClass colorWithHexString:@"#f3f5f7"].CGColor];
    }
    
    
    
  
    
    return cell;
}
//点击cell 执行该方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
 
    
}
-(CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    autoSize
    CGSize size;
   
    size =CGSizeMake(142*autoSizeScaleX, 56*autoSizeScaleX);
    
    return size;
}




//构建视图
-(void)BuildView{
    autoSize
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];

    _view=[[UIView alloc]init];
    _view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_view];
    _view.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).topSpaceToView(self.view, 500*autoSizeScaleY);
    
    line=[[UILabel alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [_view addSubview:line];
    line.sd_layout.leftSpaceToView(_view, 0).rightSpaceToView(_view, 0).topSpaceToView(_view, 180*autoSizeScaleY).heightIs(0.6);

    
    //叉号
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:btn];
    btn.sd_layout.rightSpaceToView(_view, 25*autoSizeScaleX).topSpaceToView(_view, 25*autoSizeScaleY).widthIs(50*autoSizeScaleX).heightIs(50*autoSizeScaleY);
    
    
    
    
    
    
    MyButton *imgBtn=[[MyButton alloc]init];
    [imgBtn addTarget:self action:@selector(onImageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",classs.imgSrc,classs.comm.commodityImagesPath,classs.comm.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
    imgBtn.backgroundColor=[UIColor whiteColor];
    [imgBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [imgBtn.layer setBorderWidth:1];
    imgBtn.tag=753;
    [imgBtn.layer setMasksToBounds:YES];
    imgBtn.layer.cornerRadius = 6*autoSizeScaleX;
    imgBtn.layer.masksToBounds = 6*autoSizeScaleX;
    [_view addSubview:imgBtn];
    imgBtn.sd_layout.leftSpaceToView(_view, 25*autoSizeScaleX).bottomSpaceToView(line, 25*autoSizeScaleY).widthIs(190*autoSizeScaleX).heightIs(190*autoSizeScaleY);
    
    
    //商品编码
    UILabel *goodsNmuber=[[UILabel alloc]init];
    goodsNmuber.text=[NSString stringWithFormat:@"商品编码:%.0f",classs.comm.commoditySerial];
    goodsNmuber.textColor=[TheParentClass colorWithHexString:@"#999999"];
    goodsNmuber.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
    goodsNmuber.tag=741;
    [_view addSubview:goodsNmuber];
    goodsNmuber.sd_layout.leftSpaceToView(imgBtn, 25*autoSizeScaleX).bottomSpaceToView(line, 30*autoSizeScaleY).rightSpaceToView(_view, 25*autoSizeScaleX).autoHeightRatio(0);
    
    //商品名称
    UILabel *goodsName=[[UILabel alloc]init];
    goodsName.text=[NSString stringWithFormat:@"%@",classs.comm.commodityName];
    goodsName.textColor=[TheParentClass colorWithHexString:@"#373f4e"];
    goodsName.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [_view addSubview:goodsName];
    goodsName.sd_layout.leftSpaceToView(imgBtn, 25*autoSizeScaleX).bottomSpaceToView(goodsNmuber, 18*autoSizeScaleY).rightSpaceToView(_view, 25*autoSizeScaleX).autoHeightRatio(0);
    
    
    
    _buyBtn=[[MyButton alloc]init];
    _buyBtn.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
    [_buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _buyBtn.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    [_buyBtn setTitle:Localized(@"立即购买") forState:UIControlStateNormal];
    [_buyBtn addTarget:self action:@selector(onBuyClick) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:_buyBtn];
    _buyBtn.sd_layout.leftSpaceToView(_view, 0).rightSpaceToView(_view, self.view.frame.size.width/2).bottomSpaceToView(_view, 0).heightIs(100*autoSizeScaleY);
    
    _carShopping=[[MyButton alloc]init];
    _carShopping.backgroundColor=[TheParentClass colorWithHexString:@"#292929"];
    [_carShopping setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _carShopping.titleLabel.font=[UIFont systemFontOfSize:36*autoSizeScaleY];
    [_carShopping setTitle:Localized(@"加入购物车") forState:UIControlStateNormal];
    [_carShopping addTarget:self action:@selector(onShoppingCarClick) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:_carShopping];
    _carShopping.sd_layout.leftSpaceToView(_view, self.view.frame.size.width/2).rightSpaceToView(_view, 0).bottomSpaceToView(_view, 0).heightIs(100*autoSizeScaleY);
    
    
    
    
    
    //加减背景
    _bjImage=[[MyImageView alloc]init];
    _bjImage.image=[UIImage imageNamed:@"edict"];
    _bjImage.userInteractionEnabled = YES;
    [_view addSubview:_bjImage];
    _bjImage.sd_layout.bottomSpaceToView(_buyBtn, 50*autoSizeScaleY).rightSpaceToView(_view, 25*autoSizeScaleX).widthIs(173*autoSizeScaleX).heightIs(50*autoSizeScaleY);
    
    //数量
    _number=[[UILabel alloc]init];
    _number.text=@"1";
    _number.textColor=[TheParentClass colorWithHexString:@"#292929"];
    _number.font=[UIFont systemFontOfSize:26*autoSizeScaleY];
    _number.textAlignment=NSTextAlignmentCenter;
    [_bjImage addSubview:_number];
    _number.sd_layout.leftSpaceToView(_bjImage, 0).topSpaceToView(_bjImage, 0).bottomSpaceToView(_bjImage, 0).rightSpaceToView(_bjImage, 0);
    //加
    _addBtn=[[MyButton alloc]init];
    _addBtn.why=YES;
    [_addBtn addTarget:self action:@selector(onChangetheNumberClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bjImage addSubview:_addBtn];
    _addBtn.sd_layout.rightSpaceToView(_bjImage, 0).topEqualToView(_number).bottomEqualToView(_number).widthIs(86*autoSizeScaleX);
    //减
    _deleteBtn=[[MyButton alloc]init];
    [_deleteBtn addTarget:self action:@selector(onChangetheNumberClick:) forControlEvents:UIControlEventTouchUpInside];
    _deleteBtn.why=NO;
    [_bjImage addSubview:_deleteBtn];
    _deleteBtn.sd_layout.leftEqualToView(_number).topEqualToView(_number).bottomEqualToView(_number).widthIs(86*autoSizeScaleX);
    
    
    //记录用户点击哪个属性
    self.array=[[NSMutableArray alloc]init];
    for (int i=0; i<classs.listAttribute.count; i++) {
        GoodsDetailsListAttribute *ListAttribute=classs.listAttribute[i];
        NSMutableArray *arrays=[[NSMutableArray alloc]init];
        for (int y=0; y<ListAttribute.eAttributeVal.count; y++) {
            NSMutableDictionary *dics=[[NSMutableDictionary alloc]init];
            [dics setObject:@"no" forKey:@"why"];
            [arrays addObject:dics];
        }
        [self.array addObject:arrays];
    }
    
    
    
    
    
     [self buildCollectionView];
    

}
//关闭
-(void)onButtonClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

//点击商品图片执行
-(void)onImageBtnClick:(MyButton *)btn{
    
}

//点击立即购买执行该方法
-(void)onBuyClick{
    if ([[self ScreeningOfSkuValue] length]<1) {
        [FTIndicator showErrorWithMessage:Localized(@"请选择商品属性")];
    }else{
        int number=0;
        if (self.ChildDic==nil) {
            GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
            number=classs.comm.commodityReserves;
        }else{
            ChildProductDetailsBaseClass *class=[[ChildProductDetailsBaseClass alloc]initWithDictionary:self.ChildDic];
            number=class.map.commodityReserves;
        }
        if (numberCount>number) {
            [FTIndicator showInfoWithMessage:Localized(@"库存不足")];
        }else{
            [_deleghate BuyNowattr_input:[self ScreeningOfSkuValue] message:[self DisplayInformation] number:numberCount];
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
       
        
    }
    

    
}
//加入购物车

-(void)onShoppingCarClick{
    
    if ([[self ScreeningOfSkuValue] length]<1) {
        [FTIndicator showErrorWithMessage:Localized(@"请选择商品属性")];
    }else{
        int number=0;
        if (self.ChildDic==nil) {
            GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
            number=classs.comm.commodityReserves;
        }else{
            ChildProductDetailsBaseClass *class=[[ChildProductDetailsBaseClass alloc]initWithDictionary:self.ChildDic];
            number=class.map.commodityReserves;
        }
        if (numberCount>number) {
            [FTIndicator showInfoWithMessage:Localized(@"库存不足")];
        }else{
            [_deleghate AddToCart:[self ScreeningOfSkuValue] message:[self DisplayInformation] number:numberCount];
            [self dismissViewControllerAnimated:YES completion:^{
                
            }];
        }
      
    }
 

}
//加减数量
-(void)onChangetheNumberClick:(MyButton *)btn{
    
    int number=0;
    if (self.ChildDic==nil) {
        GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
        number=classs.comm.commodityReserves;
    }else{
        ChildProductDetailsBaseClass *class=[[ChildProductDetailsBaseClass alloc]initWithDictionary:self.ChildDic];
        number=class.map.commodityReserves;
    }
    if (btn.why) {//加
        if (numberCount<number) {
            numberCount+=1;
        }else{
        [FTIndicator showInfoWithMessage:Localized(@"库存不足")];
        }
        
    }else{//减
        if (numberCount<2) {
            [FTIndicator showInfoWithMessage:Localized(@"最少买一个")];
        }else{
            numberCount-=1;
        }
    
    }
    _number.text=[NSString stringWithFormat:@"%ld",numberCount];

}
//用户点击sku值
-(void)onSelectTheSkuClick:(MyButton *)btn{
    NSArray *arrayKey=self.array[btn.indexPath.section];
    NSMutableArray *arrays=[[NSMutableArray alloc]init];
    for (int i=0; i<arrayKey.count; i++) {
        NSMutableDictionary *dicKey=[[NSMutableDictionary alloc]init];
        if (i==btn.indexPath.row) {
            [dicKey setObject:@"yes" forKey:@"why"];
        }else{
            [dicKey setObject:@"no" forKey:@"why"];
        }
        [arrays addObject:dicKey];
    }
    [self.array replaceObjectAtIndex:btn.indexPath.section withObject:arrays];
    [_CollectionView reloadData];
    [self CheckWhetherMeetTheFilterCondition];
}
//筛选sku值拼接
-(NSString *)ScreeningOfSkuValue{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    NSString *skuStr=nil;
    int x=0;
    for (int i=0; i<self.array.count; i++) {
        GoodsDetailsListAttribute *ListAttribute=classs.listAttribute[i];
        NSArray *arrays=self.array[i];
        for (int y=0; y<arrays.count; y++) {
            NSArray *contextArray=ListAttribute.eAttributeVal;
            NSDictionary *dics=arrays[y];
            if ([[dics objectForKey:@"why"]isEqualToString:@"yes"]) {//筛选找到用户选择的sku值
                x+=1;
                NSString *skuu=[NSString stringWithFormat:@"%@",contextArray[y]];
                NSArray *fenGe=[skuu componentsSeparatedByString:@"_"];
                if (fenGe.count>0) {
                    if (skuStr==nil) {
                        skuStr=[NSString stringWithFormat:@"%@",fenGe[0]];
                    }else{
                        skuStr=[NSString stringWithFormat:@"%@-%@",skuStr,fenGe[0]];
                    }
                }
            }
        }
    }
    if (x==self.array.count) {//表示所有sku值都选了
        return skuStr;
    }
    return @"";


}
//展示信息
-(NSString *)DisplayInformation{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    NSString *skuStr=nil;
    for (int i=0; i<self.array.count; i++) {
        GoodsDetailsListAttribute *ListAttribute=classs.listAttribute[i];
        NSArray *arrays=self.array[i];
        for (int y=0; y<arrays.count; y++) {
            NSArray *contextArray=ListAttribute.eAttributeVal;
            NSDictionary *dics=arrays[y];
            if ([[dics objectForKey:@"why"]isEqualToString:@"yes"]) {//筛选找到用户选择的sku值
                NSString *skuu=[NSString stringWithFormat:@"%@",contextArray[y]];
                NSArray *fenGe=[skuu componentsSeparatedByString:@"_"];
                if (fenGe.count>1) {
                    if (skuStr==nil) {
                        skuStr=[NSString stringWithFormat:@"%@:%@",ListAttribute.attributeName,fenGe[1]];
                    }else{
                        skuStr=[NSString stringWithFormat:@"%@  %@:%@",skuStr,ListAttribute.attributeName,fenGe[1]];
                    }
                }
            }
        }
    }
    return skuStr;
    
    
}
//检查是否满足筛选条件
-(void)CheckWhetherMeetTheFilterCondition{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    NSString *skuStr=nil;
    int x=0;
    for (int i=0; i<self.array.count; i++) {
        GoodsDetailsListAttribute *ListAttribute=classs.listAttribute[i];
        NSArray *arrays=self.array[i];
        for (int y=0; y<arrays.count; y++) {
            NSArray *contextArray=ListAttribute.eAttributeVal;
            NSDictionary *dics=arrays[y];
            if ([[dics objectForKey:@"why"]isEqualToString:@"yes"]) {//筛选找到用户选择的sku值
                x+=1;
                NSString *skuu=[NSString stringWithFormat:@"%@",contextArray[y]];
                NSArray *fenGe=[skuu componentsSeparatedByString:@"_"];
                if (fenGe.count>0) {
                    if (skuStr==nil) {
                        skuStr=[NSString stringWithFormat:@"%@",fenGe[0]];
                    }else{
                        skuStr=[NSString stringWithFormat:@"%@-%@",skuStr,fenGe[0]];
                    }
                }
            }
        }
    }
    if (x==self.array.count) {//表示所有sku值都选了
        [SVProgressHUD showWithStatus:Localized(@"loading")];
        [self CommodityDataAcquisition:skuStr message:[self DisplayInformation]];
    }

}
//获取子商品信息
-(void)CommodityDataAcquisition:(NSString *)attr_input message:(NSString *)string{
    [GoodsDetailsRequest DetailsForTheChildvalues:[NSString stringWithFormat:@"%@_%@",self.commodity_serial,attr_input] block:^(NSDictionary *dics) {
        ChildProductDetailsBaseClass *class=[[ChildProductDetailsBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
        if ([class.code isEqualToString:@"28"]) {
            GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
            self.ChildDic=[self deleteEmpty:dics];
            ((UILabel *)[_view viewWithTag:741]).text=[NSString stringWithFormat:@"商品编码:%.0f",class.map.commoditySerial];
             [((MyButton *)[_view viewWithTag:753]) sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",classs.imgSrc,classs.comm.commodityImagesPath,classs.comm.commodityCoverImage]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
            [_deleghate CommodityDataAcquisition:[self deleteEmpty:dics] message:string];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
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
