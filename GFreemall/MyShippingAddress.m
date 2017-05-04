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
#import "ShippingAddressRequest.h"
@interface MyShippingAddress ()<UITableViewDelegate,UITableViewDataSource,newShippingAddressOneDelegate>
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
-(void)newShippingAddres{
    [self LoadTheRequest];
}
-(void)LoadTheRequest{
    [ShippingAddressRequest ToObtainAListShippingAddressblock:^(NSDictionary *dics) {
        self.dataDic=[self deleteEmpty:dics];
        AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"51"]) {
            [_tableView reloadData];
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
     [_tableView.mj_header endRefreshing];
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
    addRess.backgroundColor=[TheParentClass colorWithHexString:@"#292929"];
    [addRess setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addRess setTitle:Localized(@"+新建地址") forState:UIControlStateNormal];
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
    
    TheDrop_downRefresh(_tableView, @selector(LoadTheRequest))
    
    // Do any additional setup after loading the view.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];

    return class.list.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
     AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];
    AddressList *list=class.list[indexPath.row];
    return [tableView cellHeightForIndexPath:indexPath model:list keyPath:@"model" cellClass:[InputBoxCell class] contentViewWidth:self.view.frame.size.width];
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
    
    AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];
    AddressList *list=class.list[indexPath.row];
    InputBoxCell *cell=[InputBoxCell new];
    cell.model=list;
    cell.btn.row=indexPath.row;
    [cell.btn addTarget:self action:@selector(onEidClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    return cell;

}
//设置标题
-(NSArray<UITableViewRowAction*>*)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
      AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];
    AddressList *list=class.list[indexPath.row];
        [SVProgressHUD showWithStatus:Localized(@"正在删除")];
        [ShippingAddressRequest delegateAddressString:list.listIdentifier block:^(NSDictionary *dics) {
            AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            if ([class.code isEqualToString:@"55"]) {
                 [self LoadTheRequest];
            }else{
                [FTIndicator showErrorWithMessage:class.msg];
            }
           
        }];
        
        
        
    }];
    
    NSArray *arr = @[rowAction];
    return arr;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.where isEqualToString:@"选择地址"]) {
        AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];
        AddressList *list=class.list[indexPath.row];
        [self.navigationController popViewControllerAnimated:YES];
        [_delegate MyShippingAddressAddress_address:list.addressAddress address_area:list.addressArea address_city:list.addressCity address_country:list.addressCountry address_isdefault:list.addressIsdefault address_name:list.addressName address_phone:list.addressPhone address_province:list.addressProvince address_zipcode:list.addressZipcode];
    }

}


-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//点击编辑进入该方法
-(void)onEidClick:(MyButton *)btn{
    AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:self.dataDic];
    AddressList *list=class.list[btn.row];
    newShippingAddress *new=[[newShippingAddress alloc]init];
    new.name=list.addressName;
    new.phoneNumber=list.addressPhone;
    new.addressString=list.addressAddress;
    new.address_area=list.addressArea;
    new.address_city=list.addressCity;
    new.address_province=list.addressProvince;
    new.address_country=list.addressCountry;
    new.ID=list.listIdentifier;
    if (list.addressIsdefault==1) {
        new.isDefail=YES;
    }else{
        new.isDefail=NO;
    }
    new.why=@"修改";
    new.delegate=self;
    [self.navigationController pushViewController:new animated:YES];

}
//添加地址
-(void)onAddressClick{
    newShippingAddress *new=[[newShippingAddress alloc]init];
    new.delegate=self;
    new.why=@"新增";
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
