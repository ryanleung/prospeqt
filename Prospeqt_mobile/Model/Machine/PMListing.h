#import "_PMListing.h"

@interface PMListing : _PMListing {}

+ (NSString *)formattedDate:(NSDate *)date;

- (NSString *)priceFormatted;

/**
 The imageUrls will be urls of images we store in
 the Amazon server.
 */

@end
