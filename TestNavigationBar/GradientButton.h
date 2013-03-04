//
//  GradientButton.h
//  TestNavigationBar
//
//  Created by Bharath G M on 2/22/13.
//  Copyright (c) 2013 Bharath G M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientButton : UIButton
{
    CAGradientLayer *m_cGradientLayer;
}

/* All these are color components, each one acts as a color gradient*/
@property (strong) UIColor *_TopGradientColor;
@property (strong) UIColor *_BottomGradientColor;
@property (strong) UIColor *_MidGradientColor;
@property (strong) UIColor *_MidAboveGradientColor;
@property (nonatomic, retain) CAGradientLayer *m_cGradientLayer;

- (void)setHighColor:(UIColor*)color;
- (void)setLowColor:(UIColor*)color;
- (void)setMidGradientColor:(UIColor*)color;
- (void)setMidAboveGradientColor:(UIColor*)color;
- (id)initWithFrame:(CGRect)frame title:(NSString*)title titleShadowColor:(UIColor*)titleShadowColor titleColor:(UIColor*)titleColor titleLabelOffset:(CGSize)offset tag:(NSUInteger)tag font:(UIFont*)font bottomGradient:(UIColor*)bottomGradient midGradient:(UIColor*)midGradient midAboveGradient:(UIColor*)midAboveGradient topGradient:(UIColor*)topGradient;
@end
