//
//  MKLengthUnit+Imperial.h
//  MKUnits
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKLengthUnit.h"

@interface MKLengthUnit (Imperial)

+ (instancetype)inch;
+ (instancetype)foot;
+ (instancetype)yard;
+ (instancetype)chain;
+ (instancetype)furlong;
+ (instancetype)mile;
+ (instancetype)nautical_mile;


+ (instancetype)mil;
+ (instancetype)micron;
+ (instancetype)gauge;




@end

@interface MKQuantity (MKLengthUnit_Imperial)

+ (instancetype)length_inchWithAmount:(NSNumber *)amount;
+ (instancetype)length_footWithAmount:(NSNumber *)amount;
+ (instancetype)length_yardWithAmount:(NSNumber *)amount;
+ (instancetype)length_chainWithAmount:(NSNumber *)amount;
+ (instancetype)length_furlongWithAmount:(NSNumber *)amount;
+ (instancetype)length_mileWithAmount:(NSNumber *)amount;
+ (instancetype)length_nautical_mileWithAmount:(NSNumber *)amount;

+ (instancetype)thickness_milWithAmount:(NSNumber *)amount;
+ (instancetype)thickness_micronWithAmount:(NSNumber *)amount;
+ (instancetype)thickness_gaugeWithAmount:(NSNumber *)amount;

@end