//
//  ClassificationViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ClassificationViewController.h"
#import "ListCell.h"
#import "SearchListingsCollectionViewCell.h"
#import "SearchListingsView.h"
#import "BrandCell.h"
#import "MyNewsViewController.h"
#import "ClassificationRequest.h"
#import "DataAccessPageRequest.h"
@interface ClassificationViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>
{
    UILabel *number;
    UIButton *BarButton;
    UITableView *_tableView;
    UICollectionView *_CollectionView;
    UICollectionViewFlowLayout *flowLayout;
    UIView *lines;
    NSInteger defaultIdx;
}
@end

@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //取消自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self SetTheNavigationBar];//创建导航条
    [self AddTheSearch];//创建搜索框
    defaultIdx=0;
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    float height=94*autoSizeScaleY;//搜索框高度
    float yu=187*autoSizeScaleX;
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, navheight+rectStatus.size.height+height, 187*autoSizeScaleX, self.view.frame.size.height-(340*autoSizeScaleY)) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView.showsVerticalScrollIndicator = NO;//去掉右侧滚动条
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, navheight+rectStatus.size.height+height).bottomSpaceToView(lines, 0).widthIs(187*autoSizeScaleX);
    
    
    flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(140*autoSizeScaleX, 198*autoSizeScaleY);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 40*autoSizeScaleY;
    ////上,左,下 右
    flowLayout.sectionInset = UIEdgeInsetsMake(30*autoSizeScaleX, 48*autoSizeScaleY, 30*autoSizeScaleX, 48*autoSizeScaleY);
    
    _CollectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(187*autoSizeScaleX, navheight+rectStatus.size.height+height, self.view.frame.size.width-yu, _tableView.frame.size.height) collectionViewLayout:flowLayout];
    _CollectionView.backgroundColor=[TheParentClass colorWithHexString:@"eeeeee"];
    _CollectionView.delegate=self;
    _CollectionView.dataSource=self;
    [_CollectionView registerClass:[SearchListingsCollectionViewCell class] forCellWithReuseIdentifier:@"123"];    [_CollectionView registerClass:[BrandCell class] forCellWithReuseIdentifier:@"321"];
    [_CollectionView registerClass:[SearchListingsView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"cellHeader"];
    [self.view addSubview:_CollectionView];
    _CollectionView.sd_layout.leftSpaceToView(_tableView, 1).topEqualToView(_tableView).rightSpaceToView(self.view, 0).bottomEqualToView(_tableView);
    _CollectionView.backgroundColor=[UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
}
-(void)ToGetTheData{
    [SVProgressHUD showWithStatus:Localized(@"loading")];
    [ClassificationRequest ForCategoricalData:^(NSDictionary *dicData) {
        self.dataDics=[self deleteEmpty:dicData];
        ForCategoricalDataBaseClass *class=[[ForCategoricalDataBaseClass alloc]initWithDictionary:dicData];
        if ([class.code isEqualToString:@"4"]) {
            [_tableView reloadData];
            [_CollectionView reloadData];
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        [SVProgressHUD dismiss];
    }];
    

}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader ]){
        reuseIdentifier = @"cellHeader";
    }
    
    SearchListingsView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
   // view.name.text=@"我是标题";
    }
    return view;
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    autoSize
    float yu=187*autoSizeScaleX;
    CGSize size={self.view.frame.size.width-yu,0*autoSizeScaleY};
    return size;
}

//返回区数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每区返回的行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    ForCategoricalDataBaseClass *ForCategoricalData=[[ForCategoricalDataBaseClass alloc]initWithDictionary:self.dataDics];
    ForCategoricalDataListCategory *listCategory = ForCategoricalData.listCategory[defaultIdx];
    return listCategory.secondNav.count;
}
//构建单元格
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    autoSize
//        BrandCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"321" forIndexPath:indexPath];
     SearchListingsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    ForCategoricalDataBaseClass *ForCategoricalData=[[ForCategoricalDataBaseClass alloc]initWithDictionary:self.dataDics];
    ForCategoricalDataListCategory *ListCategory = ForCategoricalData.listCategory[defaultIdx];
    ForCategoricalDataSecondNav *secondNav=ListCategory.secondNav[indexPath.row];
    cell.name.text = secondNav.categoryName;

        return cell;
   
}
//点击cell 执行该方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    ForCategoricalDataBaseClass *ForCategoricalData=[[ForCategoricalDataBaseClass alloc]initWithDictionary:self.dataDics];
    ForCategoricalDataListCategory *ListCategory = ForCategoricalData.listCategory[defaultIdx];
    ForCategoricalDataSecondNav *secondNav=ListCategory.secondNav[indexPath.row];
    SearchViewController *search=[[SearchViewController alloc]init];
    search.where=@"商品";
    search.categorySerial=[NSString stringWithFormat:@"%.0f",secondNav.categorySerial];
    [self.navigationController pushViewController:search animated:YES];
}
-(CGSize)collectionView:(nonnull UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    autoSize
    CGSize size;

      size =CGSizeMake(144*autoSizeScaleX, 140*autoSizeScaleX);
  
    return size;
}



