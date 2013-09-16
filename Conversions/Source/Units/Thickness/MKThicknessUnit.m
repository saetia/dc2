//
//  MKThicknessUnit.m
//  MKUnits
//
//  Created by Joel Glovacki on 16/09/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKThicknessUnit.h"

@implementation MKThicknessUnit

+ (instancetype)mil {
    static NSString *name   = @"mil";
    static NSString *symbol = @"mil";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)micron {
    static NSString *name   = @"micron";
    static NSString *symbol = @"mic";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:393700787 exponent:-10 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)millimeter {
    static NSString *name   = @"millimeter";
    static NSString *symbol = @"mm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:393700787 exponent:-7 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)gauge {
    static NSString *name   = @"gauge";
    static NSString *symbol = @"ga";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:100 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)inch {
    static NSString *name   = @"inch";
    static NSString *symbol = @"in";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1000 exponent:0 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKThicknessUnit)

+ (instancetype)thickness_milWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKThicknessUnit mil]];
}

+ (instancetype)thickness_micronWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKThicknessUnit micron]];
}

+ (instancetype)thickness_millimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKThicknessUnit millimeter]];
}

+ (instancetype)thickness_gaugeWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKThicknessUnit gauge]];
}

+ (instancetype)thickness_inchWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKThicknessUnit inch]];
}

@end
