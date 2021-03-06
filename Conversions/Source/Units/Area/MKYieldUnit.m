//
//  MKYieldUnit.m
//  MKUnits
//

#import "MKYieldUnit.h"

@implementation MKYieldUnit

+ (instancetype)square_millimeter {
    static NSString *name   = @"square millimeter";
    static NSString *symbol = @"mm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_centimeter {
    static NSString *name   = @"centimeter";
    static NSString *symbol = @"cm";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_decimeter {
    static NSString *name   = @"square decimeter";
    static NSString *symbol = @"dm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_meter {
    static NSString *name   = @"square meter";
    static NSString *symbol = @"m2";
    id ratio = [NSDecimalNumber one];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)are {
    static NSString *name   = @"are";
    static NSString *symbol = @"dam2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)hectare {
    static NSString *name   = @"hectare";
    static NSString *symbol = @"hm2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:4 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_kilometer {
    static NSString *name   = @"square kilometer";
    static NSString *symbol = @"km2";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:1 exponent:6 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}


/*
Convert Square Meters to MSI - MSI = 1.5425 X m² (Square Meters)
Convert MSI to Square Meters - Square Meters = .64 X MSI
*/

+ (instancetype)msi {
    static NSString *name   = @"msi";
    static NSString *symbol = @"msi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:142233433 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}




@end

@implementation MKQuantity (MKYieldUnit)

+ (instancetype)yield_square_millimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_millimeter]];
}

+ (instancetype)yield_square_centimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_centimeter]];
}

+ (instancetype)yield_square_decimeterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_decimeter]];
}

+ (instancetype)yield_square_meterWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_meter]];
}

+ (instancetype)yield_areWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit are]];
}

+ (instancetype)yield_hectareWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit hectare]];
}

+ (instancetype)yield_square_kilometerWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_kilometer]];
}

+ (instancetype)yield_msiWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit msi]];
}

@end
