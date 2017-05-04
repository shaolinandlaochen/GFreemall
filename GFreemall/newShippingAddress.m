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
#import "ChooseShippingAddressOne.h"
#import "ShippingAddressRequest.h"
@interface newShippingAddress ()<UITableViewDelegate,UITableViewDataSource,ChooseShippingAddressOneDelegate,NewAddInputBoxCellDelegate>
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

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(SelectAreaClick:) name:@"SelectAreasss" object:nil];
    
    // Do any additional setup after loading the view.
}
-(void)dealloc{
    //第一种方法.这里可以移除该控制器下的所有通知
    // 移除当前所有通知
    NSLog(@"移除了所有的通知");
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}
-(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
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
    
    return 124*autoSizeScaleY;
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
    btn.backgroundColor=[TheParentClass colorWithHexString:@"#292929"];
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
        cell.delegate=self;
        cell.context.indexPath=indexPath;
        if (indexPath.row==0) {
            cell.string=Localized(@"收货人:");
            if (self.name!=nil) {
                cell.context.text=self.name;
            }
           cell.placeholder=Localized(@"请在此处填写收货人");
        }else if (indexPath.row==1){
            cell.string=Localized(@"联系方式:");
            if (self.phoneNumber!=nil) {
                cell.context.text=self.phoneNumber;
            }
            cell.placeholder=Localized(@"请在此处填写收货人手机号码");
        }else if (indexPath.row==3){
            cell.string=Localized(@"详细地址:");
            if (self.addressString!=nil) {
                cell.context.text=self.addressString;
            }
            cell.placeholder=Localized(@"请在此处填写详细地址");
        }
          return cell;
    }else if (indexPath.row==2){
        
        GigAddressTableViewCell *cell=[GigAddressTableViewCell new];
        cell.textLabel.textColor=[TheParentClass colorWithHexString:@"#292929"];
        cell.textLabel.font=[UIFont systemFontOfSize:30*autoSizeScaleY];
        if ([self.address_country length]>0) {
            cell.textLabel.text=[NSString stringWithFormat:@"%@%@%@%@",self.address_country,self.address_province,self.address_city,self.address_area];
        }else{
        cell.textLabel.text=Localized(@"地区");
        }
        
        return  cell;
    
    }else if (indexPath.row==4){
        NiCaiCell *cell=[NiCaiCell new];
        cell.swc.on=self.isDefail;
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
    if (indexPath.row==2) {
        
        //清空数据
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"countries"];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"provinces"];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"city"];
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"area"];
        //NSString *paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        //NSLog(@"%@",paths);
        //NSString *path=[NSString stringWithFormat:@"%@/dizhi_quanqiu.txt",paths];
         NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"dizhi_quanqiu" ofType:@"txt"];
        NSString* content = [NSString stringWithContentsOfFile:resourcePath encoding:NSUTF8StringEncoding error:nil];
        NSDictionary *dic = [self dictionaryWithJsonString:content];
        AddressString *string=[AddressString CommodityClassificationModel:dic];
        ChooseShippingAddressOne *One=[[ChooseShippingAddressOne alloc]init];
        One.delegate=self;
        One.array=string.list;
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:One];
        [self presentViewController:nav animated:YES completion:nil];
    }
}


-(void)onCanceClick{
    [self.navigationController popViewControllerAnimated:YES];
}
//选择是否默认
-(void)onSwhClick:(UISwitch *)swc{
    self.isDefail=swc.on;

}

-(void)SelecAreaIs{
    
}
//选择地区完毕
-(void)SelectAreaClick:(NSNotification *)not{

    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"countries"]length]>0) {
            self.address_country=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"countries"]];
    }else{
    self.address_country=@"";
    }

    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"provinces"]length]>0) {
         self.address_province=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"provinces"]];
    }else{
    self.address_province=@"";
    }
   
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"city"]length]>0) {
       self.address_city=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"city"]];
    }else{
    self.address_city=@"";
    }
    
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"area"]length]>0) {
        self.address_area=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"area"]];
    }else{
    self.address_area=@"";
    }
    
    
    [_tableView reloadData];
    
}
//保存
-(void)onSaveAndUseClick{
    
        
    
    if ([self.name length]<1||[self.phoneNumber length]<1||[self.addressString length]<1||[self.address_country length]<1||[self.address_province length]<1||[self.address_city length]<1||[self.address_area length]<1) {
        [FTIndicator showErrorWithMessage:Localized(@"参数不全")];
    }else{
        
        
        
        NSString *ii;
        if (self.isDefail) {
            ii=@"1";
        }else{
            ii=@"0";
        }
        
        
        NSString *nameStr;
        if ([self.address_country isEqualToString:@"中国"]) {
            nameStr=@"China";
        }else{
            nameStr=self.address_country;
        }
        
        
        if ([self.why isEqualToString:@"新增"]) {
            [ShippingAddressRequest AddAShippingAddressaddress_name:self.name address_phone:self.phoneNumber address_country:nameStr address_province:self.address_province address_city:self.address_city address_area:self.address_area address_address:self.addressString address_isdefault:ii block:^(NSDictionary *dics) {
                AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                if ([class.code isEqualToString:@"53"]) {
                    [_delegate newShippingAddres];
                    [self.navigationController popViewControllerAnimated:YES];
                    [FTIndicator showSuccessWithMessage:class.msg];
                }else{
                [FTIndicator showErrorWithMessage:class.msg];
                }
                
                
            }];
        }else if([self.why isEqualToString:@"修改"]){
            [ShippingAddressRequest ModifyTheShippingAddressID:self.ID address_name:self.name address_phone:self.phoneNumber address_country:self.address_country address_province:self.address_province address_city:self.address_city address_area:self.address_area address_address:self.addressString address_isdefault:ii block:^(NSDictionary *dics) {
                AddressBaseClass *class=[[AddressBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
                if ([class.code isEqualToString:@"54"]) {
                    [_delegate newShippingAddres];
                    [self.navigationController popViewControllerAnimated:YES];
                    [FTIndicator showSuccessWithMessage:class.msg];
                }else{
                [FTIndicator showErrorWithMessage:class.msg];
                }
                
                
            }];;
            
        
        }
        
        
        
        
        
    
    
    }
    
    

}
-(void)NewString:(NSString *)string indexPath:(NSIndexPath *)indexpath{

    
    if (indexpath.row==0) {
        self.name=string;
    }else if (indexpath.row==1){
        self.phoneNumber=string;
    }else if (indexpath.row==3){
        self.addressString=string;
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
