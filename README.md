# Extend-NSArray-NSMutableArray
Avoid use NSArray and NSMutableArray carsh

# -1 is error @index

@index is beyond bounds, @index = -1


# Range
// maxMultiple = 10000
@range.location is beyond bounds, @range.location = Array.count
if   @range.length is beyond bounds, and not more than Array.count * maxMultiple, @range.length = Array.count
else @range.length = 0

if   @range.location +  @range.length is beyond bounds, @range.length = Array.count - @range.location
else @range.length = @range.length


# NSMutableArray
if Successful operation，return YES，else return NO.
