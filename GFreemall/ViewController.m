//
//  ViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ViewController.h"
#import "babbarButton.h"
@interface ViewController ()
{
    NSArray *_imgsArray;//底部按钮未选中状态下背景图片名称
    NSArray *_selsctedBtnImages;//底部按钮选中状态下背景图片名称
    UIView *_bgrangdView;//地下按钮背景
}
@end

@implementation ViewController
-(UIStatusBarStyle)preferredStatusBarStyle
{
    //设置状态栏字体颜色
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[NSUserDefaults standardUserDefaults]valueForKey:@"token"]==nil) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"" forKey:@"token"];
        //同步数据
        [defaults synchronize];
        [self ForTheFirstTime];
    }else{
     [self dataCrollers];//已经不是第一次进来了
    }
    
    
   
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TheLanguageWwitchBox) name:@"TheLanguageWwitchBox" object:nil];//切换语言
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(big) name:@"big" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(small) name:@"small" object:nil];
   //监听登录通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TheLongin) name:@"MonitorTheLoginNotifications" object:nil];
    //在登录界面点击切换语言需求
     [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(ToWwitchBetweenLanguagesClick) name:@"InTheLoginScreenClickSwitchLanguageNeeds" object:nil];
    
  
    
   
    // Do any additional setup after loading the view, typically from a nib.
}
//首次进入
-(void)ForTheFirstTime{
    autoSize
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"initial_page"];
    img.frame=self.view.frame;
    img.tag=7625;
    img.userInteractionEnabled = YES;
    [self.view addSubview:img];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(DeleteCreateViews) forControlEvents:UIControlEventTouchUpInside];
    [img addSubview:btn];
    btn.sd_layout.bottomSpaceToView(img, 200*autoSizeScaleY).rightSpaceToView(img, 100*autoSizeScaleX).leftSpaceToView(img, 100*autoSizeScaleX).heightIs(100*autoSizeScaleY);
   
}
-(void)DeleteCreateViews{
    [UIView animateWithDuration:0.3 animations:^{
        ((UIImageView *)[self.view viewWithTag:7625]).alpha=0;
    }];
    [self performSelector:@selector(delayMethodClick) withObject:nil/*可传任意类型参数*/ afterDelay:0.3];

}
-(void)delayMethodClick{
    [[self.view viewWithTag:7625]removeFromSuperview];
    [self dataCrollers];
    
}
-(void)dataCrollers{

    self.ParentClass=[[TheParentClass alloc]init];
    
    HomeViewController *home=[[HomeViewController alloc]init];
    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:home];
    
    ClassificationViewController *class=[[ClassificationViewController alloc]init];
    UINavigationController *classNav=[[UINavigationController alloc]initWithRootViewController:class];
    
    //GFMViewController *GFM=[[GFMViewController alloc]init];
   // UINavigationController *GFMNav=[[UINavigationController alloc]initWithRootViewController:GFM];
    
    ShoppingCartViewController *shoping=[[ShoppingCartViewController alloc]init];
    UINavigationController *shopingNav=[[UINavigationController alloc]initWithRootViewController:shoping];
    
    MyViewController *my=[[MyViewController alloc]init];
    UINavigationController *myNav=[[UINavigationController alloc]initWithRootViewController:my];
    
    
    self.array=@[homeNav,classNav,shopingNav,myNav];
    self.index=0;
    [self createButton];

}
colorWithStr
//创建底部按钮
-(void)createButton{
    NSArray *nameArray=@[@"Home",@"classification",@"shoppingCart",@"My"];
    autoSize
    _bgrangdView=[[UIView alloc]init];
    _bgrangdView.tag=1994;
    _bgrangdView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_bgrangdView];
    float height=98*autoSizeScaleY;
    _bgrangdView.frame=CGRectMake(0, self.view.frame.size.height-height, self.view.frame.size.width, height);
    //线
    UILabel *line=[[UILabel alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
    [_bgrangdView addSubview:line];
    line.sd_layout.leftSpaceToView(_bgrangdView, 0).topSpaceToView(_bgrangdView, 0).rightSpaceToView(_bgrangdView, 0).heightIs(0.6);
    _imgsArray=@[@"icon_home",@"icon_classify",@"icon_cart",@"icon_mine"];
    _selsctedBtnImages=@[@"icon_home_s",@"icon_classify_s",@"icon_cart_s",@"icon_mine_s"];
    for (int i=0; i<4; i++) {
        float x=self.view.frame.size.width/4;
        //图标
        babbarButton *btn=[babbarButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:_imgsArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:_selsctedBtnImages[i]] forState:UIControlStateSelected];
        [btn setTitle:Localized(nameArray[i]) forState:UIControlStateNormal];
        [btn setTitleColor:[TheParentClass colorWithHexString:@"#292929"] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:20*autoSizeScaleY];
        if (i==_index) {
            btn.selected=YES;
        }else{
            btn.selected=NO;
        }
        btn.tag=i+1;
        btn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgrangdView addSubview:btn];
        btn.sd_layout.topSpaceToView(_bgrangdView, 1).leftSpaceToView(_bgrangdView, x*i).widthIs(x).heightIs(96*autoSizeScaleY);
        
    }
}
//点击底部按钮触发方法
-(void)onButtonClick:(babbarButton *)btn{
    if (btn.tag==_index+1) {
        return;
    }else{
        self.index=btn.tag-1;
        for (int i=1; i<5; i++) {
            babbarButton *button=(babbarButton *)[_bgrangdView viewWithTag:i];
            button.selected=NO;
            if (i==btn.tag) {
                  button.selected=YES;
            }
        }
      
    }
}
//set方法
-(void)setIndex:(NSInteger)index{
    if (_index==index) {
       // return;
    }
    if (_index>=0) {
        UIViewController *contrlooer=[self.array objectAtIndex:_index];
        [contrlooer.view removeFromSuperview];
    }
    UIViewController *viewcontroller=[self.array objectAtIndex:index];
    [self.view addSubview:viewcontroller.view];
    [self.view sendSubviewToBack:viewcontroller.view];
    _index=index;
}
//重写父类方法
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _index=-1;
        
    }
    return self;
    
}

