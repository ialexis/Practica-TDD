//
//  NSObject+GNUStepAddons.m
//  Wallet
//
//  Created by Fernando Rodríguez Romero on 07/07/14.
//  Copyright (c) 2014 Agbo. All rights reserved.
//
#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

- (id) subclassResponsibility: (SEL)aSel{
    
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    
    [NSException raise: NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self;    // not reached
    
}










@end
