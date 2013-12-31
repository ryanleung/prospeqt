#import "PMUser.h"


@interface PMUser ()

// Private interface goes here.

@end


@implementation PMUser

#pragma mark - Mapping

+ (RKObjectMapping *)requestMapping
{
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    
    [requestMapping addAttributeMappingsFromDictionary:@{
                                                         NSStringFromSelector(@selector(firstName)) : @"first_name",
                                                         NSStringFromSelector(@selector(lastName)) : @"last_name",
                                                         NSStringFromSelector(@selector(bio)) : @"bio",
                                                         NSStringFromSelector(@selector(email)) : @"email",
                                                         NSStringFromSelector(@selector(location)) : @"location",
                                                         NSStringFromSelector(@selector(avatarDataString)) : @"avatar_data"
//                                                         NSStringFromSelector(@selector(currentPassword)) : @"current_password",
//                                                         NSStringFromSelector(@selector(changedPassword)) : @"new_password"
                                                         }];
    
    return requestMapping;
}

@end
