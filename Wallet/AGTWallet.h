//
//  AGTWallet.h
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 10/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTWallet : NSObject<AGTMoney>

-(AGTMoney *) getMoneyWithCurrency:(NSString *)currency;
-(void) addMoney:(AGTMoney *)money;
-(void) takeMoney:(AGTMoney *)money;

-(NSInteger) countOfMoneyWithCurrency:(NSString *)currency;

@end
