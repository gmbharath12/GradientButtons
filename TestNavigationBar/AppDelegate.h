//
//  AppDelegate.h
//  TestNavigationBar
//
//  Created by Bharath G M on 11/13/12.
//  Copyright (c) 2012 Bharath G M. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong,nonatomic) UINavigationController *navController;


@end
