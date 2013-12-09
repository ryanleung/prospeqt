// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMSession.m instead.

#import "_PMSession.h"

const struct PMSessionAttributes PMSessionAttributes = {
	.apiToken = @"apiToken",
};

const struct PMSessionRelationships PMSessionRelationships = {
};

const struct PMSessionFetchedProperties PMSessionFetchedProperties = {
};

@implementation PMSessionID
@end

@implementation _PMSession

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Session" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Session";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Session" inManagedObjectContext:moc_];
}

- (PMSessionID*)objectID {
	return (PMSessionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic apiToken;











@end
