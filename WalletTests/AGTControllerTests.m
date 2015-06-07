//
//  AGTControllerTests.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 11/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AGTSimpleViewController.h"
#import "AGTWalletTableViewController.h"
#import "AGTWallet.h"

@interface AGTControllerTests : XCTestCase
@property (nonatomic, strong) AGTSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) AGTWalletTableViewController *walletVC;
@property (nonatomic, strong) AGTWallet *wallet;
@end

@implementation AGTControllerTests

- (void)setUp
{
    [super setUp];
    // Creamos el entorno de laboratorio
 //   self.simpleVC = [[AGTSimpleViewController alloc] initWithNibName:nil bundle:nil];
 //   self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
 //   [self.button setTitle:@"Hola" forState:UIControlStateNormal];
 //   self.label = [[UILabel alloc] initWithFrame:CGRectZero];
 //   self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[AGTWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[AGTMoney euroWithAmount:1]];
    
    self.walletVC = [[AGTWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown
{
    [super tearDown];
    // Lo destruimos
  //  self.simpleVC = nil;
   // self.button = nil;
   // self.label = nil;
}


-(void) testThatTablehasOneSection{
    
    NSInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, 1, @"There can only be one!");
    
}

-(void) testThatNumberOfCellsIsNumberOfMoneysPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1,
                   [self.walletVC tableView:nil numberOfRowsInSection:0],
                   @"Number of cells is the number of moneys plus 1 (the total)");
    
}
















@end
