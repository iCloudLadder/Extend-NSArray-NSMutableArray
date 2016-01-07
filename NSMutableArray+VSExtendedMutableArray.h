//
//  NSMutableArray+VSExtendedMutableArray.h
//  NSArrayCategory
//
//  Created by VS on 15/1/6.
//  Copyright (c) 2015年 VS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+VSExtendedArray.h"

@interface NSMutableArray (VSExtendedMutableArray)


/*
 * if @index is beyond bounds, not remove, return NO
 */
- (BOOL)removeFirstValue; // default @index = 0
- (BOOL)removeValueAtIndex:(NSInteger)index;
/*
 * if @aValue is nil, not add, return NO
 */
- (BOOL)addValue:(id)aValue;

/*
 * if @aValue is nil or @index is beyond bounds, not setValue, return NO
 */
- (BOOL)setValue:(id)aValue atIndexedSubscript:(NSInteger)index;


// default both @insertValueAtFirstIndex and @insertValueAtLastIndex are YES
- (BOOL)insertValue:(id)aValue atIndex:(NSInteger)index;
/*
 * if @aValue is nil, not insert, return NO
 * if @index less than 0 and @insertValueAtFirstIndex is YES, insert @avalue at firstIndex, return YES
 * if @index beyond bounds and @insertValueAtLastIndex is YES, insert @aValue at lastIndex, return YES
 */
- (BOOL)insertValue:(id)aValue atIndex:(NSInteger)index beyondBoundsLess:(BOOL)insertValueAtFirstIndex beyondBoundsMore:(BOOL)insertValueAtLastIndex;

/*
 * if @index beyond bounds or @aValue is nil, not replace, return NO
 */
- (BOOL)replaceValueAtIndex:(NSInteger)index withValue:(id)aValue;

/*
 * if @idx1 or @idx2 beyond bounds , not exchange value, return NO
 */
- (BOOL)exchangeValueAtIndex:(NSInteger)idx1 withVlaueAtIndex:(NSInteger)idx2;

/*
 * if @aValue is nil, not remove value, return NO
 * if @range is beyond bounds, return NO
 * @method  getRangeNotBeyondBoundsWith: (NSArray+VSExtendedArray)
 */
- (BOOL)removeValue:(id)aValue inRange:(NSRange)range;

/*
 * if @aValue is nil, not remove value, return NO
 * if @range is beyond bounds, return NO
 * @method  getRangeNotBeyondBoundsWith: (NSArray+VSExtendedArray)
 */
- (BOOL)removeValueIdenticalTo:(id)aValue inRange:(NSRange)range;

/*
 * if @range is beyond bounds, return NO
 * @method  getRangeNotBeyondBoundsWith: (NSArray+VSExtendedArray)
 */
- (BOOL)removeValuesInRange:(NSRange)range;

/*
 * if @range is beyond bounds, return NO
 * @method  getRangeNotBeyondBoundsWith: (NSArray+VSExtendedArray)
 * if self in @range has values, @otherRange.location is beyond bounds, replace self values with @[] (empty array), return YES
 * if self in @range has values, (@otherRange.location + @otherRange.length) is beyond bounds, @otherRange = {@otherRange.location, lastIdex}, return YES
 */
- (BOOL)replaceValuesInRange:(NSRange)range withValuesFromArray:(NSArray *)otherArray;
- (BOOL)replaceValuesInRange:(NSRange)range withVlauesFromArray:(NSArray *)otherArray range:(NSRange)otherRange;



@end
