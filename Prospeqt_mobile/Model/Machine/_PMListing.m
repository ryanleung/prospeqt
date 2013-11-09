// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.m instead.

#import "_PMListing.h"

const struct PMListingAttributes PMListingAttributes = {
	.city = @"city",
	.date = @"date",
	.info = @"info",
	.listingId = @"listingId",
	.messages = @"messages",
	.picData = @"picData",
	.picUrl = @"picUrl",
	.price = @"price",
	.smallPicData = @"smallPicData",
	.smallPicUrl = @"smallPicUrl",
	.sold = @"sold",
	.state = @"state",
	.title = @"title",
};

const struct PMListingRelationships PMListingRelationships = {
	.messageChain = @"messageChain",
	.user = @"user",
};

const struct PMListingFetchedProperties PMListingFetchedProperties = {
};

@implementation PMListingID
@end

@implementation _PMListing

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Listing" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Listing";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Listing" inManagedObjectContext:moc_];
}

- (PMListingID*)objectID {
	return (PMListingID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"listingIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"listingId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"messagesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"messages"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"soldValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sold"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic city;






@dynamic date;






@dynamic info;






@dynamic listingId;



- (int32_t)listingIdValue {
	NSNumber *result = [self listingId];
	return [result intValue];
}

- (void)setListingIdValue:(int32_t)value_ {
	[self setListingId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveListingIdValue {
	NSNumber *result = [self primitiveListingId];
	return [result intValue];
}

- (void)setPrimitiveListingIdValue:(int32_t)value_ {
	[self setPrimitiveListingId:[NSNumber numberWithInt:value_]];
}





@dynamic messages;



- (int32_t)messagesValue {
	NSNumber *result = [self messages];
	return [result intValue];
}

- (void)setMessagesValue:(int32_t)value_ {
	[self setMessages:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMessagesValue {
	NSNumber *result = [self primitiveMessages];
	return [result intValue];
}

- (void)setPrimitiveMessagesValue:(int32_t)value_ {
	[self setPrimitiveMessages:[NSNumber numberWithInt:value_]];
}





@dynamic picData;






@dynamic picUrl;






@dynamic price;






@dynamic smallPicData;






@dynamic smallPicUrl;






@dynamic sold;



- (BOOL)soldValue {
	NSNumber *result = [self sold];
	return [result boolValue];
}

- (void)setSoldValue:(BOOL)value_ {
	[self setSold:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSoldValue {
	NSNumber *result = [self primitiveSold];
	return [result boolValue];
}

- (void)setPrimitiveSoldValue:(BOOL)value_ {
	[self setPrimitiveSold:[NSNumber numberWithBool:value_]];
}





@dynamic state;






@dynamic title;






@dynamic messageChain;

	
- (NSMutableOrderedSet*)messageChainSet {
	[self willAccessValueForKey:@"messageChain"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"messageChain"];
  
	[self didAccessValueForKey:@"messageChain"];
	return result;
}
	

@dynamic user;

	






@end
