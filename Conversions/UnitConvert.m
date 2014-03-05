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

    
    
    //weight
    if ([unit isEqualToString:@"oz"]) object = [MKMassUnit ounce];
    if ([unit isEqualToString:@"lb"]) object = [MKMassUnit pound];
    if ([unit isEqualToString:@"g"]) object = [MKMassUnit gram];
    if ([unit isEqualToString:@"mg"]) object = [MKMassUnit milligram];
    if ([unit isEqualToString:@"kg"]) object = [MKMassUnit kilogram];

    
    
    //length
    if ([unit isEqualToString:@"in"]) object = [MKLengthUnit inch];
    if ([unit isEqualToString:@"ft"]) object = [MKLengthUnit foot];
    if ([unit isEqualToString:@"yd"]) object = [MKLengthUnit yard];
    if ([unit isEqualToString:@"mi"]) object = [MKLengthUnit mile];
    if ([unit isEqualToString:@"mm"]) object = [MKLengthUnit millimeter];
    if ([unit isEqualToString:@"cm"]) object = [MKLengthUnit centimeter];
    if ([unit isEqualToString:@"m"]) object = [MKLengthUnit meter];
    if ([unit isEqualToString:@"km"]) object = [MKLengthUnit kilometer];
    
    //thickness
    if ([unit isEqualToString:@"mil"]) object = [MKLengthUnit mil];
    if ([unit isEqualToString:@"mic"]) object = [MKLengthUnit micron];
    if ([unit isEqualToString:@"ga"]) object = [MKLengthUnit gauge];
    
    //areas
    if ([unit isEqualToString:@"in²"]) object = [MKAreaUnit square_inch];
    if ([unit isEqualToString:@"ft²"]) object = [MKAreaUnit square_foot];
    if ([unit isEqualToString:@"yd²"]) object = [MKAreaUnit square_yard];
    if ([unit isEqualToString:@"mi²"]) object = [MKAreaUnit square_mile];
    if ([unit isEqualToString:@"mm²"]) object = [MKAreaUnit square_millimeter];
    if ([unit isEqualToString:@"cm²"]) object = [MKAreaUnit square_centimeter];
    if ([unit isEqualToString:@"m²"]) object = [MKAreaUnit square_meter];
    if ([unit isEqualToString:@"km²"]) object = [MKAreaUnit square_kilometer];
    if ([unit isEqualToString:@"msi"]) object = [MKAreaUnit msi];

    //yields
    if ([unit isEqualToString:@"in²/lb"]) object = [MKYieldUnit square_inch];
    if ([unit isEqualToString:@"ft²/lb"]) object = [MKYieldUnit square_foot];
    if ([unit isEqualToString:@"yd²/lb"]) object = [MKYieldUnit square_yard];
    if ([unit isEqualToString:@"mi²/lb"]) object = [MKYieldUnit square_mile];
    if ([unit isEqualToString:@"mm²/kg"]) object = [MKYieldUnit square_millimeter];
    if ([unit isEqualToString:@"cm²/kg"]) object = [MKYieldUnit square_centimeter];
    if ([unit isEqualToString:@"m²/kg"]) object = [MKYieldUnit square_meter];
    if ([unit isEqualToString:@"km²/kg"]) object = [MKYieldUnit square_kilometer];
    if ([unit isEqualToString:@"msi/lb"]) object = [MKYieldUnit msi];
    
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
                                      
  @"lb": [UIColor colorWithRed:0.63f green:0.04f blue:0.15f alpha:1.00f],
  @"in": [UIColor colorWithRed:0.00f green:0.69f blue:0.53f alpha:1.00f],
  @"ft": [UIColor colorWithRed:1.00f green:0.32f blue:0.35f alpha:1.00f],
  @"yd": [UIColor colorWithRed:0.85f green:0.36f blue:0.69f alpha:1.00f],
  @"mi": [UIColor colorWithRed:0.36f green:0.77f blue:0.91f alpha:1.00f],
  @"mm": [UIColor colorWithRed:0.33f green:0.70f blue:0.37f alpha:1.00f],
  @"cm": [UIColor colorWithRed:1.00f green:0.60f blue:0.65f alpha:1.00f],
  @"m": [UIColor colorWithRed:0.53f green:0.72f blue:0.79f alpha:1.00f],
  @"km": [UIColor colorWithRed:0.46f green:0.37f blue:0.69f alpha:1.00f],
  
  @"msi": [UIColor colorWithRed:0.31f green:0.38f blue:0.55f alpha:1.00f],
  
  @"in²": [UIColor colorWithRed:0.00f green:0.69f blue:0.53f alpha:0.80f],
  @"ft²": [UIColor colorWithRed:1.00f green:0.32f blue:0.35f alpha:0.80f],
  @"yd²": [UIColor colorWithRed:0.85f green:0.36f blue:0.69f alpha:0.80f],
  @"mi²": [UIColor colorWithRed:0.36f green:0.77f blue:0.91f alpha:0.80f],
  @"mm²": [UIColor colorWithRed:0.33f green:0.70f blue:0.37f alpha:0.80f],
  @"cm²": [UIColor colorWithRed:1.00f green:0.60f blue:0.65f alpha:0.80f],
  @"m²": [UIColor colorWithRed:0.53f green:0.72f blue:0.79f alpha:0.80f],
  @"km²": [UIColor colorWithRed:0.46f green:0.37f blue:0.69f alpha:0.80f],
  
  @"g/m²": [UIColor colorWithRed:0.25f green:0.77f blue:0.71f alpha:0.80f],
  @"oz/yd²": [UIColor colorWithRed:1.00f green:0.44f blue:0.26f alpha:0.80f],
  @"in²/lb": [UIColor colorWithRed:0.97f green:0.34f blue:0.50f alpha:0.80f],
  @"ft²/lb": [UIColor colorWithRed:0.31f green:0.38f blue:0.55f alpha:0.80f],
  @"m²/kg":  [UIColor colorWithRed:0.07f green:0.41f blue:0.56f alpha:1.00f],
  @"msi/lb": [UIColor colorWithRed:0.57f green:0.24f blue:1.00f alpha:1.00f],

  
  
  @"mil": [UIColor colorWithRed:0.25f green:0.77f blue:0.71f alpha:1.00f],
  @"mic": [UIColor colorWithRed:1.00f green:0.44f blue:0.26f alpha:1.00f],
  @"ga": [UIColor colorWithRed:0.97f green:0.34f blue:0.50f alpha:1.00f],
  

  
  };
    
    return (units_to_colors[unit]) ?: [UIColor colorWithRed:0.00f green:0.64f blue:0.48f alpha:1.00f];
}



@end
