//
//  ViewController.h
//  TestNavigationBar
//
//  Created by Bharath G M on 11/13/12.
//  Copyright (c) 2012 Bharath G M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientButton.h"


@interface ViewController : UIViewController
{
    UINavigationBar *nav;
    GradientButton *button;            //find a store button
    GradientButton *getDirections;     //Get Directions
    GradientButton *mapLocation;       //Map Location
    CAGradientLayer *gradientLayer;
    UILabel *m_cLabel;
}
-(IBAction)push:(id)sender;
@end
