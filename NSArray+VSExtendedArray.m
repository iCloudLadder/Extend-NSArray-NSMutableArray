//
//  NSArray+VSExtendedArray.m
//  NSArrayCategory
//
//  Created by VS on 15/1/6.
//  Copyright (c) 2015年 VS. All rights reserved.
//

#import "NSArray+VSExtendedArray.h"

#define kVSBeyondBoundsMultiple (10000)

@implementation NSArray (VSExtendedArray)

- (NSInteger)checkIndex:(NSInteger)index
{
    if (index >= 0 && index < self.count) {
        return index;
    }
    return kVSArrayErrorIndex;
}

- (NSRange)getRangeNotBeyondBoundsWith:(NSRange)otherRange
{
    NSUInteger count = [self count];
    if (count == 0) {
        return NSMakeRange(0, 0);
    }
    otherRange.location = MIN(otherRange.location, count);
    otherRange.length = (otherRange.length/count > kVSBeyondBoundsMultiple) ? 0 : otherRange.length;
    otherRange.length = MAX(0, MIN(otherRange.length, (count - otherRange.location)));
    return otherRange;
}


- (id)valueAtIndex:(NSInteger)index
{
    return [self valueAtIndexedSubscript:index];
}


- (id)valueAtIndexedSubscript:(NSInteger)index
{
    index = [self checkIndex:index];
    if (index != -1) {
        return self[index];
    }
    return nil;
}


- (id)valueIfBeyondBoundsReturnFirstOrLastValueAtIndex:(NSInteger)index
{
    NSUInteger count = [self count];
    index = MIN(MAX(index, 0), (count - 1));
    if (index >= 0) {
        return self[index];
    }
    
    return nil;
}

- (NSInteger)indexOfValue:(id)aValue inRange:(NSRange)range
{
    range = [self getRangeNotBeyondBoundsWith:range];
    if (!aValue || range.length == 0) {
        return kVSArrayErrorIndex;
    }
    NSUInteger index = [self indexOfObject:aValue inRange:range];
    return index < self.count ? index : kVSArrayErrorIndex;
}

- (NSInteger)indexOfValueIdenticalTo:(id)aValue inRange:(NSRange)range
{
    range = [self getRangeNotBeyondBoundsWith:range];
    if (!aValue || range.length == 0) {
        return kVSArrayErrorIndex;
    }
    NSUInteger index = [self indexOfObject:aValue inRange:range];
    return index < self.count ? index : kVSArrayErrorIndex;
}

- (NSArray *)subValuesWithRange:(NSRange)range
{
    range = [self getRangeNotBeyondBoundsWith:range];
    if (range.length == 0) {
        return @[];
    }
    return [self subarrayWithRange:range];
}



@end
