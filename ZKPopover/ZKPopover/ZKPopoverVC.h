//
//  ZKPopoverVC.h
//  ZKPopover
//
//  Created by Zeeshan on 06/12/12.
//  Copyright (c) 2012 Diaspark Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPViewController.h"

@interface ZKPopoverVC : UIViewController <UIScrollViewDelegate, UITextFieldDelegate>
@property (nonatomic, assign) id <PopoverDelegate> delegate;
@property (retain, nonatomic) IBOutlet UIScrollView *popoverSV;
@property (retain, nonatomic) IBOutlet UITextField *txtName;
@property (retain, nonatomic) IBOutlet UITextField *txtCompany;
@property (retain, nonatomic) IBOutlet UITextField *txtAddress;
@end
