//
//  MKByteUnit.h
//  MKUnits
//
//  Created by Michal Konturek on 29/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "MKUnit.h"
#import "MKQuantity.h"

@interface MKThicknessUnit : MKUnit

+ (instancetype)mil;
+ (instancetype)micron;
+ (instancetype)millimeter;
+ (instancetype)gauge;
+ (instancetype)inch;

@end

@interface MKQuantity (MKThicknessUnit)

+ (instancetype)thickness_milWithAmount:(NSNumber *)amount;
+ (instancetype)thickness_micronWithAmount:(NSNumber *)amount;
+ (instancetype)thickness_gaugeWithAmount:(NSNumber *)amount;
+ (instancetype)thickness_millimeterWithAmount:(NSNumber *)amount;
+ (instancetype)thickness_inchWithAmount:(NSNumber *)amount;

@end
