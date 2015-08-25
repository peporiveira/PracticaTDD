//
//  LARMoney.h
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LARMoney;
@class LARBroker;

@protocol LARMoney <NSObject>

- (id) initWithAmount: (NSInteger) amount
             currency: (NSString *) currency;
- (LARMoney *)reduceToCurrency: (NSString *) currency
                    withBroker: (LARBroker *) broker;

@end

@interface LARMoney : NSObject<LARMoney>

@property (nonatomic, readonly) NSString *currency;
@property (nonatomic, strong, readonly) NSNumber *amount;

+ (id) euroWithAmount: (NSInteger) amount;
+ (id) dollarWithAmount: (NSInteger) amount;

- (id<LARMoney>) times: (NSUInteger) multiplier;
- (id<LARMoney>) plus: (LARMoney *) other;
- (id<LARMoney>) minus: (LARMoney *) other;

@end
