//
//  LineUp.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/10.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "LineUp.h"
#import "AttributeSkuCell.h"
#import "SKUCollectionReusableView.h"
@interface LineUp ()<UICollectionViewDelegate,UICollectionViewDataSource>
{

    UICollectionView *_CollectionView;
    UICollectionViewFlowLayout *flowLayout;
    NSInteger MyindexPath;

}

@end

@implementation LineUp
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self buildCollectionView];
    MyindexPath=0;
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
    _CollectionView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [_CollectionView registerClass:[AttributeSkuCell class] forCellWithReuseIdentifier:@"321"];
    [_CollectionView registerClass:[SKUCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeader"];
    [self.view addSubview:_CollectionView];
    _CollectionView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 98*autoSizeScaleY);
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
        reuseIdentifier = @"cellHeader";
    }
    
    SKUCollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        //view.name.text=@"我是标题";
    }
    return view;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    autoSize
    CGSize size={0,0};
    return size;
}

//返回区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每区返回的行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 50;
}
//构建单元格
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    autoSize
    AttributeSkuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"321" forIndexPath:indexPath];
    cell.string.row=indexPath.row;
    [cell.string addTarget:self action:@selector(onIndexPathClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.string setTitle:@"1234567" forState:UIControlStateNormal];
    cell.string.titleLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
   
    if (indexPath.row==MyindexPath) {
        [cell.string.layer setBorderColor:[TheParentClass colorWithHexString:@"#e61f5b"].CGColor];
        [cell.string setTitleColor:[TheParentClass colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        cell.string.backgroundColor=[TheParentClass colorWithHexString:@"#e61f5b"];
    }else{
        [cell.string.layer setBorderColor:[TheParentClass colorWithHexString:@"#999999"].CGColor];
        [cell.string setTitleColor:[TheParentClass colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        cell.string.backgroundColor=[UIColor whiteColor];
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
    
    size =CGSizeMake(216*autoSizeScaleX, 100*autoSizeScaleX);
    
    return size;
}
-(void)onIndexPathClick:(MyButton *)btn{
    MyindexPath=btn.row;
    [_CollectionView reloadData];
    NSLog(@"%ld",MyindexPath);

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
