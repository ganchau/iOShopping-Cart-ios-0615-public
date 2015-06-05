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
    if ([self.items containsObject:itemToRemove]) {
        [self.items removeObject:itemToRemove];
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

@end
