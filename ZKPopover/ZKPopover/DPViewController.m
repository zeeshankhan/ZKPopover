//
//  DPViewController.m
//  ZKPopover
//
//  Created by Zeeshan on 06/12/12.
//  Copyright (c) 2012 Diaspark Infotech. All rights reserved.
//

#import "DPViewController.h"
#import "ZKPopoverVC.h"
#import <QuartzCore/QuartzCore.h>

@interface DPViewController ()
@property (nonatomic, retain) ZKPopoverVC *vcObj;
@end

@implementation DPViewController

- (void)popoverDidClose {
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{

        // Animate fading
        _fadeView.alpha = 0;
        
        // Animate popover
        CGRect  frame = _popOverView.frame;
        frame.origin.y = 1004.0f;
        [_popOverView setFrame:frame];
        
    } completion:^(BOOL finished) {
        // Remove fade view
        [self.view sendSubviewToBack:_fadeView];
    }];   
}

- (IBAction)presentPopover {

    // First bring fade view
    [self.view bringSubviewToFront:_fadeView];

    // Then Bring Popover to front
    [self.view bringSubviewToFront:_popOverView];

    [UIView animateWithDuration:0.5 animations:^{
        
        // Animate fading
        _fadeView.alpha = 0.5;
        
        // Animate popover view
        CGRect  frame = _popOverView.frame;
        frame.origin.y = 50.0f;
        [_popOverView setFrame:frame];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[_popOverView layer] setCornerRadius:5];

}

//- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
//    NSLog(@"Asked whether the scroll view should scroll to top.");
//    return NO;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)dealloc {
    [_fadeView release];
    [_popOverView release];
    [_vcObj release];
    [super dealloc];
}

- (ZKPopoverVC*)vcObj {
    if (!_vcObj) {
        _vcObj = [[ZKPopoverVC alloc] initWithNibName:@"ZKPopoverVC" bundle:[NSBundle mainBundle]];
        _vcObj.delegate = self;
        [[[_vcObj view] layer] setCornerRadius:5];

    }
    return _vcObj;
}

#pragma mark - ViewController lifecycle


- (void) viewWillAppear:(BOOL)animated
{
    if (_popOverNavigationController) {
        [_popOverNavigationController release];
    }
    _popOverNavigationController = [[UINavigationController alloc] initWithRootViewController:[self vcObj]];
    _popOverNavigationController.delegate = self;
//    _popOverNavigationController.navigationBarHidden = YES;
    
    [[[_popOverNavigationController navigationBar] layer] setCornerRadius:5];
    _popOverNavigationController.view.frame = _popOverView.bounds;
    [self vcObj].view.frame = _popOverNavigationController.view.bounds;
    
    [_popOverView addSubview:_popOverNavigationController.view];
    [[[_popOverNavigationController view] layer] setCornerRadius:5];
    
	[_popOverNavigationController viewWillAppear:animated];
	[super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated
{
	[_popOverNavigationController viewDidAppear:animated];
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[_popOverNavigationController viewWillDisappear:animated];
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[_popOverNavigationController viewDidDisappear:animated];
	[super viewDidDisappear:animated];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[_popOverNavigationController willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	[_popOverNavigationController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[_popOverNavigationController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
	[_popOverNavigationController willAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [super willAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

- (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	[_popOverNavigationController didAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation];
    [super didAnimateFirstHalfOfRotationToInterfaceOrientation:toInterfaceOrientation];
}

- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration
{
	[_popOverNavigationController willAnimateSecondHalfOfRotationFromInterfaceOrientation:fromInterfaceOrientation duration:duration];
    [super willAnimateSecondHalfOfRotationFromInterfaceOrientation:fromInterfaceOrientation duration:duration];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewWillAppear:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [viewController viewDidAppear:animated];
}


@end
