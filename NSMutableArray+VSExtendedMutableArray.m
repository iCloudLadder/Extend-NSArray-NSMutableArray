//
//  NSMutableArray+VSExtendedMutableArray.m
//  NSArrayCategory
//
//  Created by VS on 15/1/6.
//  Copyright (c) 2015年 VS. All rights reserved.
//

#import "NSMutableArray+VSExtendedMutableArray.h"

@implementation NSMutableArray (VSExtendedMutableArray)

- (BOOL)removeFirstValue
{
    return [self removeValueAtIndex:0];
}

- (BOOL)removeValueAtIndex:(NSInteger)index
{
    index = [self checkIndex:index];
    if (index != kVSArrayErrorIndex) {
        [self removeObjectAtIndex:index];
        return YES;
    }
    return NO;
}


- (BOOL)addValue:(id)aValue
{
    if (aValue) {
        [self addObject:aValue];
        return YES;
    }
    return NO;
}


- (BOOL)setValue:(id)aValue atIndexedSubscript:(NSInteger)index
{
    index = [self checkIndex:index];
    if (index != kVSArrayErrorIndex && aValue) {
        self[index] = aValue;
        return YES;
    }
    return NO;
}


- (BOOL)insertValue:(id)aValue atIndex:(NSInteger)index
{
    return [self insertValue:aValue atIndex:index beyondBoundsLess:YES beyondBoundsMore:YES];
}

- (BOOL)insertValue:(id)aValue atIndex:(NSInteger)index beyondBoundsLess:(BOOL)insertValueAtFirstIndex beyondBoundsMore:(BOOL)insertValueAtLastIndex
{
    NSUInteger count = [self count];
    if (!aValue || (index > count && !insertValueAtLastIndex) || (index < 0 && !insertValueAtFirstIndex)) {
        return NO;
    }
    
    index = MIN(MAX(index, 0), (count - 1));
    [self insertObject:aValue atIndex:index];
    return YES;
}


- (BOOL)replaceValueAtIndex:(NSInteger)index withValue:(id)aValue
{
    index = [self checkIndex:index];
    if (!aValue || index == kVSArrayErrorIndex) {
        return NO;
    }
    
    [self replaceObjectAtIndex:index withObject:aValue];
    return YES;
}

- (BOOL)exchangeValueAtIndex:(NSInteger)idx1 withVlaueAtIndex:(NSInteger)idx2
{
    idx1 = [self checkIndex:idx1];
    idx2 = [self checkIndex:idx2];
    if (idx1 != kVSArrayErrorIndex && idx2 != kVSArrayErrorIndex) {
        [self exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
        return YES;
    }
    return NO;
}

- (BOOL)removeValue:(id)aValue inRange:(NSRange)range
{
    range = [self getRangeNotBeyondBoundsWith:range];
    if (range.length == 0 || !aValue) {
        return NO;
    }
    
    [self removeObject:aValue inRange:range];
    return YES;
}

- (BOOL)removeValueIdenticalTo:(id)aValue inRange:(NSRange)range
{
    range = [self getRangeNotBeyondBoundsWith:range];
    if (range.length == 0 || !aValue) {
        return NO;
    }
    
    [self removeObjectIdenticalTo:aValue inRange:range];
    return YES;
}

- (BOOL)removeValuesInRange:(NSRange)range
{
    range = [self getRangeNotBeyondBoundsWith:range];
    if (range.length == 0) {
        return NO;
    }
    
    [self removeObjectsInRange:range];
    return YES;
}


- (BOOL)replaceValuesInRange:(NSRange)range withValuesFromArray:(NSArray *)otherArray
{
    return [self replaceValuesInRange:range withVlauesFromArray:otherArray range:NSMakeRange(0, [otherArray count])];
}

- (BOOL)replaceValuesInRange:(NSRange)range withVlauesFromArray:(NSArray *)otherArray range:(NSRange)otherRange
{
    range = [self getRangeNotBeyondBoundsWith:range];
    otherRange = [otherArray getRangeNotBeyondBoundsWith:otherRange];
    if (range.length == 0) {
        return NO;
    }
    
    [self replaceObjectsInRange:range withObjectsFromArray:otherArray range:otherRange];
    return YES;
}



@end