//以下是表


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
autoSize
    return 125*autoSizeScaleY;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    ForCategoricalDataBaseClass *classs=[[ForCategoricalDataBaseClass alloc]initWithDictionary:self.dataDics];
    return classs.listCategory.count;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    defaultIdx=indexPath.row;
    [_tableView reloadData];
    [_CollectionView reloadData];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    ListCell *cell=[ListCell new];
    
    NSArray *listCategory=[self.dataDics objectForKey:@"listCategory"];
    
    cell.lbl.text=[NSString stringWithFormat:@"%@",[listCategory[indexPath.row] objectForKey:@"category_name"]];

    
        if (indexPath.row==defaultIdx) {
            cell.backgroundColor=[UIColor whiteColor];
            cell.lbl.textColor=[TheParentClass colorWithHexString:@"#de0024"];
        }else{
            cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
            cell.lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
        }
      
        return cell;
    

}

-(void)SetTheNavigationBar{
    autoSize
    
//    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"language") style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButtonClick)];
//    self.navigationItem.leftBarButtonItem=leftItem;
//    [self.navigationItem.leftBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
//    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
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
    [view addSubview:number];
    //右按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItem=item;
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    
    lines=[[UIView alloc]init];
    [self.view addSubview:lines];
    lines.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 98*autoSizeScaleY).heightIs(0.1);
    
}
//点击导航条左按钮执行该方法(选择语言)
-(void)onLeftButtonClick{
    [TheParentClass languaggeSwitch];
    
}
//点击右边导航条按钮执行该方法
-(void)onBarButtonClick:(UIButton *)btn{
    MyNewsViewController *news=[[MyNewsViewController alloc]init];
    [self.navigationController pushViewController:news animated:YES];
    
}
-(void)AddTheSearch{
    autoSize
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];

    UIButton *img=[UIButton buttonWithType:UIButtonTypeCustom];
    [img setBackgroundImage:[UIImage imageNamed:@"search_bg"] forState:UIControlStateNormal];
    [img addTarget:self action:@selector(onSearchClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).topSpaceToView(self.view, (12*autoSizeScaleY)+navheight+rectStatus.size.height).rightSpaceToView(self.view, 25*autoSizeScaleX).heightIs(70*autoSizeScaleY);
    UIImageView *imgSearch=[[UIImageView alloc]init];
    imgSearch.image=[UIImage imageNamed:@"icon_search"];
    [img addSubview:imgSearch];
    imgSearch.sd_layout.leftSpaceToView(img, 20*autoSizeScaleX).topSpaceToView(img, 20*autoSizeScaleY).bottomSpaceToView(img, 20*autoSizeScaleY).widthIs(30*autoSizeScaleY);
    
    UILabel *lbl=[[UILabel alloc]init];
    lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
    lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    lbl.textAlignment=NSTextAlignmentLeft;
    lbl.text=Localized(@"搜索您想找的商品");
    [img addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(imgSearch, 20*autoSizeScaleX).topEqualToView(imgSearch).bottomEqualToView(imgSearch).widthIs(400*autoSizeScaleX);
}
//用户点击搜索栏执行该方法
-(void)onSearchClick{
    SearchViewController *search=[[SearchViewController alloc]init];
    search.where=@"搜索";
    [self.navigationController pushViewController:search animated:YES];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:YES];
     [self ToGetTheData];//获取数据
    [self messageNumber];//查询未读消息
    
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
                    if (class.data>99) {
                        number.text=@"99";
                    }
                    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
