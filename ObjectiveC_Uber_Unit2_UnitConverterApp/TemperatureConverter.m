//
//  TemperatureConverter.m
//  ObjectiveC_Uber_Unit2_UnitConverterApp
//
//  Created by Craig on 6/07/2015.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "TemperatureConverter.h"

@implementation TemperatureConverter

+ (float)celsiusToFahrenheight:(float)celsius {
    float fahrenheit = celsius * 1.8 + 32;
    return fahrenheit;
}

@end
