//
//  MKYieldUnit.h
//  MKUnits
//


#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKYieldUnit : MKUnit

+ (instancetype)square_millimeter;
+ (instancetype)square_centimeter;
+ (instancetype)square_decimeter;
+ (instancetype)square_meter;
+ (instancetype)are;
+ (instancetype)hectare;
+ (instancetype)square_kilometer;
+ (instancetype)msi;

@end

@interface MKQuantity (MKYieldUnit)

+ (instancetype)yield_square_millimeterWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_centimeterWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_decimeterWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_meterWithAmount:(NSNumber *)amount;
+ (instancetype)yield_areWithAmount:(NSNumber *)amount;
+ (instancetype)yield_hectareWithAmount:(NSNumber *)amount;
+ (instancetype)yield_square_kilometerWithAmount:(NSNumber *)amount;
+ (instancetype)yield_msiWithAmount:(NSNumber *)amount;

@end
