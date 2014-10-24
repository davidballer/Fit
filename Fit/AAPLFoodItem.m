/*
    Copyright (C) 2014 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    
                A simple model class to represent food and its associated energy.
            
*/

#import "AAPLFoodItem.h"

@interface AAPLFoodItem ()

@end

@implementation AAPLFoodItem

+ (instancetype)foodItemWithName:(NSString *)name calories:(double)calories {
    AAPLFoodItem *foodItem = [[self alloc] init];
    
    foodItem.name = name;
    foodItem.calories = calories;

    return foodItem;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[AAPLFoodItem class]]) {
        return [object calories] == self.calories && [self.name isEqualToString:[object name]];
    }
    
    return NO;
}

- (NSString *)description {
    return [@{
        @"name": self.name,
        @"calories": @(self.calories)
    } description];
}

@end
