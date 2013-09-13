//
//  UnitConvert.h
//  Conversions
//
//  Created by Joel Glovacki on 9/13/13.
//  Copyright (c) 2013 Dunmore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKUnits.h"

@interface UnitConvert : NSObject
    + (NSNumber *)convert:(NSNumber *)value from:(NSString *)from to:(NSString *)to;
    + (id)objectify:(NSString *)unit;
    + (UIColor *)colorize: (NSString *)unit;
@end

