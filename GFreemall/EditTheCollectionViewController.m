//
//  EditTheCollectionViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "EditTheCollectionViewController.h"
#import "EditTheCollectionCell.h"
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
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        EditTheCollectionCell *cell=[EditTheCollectionCell new];
        cell.selectedBtn.indexPath=indexPath;
        [cell.selectedBtn addTarget:self action:@selector(onSlelctedBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return cell;
    }
    NULLCell *celll=[NULLCell new];
    return celll;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
//完成
-(void)onrightItemButtonClick{

    
}
//选中
-(void)onSlelctedBtnClick:(MyButton *)btn{

}
//全选
-(void)onFutureGenerationsClick:(UIButton *)btn{

}
//删除
-(void)onDeleteClick{

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
