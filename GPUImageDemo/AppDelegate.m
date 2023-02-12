//
//  AppDelegate.m
//  GPUImageDemo
//
//  Created by 李琢琢 on 2023/2/12.
//

#import "AppDelegate.h"
#import "UIViewController+RuntimeReplace.h"

#import "GIDDemoListViewController.h"

@interface AppDelegate ()

@property(nonatomic, strong) UIWindow *cWindow;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
#ifdef DEBUG
    
    [UIViewController debug_runtime_replace];
    
#endif
    if (@available(iOS 13.0, *)) {
    } else {
        self.cWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
        GIDDemoListViewController *viewController = [GIDDemoListViewController new];
        UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
        
        self.cWindow.rootViewController = naviController;
        self.cWindow.backgroundColor = [UIColor whiteColor];
        [self.cWindow makeKeyAndVisible];
    }

    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
