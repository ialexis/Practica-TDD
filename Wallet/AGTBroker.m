//
//  AGTBroker.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 10/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import "AGTBroker.h"
#import "AGTMoney.h"

@interface AGTBroker ()

@end
@implementation AGTBroker

-(id) init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(AGTMoney*)reduce:(id<AGTMoney>) money
         toCurrency:(NSString *) currency{
 
    // double dispatch
    return [money reduceToCurrency:currency
                        withBroker:self];
    
}

-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*)fromCurrency
     toCurrency:(NSString*)toCurrency{
    
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    NSNumber *invRate =@(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
    
    
}




#pragma mark -  utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}





















@end
