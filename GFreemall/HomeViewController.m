//
//  HomeViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//
#define AppLanguage @"appLanguage"


#import "HomeViewController.h"
#import "HomeCell.h"
#import "NULLCell.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
{
    UIButton *BarButtonOne;//导航条按钮1
    UIButton *BarButtonTwo;//导航条按钮2
    UITableView *_tableView;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    autoSize
    [self SetTheNavigationBar];//设置导航条
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];

    [SVProgressHUD dismiss];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else if (section>2){
        return 5;
    }
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
autoSize

    return 94*autoSizeScaleY;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0&&indexPath.row==0) {
        HomeCell *cell=[HomeCell new];
        return cell;
    }
    NULLCell *cell=[NULLCell new];
    

    return cell;
}
-(void)SetTheNavigationBar{
    autoSize
    

    
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithTitle:Localized(@"language") style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButtonClick)];
    self.navigationItem.leftBarButtonItem=leftItem;
    [self.navigationItem.leftBarButtonItem setTintColor:[TheParentClass colorWithHexString:@"#ffffff"]];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:30*autoSizeScaleX],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    //logo
    UIImageView *img=[[UIImageView alloc]initWithFrame:frame(0, 0, 150, 60)];
    img.image=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView = img;
    //右按钮项
    UIView *view=[[UIView alloc]initWithFrame:frame(0, 0, 200, 80)];
    view.backgroundColor=[UIColor clearColor];
    
    BarButtonOne=[UIButton buttonWithType:UIButtonTypeCustom];
    [BarButtonOne setBackgroundImage:[UIImage imageNamed:@"icon_news"] forState:UIControlStateNormal];
    BarButtonOne.frame=frame(50, 20, 50, 50);
    BarButtonOne.tag=1;
    [BarButtonOne addTarget:self action:@selector(onBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:BarButtonOne];
    
    BarButtonTwo=[UIButton buttonWithType:UIButtonTypeCustom];
    [BarButtonTwo setBackgroundImage:[UIImage imageNamed:@"icon_news"] forState:UIControlStateNormal];
    BarButtonTwo.frame=frame(150, 20, 50, 50);
    BarButtonTwo.tag=2;
    [BarButtonTwo addTarget:self action:@selector(onBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:BarButtonTwo];
    
    //右按钮
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.rightBarButtonItem=item;
    
    [self.navigationController.navigationBar setBarTintColor:[TheParentClass colorWithHexString:@"#292929"]];

}
//点击导航条左按钮执行该方法(选择语言)
-(void)onLeftButtonClick{
    NSString *language=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"appLanguage"]];
    
    UIAlertController *aler=[UIAlertController alertControllerWithTitle:Localized(@"prompt") message:Localized(@"choose") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action=[UIAlertAction actionWithTitle:Localized(@"cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [aler addAction:action];
    //2.
    UIAlertAction *languageOne=[UIAlertAction actionWithTitle:@"简体中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        if (![language isEqualToString:@"zh-Hans"]) {//目前不是简体中文需要切换
            //简体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
            //发通知切换语言
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ToWwitchBetweenLanguages" object:nil];
        }
    }];
    [aler addAction:languageOne];
    UIAlertAction *languageTwo=[UIAlertAction actionWithTitle:@"繁體中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![language isEqualToString:@"zh-Hant"]) {//目前不是繁体中文需要切换
            //繁体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
            //发通知切换语言
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ToWwitchBetweenLanguages" object:nil];
        }
        
    }];
    [aler addAction:languageTwo];
    UIAlertAction *languageThree=[UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![language isEqualToString:@"en"]) {//目前不是英文需要切换
            //英文
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            //发通知切换语言
            [[NSNotificationCenter defaultCenter]postNotificationName:@"ToWwitchBetweenLanguages" object:nil];
        }
        
    }];
    [aler addAction:languageThree];
    //最后一步
    [self presentViewController:aler animated:YES completion:nil];
    
    
    
}
//点击右边导航条按钮执行该方法
-(void)onBarButtonClick:(UIButton *)btn{
    if (btn.tag==1) {
        
    }else if (btn.tag==2){
    
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
