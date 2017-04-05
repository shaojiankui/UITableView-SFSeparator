//
//  AppDelegate.h
//  UITableView-SFSeparator
//
//  Created by Jakey on 2017/4/4.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;
@property (strong, nonatomic) UINavigationController *navgationController;
+(AppDelegate*)APP;
@end
