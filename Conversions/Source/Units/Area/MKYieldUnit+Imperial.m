//
//  MKYieldUnit+Imperial.m
//  MKUnits
//


#import "MKYieldUnit+Imperial.h"

@implementation MKYieldUnit (Imperial)

+ (instancetype)square_inch {
    static NSString *name   = @"square inch";
    static NSString *symbol = @"sq in";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:142233433 exponent:-11 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_foot {
    static NSString *name   = @"square foot";
    static NSString *symbol = @"sq ft";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:204816144 exponent:-9 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_yard {
    static NSString *name   = @"square yard";
    static NSString *symbol = @"sq yd";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:184334529 exponent:-8 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

//todo
+ (instancetype)acre {
    static NSString *name   = @"acre";
    static NSString *symbol = @"ac";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:40468564224 exponent:-7 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

+ (instancetype)square_mile {
    static NSString *name   = @"square mile";
    static NSString *symbol = @"sq mi";
    id ratio = [NSDecimalNumber decimalNumberWithMantissa:570994638 exponent:-2 isNegative:NO];
    
    return [self createWithName:name
                     withSymbol:symbol
                      withRatio:ratio];
}

@end

@implementation MKQuantity (MKYieldUnit_Imperial)

+ (instancetype)area_square_inchWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_inch]];
}

+ (instancetype)area_square_footWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_foot]];
}

+ (instancetype)area_square_yardWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_yard]];
}

+ (instancetype)area_acreWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit acre]];
}

+ (instancetype)area_square_mileWithAmount:(NSNumber *)amount {
    return [self createWithAmount:amount withUnit:[MKYieldUnit square_mile]];
}

@end
