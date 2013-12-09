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
    NSNumber *_userid;
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

- (void)setUserid:(NSNumber *)userid
{
    [self willChangeValueForKey:kPMKeychainUseridKey];
    _userid = [userid copy];
    
    if (! _userid) {
        [self deleteKeychainItem:kPMKeychainUseridKey];
    } else {
        [self saveStringValue:[NSString stringWithFormat:@"%@", _userid] keychainItem:kPMKeychainUseridKey];
    }
    [self didChangeValueForKey:kPMKeychainUseridKey];
}

- (NSNumber *)userid
{
    if (!_userid) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        _userid = [f numberFromString:[self stringValueForKeychainItem:kPMKeychainUseridKey]];
    }
    return _userid;
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
