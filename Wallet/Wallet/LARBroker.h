//
//  LARBroker.h
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LARMoney.h"

@interface LARBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

- (id<LARMoney>)reduce: (id<LARMoney>) money
            toCurrency: (NSString *) currency;

- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency;

- (NSString *) keyFromCurrency: fromCurrency
                    toCurrency: (NSString *) toCurrency;

- (void) parseJSONRates: (NSData *) json;


@end
