//
//  ViewController.m
//  TestNavigationBar
//
//  Created by Bharath G M on 11/13/12.
//  Copyright (c) 2012 Bharath G M. All rights reserved.
//
#import "GradientButton.h"
#import "ViewController.h"
#import "NextViewController.h"

#define NAVBAR_TITLE @"iOS Gradient Buttons";
#define FIND_STORE_BUTTON_TAG  0
#define DIRECTIONS_TAG 1
#define MAP_LOCATION_TAG 2
#define DIRECTION_TITLE @"Get Directions"
#define MAP_TITLE @"Map Location"

@interface ViewController ()
{
}
- (void) changeButtonFrameTo:(CGRect) rect  forGradientButton:(GradientButton *)gradientButton;
- (IBAction)changeColorOnTapforButton:(id) sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initButton];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.57 green:0.06 blue:0.14 alpha:1];
    self.navigationItem.title = NAVBAR_TITLE
    self.navigationController.navigationBar.hidden = NO;
    UIBarButtonItem *myBarButtonItem = [[UIBarButtonItem alloc] init];
    myBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = myBarButtonItem;
    
    m_cLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 210, 100, 24)];
    [m_cLabel setTextColor:[UIColor purpleColor]];
    [m_cLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [m_cLabel setHidden:YES];
    [self.view addSubview:m_cLabel];
}
-(void)viewWillAppear:(BOOL)animated
{
    m_cLabel.hidden = YES;
    //Resizing buttons if orientation changed on sub view and pop the subview 
    if ((self.interfaceOrientation == UIInterfaceOrientationLandscapeRight) || (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft))
    {
        [self changeButtonFrameTo:CGRectMake(10, 80, [[UIScreen mainScreen] bounds].size.height - 20, 44) forGradientButton:button];
        [self changeButtonFrameTo:CGRectMake(10, 140,  ([[UIScreen mainScreen] bounds].size.height/2) - 20, 44) forGradientButton:getDirections];
        [self changeButtonFrameTo:CGRectMake([[UIScreen mainScreen] bounds].size.height/2, 140, ([[UIScreen mainScreen] bounds].size.height/2) - 20, 44) forGradientButton:mapLocation];
    }
    else
    {
        [self changeButtonFrameTo:CGRectMake(10, 80, [[UIScreen mainScreen] bounds].size.width - 20, 44) forGradientButton:button];
        [self changeButtonFrameTo:CGRectMake(10, 140,  ([[UIScreen mainScreen] bounds].size.width/2) - 20, 44) forGradientButton:getDirections];
        [self changeButtonFrameTo:CGRectMake([[UIScreen mainScreen] bounds].size.width/2, 140, ([[UIScreen mainScreen] bounds].size.width/2) - 20, 44) forGradientButton:mapLocation];
    }
}

