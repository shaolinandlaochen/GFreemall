//
//  MyCollectionViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "SearchForGoodsCell.h"
#import "EditTheCollectionViewController.h"
#import "CollectionRequest.h"
@interface MyCollectionViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation MyCollectionViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
     TheDrop_downRefresh(_tableView, @selector(AccessToDataCollectionList))
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"收藏");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[[UIColor blackColor]colorWithAlphaComponent:0.9]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
   // [self BuildNoCollectioneView];//没有收藏

    
    // Do any additional setup after loading the view.
}
-(void)AccessToDataCollectionList{
    //[SVProgressHUD showWithStatus:@"正在加载"];
    [CollectionRequest ToObtainAListCollectionblock:^(NSDictionary *dic) {
        self.dataDic =[self deleteEmpty:dic];
        CollectionBaseClass *class=[[CollectionBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"3"]) {
            if (class.data.resultList.count>0) {
                 [_tableView reloadData];
            }else{
            [self BuildNoCollectioneView];//没有收藏
            }
           
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        [_tableView.mj_header endRefreshing];
        [SVProgressHUD dismiss];
    }];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [SVProgressHUD dismiss];
   
}
cancelClick
-(void)CreatView{
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"编辑") style:UIBarButtonItemStylePlain target:self action:@selector(onrightItemButtonClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
    [self.navigationItem.rightBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    TheDrop_downRefresh(_tableView, @selector(AccessToDataCollectionList))
    
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
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     CollectionBaseClass *class=[[CollectionBaseClass alloc]initWithDictionary:self.dataDic];
    CollectionData *data=class.data;
    return data.resultList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        SearchForGoodsCell *cell=[SearchForGoodsCell new];
        CollectionBaseClass *class=[[CollectionBaseClass alloc]initWithDictionary:self.dataDic];
        CollectionData *data=class.data;
        CollectionResultList *ResultList=data.resultList[indexPath.row];
        [cell.img sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,ResultList.commodityImagesPath,ResultList.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
        cell.title.text=ResultList.commodityName;
        cell.picre.text=[NSString stringWithFormat:@"¥%.2f",ResultList.commoditySellprice];
        
        return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //商品位
    CollectionBaseClass *class=[[CollectionBaseClass alloc]initWithDictionary:self.dataDic];
    CollectionResultList *list=class.data.resultList[indexPath.row];
    GoodsDetailsViewController *goodsDetails=[[GoodsDetailsViewController alloc]init];
    goodsDetails.commodity_serial=[NSString stringWithFormat:@"%.0f",list.commoditySerial];
    [self.navigationController pushViewController:goodsDetails animated:YES];

}
//编辑
-(void)onrightItemButtonClick{
    EditTheCollectionViewController *EditTheCollection=[[EditTheCollectionViewController alloc]init];
    EditTheCollection.dataDic=[self deleteEmpty:self.dataDic];
    [self.navigationController pushViewController:EditTheCollection animated:YES];

}
-(void)BuildNoCollectioneView{
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"pic_shoucang"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 195*autoSizeScaleX).rightSpaceToView(self.view, 195*autoSizeScaleX).topSpaceToView(self.view, 300*autoSizeScaleY).heightIs(141*autoSizeScaleY);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=Localized(@"您还没有任何收藏呢");
    lbl.textColor=[TheParentClass colorWithHexString:@"#999999"];
    lbl.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    lbl.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lbl];
    lbl.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(img, 10).heightIs(35*autoSizeScaleY);
    
    
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
