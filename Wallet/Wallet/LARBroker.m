//
//  LARBroker.m
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import "LARBroker.h"
#import "LARMoney.h"

@interface LARBroker ()
@end

@implementation LARBroker

// Sobreescribimos el init de NSObject para inicializar el diccionario de rates
- (id) init{
    if (self = [super init]) {
        _rates = [@{} mutableCopy];
    }
    return self;
}

- (LARMoney *)reduce: (id<LARMoney>) money
          toCurrency: (NSString *) currency{
    
    // double dispatch
    return [money reduceToCurrency: currency
                        withBroker: self];
}

- (void) addRate: (NSInteger) rate
    fromCurrency: (NSString *) fromCurrency
      toCurrency: (NSString *) toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency: fromCurrency
                                     toCurrency: toCurrency]];
    
    [self.rates setObject:@(1.0f/rate)
                   forKey:[self keyFromCurrency: toCurrency
                                     toCurrency: fromCurrency]];
}

- (NSString *) keyFromCurrency: fromCurrency
                    toCurrency: (NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}

#pragma mark - Rates

- (void) parseJSONRates: (NSData *) json{
    
    NSError *err;
    id obj = [NSJSONSerialization JSONObjectWithData:json
                                             options:NSJSONReadingAllowFragments
                                               error:&err];
    
    if (obj != nil) {
        // Pillamos los rates y los vamos añadiendo al broker
    }else{
        // No hemos recibido nada
        [NSException raise:@"NoRatesInJSONException"
                    format:@"JSON must carry some data!"];
    }
}

@end
