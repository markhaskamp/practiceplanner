//
//  pplViewController.m
//  Practice Planner
//
//  Created by Mark Haskamp on 11/23/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "pplViewController.h"

@interface pplViewController ()

@end

@implementation pplViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIColor *clr = nil;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        clr = [UIColor colorWithRed:0.26 green:0.13 blue:0.0 alpha:1];
    }
    else {
        clr = [UIColor groupTableViewBackgroundColor];
    }
    [[self view]setBackgroundColor:clr];
}

-(void)viewDidAppear:(BOOL)animated
{
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    [self setViewWidths:orientation];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                               duration:(NSTimeInterval)duration
{
    NSLog(@"willRotateToInterfaceOrientation");
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    UIInterfaceOrientation orientation = UIInterfaceOrientationPortrait;
    if ([self orientationIsPortrait:fromInterfaceOrientation]) {
        orientation = UIInterfaceOrientationLandscapeLeft;
    }
    [self setViewWidths:orientation];
}

-(void)setViewWidths:(UIInterfaceOrientation)orientation
{
    UIViewController *vc0 =(UIViewController *)self.childViewControllers[0];
    UIView *practiceListView = vc0.view;
    
    UIViewController *vc1 =(UIViewController *)self.childViewControllers[1];
    UIView *drillListView = vc1.view;
    
    float width = 0.0;
    float height = 0.0;
    if ([self orientationIsPortrait:orientation]) {
        width = [UIScreen mainScreen].bounds.size.width;
        height = [UIScreen mainScreen].bounds.size.height;
    }
    else {
        width = [UIScreen mainScreen].bounds.size.height;
        height = [UIScreen mainScreen].bounds.size.width;
    }
    
    float newPracticeWidth = (width * 0.58);
    
    float leftGap = 20.0;
    float rightGap = 10.0;
    float middleGap = 5.0;
    float bottomGap = 10.0;
    float practiceListYOffset = 225.0;
    float drillListYOffset = 225.0;
    
    float newDrillWidth = width -  (leftGap + newPracticeWidth + middleGap + rightGap);
    [practiceListView superview].frame = CGRectMake(leftGap, practiceListYOffset, newPracticeWidth, height - practiceListYOffset - bottomGap);
    
    [drillListView superview].frame = CGRectMake(leftGap + newPracticeWidth + middleGap, drillListYOffset, newDrillWidth, height - drillListYOffset - bottomGap);
    
}

-(bool)orientationIsPortrait:(UIInterfaceOrientation)orientation
{
    bool isOrientation = (orientation == UIInterfaceOrientationPortrait ||
                          orientation == UIInterfaceOrientationPortraitUpsideDown);
    return isOrientation;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)orientationChanged
{
    
}

@end
