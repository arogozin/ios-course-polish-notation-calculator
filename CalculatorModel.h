//
//  CalculatorModel.h
//  Calculator
//
//  Created by Aleksandr Rogozin on 8/5/13.
//  Copyright (c) 2013 arg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorModel : NSObject

- (void) pushOperand:(double) operand;
- (double) performOperation:(NSString *) operation;

@end
