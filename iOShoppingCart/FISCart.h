//
//  FISCart.h
//  iOShoppingCart
//
//  Created by Gan Chau on 6/5/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISCart : NSObject

@property (nonatomic, strong) NSMutableArray *items;

- (NSNumber *)total;
- (NSNumber *)numOfItems;
- (void)addItem:(FISItem *)newItem;
- (void)removeItem:(FISItem *)itemToRemove;
- (NSArray *)itemsSortedByName;
- (NSArray *)itemsSortedByPrice;
- (NSArray *)itemsWithName:(NSString *)name;
- (NSArray *)itemsMoreExpensiveThan:(NSNumber *)price;

@end
