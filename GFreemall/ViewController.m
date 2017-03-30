//
//  ViewController.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "ViewController.h"

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
    
    
    [self dataCrollers];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TheLanguageWwitchBox) name:@"TheLanguageWwitchBox" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)dataCrollers{
    self.ParentClass=[[TheParentClass alloc]init];
    
    HomeViewController *home=[[HomeViewController alloc]init];
    UINavigationController *homeNav=[[UINavigationController alloc]initWithRootViewController:home];
    
    ClassificationViewController *class=[[ClassificationViewController alloc]init];
    UINavigationController *classNav=[[UINavigationController alloc]initWithRootViewController:class];
    
    GFMViewController *GFM=[[GFMViewController alloc]init];
    UINavigationController *GFMNav=[[UINavigationController alloc]initWithRootViewController:GFM];
    
    ShoppingCartViewController *shoping=[[ShoppingCartViewController alloc]init];
    UINavigationController *shopingNav=[[UINavigationController alloc]initWithRootViewController:shoping];
    
    MyViewController *my=[[MyViewController alloc]init];
    UINavigationController *myNav=[[UINavigationController alloc]initWithRootViewController:my];
    
    
    self.array=@[homeNav,classNav,GFMNav,shopingNav,myNav];
    self.index=0;
    [self createButton];

}
colorWithStr
//创建底部按钮
-(void)createButton{
    NSArray *nameArray=@[@"Home",@"classification",@"GFM",@"shoppingCart",@"My"];
    autoSize
    _bgrangdView=[[UIView alloc]init];
    _bgrangdView.backgroundColor=[self colorWithHexString:@"#f3f5f7"];
    [self.view addSubview:_bgrangdView];
    _bgrangdView.sd_layout.leftSpaceToView(self.view, 0).widthIs(self.view.frame.size.width).heightIs(98*autoSizeScaleY).bottomSpaceToView(self.view, 0);
    //线
    UILabel *line=[[UILabel alloc]init];
    line.backgroundColor=[TheParentClass colorWithHexString:@"#b2b2b2"];
    [_bgrangdView addSubview:line];
    line.sd_layout.leftSpaceToView(_bgrangdView, 0).topSpaceToView(_bgrangdView, 0).rightSpaceToView(_bgrangdView, 0).heightIs(0.6);
    _imgsArray=@[@"icon_home",@"icon_classify",@"icon_gfm",@"icon_cart",@"icon_mine"];
    _selsctedBtnImages=@[@"icon_home_s",@"icon_classify_s",@"icon_gfm_s",@"icon_cart_s",@"icon_mine_s"];
    for (int i=0; i<5; i++) {
        float x=52+(48+102)*(i%5);
        //图标
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:_imgsArray[i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:_selsctedBtnImages[i]] forState:UIControlStateSelected];
        if (i==0) {
            btn.selected=YES;
        }else{
            btn.selected=NO;
        }
        btn.tag=i+1;
        [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bgrangdView addSubview:btn];
        btn.sd_layout.topSpaceToView(_bgrangdView, 15*autoSizeScaleY).leftSpaceToView(_bgrangdView, x*autoSizeScaleX).widthIs(48*autoSizeScaleX).heightIs(42*autoSizeScaleY);
        //底部按钮名称
        UILabel *lbl=[[UILabel alloc]init];
        lbl.text=Localized(nameArray[i]);
        lbl.textAlignment=NSTextAlignmentCenter;
        lbl.textColor=[TheParentClass colorWithHexString:@"#292929"];
        lbl.font=[UIFont systemFontOfSize:20*autoSizeScaleX];
        [_bgrangdView addSubview:lbl];
        float with=self.view.frame.size.width/5;
        float xxx=2+(148+2)*(i%5);
        lbl.sd_layout.leftSpaceToView(_bgrangdView, xxx*autoSizeScaleX).topSpaceToView(btn, 12*autoSizeScaleX).widthIs(148*autoSizeScaleX).bottomSpaceToView(_bgrangdView, 2);
        //最上面的btn
        UIButton *buton=[UIButton buttonWithType:UIButtonTypeCustom];
        [buton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        buton.frame=CGRectMake(with*i, 0, with, _bgrangdView.size.height);
        buton.tag=i+10;
        [_bgrangdView addSubview:buton];
        
        
    }
}
//点击底部按钮触发方法
-(void)onButtonClick:(UIButton *)btn{
    if (btn.tag==_index+10) {
        return;
    }else{
        self.index=btn.tag-10;
        for (int i=1; i<6; i++) {
            UIButton *button=(UIButton *)[_bgrangdView viewWithTag:i];
            button.selected=NO;
        }
        UIButton *selectdBtn=(UIButton *)[_bgrangdView viewWithTag:btn.tag-9];
        selectdBtn.selected=YES;
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
        _index=-10;
        
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
