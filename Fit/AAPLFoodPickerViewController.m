/*
    Copyright (C) 2014 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    
                A UIViewController subclass that manages the selection of a food item.
            
*/

#import "AAPLFoodPickerViewController.h"
#import "AAPLFoodItem.h"

NSString *const AAPLFoodPickerViewControllerTableViewCellIdentifier = @"cell";
NSString *const AAPLFoodPickerViewControllerUnwindSegueIdentifier = @"AAPLFoodPickerViewControllerUnwindSegueIdentifier";

@interface AAPLFoodPickerViewController()

@property (nonatomic, strong) NSArray *foodItems;

@end


@implementation AAPLFoodPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // A hard-coded list of possible food items. In your application, you can decide how these should
    // be represented / created.
    self.foodItems = @[
        [AAPLFoodItem foodItemWithName:@"Wheat Bagel" calories:310],
        [AAPLFoodItem foodItemWithName:@"Bran with Raisins" calories:106],
        [AAPLFoodItem foodItemWithName:@"Regular Instant Coffee" calories:2],
        [AAPLFoodItem foodItemWithName:@"Banana" calories:110],
        [AAPLFoodItem foodItemWithName:@"Cranberry Bagel" calories:270],
        [AAPLFoodItem foodItemWithName:@"Oatmeal" calories:200],
        [AAPLFoodItem foodItemWithName:@"Fruits Salad" calories:120],
        [AAPLFoodItem foodItemWithName:@"Fried Sea Bass" calories:300],
        [AAPLFoodItem foodItemWithName:@"Chips" calories:220],
        [AAPLFoodItem foodItemWithName:@"Chicken Taco" calories:180]
    ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.foodItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:AAPLFoodPickerViewControllerTableViewCellIdentifier forIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    AAPLFoodItem *foodItem = self.foodItems[indexPath.row];
    
    cell.textLabel.text = foodItem.name;
    
    NSEnergyFormatter *energyFormatter = [self energyFormatter];
    cell.detailTextLabel.text = [energyFormatter stringFromValue:foodItem.calories unit:NSEnergyFormatterUnitKilocalorie];
}

#pragma mark - Convenience

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:AAPLFoodPickerViewControllerUnwindSegueIdentifier]) {
        NSIndexPath *indexPathForSelectedRow = self.tableView.indexPathForSelectedRow;

        self.selectedFoodItem = self.foodItems[indexPathForSelectedRow.row];
    }
}

- (NSEnergyFormatter *)energyFormatter {
    static NSEnergyFormatter *energyFormatter;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        energyFormatter = [[NSEnergyFormatter alloc] init];
        energyFormatter.unitStyle = NSFormattingUnitStyleLong;
        energyFormatter.forFoodEnergyUse = YES;
        energyFormatter.numberFormatter.maximumFractionDigits = 0;
    });
    
    return energyFormatter;
}

@end
