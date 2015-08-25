//
//  LARWallet.m
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import "LARWallet.h"

@interface LARWallet ()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation LARWallet

- (NSUInteger) count{
    return self.moneys.count;
}

- (id) initWithAmount: (NSInteger) amount
             currency: (NSString *) currency{
    if (self = [super init]) {
        LARMoney *money = [[LARMoney alloc] initWithAmount:amount
                                                  currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

- (id<LARMoney>) times: (NSUInteger) multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    for (LARMoney *each in self.moneys) {
        LARMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
    }
    self.moneys = newMoneys;
    return self;
}

- (id<LARMoney>) addMoney: (LARMoney *) other{
    [self.moneys addObject:other];
    return self;
}

- (id<LARMoney>) takeMoney: (LARMoney *) other{
    if (![self.moneys containsObject:other]) {
        [NSException raise:@"TryingToSubstractANonExistingMoneyException"
                    format:@"Imposible to substract %@ %@ form the wallet", other.amount, other.currency];
    }
    [self.moneys removeObject:other];
    return self;
}

- (LARMoney *)reduceToCurrency:(NSString *)currency
                    withBroker:(LARBroker *)broker{
    
    LARMoney *result = [[LARMoney alloc] initWithAmount:0
                                               currency:currency];
    for (LARMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency
                                          withBroker:broker]];
    }
    return result;
}

- (void) subscribeToMemoryWarning: (NSNotificationCenter *) nc{
    
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
    
}

- (void) dumpToDisk: (NSNotification *) notification{
    // Guarda las cosas en disco cuando la cosa se pknga fea
}


@end
