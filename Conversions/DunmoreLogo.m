//
//  DunmoreLogo.m
//  Conversions
//
//  Created by Joel Glovacki on 9/13/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "DunmoreLogo.h"

@implementation DunmoreLogo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect: (CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = [[UIColor blackColor] colorWithAlphaComponent: 0.5];
    CGSize shadowOffset = CGSizeMake(0.1, -1.1);
    CGFloat shadowBlurRadius = 0;
    
    //// R
    {
    }
    
    
    //// Group 2
    {
        //// Bezier 10 Drawing
        
        
        //// Rectangle 2 Drawing
        CGRect rectangle2Rect = CGRectMake(170.28, 7.46, 4.68, 9.36);
        [color2 setFill];
        [@"R" drawInRect: rectangle2Rect withFont: [UIFont fontWithName: @"Verdana" size: 4.68] lineBreakMode: NSLineBreakByWordWrapping alignment: NSTextAlignmentLeft];
        
        
        //// Bezier 11 Drawing
        UIBezierPath* bezier11Path = [UIBezierPath bezierPath];
        [bezier11Path moveToPoint: CGPointMake(173.85, 8.83)];
        [bezier11Path addCurveToPoint: CGPointMake(173.85, 12.83) controlPoint1: CGPointMake(174.95, 9.94) controlPoint2: CGPointMake(174.95, 11.73)];
        [bezier11Path addCurveToPoint: CGPointMake(169.84, 12.83) controlPoint1: CGPointMake(172.74, 13.94) controlPoint2: CGPointMake(170.95, 13.94)];
        [bezier11Path addCurveToPoint: CGPointMake(169.84, 8.83) controlPoint1: CGPointMake(168.74, 11.73) controlPoint2: CGPointMake(168.74, 9.94)];
        [bezier11Path addCurveToPoint: CGPointMake(173.85, 8.83) controlPoint1: CGPointMake(170.95, 7.72) controlPoint2: CGPointMake(172.74, 7.72)];
        [bezier11Path closePath];
        bezier11Path.miterLimit = 4;
        
        [color2 setStroke];
        bezier11Path.lineWidth = 0.65;
        [bezier11Path stroke];
    }
    
    
    //// Group 3
    {
        //// Bezier 12 Drawing
        UIBezierPath* bezier12Path = [UIBezierPath bezierPath];
        [bezier12Path moveToPoint: CGPointMake(12.1, 7.71)];
        [bezier12Path addCurveToPoint: CGPointMake(20.97, 11.28) controlPoint1: CGPointMake(16.01, 7.71) controlPoint2: CGPointMake(18.97, 8.93)];
        [bezier12Path addCurveToPoint: CGPointMake(23.85, 21.12) controlPoint1: CGPointMake(22.91, 13.64) controlPoint2: CGPointMake(23.98, 17.29)];
        [bezier12Path addCurveToPoint: CGPointMake(19.47, 32.34) controlPoint1: CGPointMake(23.68, 25.78) controlPoint2: CGPointMake(22.14, 29.69)];
        [bezier12Path addCurveToPoint: CGPointMake(9.77, 35.74) controlPoint1: CGPointMake(17.01, 34.78) controlPoint2: CGPointMake(14.3, 35.74)];
        [bezier12Path addLineToPoint: CGPointMake(1.07, 35.74)];
        [bezier12Path addLineToPoint: CGPointMake(4.74, 7.71)];
        [bezier12Path addLineToPoint: CGPointMake(12.1, 7.71)];
        [bezier12Path closePath];
        [bezier12Path moveToPoint: CGPointMake(10.03, 27.42)];
        [bezier12Path addLineToPoint: CGPointMake(11.14, 27.42)];
        [bezier12Path addCurveToPoint: CGPointMake(16.06, 20.91) controlPoint1: CGPointMake(13.78, 27.42) controlPoint2: CGPointMake(15.93, 24.61)];
        [bezier12Path addCurveToPoint: CGPointMake(12.49, 15.95) controlPoint1: CGPointMake(16.16, 18.09) controlPoint2: CGPointMake(14.61, 15.95)];
        [bezier12Path addLineToPoint: CGPointMake(11.55, 15.95)];
        [bezier12Path addLineToPoint: CGPointMake(10.03, 27.42)];
        [bezier12Path closePath];
        bezier12Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier12Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 13 Drawing
        UIBezierPath* bezier13Path = [UIBezierPath bezierPath];
        [bezier13Path moveToPoint: CGPointMake(45.53, 23.22)];
        [bezier13Path addCurveToPoint: CGPointMake(42.14, 33.18) controlPoint1: CGPointMake(44.77, 29.02) controlPoint2: CGPointMake(44.15, 30.91)];
        [bezier13Path addCurveToPoint: CGPointMake(34.66, 36.46) controlPoint1: CGPointMake(40.21, 35.41) controlPoint2: CGPointMake(37.79, 36.46)];
        [bezier13Path addCurveToPoint: CGPointMake(27.11, 33.43) controlPoint1: CGPointMake(31.54, 36.46) controlPoint2: CGPointMake(28.97, 35.41)];
        [bezier13Path addCurveToPoint: CGPointMake(24.93, 26.12) controlPoint1: CGPointMake(25.51, 31.71) controlPoint2: CGPointMake(24.81, 29.4)];
        [bezier13Path addCurveToPoint: CGPointMake(25.11, 23.85) controlPoint1: CGPointMake(24.96, 25.24) controlPoint2: CGPointMake(25.02, 24.57)];
        [bezier13Path addLineToPoint: CGPointMake(27.21, 7.71)];
        [bezier13Path addLineToPoint: CGPointMake(35.19, 7.71)];
        [bezier13Path addLineToPoint: CGPointMake(33.18, 23.22)];
        [bezier13Path addCurveToPoint: CGPointMake(32.97, 25.4) controlPoint1: CGPointMake(33.08, 24.1) controlPoint2: CGPointMake(32.99, 24.94)];
        [bezier13Path addCurveToPoint: CGPointMake(34.84, 27.93) controlPoint1: CGPointMake(32.91, 26.96) controlPoint2: CGPointMake(33.63, 27.93)];
        [bezier13Path addCurveToPoint: CGPointMake(37.5, 23.6) controlPoint1: CGPointMake(36.33, 27.93) controlPoint2: CGPointMake(37.1, 26.67)];
        [bezier13Path addLineToPoint: CGPointMake(39.56, 7.71)];
        [bezier13Path addLineToPoint: CGPointMake(47.58, 7.71)];
        [bezier13Path addLineToPoint: CGPointMake(45.53, 23.22)];
        [bezier13Path closePath];
        bezier13Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier13Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 14 Drawing
        UIBezierPath* bezier14Path = [UIBezierPath bezierPath];
        [bezier14Path moveToPoint: CGPointMake(68.38, 35.74)];
        [bezier14Path addLineToPoint: CGPointMake(60.72, 35.74)];
        [bezier14Path addLineToPoint: CGPointMake(57.28, 26.08)];
        [bezier14Path addCurveToPoint: CGPointMake(55.67, 19.9) controlPoint1: CGPointMake(56.51, 23.85) controlPoint2: CGPointMake(56.14, 22.46)];
        [bezier14Path addLineToPoint: CGPointMake(55.38, 19.9)];
        [bezier14Path addCurveToPoint: CGPointMake(55.39, 23.26) controlPoint1: CGPointMake(55.43, 21.16) controlPoint2: CGPointMake(55.43, 22.09)];
        [bezier14Path addCurveToPoint: CGPointMake(55.23, 26.08) controlPoint1: CGPointMake(55.35, 24.4) controlPoint2: CGPointMake(55.29, 25.32)];
        [bezier14Path addLineToPoint: CGPointMake(54.17, 35.74)];
        [bezier14Path addLineToPoint: CGPointMake(46.25, 35.74)];
        [bezier14Path addLineToPoint: CGPointMake(49.91, 7.71)];
        [bezier14Path addLineToPoint: CGPointMake(57.83, 7.71)];
        [bezier14Path addLineToPoint: CGPointMake(61.34, 18.26)];
        [bezier14Path addCurveToPoint: CGPointMake(62.2, 21.54) controlPoint1: CGPointMake(61.63, 19.19) controlPoint2: CGPointMake(61.95, 20.36)];
        [bezier14Path addCurveToPoint: CGPointMake(62.53, 23.22) controlPoint1: CGPointMake(62.25, 21.83) controlPoint2: CGPointMake(62.36, 22.42)];
        [bezier14Path addLineToPoint: CGPointMake(62.69, 24.1)];
        [bezier14Path addLineToPoint: CGPointMake(62.99, 24.1)];
        [bezier14Path addCurveToPoint: CGPointMake(62.96, 19.31) controlPoint1: CGPointMake(62.91, 21.58) controlPoint2: CGPointMake(62.91, 20.7)];
        [bezier14Path addCurveToPoint: CGPointMake(63.18, 15.99) controlPoint1: CGPointMake(63.01, 18.05) controlPoint2: CGPointMake(63.07, 17.04)];
        [bezier14Path addLineToPoint: CGPointMake(64.02, 7.71)];
        [bezier14Path addLineToPoint: CGPointMake(72.04, 7.71)];
        [bezier14Path addLineToPoint: CGPointMake(68.38, 35.74)];
        [bezier14Path closePath];
        bezier14Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier14Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 15 Drawing
        UIBezierPath* bezier15Path = [UIBezierPath bezierPath];
        [bezier15Path moveToPoint: CGPointMake(98.56, 35.74)];
        [bezier15Path addLineToPoint: CGPointMake(90.9, 35.74)];
        [bezier15Path addLineToPoint: CGPointMake(91.62, 27.47)];
        [bezier15Path addCurveToPoint: CGPointMake(92.64, 19.65) controlPoint1: CGPointMake(91.86, 24.44) controlPoint2: CGPointMake(92.11, 22.67)];
        [bezier15Path addLineToPoint: CGPointMake(92.35, 19.61)];
        [bezier15Path addLineToPoint: CGPointMake(92.28, 19.86)];
        [bezier15Path addCurveToPoint: CGPointMake(90.16, 27.25) controlPoint1: CGPointMake(91.5, 23.35) controlPoint2: CGPointMake(91.24, 24.27)];
        [bezier15Path addLineToPoint: CGPointMake(87.09, 35.74)];
        [bezier15Path addLineToPoint: CGPointMake(82.14, 35.74)];
        [bezier15Path addLineToPoint: CGPointMake(81.6, 26.88)];
        [bezier15Path addCurveToPoint: CGPointMake(81.53, 21.71) controlPoint1: CGPointMake(81.52, 25.62) controlPoint2: CGPointMake(81.48, 22.97)];
        [bezier15Path addCurveToPoint: CGPointMake(81.67, 19.61) controlPoint1: CGPointMake(81.55, 20.95) controlPoint2: CGPointMake(81.57, 20.53)];
        [bezier15Path addLineToPoint: CGPointMake(81.41, 19.61)];
        [bezier15Path addCurveToPoint: CGPointMake(80.17, 26.88) controlPoint1: CGPointMake(80.96, 22.97) controlPoint2: CGPointMake(80.8, 23.93)];
        [bezier15Path addLineToPoint: CGPointMake(78.26, 35.74)];
        [bezier15Path addLineToPoint: CGPointMake(70.28, 35.74)];
        [bezier15Path addLineToPoint: CGPointMake(77.59, 7.72)];
        [bezier15Path addLineToPoint: CGPointMake(85.93, 7.72)];
        [bezier15Path addLineToPoint: CGPointMake(86.47, 16.46)];
        [bezier15Path addCurveToPoint: CGPointMake(86.52, 19.82) controlPoint1: CGPointMake(86.56, 17.72) controlPoint2: CGPointMake(86.56, 18.43)];
        [bezier15Path addCurveToPoint: CGPointMake(86.22, 22.63) controlPoint1: CGPointMake(86.48, 20.74) controlPoint2: CGPointMake(86.39, 21.54)];
        [bezier15Path addLineToPoint: CGPointMake(86.55, 22.63)];
        [bezier15Path addCurveToPoint: CGPointMake(88.75, 14.61) controlPoint1: CGPointMake(87.03, 19.99) controlPoint2: CGPointMake(87.55, 18.09)];
        [bezier15Path addLineToPoint: CGPointMake(91.18, 7.71)];
        [bezier15Path addLineToPoint: CGPointMake(99.49, 7.71)];
        [bezier15Path addLineToPoint: CGPointMake(98.56, 35.74)];
        [bezier15Path closePath];
        bezier15Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier15Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 16 Drawing
        UIBezierPath* bezier16Path = [UIBezierPath bezierPath];
        [bezier16Path moveToPoint: CGPointMake(122.19, 10.87)];
        [bezier16Path addCurveToPoint: CGPointMake(125.4, 21.62) controlPoint1: CGPointMake(124.48, 13.43) controlPoint2: CGPointMake(125.56, 17.04)];
        [bezier16Path addCurveToPoint: CGPointMake(113.07, 36.46) controlPoint1: CGPointMake(125.1, 29.94) controlPoint2: CGPointMake(119.69, 36.46)];
        [bezier16Path addCurveToPoint: CGPointMake(104.24, 32.05) controlPoint1: CGPointMake(109.65, 36.46) controlPoint2: CGPointMake(106.42, 34.82)];
        [bezier16Path addCurveToPoint: CGPointMake(101.36, 22.13) controlPoint1: CGPointMake(102.18, 29.4) controlPoint2: CGPointMake(101.22, 26.08)];
        [bezier16Path addCurveToPoint: CGPointMake(113.89, 7) controlPoint1: CGPointMake(101.66, 13.64) controlPoint2: CGPointMake(107.18, 7)];
        [bezier16Path addCurveToPoint: CGPointMake(122.19, 10.87) controlPoint1: CGPointMake(116.99, 7) controlPoint2: CGPointMake(119.93, 8.39)];
        [bezier16Path closePath];
        [bezier16Path moveToPoint: CGPointMake(109.28, 22.21)];
        [bezier16Path addCurveToPoint: CGPointMake(112.9, 27.63) controlPoint1: CGPointMake(109.17, 25.32) controlPoint2: CGPointMake(110.71, 27.63)];
        [bezier16Path addCurveToPoint: CGPointMake(117.47, 21.71) controlPoint1: CGPointMake(115.41, 27.63) controlPoint2: CGPointMake(117.35, 25.11)];
        [bezier16Path addCurveToPoint: CGPointMake(113.72, 16.29) controlPoint1: CGPointMake(117.58, 18.6) controlPoint2: CGPointMake(116, 16.29)];
        [bezier16Path addCurveToPoint: CGPointMake(109.28, 22.21) controlPoint1: CGPointMake(111.44, 16.29) controlPoint2: CGPointMake(109.39, 19.02)];
        [bezier16Path closePath];
        bezier16Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier16Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 17 Drawing
        UIBezierPath* bezier17Path = [UIBezierPath bezierPath];
        [bezier17Path moveToPoint: CGPointMake(145.86, 35.74)];
        [bezier17Path addLineToPoint: CGPointMake(137.33, 35.74)];
        [bezier17Path addLineToPoint: CGPointMake(135.61, 28.98)];
        [bezier17Path addCurveToPoint: CGPointMake(134.93, 25.24) controlPoint1: CGPointMake(135.32, 27.8) controlPoint2: CGPointMake(135.05, 26.29)];
        [bezier17Path addLineToPoint: CGPointMake(134.67, 25.28)];
        [bezier17Path addCurveToPoint: CGPointMake(134.66, 27.34) controlPoint1: CGPointMake(134.7, 26.16) controlPoint2: CGPointMake(134.68, 26.67)];
        [bezier17Path addCurveToPoint: CGPointMake(134.36, 31.03) controlPoint1: CGPointMake(134.61, 28.6) controlPoint2: CGPointMake(134.5, 29.86)];
        [bezier17Path addLineToPoint: CGPointMake(133.74, 35.74)];
        [bezier17Path addLineToPoint: CGPointMake(125.85, 35.74)];
        [bezier17Path addLineToPoint: CGPointMake(129.52, 7.71)];
        [bezier17Path addLineToPoint: CGPointMake(138.19, 7.71)];
        [bezier17Path addCurveToPoint: CGPointMake(144.92, 9.98) controlPoint1: CGPointMake(141.67, 7.71) controlPoint2: CGPointMake(143.38, 8.3)];
        [bezier17Path addCurveToPoint: CGPointMake(147.21, 16.96) controlPoint1: CGPointMake(146.42, 11.71) controlPoint2: CGPointMake(147.3, 14.31)];
        [bezier17Path addCurveToPoint: CGPointMake(144.81, 23.13) controlPoint1: CGPointMake(147.13, 19.4) controlPoint2: CGPointMake(146.23, 21.66)];
        [bezier17Path addCurveToPoint: CGPointMake(141.53, 24.78) controlPoint1: CGPointMake(143.86, 24.1) controlPoint2: CGPointMake(143.1, 24.48)];
        [bezier17Path addLineToPoint: CGPointMake(145.86, 35.74)];
        [bezier17Path closePath];
        [bezier17Path moveToPoint: CGPointMake(135.76, 20.28)];
        [bezier17Path addLineToPoint: CGPointMake(136.44, 20.28)];
        [bezier17Path addCurveToPoint: CGPointMake(139.47, 17.42) controlPoint1: CGPointMake(138.26, 20.28) controlPoint2: CGPointMake(139.41, 19.19)];
        [bezier17Path addCurveToPoint: CGPointMake(137.04, 15.24) controlPoint1: CGPointMake(139.53, 15.95) controlPoint2: CGPointMake(138.74, 15.24)];
        [bezier17Path addLineToPoint: CGPointMake(136.42, 15.24)];
        [bezier17Path addLineToPoint: CGPointMake(135.76, 20.28)];
        [bezier17Path closePath];
        bezier17Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier17Path fill];
        CGContextRestoreGState(context);
        
        
        
        //// Bezier 18 Drawing
        UIBezierPath* bezier18Path = [UIBezierPath bezierPath];
        [bezier18Path moveToPoint: CGPointMake(164.6, 14.98)];
        [bezier18Path addLineToPoint: CGPointMake(158.21, 14.98)];
        [bezier18Path addLineToPoint: CGPointMake(157.81, 18.09)];
        [bezier18Path addLineToPoint: CGPointMake(163.68, 18.09)];
        [bezier18Path addLineToPoint: CGPointMake(162.75, 25.03)];
        [bezier18Path addLineToPoint: CGPointMake(156.88, 25.03)];
        [bezier18Path addLineToPoint: CGPointMake(156.48, 28.22)];
        [bezier18Path addLineToPoint: CGPointMake(163.12, 28.22)];
        [bezier18Path addLineToPoint: CGPointMake(162.14, 35.74)];
        [bezier18Path addLineToPoint: CGPointMake(147.61, 35.74)];
        [bezier18Path addLineToPoint: CGPointMake(151.27, 7.71)];
        [bezier18Path addLineToPoint: CGPointMake(165.58, 7.71)];
        [bezier18Path addLineToPoint: CGPointMake(164.6, 14.98)];
        [bezier18Path closePath];
        bezier18Path.miterLimit = 4;
        
        CGContextSaveGState(context);
        CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
        [color2 setFill];
        [bezier18Path fill];
        CGContextRestoreGState(context);
        
    }
    
    
    //// R 2
    {
    }
    
    

    
}

@end
