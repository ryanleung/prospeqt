// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.m instead.

#import "_PMUser.h"

const struct PMUserAttributes PMUserAttributes = {
	.username = @"username",
};

const struct PMUserRelationships PMUserRelationships = {
	.listings = @"listings",
};

const struct PMUserFetchedProperties PMUserFetchedProperties = {
};

@implementation PMUserID
@end

@implementation _PMUser

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"User";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"User" inManagedObjectContext:moc_];
}

- (PMUserID*)objectID {
	return (PMUserID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic username;






@dynamic listings;

	






@end
