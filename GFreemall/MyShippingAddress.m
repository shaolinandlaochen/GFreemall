//
//  MyShippingAddress.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyShippingAddress.h"
#import "InputBoxCell.h"
#import "newShippingAddress.h"
@interface MyShippingAddress ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *addRess;
}


@end

@implementation MyShippingAddress
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"收货管理");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    
    
    addRess=[[MyButton alloc]init];
    addRess.backgroundColor=[UIColor blackColor];
    [addRess setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addRess setTitle:@"+新建地址" forState:UIControlStateNormal];
    //圆角
    addRess.layer.cornerRadius = 6*autoSizeScaleX;
    addRess.layer.masksToBounds = 6*autoSizeScaleX;
    [addRess addTarget:self action:@selector(onAddressClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addRess];
    addRess.sd_layout.leftSpaceToView(self.view, 25*autoSizeScaleX).rightSpaceToView(self.view, 25*autoSizeScaleX).bottomSpaceToView(self.view, 20*autoSizeScaleY).heightIs(96*autoSizeScaleY);
    
    
    CGFloat navheight = self.navigationController.navigationBar.frame.size.height;//导航栏目高度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];//状态栏高度
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
    _tableView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).bottomSpaceToView(addRess, 20*autoSizeScaleY).topSpaceToView(self.view, navheight+rectStatus.size.height);
    
    
    // Do any additional setup after loading the view.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return 6;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    NSString *txt=@"a";
    return [tableView cellHeightForIndexPath:indexPath model:txt keyPath:@"text" cellClass:[InputBoxCell class] contentViewWidth:self.view.frame.size.width];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
  
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
    
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    InputBoxCell *cell=[InputBoxCell new];
    if (indexPath.row==0) {
        cell.icon.text=@"默认";
        cell.icon.backgroundColor=[UIColor redColor];
        [cell.btn addTarget:self action:@selector(onEidClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.btn.indexPath=indexPath;
    }
    cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    newShippingAddress *new=[[newShippingAddress alloc]init];
    [self.navigationController pushViewController:new animated:YES];
}


-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//点击编辑进入该方法
-(void)onEidClick:(MyButton *)btn{

}
//添加地址
-(void)onAddressClick{
    newShippingAddress *new=[[newShippingAddress alloc]init];
    [self.navigationController pushViewController:new animated:YES];
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