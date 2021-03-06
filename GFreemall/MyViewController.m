//
//  MyViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyViewController.h"
#import "MyAllCell.h"
#import "MyMessageCells.h"
#import "MyShippingAddress.h"
#import "MyOrderViewController.h"
#import "MyNewsViewController.h"
#import "MyCollectionViewController.h"
#import "MyBasicInformationViewController.h"
#import "SetUpViewController.h"
#import "OnlineWalletViewController.h"
#import "MyRequest.h"
#import "DataAccessPageRequest.h"
@interface MyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSInteger number;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.navigationController.navigationBarHidden=YES;
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    _tableView=[[UITableView alloc]initWithFrame:frame(0, -50, 750, 1500) style:UITableViewStylePlain];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.scrollEnabled=NO;
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_tableView];
      // Do any additional setup after loading the view.
}
-(void)PersonalInformation{
 
    //打印主线程
         NSLog(@"主线程----%d",[NSThread isMainThread]);
    
        //创建串行队列
         dispatch_queue_t  queue= dispatch_queue_create("wendingding", NULL);
         //第一个参数为串行队列的名称，是c语言的字符串
        //第二个参数为队列的属性，一般来说串行队列不需要赋值任何属性，所以通常传空值（NULL）
         //2.添加任务到队列中执行
    
         dispatch_async(queue, ^{
         [MyRequest MyInformationAndOrderQuantityblock:^(NSDictionary *dics) {
             MyInformationDataBaseClass *class=[[MyInformationDataBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
             self.dataDic=[self deleteEmpty:dics];
             if ([class.code isEqualToString:@"19"]) {
                 
                 [_tableView reloadData];
             }else{
                 [FTIndicator showErrorWithMessage:class.msg];
             }
         }];
        
        });

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    if (section==2){
        return 4;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
autoSize
    if (indexPath.section==0){
        return 0;
    }else{
        return 90*autoSizeScaleY;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    if (section==3) {
        return 0;
    }
    return 20*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    if (section==0) {
        return 548*autoSizeScaleY;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    return view;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        MyInformationView *view=[[MyInformationView alloc]init];
        
        MyInformationDataBaseClass *class=[[MyInformationDataBaseClass alloc]initWithDictionary:self.dataDic];
        
        if ([class.username length]>0) {
            view.name.text=class.username;
        }else{
            view.name.text=Localized(@"登录/注册");
        }
        
        view.levelNumber=class.baseGrade;
        [view.iconBtn addTarget:self action:@selector(onTheLoginClick) forControlEvents:UIControlEventTouchUpInside];
        [view.orderName addTarget:self action:@selector(onOrderClick) forControlEvents:UIControlEventTouchUpInside];
        [view.GoOrderIcon addTarget:self action:@selector(onOrderClick) forControlEvents:UIControlEventTouchUpInside];
        [view.ForThePaymentBtn addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        [view.ForTheGoods addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        [view.ToEvaluate addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        [view.HasBeenCompleted addTarget:self action:@selector(myOrderAll:) forControlEvents:UIControlEventTouchUpInside];
        if (class.payment>0) {//待付款
            view.redOne.text=[NSString stringWithFormat:@"%.0f",class.payment];
            if (class.payment>99) {
                view.redOne.text=@"99";
            }
        }else{
            view.redOne.backgroundColor=[UIColor clearColor];
        }
        if (class.send>0) {//待收货
            view.redTwo.text=[NSString stringWithFormat:@"%.0f",class.send];
            if (class.send>99) {
                view.redTwo.text=@"99";
            }
        }else{
            view.redTwo.backgroundColor=[UIColor clearColor];
        }
        if (class.comment>0) {//待评价
            view.redThree.text=[NSString stringWithFormat:@"%.0f",class.comment];
            if (class.comment>99) {
                view.redThree.text=@"99";
            }
        }else{
        view.redThree.backgroundColor=[UIColor clearColor];
        }
        
        view.redFour.backgroundColor=[UIColor clearColor];
        
        return view;
    }
    
    return nil;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section!=0) {
        MyMessageCells *cell=[MyMessageCells new];
        if (indexPath.section==1) {
            cell.icon.image=[UIImage imageNamed:@"icon_mews"];
            cell.name.text=Localized(@"我的消息");
            cell.witht=WIDTH;
            if (number>0) {
               
                cell.numberString.text=[NSString stringWithFormat:@"%ld",number];
                if (number>99) {
                    cell.numberString.text=@"99";
                }
                cell.numberString.backgroundColor=[TheParentClass colorWithHexString:@"#de0024"];
            }
        }else if (indexPath.section==2){
            if (indexPath.row==0) {
                cell.witht=0;
            cell.icon.image=[UIImage imageNamed:@"icon_information"];
                cell.name.text=Localized(@"基本信息");
            }else if (indexPath.row==1){
                cell.witht=0;
            cell.icon.image=[UIImage imageNamed:@"icon_wallete"];
                cell.name.text=Localized(@"钱包管理");
            }else if (indexPath.row==2){
                cell.witht=0;
            cell.icon.image=[UIImage imageNamed:@"icon_collect"];
                cell.name.text=Localized(@"我的收藏");
            }else if (indexPath.row==3){
                cell.witht=WIDTH;
            cell.icon.image=[UIImage imageNamed:@"icon_address"];
                cell.name.text=Localized(@"地址管理");
                
            }
        }else if (indexPath.section==3){
            cell.icon.image=[UIImage imageNamed:@"icon_setting"];
            cell.name.text=Localized(@"设置");
            cell.witht=WIDTH;
        }
        return cell;
    }
    
    NULLCell *celll=[NULLCell new];
    return celll;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==2&&indexPath.row==3) {
        if ([tokenString length]>0) {
            MyShippingAddress *Address=[[MyShippingAddress alloc]init];
            [self.navigationController pushViewController:Address animated:YES];
        }else{
            [TheParentClass theLogin];
        }

    }else if (indexPath.section==1){//消息
        if ([tokenString length]>0) {
            MyNewsViewController *myNews=[[MyNewsViewController alloc]init];
            [self.navigationController pushViewController:myNews animated:YES];
        }else{
            [TheParentClass theLogin];
        }

  
    
    }else if (indexPath.section==2&&indexPath.row==2){//收藏
    
        if ([tokenString length]>0) {
            MyCollectionViewController *MyCollection=[[MyCollectionViewController alloc]init];
            [self.navigationController pushViewController:MyCollection animated:YES];
        }else{
            [TheParentClass theLogin];
        }

    }else if (indexPath.section==2&&indexPath.row==0){
        //基本信息
        if ([tokenString length]>0) {
            MyBasicInformationViewController *MyBasicInformation=[[MyBasicInformationViewController alloc]init];
            [self.navigationController pushViewController:MyBasicInformation animated:YES];
        }else{
            [TheParentClass theLogin];
        }
       
    }else if (indexPath.section==3){
        SetUpViewController *SetUp=[[SetUpViewController alloc]init];;
        [self.navigationController pushViewController:SetUp animated:YES];
    }else if (indexPath.section==2&&indexPath.row==1){//钱包管理
        if ([tokenString length]>0) {
            OnlineWalletViewController *online=[[OnlineWalletViewController alloc]init];
            [self.navigationController pushViewController:online animated:YES];
        }else{
            [TheParentClass theLogin];
        }

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//查看全部订单
-(void)onOrderClick{
    if ([tokenString length]>0) {
        MyOrderViewController *order=[[MyOrderViewController alloc]init];
        [self.navigationController pushViewController:order animated:YES];
    }else{
        [TheParentClass theLogin];
    }

}
//代付款待收货待评价等等
-(void)myOrderAll:(MyButton *)btn{
    
    
    if ([tokenString length]>0) {
        
        MyOrderViewController *order=[[MyOrderViewController alloc]init];
        
        switch (btn.tag) {
            case 100:
            {
                
                order.OrderType=@"nopay";
            }
                break;
            case 101:
            {
                order.OrderType=@"noreceiving";
            }
                break;
            case 102:
            {
                order.OrderType=@"iscomment";
            }
                break;
            case 103:
            {
                order.OrderType=@"iscomment";
            }
                break;
                
            default:
                break;
        }
        [self.navigationController pushViewController:order animated:YES];

    }else{
        [TheParentClass theLogin];
    }
    
}
//点击头像
-(void)onTheLoginClick{
    [TheParentClass theLogin];
}
-(void)messageNumber{
    autoSize
    
    if ([tokenString length]>0) {
        [DataAccessPageRequest GetNumbeOfUnreadMessagesBlock:^(NSDictionary *dics) {
            MessageNumberBaseClass *class=[[MessageNumberBaseClass alloc]initWithDictionary:[self deleteEmpty:dics]];
            if ([class.code isEqualToString:@"51"]) {
                if (class.data>0) {
                    number=class.data;
                    FormToUpdate(1, _tableView)
                }
            }
        }];
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:YES];
     self.navigationController.navigationBarHidden=YES;
    number=0;
    if ([tokenString length]>1) {
          [self PersonalInformation];//获取个人信息
        [self messageNumber];//获取未读消息
    }else{
        NSDictionary *dic;
        self.dataDic=[self deleteEmpty:dic];
        [_tableView reloadData];
    }


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
