//
//  newShippingAddress.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/3.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "newShippingAddress.h"
#import "NewAddInputBoxCell.h"
#import "GigAddressTableViewCell.h"
#import "NiCaiCell.h"
@interface newShippingAddress ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    MyButton *addRess;
}

@end

@implementation newShippingAddress

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"新建收货地址");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.backgroundColor=[UIColor whiteColor];
    _tableView.separatorColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 106*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    
    return 106*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    autoSize
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor whiteColor];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor blackColor];
    [btn addTarget:self action:@selector(onSaveAndUseClick) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font=[UIFont systemFontOfSize:34*autoSizeScaleY];
    btn.layer.cornerRadius = 6*autoSizeScaleX;
    btn.layer.masksToBounds = 6*autoSizeScaleX;
    [btn setTitle:Localized(@"保存并使用") forState:UIControlStateNormal];
    [view addSubview:btn];
    btn.sd_layout.leftSpaceToView(view, 25*autoSizeScaleX).topSpaceToView(view, 16*autoSizeScaleY).rightSpaceToView(view, 25*autoSizeScaleX).bottomSpaceToView(view, 16*autoSizeScaleY);
    
    
    
    
    return view;


}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    
    if (indexPath.row==0||indexPath.row==1||indexPath.row==3) {
        NewAddInputBoxCell *cell=[NewAddInputBoxCell new];
      
        if (indexPath.row==0) {
            cell.string=Localized(@"收货人:");
        }else if (indexPath.row==1){
            cell.string=Localized(@"联系方式:");
        }else if (indexPath.row==3){
            cell.string=Localized(@"详细地址:");
        }
          return cell;
    }else if (indexPath.row==2){
        
        GigAddressTableViewCell *cell=[GigAddressTableViewCell new];
        cell.textLabel.textColor=[TheParentClass colorWithHexString:@"#292929"];
        cell.textLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        cell.textLabel.text=Localized(@"地区");
        return  cell;
    
    }else if (indexPath.row==4){
        NiCaiCell *cell=[NiCaiCell new];
        [cell.swc addTarget:self action:@selector(onSwhClick:) forControlEvents:UIControlEventTouchUpInside];
        cell.textLabel.textColor=[TheParentClass colorWithHexString:@"#292929"];
        cell.textLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        cell.textLabel.text=Localized(@"设为默认地址");
        return cell;
    }
    NULLCell  *cell=[NULLCell new];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//选择是否默认
-(void)onSwhClick:(UISwitch *)swc{
    NSLog(@"aaaaaaaa");

}
//保存
-(void)onSaveAndUseClick{

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
