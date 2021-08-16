The solution of the DP problem is limited to the upper limit of the fixed space.
We should use dynamically allocated memory.
The size of the memory should be a multiple of 2.

There is a very cool define I found,
#define kroundup32(x) (--(x), (x)|=(x)>>1, (x)|=(x)>>2, (x)|=(x)>>4, (x)|=(x)>>8, (x)|=(x)>>16, ++(x))
Ref. https://github.com/attractivechaos/klib/blob/master/kstring.h

Ex:
If x=8, then the allocated memory is 8.
If x=12, then the allocated memory is 16.
If x=17, then the allocated memory is 32.

