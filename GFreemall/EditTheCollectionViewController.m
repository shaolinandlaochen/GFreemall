//
//  EditTheCollectionViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "EditTheCollectionViewController.h"
#import "EditTheCollectionCell.h"
#import "CollectionRequest.h"
@interface EditTheCollectionViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
    
    UIButton * _selecateButton;
    
    UIButton *_deleteBtn;
}

@end

@implementation EditTheCollectionViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"收藏");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[UIColor whiteColor];
    leftCancel
    [self CreatView];
    // Do any additional setup after loading the view.
}
cancelClick
-(void)CreatView{
    _AddAndDeleteArray=[[NSMutableArray alloc]init];
    CollectionBaseClass *class=[[CollectionBaseClass alloc]initWithDictionary:self.dataDic];
    CollectionData *data=class.data;
    for (int i=0; i<data.resultList.count; i++) {
        CollectionResultList *list=data.resultList[i];
        list.selected=NO;
        [_AddAndDeleteArray addObject:list];
    }
    
    
    
    
    autoSize
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"完成") style:UIBarButtonItemStylePlain target:self action:@selector(onrightItemButtonClick)];
    self.navigationItem.rightBarButtonItem=rightItem;
    [self.navigationItem.rightBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 100*autoSizeScaleY).topSpaceToView(self.view, 0);
    
    _selecateButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [_selecateButton addTarget:self action:@selector(onFutureGenerationsClick:) forControlEvents:UIControlEventTouchUpInside];
    [_selecateButton setImage:[UIImage imageNamed:@"icon_circle"] forState:UIControlStateNormal];
     [_selecateButton setImage:[UIImage imageNamed:@"icon_selected"] forState:UIControlStateSelected];
    [self.view addSubview:_selecateButton];
    _selecateButton.sd_layout.leftSpaceToView(self.view, 10*autoSizeScaleX).bottomSpaceToView(self.view, 20*autoSizeScaleY).widthIs(60*-autoSizeScaleX).heightIs(60*autoSizeScaleY);
    
    
    UILabel *name=[[UILabel alloc]init];
    name.text=Localized(@"全选");
    name.textColor=[TheParentClass colorWithHexString:@"#292929"];
    name.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [self.view addSubview:name];
    name.sd_layout.leftSpaceToView(_selecateButton, 10*autoSizeScaleX).bottomEqualToView(_selecateButton).widthIs(100*autoSizeScaleX).heightIs(60*autoSizeScaleY);
    
    
    _deleteBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [_deleteBtn setTitle:Localized(@"删除") forState:UIControlStateNormal];
    _deleteBtn.titleLabel.font=[UIFont systemFontOfSize:28*autoSizeScaleY];
    [_deleteBtn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
    [_deleteBtn.layer setBorderColor:[TheParentClass colorWithHexString:@"#292929"].CGColor];
    [_deleteBtn.layer setBorderWidth:1];
    [_deleteBtn addTarget:self action:@selector(onDeleteClick) forControlEvents:UIControlEventTouchUpInside];
    [_deleteBtn.layer setMasksToBounds:YES];
    _deleteBtn.layer.cornerRadius = 6*autoSizeScaleX;
    _deleteBtn.layer.masksToBounds = 6*autoSizeScaleX;
    [self.view addSubview:_deleteBtn];
    _deleteBtn.sd_layout.rightSpaceToView(self.view, 25*autoSizeScaleX).bottomSpaceToView(self.view, 19*autoSizeScaleY).widthIs(142*autoSizeScaleX).heightIs(62*autoSizeScaleY);
    
    
    
    UIView *line=[[UIView alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#d7d7d7"];
    [self.view addSubview:line];
    line.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(self.view, 97*autoSizeScaleY).heightIs(1);
    
    
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
    
    return _AddAndDeleteArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    EditTheCollectionCell *cell=[EditTheCollectionCell new];
    CollectionBaseClass *class=[[CollectionBaseClass alloc]initWithDictionary:self.dataDic];
    CollectionResultList *ResultList=_AddAndDeleteArray[indexPath.row];
    cell.selectedBtn.selected=ResultList.selected;
    cell.selectedBtn.indexPath=indexPath;
    [cell.selectedBtn addTarget:self action:@selector(onSlelctedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",class.imgSrc,ResultList.commodityImagesPath,ResultList.commodityCoverImage]] placeholderImage:[UIImage imageNamed:@""]];
    cell.title.text=ResultList.commodityName;
    cell.picre.text=[NSString stringWithFormat:@"%f",ResultList.commoditySellprice];
        return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
//完成
-(void)onrightItemButtonClick{

    
}
//选中
-(void)onSlelctedBtnClick:(MyButton *)btn{
    btn.selected=!btn.selected;
    CollectionResultList *list=_AddAndDeleteArray[btn.indexPath.row];
    list.selected=btn.selected;
    [_AddAndDeleteArray replaceObjectAtIndex:btn.indexPath.row withObject:list];
    
    int y=0;
    for (int i=0; i<_AddAndDeleteArray.count; i++) {
        CollectionResultList *ResultList=_AddAndDeleteArray[i];
        if (ResultList.selected==YES) {
            y+=1;
        }
    }
    NSLog(@"数组数量==%ld----%d",_AddAndDeleteArray.count,y);
    if (y==_AddAndDeleteArray.count) {
        _selecateButton.selected=YES;
    }else{
    _selecateButton.selected=NO;
    }
    [_tableView reloadData];
}
//全选
-(void)onFutureGenerationsClick:(UIButton *)btn{
    btn.selected=!btn.selected;
    for (int i=0; i<_AddAndDeleteArray.count; i++) {
        CollectionResultList *ResultList=_AddAndDeleteArray[i];
        if (btn.selected==YES) {
            ResultList.selected=YES;
        }else{
        ResultList.selected=NO;
        }
    [_AddAndDeleteArray replaceObjectAtIndex:i withObject:ResultList];
    }
    [_tableView reloadData];

}
//删除
-(void)onDeleteClick{
    
    
    NSString *idStr=@"";
    //拼接字符串
    for (int i=0; i<_AddAndDeleteArray.count; i++) {
        CollectionResultList *ResultList=_AddAndDeleteArray[i];
        if (ResultList.selected==YES) {
            if ([idStr isEqualToString:@""]) {
                idStr=[NSString stringWithFormat:@"%.0f",ResultList.resultListIdentifier];
            }else{
             idStr=[NSString stringWithFormat:@"%@,%.0f",idStr,ResultList.resultListIdentifier];
            }
        }
    }
    if ([idStr isEqualToString:@""]) {//走到这表示拥护没有选中任何商品
        [FTIndicator showInfoWithMessage:Localized(@"请选择要删除的商品")];
    }else{
        [SVProgressHUD showWithStatus:Localized(@"正在删除")];
        [CollectionRequest delegateGoods:idStr block:^(NSDictionary *dic) {
            NSDictionary *dicMessage=[self deleteEmpty:dic];
            if ([[NSString stringWithFormat:@"%@",[dicMessage objectForKey:@"code"]] isEqualToString:@"50"]) {//删除成功
                //进行删除
                NSArray *idstrArray=[idStr componentsSeparatedByString:@","];
                for (int y=0; y<idstrArray.count; y++) {
                    for (int i=0; i<_AddAndDeleteArray.count; i++) {
                        CollectionResultList *ResultList=_AddAndDeleteArray[i];
                        if ([[NSString stringWithFormat:@"%.0f",ResultList.resultListIdentifier] isEqualToString:idstrArray[y]]) {
                            [_AddAndDeleteArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                if (obj ==ResultList) {
                                    [_AddAndDeleteArray removeObject:obj];
                                }
                            }];
                        }
                    }
                }
                
               
                NSLog(@"%ld",_AddAndDeleteArray.count);
                //[self.navigationController popViewControllerAnimated:YES];
                [_tableView reloadData];
            }
             [FTIndicator showErrorWithMessage:[NSString stringWithFormat:@"%@",[dicMessage objectForKey:@"msg"]]];
            [SVProgressHUD dismiss];
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
