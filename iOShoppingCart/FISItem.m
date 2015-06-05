//
//  FISItem.m
//  iOShoppingCart
//
//  Created by Gan Chau on 6/5/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISItem.h"

@implementation FISItem

- (instancetype)init
{
    return [self initWithName:@"" andPrice:@0];
}

// designated initializer
- (instancetype)initWithName:(NSString *)name andPrice:(NSNumber *)price
{
    self = [super init];
    
    if (self) {
        _name = name;
        _price = price;
    }
    
    return self;
}

- (NSString *)description
{
    return self.name;
}

@end
