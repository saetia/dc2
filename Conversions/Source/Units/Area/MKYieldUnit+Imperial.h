//
//  MKYieldUnit+Imperial.h
//  MKUnits
//

#import "MKYieldUnit.h"

@interface MKYieldUnit (Imperial)

+ (instancetype)square_inch;
+ (instancetype)square_foot;
+ (instancetype)square_yard;
+ (instancetype)acre;
+ (instancetype)square_mile;

@end

@interface MKQuantity (MKYieldUnit_Imperial)

+ (instancetype)yield_square_inchWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_footWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_yardWithAmount:(NSNumber *)amount;
+ (instancetype)yield_acreWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_mileWithAmount:(NSNumber *)amount;

@end
