//
//  AGTWalletTests.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 10/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTMoney.h"
#import "AGTBroker.h"
#import "AGTWallet.h"
@interface AGTWalletTests : XCTestCase

@end

@implementation AGTWalletTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    
    AGTBroker *broker = [AGTBroker new];
    [broker addRate: 2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:20]];
    
    AGTMoney *reduced = [broker reduce:wallet toCurrency:@"USD"];
    
    XCTAssertEqualObjects(reduced, [AGTMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1");
    
    
    
}
-(void) testGetMoneyWithCurrencyFine
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:20]];
    AGTMoney *euros = [wallet getMoneyWithCurrency: @"EUR"];
    XCTAssertEqualObjects(euros, [AGTMoney euroWithAmount:40], @"€40");
    
}

-(void) testGetMoneyWithCurrencyNotFine
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus: [AGTMoney dollarWithAmount:20]];
    AGTMoney *euros = [wallet getMoneyWithCurrency: @"USD"];
    XCTAssertNotEqualObjects(euros, [AGTMoney euroWithAmount:40], @"€40");
    
}
-(void) testAddMoneyToExistingCurrency
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet addMoney:[AGTMoney euroWithAmount:20]];
    
    AGTMoney *euros = [wallet getMoneyWithCurrency: @"EUR"];
    
    
    XCTAssertEqualObjects(euros,[AGTMoney euroWithAmount:60] , @"40€+20€ = 60€");
}

-(void) testAddMoneyToNoExistingCurrency
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet addMoney:[AGTMoney dollarWithAmount:20]];
    
    AGTMoney *dollars = [wallet getMoneyWithCurrency: @"USD"];
    
    
    XCTAssertEqualObjects(dollars,[AGTMoney dollarWithAmount:20] , @"$0+$20 = 20$");
}


-(void) testTakeMoneyToExistingCurrency
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet takeMoney:[AGTMoney euroWithAmount:20]];
    
    AGTMoney *euros = [wallet getMoneyWithCurrency: @"EUR"];
    
    
    XCTAssertEqualObjects(euros,[AGTMoney euroWithAmount:20] , @"40€+20€ = 60€");
}
-(void) testAddTakeoNoExistingCurrency
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"EUR"];
    
    [wallet takeMoney:[AGTMoney dollarWithAmount:20]];
    
    AGTMoney *dollars = [wallet getMoneyWithCurrency: @"USD"];
    
    
    XCTAssertEqualObjects(dollars,[AGTMoney dollarWithAmount:-20] , @"$0+$20 = 20$");
}
-(void) testCountOfDollars
{
    AGTWallet *wallet = [[AGTWallet alloc] initWithAmount:40 currency:@"USD"];
    [wallet takeMoney:[AGTMoney dollarWithAmount:20]];
    NSInteger count = [wallet countOfMoneyWithCurrency:@"USD"];
    NSInteger nsi1 = [[NSNumber numberWithInt:2]integerValue] ;
    NSInteger nsi2 = [[NSNumber numberWithInt:4]integerValue] ;
    
    XCTAssertEqual(count,nsi1,@"count of dollars must be two");
    XCTAssertNotEqual(count,nsi2,@"count of dollars dont must be 4");

}
@end
