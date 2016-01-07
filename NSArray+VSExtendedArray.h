//
//  NSArray+VSExtendedArray.h
//  NSArrayCategory
//
//  Created by VS on 15/1/6.
//  Copyright (c) 2015年 VS. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kVSArrayErrorIndex (-1)

@interface NSArray (VSExtendedArray)

/*
 * if @index is beyond bounds, return -1
 */
- (NSInteger)checkIndex:(NSInteger)index;



/*
 * if @otherRange.location is beyond bounds, @otherRange.location = self.count
 * if @otherRange.length is beyond bounds, @otherRange.length = 0
 * if (@otherRange.location + @otherRange.length) is beyond bounds, return {@otherRange.location, MAX(0, MIN(@otherRange.length, (self.count - @otherRange.location)))}
 */
- (NSRange)getRangeNotBeyondBoundsWith:(NSRange)otherRange;


/*
 * if @index is beyond bounds, return nil
 */
- (id)valueAtIndex:(NSInteger)index;
- (id)valueAtIndexedSubscript:(NSInteger)index;

/*
 * if @index is beyond bounds, @index = lastIndex
 * if @index is less than 0, @index = 0
 */
- (id)valueIfBeyondBoundsReturnFirstOrLastValueAtIndex:(NSInteger)index;


/*
 * if @aValue is nil, return -1
 * if @range.length == 0, return -1
 * if self does not contain @aValue, return -1
 */
- (NSInteger)indexOfValue:(id)aValue inRange:(NSRange)range;

/*
 * if @aValue is nil, return -1
 * if @range.length == 0, return -1
 * if self does not contain @aValue, return -1
 */
- (NSInteger)indexOfValueIdenticalTo:(id)aValue inRange:(NSRange)range;

/*
 * if @range is beyond bounds, return @[] (empty array)
 */
- (NSArray *)subValuesWithRange:(NSRange)range;

@end
