//
//  DPAppDelegate.h
//  ZKPopover
//
//  Created by Zeeshan on 06/12/12.
//  Copyright (c) 2012 Diaspark Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPViewController;
@class DPModelVC;
@interface DPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) DPViewController *viewController;
@property (strong, nonatomic) DPModelVC *viewController;

@end
