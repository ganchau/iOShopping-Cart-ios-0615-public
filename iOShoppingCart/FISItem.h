//
//  FISItem.h
//  iOShoppingCart
//
//  Created by Gan Chau on 6/5/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FISItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *price;

// designated initializer
- (instancetype)initWithName:(NSString *)name andPrice:(NSNumber *)price;

@end
