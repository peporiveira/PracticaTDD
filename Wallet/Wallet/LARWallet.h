//
//  LARWallet.h
//  Wallet
//
//  Created by LUIS APARICIO RAMIREZ on 26/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LARMoney.h"

@interface LARWallet : NSObject<LARMoney>
@property (nonatomic, readonly) NSUInteger count;

- (id<LARMoney>) addMoney: (LARMoney *) other;
- (id<LARMoney>) takeMoney: (LARMoney *) other;

- (void) subscribeToMemoryWarning: (NSNotificationCenter *) nc;

@end