-(void)TheLanguageWwitchBox{
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
            //切换语言
            [self ToWwitchBetweenLanguagesClick];
        }
    }];
    [aler addAction:languageOne];
    UIAlertAction *languageTwo=[UIAlertAction actionWithTitle:@"繁體中文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![language isEqualToString:@"zh-Hant"]) {//目前不是繁体中文需要切换
            //繁体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
            //切换语言
            [self ToWwitchBetweenLanguagesClick];
        }
        
    }];
    [aler addAction:languageTwo];
    UIAlertAction *languageThree=[UIAlertAction actionWithTitle:@"English" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![language isEqualToString:@"en"]) {//目前不是英文需要切换
            //英文
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            //切换语言
            [self ToWwitchBetweenLanguagesClick];
        }
        
    }];
    [aler addAction:languageThree];
    //最后一步
    [self presentViewController:aler animated:YES completion:nil];
}
-(void)ToWwitchBetweenLanguagesClick{
    //接收通知切换语言
    [SVProgressHUD showWithStatus:Localized(@"loading")];
    
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];//删除所有子视图,
    [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.0];
    
}
-(void)delayMethod{
[self dataCrollers];//重新创建
    
}
-(void)big{
    [[self.view viewWithTag:1994]removeFromSuperview];
    [self createButton];
}
-(void)small{
    [[self.view viewWithTag:1994]removeFromSuperview];
}
//颜色值
+(UIColor *)colorWithHexString:(NSString *)color{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
-(void)TheLongin{

    TheLoginViewController *login=[[TheLoginViewController alloc]init];
    UINavigationController *navLoGin=[[UINavigationController alloc]initWithRootViewController:login];
    [self presentViewController:navLoGin animated:YES completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
