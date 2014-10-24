/*
    Copyright (C) 2014 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    
                A simple model class to represent food and its associated energy.
            
*/

@import Foundation;
@import HealthKit;

@interface AAPLFoodItem : NSObject

// Creates a new food item.
+ (instancetype)foodItemWithName:(NSString *)name calories:(double)calories;

// AAPLFoodItem properties are immutable.
@property NSString* name;
@property double calories;

@end
