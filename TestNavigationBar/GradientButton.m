//
//  GradientButton.m
//  TestNavigationBar
//
//  Created by Bharath G M on 2/22/13.
//  Copyright (c) 2013 Bharath G M. All rights reserved.
//

#import "GradientButton.h"

@implementation GradientButton

@synthesize m_cGradientLayer;
@synthesize _BottomGradientColor;
@synthesize _TopGradientColor;
@synthesize _MidAboveGradientColor;
@synthesize _MidGradientColor;


- (id)initWithFrame:(CGRect)frame title:(NSString*)title titleShadowColor:(UIColor*)titleShadowColor titleColor:(UIColor*)titleColor titleLabelOffset:(CGSize)offset tag:(NSUInteger)tag font:(UIFont*)font bottomGradient:(UIColor*)bottomGradient midGradient:(UIColor*)midGradient midAboveGradient:(UIColor*)midAboveGradient topGradient:(UIColor*)topGradient
{
    self = [super init];
    if (self)
    {
        
        [self setFrame:frame];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleShadowColor:titleShadowColor forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        [[self titleLabel] setShadowOffset:offset];
        [self setTag:tag];
        [[self titleLabel] setFont:font];
        [self set_BottomGradientColor:bottomGradient];
        [self set_MidGradientColor:midGradient];
        [self set_MidAboveGradientColor:midAboveGradient];
        [self set_TopGradientColor:topGradient];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    if (!self.m_cGradientLayer)
    {
        self.m_cGradientLayer = [[CAGradientLayer alloc] init];
    }
    [self.m_cGradientLayer setBounds:[self bounds]];
    [self.m_cGradientLayer setPosition:CGPointMake([self bounds].size.width/2, [self bounds].size.height/2)];
    
    [[self layer] insertSublayer:self.m_cGradientLayer atIndex:0];
    
    [[self layer] setCornerRadius:8.0f];
    [[self layer] setMasksToBounds:YES];
    [[self layer] setBorderColor:[[UIColor colorWithRed:44/255 green:44/255 blue:44/255 alpha:0.48] CGColor]];

    if (self._TopGradientColor && self._BottomGradientColor && self._MidGradientColor && self._MidAboveGradientColor)
    {
        [self.m_cGradientLayer setColors:[NSArray arrayWithObjects:(id)[self._TopGradientColor CGColor],(id)[self._MidAboveGradientColor CGColor],(id)[self._MidGradientColor CGColor],(id)[self._BottomGradientColor CGColor], nil]]; //applying 4 gradients
    }
    [super drawRect:rect];
}

- (void)setHighColor:(UIColor*)color;
{
    [self set_TopGradientColor:color];
    [[self layer] setNeedsDisplay];
}

- (void)setLowColor:(UIColor*)color;
{
    [self set_BottomGradientColor:color];
    [[self layer] setNeedsDisplay];
}

-(void)setMidGradientColor:(UIColor *)color
{
    [self set_MidGradientColor:color];
    [[self layer] setNeedsDisplay];
}

-(void)setMidAboveGradientColor:(UIColor *)color
{
    [self set_MidAboveGradientColor:color];
    [[self layer] setNeedsDisplay];
}
@end

