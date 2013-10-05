//
//  PMNetworkController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMNetworkController.h"


@implementation PMNetworkController

#pragma mark - Authentication

//- (BOOL)sessionInvalid
//{
//    return [LUVKeychain keychain].authenticationToken == nil || [LUVKeychain keychain].username == nil;
//}

- (void)authenticateIfNeededAndLoadData:(id<PMDataLoadProtocol>)dataLoader
{
    if ([dataLoader needsUserAuthentication]){// && [self sessionInvalid]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kPMNotificationUserNeedsAuthenticated object:dataLoader];
        });
    } else {
        [dataLoader loadData];
    }
}

@end
