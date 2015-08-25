//
//  WalletTests.m
//  WalletTests
//
//  Created by LUIS APARICIO RAMIREZ on 25/8/15.
//  Copyright (c) 2015 iKale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "LAREuro.h"

@interface LAREuroTests : XCTestCase

@end

@implementation LAREuroTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testMultiplication{
    
    LAREuro *five = [[LAREuro alloc] initWithAmount:5];
    LAREuro *total = [five times:2];
    
    XCTAssertEqual(10, total.amount, @"5*2 should be 10");
}

- (void) testEquality{
    
    LAREuro *five = [[LAREuro alloc] initWithAmount:5];
    LAREuro *ten = [[LAREuro alloc] initWithAmount:10];
    
    LAREuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"Equivalent objects should be equal");
}

@end
