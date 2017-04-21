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

@interface AttributeSelectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UIView *_view;
    UILabel *line;//基准
    UICollectionView *_CollectionView;
    UICollectionViewFlowLayout *flowLayout;
    MyButton *_buyBtn;//立即购买
    MyButton *_carShopping;
}
@end

@implementation AttributeSelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self BuildView];
    [self AddTheCommodityInformation];
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
    _CollectionView.sd_layout.leftSpaceToView(_view, 0).topSpaceToView(line, 0).rightSpaceToView(_view, 0).bottomSpaceToView(_view, 100*autoSizeScaleY);
    
    
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
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    GoodsDetailsListAttribute *Attribute=classs.listAttribute[indexPath.section];
    NSArray *array=[self deleteEmptyArr:Attribute.eAttributeVal];
    autoSize
    NSArray *strArray=[[NSString stringWithFormat:@"%@",array[indexPath.row]] componentsSeparatedByString:@"_"];
    AttributeSkuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"321" forIndexPath:indexPath];
    if (strArray.count>1) {
          [cell.string setTitle:[NSString stringWithFormat:@"%@",strArray[1]] forState:UIControlStateNormal];
    }
  
    
    return cell;
}
//点击cell 执行该方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
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
    _view=[[UIView alloc]init];
    _view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_view];
    _view.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).topSpaceToView(self.view, 500*autoSizeScaleY);
    
    line=[[UILabel alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [_view addSubview:line];
    line.sd_layout.leftSpaceToView(_view, 0).rightSpaceToView(_view, 0).topSpaceToView(_view, 180*autoSizeScaleY).heightIs(0.6);
    //构建加入购物车.立即购买按钮
    [self buyAndCar];
    
    //叉号
    UIButton *btn=[[UIButton alloc]init];
    [btn setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [_view addSubview:btn];
    btn.sd_layout.rightSpaceToView(_view, 25*autoSizeScaleX).topSpaceToView(_view, 25*autoSizeScaleY).widthIs(50*autoSizeScaleX).heightIs(50*autoSizeScaleY);

}
//关闭
-(void)onButtonClick{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
[_deleghate hutDownGo];
}
//添加商品信息
-(void)AddTheCommodityInformation{
    autoSize
    GoodsDetailsBaseClass *classs=[[GoodsDetailsBaseClass alloc]initWithDictionary:self.dataDic];
    
    
    MyButton *imgBtn=[[MyButton alloc]init];
    [imgBtn addTarget:self action:@selector(onImageBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [imgBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1491122119507&di=62a38ab54d32a27046a595d9d8d1c597&imgtype=0&src=http%3A%2F%2Fimage.3761.com%2Fnvxing%2F2016022921%2F2016022921382152113.jpg"] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
    imgBtn.backgroundColor=[UIColor whiteColor];
    [imgBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [imgBtn.layer setBorderWidth:1];
    [imgBtn.layer setMasksToBounds:YES];
    imgBtn.layer.cornerRadius = 6*autoSizeScaleX;
    imgBtn.layer.masksToBounds = 6*autoSizeScaleX;
    [_view addSubview:imgBtn];
    imgBtn.sd_layout.leftSpaceToView(_view, 25*autoSizeScaleX).bottomSpaceToView(line, 25*autoSizeScaleY).widthIs(190*autoSizeScaleX).heightIs(190*autoSizeScaleY);
    
    
    //商品编码
    UILabel *goodsNmuber=[[UILabel alloc]init];
    goodsNmuber.text=@"商品编码:12345678998";
    goodsNmuber.textColor=[TheParentClass colorWithHexString:@"#999999"];
    goodsNmuber.font=[UIFont systemFontOfSize:24*autoSizeScaleY];
    [_view addSubview:goodsNmuber];
    goodsNmuber.sd_layout.leftSpaceToView(imgBtn, 25*autoSizeScaleX).bottomSpaceToView(line, 30*autoSizeScaleY).rightSpaceToView(_view, 25*autoSizeScaleX).autoHeightRatio(0);
    
    //商品名称
    UILabel *goodsName=[[UILabel alloc]init];
    goodsName.text=@"华夏美女成都专供只要998";
    goodsName.textColor=[TheParentClass colorWithHexString:@"#373f4e"];
    goodsName.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
    [_view addSubview:goodsName];
    goodsName.sd_layout.leftSpaceToView(imgBtn, 25*autoSizeScaleX).bottomSpaceToView(goodsNmuber, 18*autoSizeScaleY).rightSpaceToView(_view, 25*autoSizeScaleX).autoHeightRatio(0);
    
    
    [self buildCollectionView];

}
//点击商品图片执行
-(void)onImageBtnClick:(MyButton *)btn{
    
}
//构建加入狗无车和立即购买按钮
-(void)buyAndCar{
autoSize
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
    

}
//点击立即购买执行该方法
-(void)onBuyClick{

}
//加入购物车

-(void)onShoppingCarClick{


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