-(void)initButton
{
        void (^findStore)(void) =
    ^{
            button = [[GradientButton alloc] initWithFrame:CGRectMake(10, 80, 300, 44)];
            [button set_MidGradientColor:[UIColor customisedGradientMid]];
            [button set_MidAboveGradientColor:[UIColor customisedGradientAboveMid]];
            [button set_TopGradientColor:[UIColor customisedGradientTop]];
            [button set_BottomGradientColor:[UIColor customisedGradientBottom]];
            [button setTitle:@"Find a Store" forState:UIControlStateNormal];
            [button setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.shadowOffset = CGSizeMake(1, 1);
            [button setTitleColor:[UIColor walgreensRedColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
            [button setTag:FIND_STORE_BUTTON_TAG];
            [button addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
            [button setHighlighted:YES];
            [self.view addSubview:button];
    };
    findStore(); //usage of blocks
    
    getDirections = [[GradientButton alloc] initWithFrame:CGRectMake(10, 140, 140, 44)];
    [getDirections set_MidGradientColor:[UIColor customisedGradientMid]];
    [getDirections set_MidAboveGradientColor:[UIColor customisedGradientAboveMid]];
    [getDirections set_TopGradientColor:[UIColor customisedGradientTop]];
    [getDirections set_BottomGradientColor:[UIColor customisedGradientBottom]];
    [getDirections setTitle:@"Get Directions" forState:UIControlStateNormal];
    [getDirections setTitleColor:[UIColor walgreensRedColor] forState:UIControlStateNormal];
    [getDirections setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getDirections.titleLabel.shadowOffset = CGSizeMake(1, 1);
    getDirections.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [getDirections setTag:DIRECTIONS_TAG];
    [getDirections addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getDirections];
    

    mapLocation = [[GradientButton alloc] initWithFrame:CGRectMake(160, 140, 140, 44)];
    [mapLocation set_MidGradientColor:[UIColor customisedGradientMid]];
    [mapLocation set_MidAboveGradientColor:[UIColor customisedGradientAboveMid]];
    [mapLocation set_TopGradientColor:[UIColor customisedGradientTop]];
    [mapLocation set_BottomGradientColor:[UIColor customisedGradientBottom]];
    [mapLocation setTitle:@"Map Location" forState:UIControlStateNormal];
    [mapLocation setTitleColor:[UIColor walgreensRedColor] forState:UIControlStateNormal];
    [mapLocation setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mapLocation setTag:MAP_LOCATION_TAG];
    mapLocation.titleLabel.shadowOffset = CGSizeMake(1, 1);
    mapLocation.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [mapLocation addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mapLocation];

}



-(void)viewDidAppear:(BOOL)animated
{
//    self.navigationController.navigationBar.hidden = YES;

}


-(IBAction)push:(UIButton*)sender
{
    if (sender.tag == FIND_STORE_BUTTON_TAG)
    {
        NextViewController *next = [[NextViewController alloc] init];
        [self.navigationController pushViewController:next animated:YES];
    }
    
    else if (sender.tag == DIRECTIONS_TAG)
    {
        m_cLabel.hidden = NO;
        [m_cLabel setText:DIRECTION_TITLE];
    }
    else
    {
        m_cLabel.hidden = NO;
        [m_cLabel setText:MAP_TITLE];
    }
}



- (BOOL)shouldAutorotate
{
    return  YES;
}


- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //Resizing buttons if orientation changed get changed
    if ((toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) || (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft))
    {
       [self changeButtonFrameTo:CGRectMake(10, 80, [[UIScreen mainScreen] bounds].size.height - 20, 44) forGradientButton:button];
        [self changeButtonFrameTo:CGRectMake(10, 140,  ([[UIScreen mainScreen] bounds].size.height/2) - 20, 44) forGradientButton:getDirections];
        [self changeButtonFrameTo:CGRectMake([[UIScreen mainScreen] bounds].size.height/2, 140, ([[UIScreen mainScreen] bounds].size.height/2) - 20, 44) forGradientButton:mapLocation];
    }
    else
    {
        [self changeButtonFrameTo:CGRectMake(10, 80, [[UIScreen mainScreen] bounds].size.width - 20, 44) forGradientButton:button];
        [self changeButtonFrameTo:CGRectMake(10, 140,  ([[UIScreen mainScreen] bounds].size.width/2) - 20, 44) forGradientButton:getDirections];
        [self changeButtonFrameTo:CGRectMake([[UIScreen mainScreen] bounds].size.width/2, 140, ([[UIScreen mainScreen] bounds].size.width/2) - 20, 44) forGradientButton:mapLocation];
    }
}

-(void) changeButtonFrameTo:(CGRect) rect  forGradientButton:(GradientButton*) gradientButton
{
    [gradientButton setFrame:rect];
    [gradientButton.m_cGradientLayer setBounds:[gradientButton bounds]];
    [gradientButton.m_cGradientLayer setPosition:CGPointMake([gradientButton bounds].size.width/2, [gradientButton bounds].size.height/2)];
}

- (IBAction)changeColorOnTapforButton:(id) sender
{
    GradientButton* gradientButton = (GradientButton*)sender;
    [gradientButton setHighColor:[UIColor customisedGradientTopOnTouch]];
    [gradientButton setLowColor:[UIColor customisedGradientBottomOnTouch]];
    [gradientButton setMidGradientColor:[UIColor customisedGradientMidOnTouch]];
    [gradientButton setMidAboveGradientColor:[UIColor customisedGradientAboveMidOnTouch]];
}


@end
