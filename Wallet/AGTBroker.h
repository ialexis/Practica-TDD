//
//  AGTBroker.h
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 10/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTMoney.h"

@interface AGTBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;


-(AGTMoney*)reduce:(id<AGTMoney>) money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency;

-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency;
@end
