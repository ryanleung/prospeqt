//
//  PMKeychain.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/20/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMKeychain.h"
#import "SSKeychainQuery.h"

static PMKeychain *pm_keychain_instance = nil;

@implementation PMKeychain {
    NSString *_authenticationToken;
    NSString *_userEmail;
}

+ (instancetype)keychain
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pm_keychain_instance = [self new];
    });
    return pm_keychain_instance;
}

#pragma mark - Properties

- (void)setAuthenticationToken:(NSString *)authenticationToken
{
    [self willChangeValueForKey:kPMKeychainTokenKey];
    _authenticationToken = [authenticationToken copy];
    
    if (!_authenticationToken) {
        [self deleteKeychainItem:kPMKeychainTokenKey];
    } else {
        [self saveStringValue:_authenticationToken keychainItem:kPMKeychainTokenKey];
    }
    [self didChangeValueForKey:kPMKeychainTokenKey];
}

- (NSString *)authenticationToken
{
    if (!_authenticationToken) {
        _authenticationToken = [self stringValueForKeychainItem:kPMKeychainTokenKey];
    }
    
    return _authenticationToken;
}

- (void)setUserEmail:(NSString *)userEmail
{
    [self willChangeValueForKey:kPMKeychainUserEmailKey];
    _userEmail = [userEmail copy];
    
    if (! _userEmail) {
        [self deleteKeychainItem:kPMKeychainUserEmailKey];
    } else {
        [self saveStringValue:userEmail keychainItem:kPMKeychainUserEmailKey];
    }
    [self didChangeValueForKey:kPMKeychainUserEmailKey];
}

- (NSString *)userEmail
{
    if (!_userEmail) {
        _userEmail = [self stringValueForKeychainItem:kPMKeychainUserEmailKey];
    }
    return _userEmail;
}

#pragma mark - Keychain Access

- (SSKeychainQuery *)defaultQuery
{
    SSKeychainQuery *query = [SSKeychainQuery new];
//#if PMStaging
//    query.service = [kLUVKeychainServiceName stringByAppendingString:@"-beta"];
//#else
    query.service = kPMKeychainServiceName;
//#endif
    return query;
}

- (void)deleteKeychainItem:(NSString *)itemKey
{
    SSKeychainQuery *query = [self defaultQuery];
    query.account = itemKey;
    
    NSError *error = nil;
    if (![query deleteItem:&error]) {
        NSLog(@"Could not delete key [%@] from keychain: %@", itemKey, [error localizedDescription]);
    }
}

- (void)saveStringValue:(NSString *)stringValue keychainItem:(NSString *)itemKey
{
    SSKeychainQuery *query = [self defaultQuery];
    query.account = itemKey;
    query.password = stringValue;
    
    NSError *error = nil;
    if (![query save:&error]) {
        NSLog(@"Could not save key [%@] from keychain: %@", itemKey, [error localizedDescription]);
    }
}

- (NSString *)stringValueForKeychainItem:(NSString *)itemKey
{
    NSString *stringValue = nil;
    
    SSKeychainQuery *query = [self defaultQuery];
    query.account = itemKey;
    
    NSError *error = nil;
    if ([query fetch:&error]) {
        stringValue = query.password;
    } else {
        NSLog(@"Could not fetch key [%@] from keychain: %@", itemKey, [error localizedDescription]);
    }
    
    return stringValue;
}

@end
