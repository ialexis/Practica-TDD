//
//  AGTMoney.h
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 07/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AGTMoney;
@class AGTBroker;

@protocol AGTMoney <NSObject>

-(id)initWithAmount:(NSInteger) amount
           currency: (NSString *) currency;

-(id<AGTMoney>) times:(NSInteger) multiplier;

-(id<AGTMoney>) plus:(AGTMoney *) other;

-(id<AGTMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(AGTBroker*) broker;



@end

@interface AGTMoney : NSObject<AGTMoney>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;


@end














