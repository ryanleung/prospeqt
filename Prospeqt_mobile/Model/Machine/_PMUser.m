// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.m instead.

#import "_PMUser.h"

const struct PMUserAttributes PMUserAttributes = {
	.avatarDataString = @"avatarDataString",
	.avatarUrl = @"avatarUrl",
	.bio = @"bio",
	.email = @"email",
	.firstName = @"firstName",
	.lastName = @"lastName",
	.location = @"location",
	.rating = @"rating",
	.userId = @"userId",
};

const struct PMUserRelationships PMUserRelationships = {
	.listings = @"listings",
	.messageChains = @"messageChains",
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
	if ([key isEqualToString:@"userIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"userId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic avatarDataString;






@dynamic avatarUrl;






@dynamic bio;






@dynamic email;






@dynamic firstName;






@dynamic lastName;






@dynamic location;






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





@dynamic userId;



- (int32_t)userIdValue {
	NSNumber *result = [self userId];
	return [result intValue];
}

- (void)setUserIdValue:(int32_t)value_ {
	[self setUserId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveUserIdValue {
	NSNumber *result = [self primitiveUserId];
	return [result intValue];
}

- (void)setPrimitiveUserIdValue:(int32_t)value_ {
	[self setPrimitiveUserId:[NSNumber numberWithInt:value_]];
}





@dynamic listings;

	
- (NSMutableSet*)listingsSet {
	[self willAccessValueForKey:@"listings"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"listings"];
  
	[self didAccessValueForKey:@"listings"];
	return result;
}
	

@dynamic messageChains;

	
- (NSMutableOrderedSet*)messageChainsSet {
	[self willAccessValueForKey:@"messageChains"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"messageChains"];
  
	[self didAccessValueForKey:@"messageChains"];
	return result;
}
	






@end
