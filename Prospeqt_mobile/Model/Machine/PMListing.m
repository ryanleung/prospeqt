#import "PMListing.h"


@interface PMListing ()

// Private interface goes here.
@property (nonatomic, strong) NSNumberFormatter *priceFormatter;

@end


@implementation PMListing

@synthesize priceFormatter = _priceFormatter;

+ (NSString *)formattedDate:(NSDate *)date
{
    NSTimeInterval timeSinceDate = [[NSDate date] timeIntervalSinceDate:date];
    
    if (timeSinceDate < 24.0 * 60.0 * 60.0) {
        NSUInteger hoursSinceDate = (NSUInteger)(timeSinceDate / (60.0 * 60.0));
        
        switch ((hoursSinceDate)) {
            case 1:
                return NSLocalizedString(@"listings.date.hourAgo", @"Hour Ago");
            case 0: {
                NSUInteger minutesSinceDate = (NSUInteger)(timeSinceDate / 60.0);
                NSString *minutesFormat = NSLocalizedString(@"listings.date.minutesAgoFormat", @"Minutes");
                return [NSString stringWithFormat:minutesFormat, minutesSinceDate];
            }
            default: {
                NSString *hoursFormat = NSLocalizedString(@"listings.date.hoursAgoFormat", @"Hours");
                return [NSString stringWithFormat:hoursFormat, hoursSinceDate];
            }
        }
    } else {
        NSUInteger daysSinceDate = (NSUInteger)(timeSinceDate / (60.0 * 60.0 * 24.0));
        switch (daysSinceDate) {
            case 1:
                return NSLocalizedString(@"listings.date.dayAgo", "Day");
            default: {
                NSString *daysFormat = NSLocalizedString(@"listings.date.daysAgoFormat", @"days");
                return [NSString stringWithFormat:daysFormat, daysSinceDate];
            }
        }
    }
}

- (NSString *)priceFormatted
{
    return [self.priceFormatter stringFromNumber:self.price];
}

- (NSNumberFormatter *)priceFormatter
{
    if (!_priceFormatter) {
        _priceFormatter = [NSNumberFormatter new];
        _priceFormatter.locale = [NSLocale autoupdatingCurrentLocale];
        _priceFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    }
    return _priceFormatter;
}

@end
