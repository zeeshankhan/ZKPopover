//
//  DPViewController.h
//  ZKPopover
//
//  Created by Zeeshan on 06/12/12.
//  Copyright (c) 2012 Diaspark Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopoverDelegate <NSObject>
- (void)popoverDidClose;
@end

@interface DPViewController : UIViewController <UINavigationControllerDelegate,PopoverDelegate>
@property (retain, nonatomic) IBOutlet UIView *popOverView;
@property (nonatomic, retain) IBOutlet UINavigationController*   popOverNavigationController;
@property (nonatomic, retain) IBOutlet UIView *fadeView;
@end
