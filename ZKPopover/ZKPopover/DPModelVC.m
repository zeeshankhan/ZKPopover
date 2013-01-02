//
//  DPModelVC.m
//  ZKPopover
//
//  Created by Zeeshan on 07/12/12.
//  Copyright (c) 2012 Diaspark Infotech. All rights reserved.
//

#import "DPModelVC.h"
#import "DPViewController.h"

@interface DPModelVC ()
@end

@implementation DPModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
//    NSLog(@"Asked whether the scroll view should scroll to top.");
//    return NO;
//}


- (IBAction)presentModel {
    DPViewController *obj = [[DPViewController alloc] initWithNibName:@"DPViewController" bundle:nil];
    [self presentModalViewController:obj animated:YES];
}

@end
