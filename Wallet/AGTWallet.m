//
//  AGTWallet.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 10/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import "AGTWallet.h"

@interface AGTWallet ()
@property (nonatomic, strong) NSMutableArray *moneys;
@end

@implementation AGTWallet

-(id) initWithAmount:(NSInteger) amount  currency:(NSString*) currency{
    
    if (self = [super init]) {
        AGTMoney *money = [[AGTMoney alloc] initWithAmount:amount currency: currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject: money];
        
        _diferentCurrencies = [NSMutableOrderedSet new];
        [_diferentCurrencies addObject:money.currency];
        
    }
    return self;
}

-(id<AGTMoney>)plus:(AGTMoney*)money{
    
    [self.moneys addObject: money];
    return self;
}

-(id<AGTMoney>) times:(NSInteger) multiplier{
    
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity: self.moneys.count];
    
    for (AGTMoney *each in self.moneys) {
        
        AGTMoney *newMoney = [each times:multiplier];
        [newMoneys addObject: newMoney];
    }
    self.moneys = newMoneys;
    return self;
}


-(id<AGTMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(AGTBroker*) broker{
    
    AGTMoney *result = [[AGTMoney alloc] initWithAmount:0 currency:currency];
    
    for (AGTMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
    
    
}

-(AGTMoney *) getMoneyWithCurrency:(NSString *)currency
{
    
    AGTMoney *totalMoneyWithCurrency = [[AGTMoney alloc]initWithAmount:0 currency:currency];
    for (AGTMoney *each in self.moneys)
    {
        if ([each.currency isEqualToString:currency])
        {
            totalMoneyWithCurrency = [totalMoneyWithCurrency plus:each];
        }
    }
    return totalMoneyWithCurrency;
    

}

-(NSInteger) countOfMoneyWithCurrency:(NSString *)currency
{
    long totalCountOfMoneyWithCurrency = 0;
 
    for (AGTMoney *each in self.moneys)
    {
        if ([each.currency isEqualToString:currency])
        {
            totalCountOfMoneyWithCurrency++;
        }
    }
    
    return (NSInteger) totalCountOfMoneyWithCurrency;

}

-(void) addMoney:(AGTMoney *)money
{
    [self.moneys addObject:money];
    [self.diferentCurrencies addObject:money.currency];
}

-(void)takeMoney:(AGTMoney *)money
{
    
    AGTMoney *newMoney = [[AGTMoney alloc]initWithAmount:(0 - [money.amount integerValue]) currency:money.currency] ;
    
  //  [self.moneys addObject:newMoney];
    
    [self addMoney:newMoney];
}




@end
