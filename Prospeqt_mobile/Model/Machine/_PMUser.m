// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.m instead.

#import "_PMUser.h"

const struct PMUserAttributes PMUserAttributes = {
	.city = @"city",
	.info = @"info",
	.rating = @"rating",
	.state = @"state",
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
	
	if ([key isEqualToString:@"ratingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic city;






@dynamic info;






@dynamic rating;



- (int16_t)ratingValue {
	NSNumber *result = [self rating];
	return [result shortValue];
}

- (void)setRatingValue:(int16_t)value_ {
	[self setRating:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRatingValue {
	NSNumber *result = [self primitiveRating];
	return [result shortValue];
}

- (void)setPrimitiveRatingValue:(int16_t)value_ {
	[self setPrimitiveRating:[NSNumber numberWithShort:value_]];
}





@dynamic state;






@dynamic username;






@dynamic listings;

	
- (NSMutableSet*)listingsSet {
	[self willAccessValueForKey:@"listings"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"listings"];
  
	[self didAccessValueForKey:@"listings"];
	return result;
}
	






@end
