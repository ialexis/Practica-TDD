//
//  AGTWalletTableViewController.h
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 11/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AGTWallet;

@interface AGTWalletTableViewController : UITableViewController

-(id) initWithModel:(AGTWallet *) model;

@end
