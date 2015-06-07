//
//  AGTControllerTests.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 11/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AGTControllerTests : XCTestCase


@property (nonatomic, strong) AGTWalletTableViewController *walletVC;
@property (nonatomic, strong) AGTWallet *wallet;
@end

@implementation AGTControllerTests

- (void)setUp
{
    [super setUp];
    // se crea el entorno de laboratorio
    self.wallet = [[AGTWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet addMoney:[AGTMoney euroWithAmount:1]];
    
    self.walletVC = [[AGTWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown
{
    [super tearDown];

}


-(void) testThatTablehasOneSectionPorCurrency{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections,
                   3,
                   @"Number of section is the number of diferente Currencies (2-USD and EUR) plus 1 (the total)");
    
   // XCTAssertEqual(sections, 1, @"There can only be one!");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneysOfOneCurrencyPlusOne{
    
    
    [self.wallet addMoney:[AGTMoney dollarWithAmount:2]];
    
    
    //I have 2 Moneys with Dollars, First in the SetUp we add one and now we add another one money with Dollars. So the number of cells must be 3 (number of moneys plus 1 (The total)
    XCTAssertEqual(3,
                   [self.walletVC tableView:nil numberOfRowsInSection:0],
                   @"Number of cells is the number of moneys plus 1 (the total)");
    
}
















@end
