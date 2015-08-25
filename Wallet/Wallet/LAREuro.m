//
//  LAREuro.m
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import "LAREuro.h"

@interface LAREuro ()

@property (nonatomic) NSInteger amount;

@end

@implementation LAREuro

- (id) initWithAmount: (NSInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

- (LAREuro *) times: (NSUInteger) multiplier{
    return [[LAREuro alloc] initWithAmount:self.amount * multiplier];
}

#pragma mark - Overwritten

- (BOOL)isEqual:(id)object{
    return YES;
    //    return [self amount] == [object amount];
}


@end
