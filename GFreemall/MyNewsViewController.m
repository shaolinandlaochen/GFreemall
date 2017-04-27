//
//  MyNewsViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/4/6.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "MyNewsViewController.h"
#import "MyNewsCell.h"
#import "MessageForDetailsViewController.h"
#import "MessageRequest.h"
@interface MyNewsViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *_tableView;
}

@end

@implementation MyNewsViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TheParentClass ButtonAtTheBottomOfThesize:NO];
    self.navigationController.navigationBarHidden=NO;
    TheDrop_downRefresh(_tableView, @selector(AccessToThMessageListClick))
}
- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    self.title=Localized(@"我的消息");
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:34*autoSizeScaleY],NSForegroundColorAttributeName:[TheParentClass colorWithHexString:@"#eeeeee"]}];
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];
    self.view.backgroundColor=[TheParentClass colorWithHexString:@"#f3f5f7"];
    leftCancel
    [self CreatView];
    //构建没有消息视图
   // [self BuildNoMessageView];
    // Do any additional setup after loading the view.
}
-(void)AccessToThMessageListClick{
    //[SVProgressHUD showWithStatus:@"正在加载"];
    [MessageRequest AccessToTheMessageListBlock:^(NSDictionary *dics) {
        self.dataDic=[self deleteEmpty:dics];
        MessageBaseClass *class=[[MessageBaseClass alloc]initWithDictionary:self.dataDic];
        if ([class.code isEqualToString:@"51"]) {
            [_tableView reloadData];
            if (class.data.resultList.count<1) {
                 [self BuildNoMessageView];
            }
        }else{
            [FTIndicator showErrorWithMessage:class.msg];
        }
        [SVProgressHUD dismiss];
        [_tableView.mj_header endRefreshing];
        
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

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    autoSize
    return 156*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    autoSize
    return 0*autoSizeScaleY;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MessageBaseClass *class=[[MessageBaseClass alloc]initWithDictionary:self.dataDic];
    return class.data.resultList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MyNewsCell *cell=[MyNewsCell new];
    
    MessageBaseClass *class=[[MessageBaseClass alloc]initWithDictionary:self.dataDic];
    MessageResultList *list=class.data.resultList[indexPath.row];
    if (list.messageCategory==1) {
        cell.img.image=[UIImage imageNamed:@"icon_order"];
    }else{
        cell.img.image=[UIImage imageNamed:@"icon_system"];
    }
    if (list.readState==0) {
        cell.unreadStr=@"未读";
    }
    
    cell.title.text=list.messageTitle;;
    cell.context.text=list.messageText;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MessageBaseClass *class=[[MessageBaseClass alloc]initWithDictionary:self.dataDic];
    MessageResultList *list=class.data.resultList[indexPath.row];
    MessageForDetailsViewController *MessageForDetails=[[MessageForDetailsViewController alloc]init];
    MessageForDetails.message_id=list.resultListIdentifier;
    MessageForDetails.titleStr=list.messageTitle;;
    MessageForDetails.context=list.messageText;
    [self.navigationController pushViewController:MessageForDetails animated:YES];
    
}
//没有消息
-(void)BuildNoMessageView{
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"无消息"];
    [self.view addSubview:img];
    img.sd_layout.leftSpaceToView(self.view, 195*autoSizeScaleX).rightSpaceToView(self.view, 195*autoSizeScaleX).topSpaceToView(self.view, 300*autoSizeScaleY).heightIs(141*autoSizeScaleY);
    UILabel *lbl=[[UILabel alloc]init];
    lbl.text=Localized(@"您还没有相关消息哦");
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
