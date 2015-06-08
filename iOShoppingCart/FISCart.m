//
//  FISCart.m
//  iOShoppingCart
//
//  Created by Gan Chau on 6/5/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISCart.h"

@implementation FISCart

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _items = [@[] mutableCopy];
    }
    
    return self;
}

- (NSNumber *)total
{
    NSUInteger total = 0;
    for (FISItem *item in self.items) {
        total+= [item.price integerValue];
    }
    
    return @(total);
}

- (NSNumber *)numOfItems
{
    return @(self.items.count);
}

- (void)addItem:(FISItem *)newItem
{
    [self.items addObject:newItem];
}

- (void)removeItem:(FISItem *)itemToRemove
{
    for (int i = 0; i < self.items.count; i++) {
        if ([self.items[i] isEqual:itemToRemove]) {
            [self.items removeObjectAtIndex:i];
            break;
        }
    }
}

- (NSArray *)itemsSortedByName
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortDescriptor]];
    NSLog(@"%@", self.items);
    return sortedArray;
}

- (NSArray *)itemsSortedByPrice
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"price" ascending:YES];
    NSArray *sortedArray = [self.items sortedArrayUsingDescriptors:@[sortDescriptor]];
    return sortedArray;
}

- (NSArray *)itemsWithName:(NSString *)name
{
    NSMutableArray *itemsWithSameName = [@[] mutableCopy];
    for (FISItem *item in self.items) {
        if ([item.name isEqualToString:name]) {
            [itemsWithSameName addObject:item];
        }
    }
    return [itemsWithSameName copy];
}

- (NSArray *)itemsMoreExpensiveThan:(NSNumber *)price
{
    NSMutableArray *itemsMoreExpensive = [@[] mutableCopy];
    for (FISItem *item in self.items) {
        if ([item.price integerValue] > [price integerValue]) {
            [itemsMoreExpensive addObject:item];
        }
    }
    return [itemsMoreExpensive copy];
}

- (NSString *)description
{
    NSCountedSet *itemsWithQuantity = [[NSCountedSet alloc] initWithArray:self.items];
    NSMutableString *string = [@"\n" mutableCopy];
    NSNumber *total = @0;
    
    for (FISItem *item in itemsWithQuantity) {
        NSNumber *quantity = @([itemsWithQuantity countForObject:item]);
        NSNumber *price = @([item.price integerValue] * [quantity integerValue]);
        total = @([total integerValue] + [price integerValue]);
        int quantitySpace = 5 - (int)[quantity stringValue].length;
        int nameSpace = 15 - (int)item.name.length;
        int priceSpace = 5 - (int)[price stringValue].length;
        
        NSString *lineItem = [NSString stringWithFormat:@"\n%*s%@ %@%*s%*s%@",
                              quantitySpace,
                              " ",
                              quantity,
                              item.name,
                              nameSpace,
                              " ",
                              priceSpace,
                              " ",
                              price];
        
        [string appendString:lineItem];
    }
    
    int totalSpace = 15 - (int)[total stringValue].length;
    [string appendFormat:@"\n    ----------------------\n      Total%*s%@\n\n", totalSpace, " ", total];
    
    return string;
}

@end
