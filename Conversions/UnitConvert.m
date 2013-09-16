//
//  UnitConvert.m
//  Conversions
//
//  Created by Joel Glovacki on 9/13/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import "UnitConvert.h"

@implementation UnitConvert


+ (id)objectify:(NSString *)unit {
    
    id object;
    
    if ([unit isEqualToString:@"in"]) object = [MKLengthUnit inch];
    if ([unit isEqualToString:@"ft"]) object = [MKLengthUnit foot];
    if ([unit isEqualToString:@"yd"]) object = [MKLengthUnit yard];
    if ([unit isEqualToString:@"mi"]) object = [MKLengthUnit mile];
    if ([unit isEqualToString:@"mm"]) object = [MKLengthUnit millimeter];
    if ([unit isEqualToString:@"cm"]) object = [MKLengthUnit centimeter];
    if ([unit isEqualToString:@"m"]) object = [MKLengthUnit meter];
    if ([unit isEqualToString:@"km"]) object = [MKLengthUnit kilometer];
    
    if ([unit isEqualToString:@"in²"]) object = [MKAreaUnit square_inch];
    if ([unit isEqualToString:@"ft²"]) object = [MKAreaUnit square_foot];
    if ([unit isEqualToString:@"yd²"]) object = [MKAreaUnit square_yard];
    if ([unit isEqualToString:@"mi²"]) object = [MKAreaUnit square_mile];
    if ([unit isEqualToString:@"mm²"]) object = [MKAreaUnit square_millimeter];
    if ([unit isEqualToString:@"cm²"]) object = [MKAreaUnit square_centimeter];
    if ([unit isEqualToString:@"m²"]) object = [MKAreaUnit square_meter];
    if ([unit isEqualToString:@"km²"]) object = [MKAreaUnit square_kilometer];

    
    //mil, mic, gauge
    //msi
    
    
    return (object) ?: FALSE;
    
}



+ (NSNumber *)convert:(NSNumber *)value from:(NSString *)from to:(NSString *)to {
    
    //if we don't have a legit conversion, just return value. not everything needs a conversion
    if (![self objectify:from] || ![self objectify:to]) return value;
    
    NSNumber *result = [MKUnit convertAmount:value from:[self objectify:from] to:[self objectify:to]];
    
    return result;
    
}




+ (UIColor *)colorize: (NSString *)unit {
    
    
    NSDictionary *units_to_colors = @{
                                      
                                      @"in": [UIColor colorWithRed:0.92f green:0.56f blue:0.15f alpha:1.00f],
                                      @"ft": [UIColor colorWithRed:0.46f green:0.14f blue:0.70f alpha:1.00f],
                                      @"yd": [UIColor colorWithRed:0.09f green:0.61f blue:0.46f alpha:1.00f],
                                      @"mi": [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f],
                                      @"mm": [UIColor colorWithRed:0.7f green:0.64f blue:0.48f alpha:1.00f],
                                      @"cm": [UIColor colorWithRed:0.37f green:0.73f blue:0.64f alpha:1.00f],
                                      @"m": [UIColor colorWithRed:0.50f green:0.05f blue:0.00f alpha:1.00f],
                                      @"km": [UIColor colorWithRed:0.36f green:0.25f blue:0.18f alpha:1.00f],
                                      
                                      @"msi": [UIColor colorWithRed:0.42f green:0.55f blue:0.50f alpha:1.00f],
                                      
                                      @"in²": [UIColor colorWithRed:0.92f green:0.56f blue:0.15f alpha:1.00f],
                                      @"ft²": [UIColor colorWithRed:0.46f green:0.14f blue:0.70f alpha:1.00f],
                                      @"yd²": [UIColor colorWithRed:0.09f green:0.61f blue:0.46f alpha:1.00f],
                                      @"mi²": [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f],
                                      @"mm²": [UIColor colorWithRed:0.7f green:0.64f blue:0.48f alpha:1.00f],
                                      @"cm²": [UIColor colorWithRed:0.37f green:0.73f blue:0.64f alpha:1.00f],
                                      @"m²": [UIColor colorWithRed:0.50f green:0.05f blue:0.00f alpha:1.00f],
                                      @"km²": [UIColor colorWithRed:0.36f green:0.25f blue:0.18f alpha:1.00f],
                                      
                                      @"g/m²": [UIColor colorWithRed:0.28f green:0.28f blue:0.28f alpha:1.00f],
                                      @"oz/yd²": [UIColor colorWithRed:0.40f green:0.64f blue:0.48f alpha:1.00f],
                                      
                                      };
    
    return (units_to_colors[unit]) ?: [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f];
}



@end
