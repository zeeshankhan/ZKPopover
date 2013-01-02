//
//  ZKPopoverVC.m
//  ZKPopover
//
//  Created by Zeeshan on 06/12/12.
//  Copyright (c) 2012 Diaspark Infotech. All rights reserved.
//

#import "ZKPopoverVC.h"
#import <QuartzCore/QuartzCore.h>

@interface ZKPopoverVC ()
@end

@implementation ZKPopoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[[self view] layer] setCornerRadius:5];
   
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closePopover)] autorelease];
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewVC)] autorelease];

    self.title = @"Popover View Controller";
    
    CGSize frameSize = _popoverSV.frame.size;
    [_popoverSV setContentSize:CGSizeMake(frameSize.width, frameSize.height*2)];
}

- (void)closePopover {
    [_delegate popoverDidClose];
}

- (void)addNewVC {
    UIViewController *cont = [[[UIViewController alloc] init] autorelease];
    [self.navigationController pushViewController:cont animated:YES];   
}

- (IBAction)scrollPopoverSV {
//    [_popoverSV scrollsToTop];
    [_popoverSV scrollRectToVisible:_txtName.frame animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"Asked whether the scroll view should scroll to top.");
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)dealloc {
    [_txtName release];
    [_popoverSV release];
    [_txtCompany release];
    [_txtAddress release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTxtName:nil];
    [self setPopoverSV:nil];
    [self setTxtCompany:nil];
    [self setTxtAddress:nil];
    [super viewDidUnload];
}
@end
