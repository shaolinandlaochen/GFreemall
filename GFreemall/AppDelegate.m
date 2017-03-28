//
//  AppDelegate.m
//  GFreemall
//
//  Created by 韩少林 on 2017/3/27.
//  Copyright © 2017年 MrHan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.backgroundColor=[TheParentClass colorWithHexString:@"#f2f3f7"];
  
    if (![[NSUserDefaults standardUserDefaults]objectForKey:@"appLanguage"]) {
        
        NSArray *languages = [NSLocale preferredLanguages];
        
        NSString *language = [languages objectAtIndex:0];
        NSLog(@"语言-----%@",language);
        
        if ([language rangeOfString:@"zh-Hans"].location !=NSNotFound) {//开头匹配
            //简体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:@"appLanguage"];
            
        }else if ([language rangeOfString:@"zh-Hant"].location !=NSNotFound) {//开头匹配
            //繁体中文
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hant" forKey:@"appLanguage"];
            
        }else{
            // if([language rangeOfString:@"en"].location !=NSNotFound)
            //英文
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:@"appLanguage"];
            
        }
        
    }

    // Override point for customization   dsfeffsff66666 after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
