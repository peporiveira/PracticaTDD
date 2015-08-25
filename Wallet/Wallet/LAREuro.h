//
//  LAREuro.h
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LAREuro : NSObject

@property (nonatomic, readonly) NSInteger amount;
- (id) initWithAmount: (NSInteger) amount;

- (LAREuro *) times: (NSUInteger) multiplier;

@end
