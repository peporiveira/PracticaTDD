//
//  LARMoney.m
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import "LARMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "LARBroker.h"

@interface LARMoney ()

@property (nonatomic, strong) NSNumber *amount;

@end

@implementation LARMoney

+ (instancetype) euroWithAmount: (NSInteger) amount{
    return [[LARMoney alloc] initWithAmount:amount
                                   currency:@"EUR"];
}
+ (instancetype) dollarWithAmount: (NSInteger) amount{
    return [[LARMoney alloc] initWithAmount:amount
                                   currency:@"USD"];
}

- (id) initWithAmount: (NSInteger) amount
             currency: (NSString *) currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}


- (id<LARMoney>) times: (NSUInteger) multiplier{
    return [[LARMoney alloc] initWithAmount:[self.amount integerValue] * multiplier
                                   currency:self.currency];
}

- (id<LARMoney>) plus: (LARMoney *) other{
    return [[LARMoney alloc] initWithAmount:([self.amount integerValue] + [[other amount] integerValue])
                                   currency:self.currency];
}

- (id<LARMoney>) minus: (LARMoney *) other{
    if ([other.amount integerValue] > [self.amount integerValue]) {
        [NSException raise:@"TryingToSubstractBiggestAmountThanExistingException"
                    format:@"Imposible to substract %@ %@ form %@ %@", other.amount, other.currency, self.amount, self.currency];
        
    }
    return [[LARMoney alloc] initWithAmount:([self.amount integerValue] - [[other amount] integerValue])
                                   currency:self.currency];
}

- (LARMoney *)reduceToCurrency: (NSString *) currency
                    withBroker: (LARBroker *) broker{
    LARMoney *result;
    double rate = [[broker.rates objectForKey:[broker keyFromCurrency:self.currency
                                                           toCurrency:currency]] doubleValue];
    
    // Comprobamos si divisa de origen y destino son iguales
    if ([self.currency isEqual:currency]) {
        result = self;
    }
    else if (rate == 0){
        // No hay tasa de conversion, lanzar excepcion
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversion for %@ to %@", self.currency, currency];
    }
    else{
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[LARMoney alloc] initWithAmount:newAmount
                                         currency:currency];
    }
    return result;
}


#pragma mark - Overwritten

- (NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>", [self class], [self currency], [self amount]];
}

- (BOOL) isEqual:(id)object{
    if ([[self currency] isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
}

// Siempre que se implemente "isEqual", se debe implamentar "hash"
// Todos los objetos que devuelvan "true" en "isEqual", deben tener el mismo Hash
- (NSUInteger) hash{
    return [self.amount integerValue];
}


@end
