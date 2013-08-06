//
//  CalculatorModel.m
//  Calculator
//
//  Created by Aleksandr Rogozin on 8/5/13.
//  Copyright (c) 2013 arg. All rights reserved.
//

#import "CalculatorModel.h"

@interface CalculatorModel ()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorModel
@synthesize operandStack = _operandStack;

// Lazy instantiation
- (NSMutableArray *)operandStack
{
    if (_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

- (void) pushOperand:(double) operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if (operandObject)
    {
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}

- (double) performOperation:(NSString *) operation
{
    double result = 0;
    
    if ([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    else if ([operation isEqualToString:@"*"])
    {
        result = [self popOperand] * [self popOperand];
    }
    else if ([operation isEqualToString:@"/"])
    {
        result = [self popOperand] / [self popOperand];
    }
    else if ([operation isEqualToString:@"-"])
    {
        result = [self popOperand] - [self popOperand];
    }
    
    [self pushOperand:result];
    
    // calculate result
    return result;
}

@end
