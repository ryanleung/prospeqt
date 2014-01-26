// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessageChain.m instead.

#import "_PMMessageChain.h"

const struct PMMessageChainAttributes PMMessageChainAttributes = {
	.inquirerId = @"inquirerId",
	.messageChainId = @"messageChainId",
	.sellerId = @"sellerId",
};

const struct PMMessageChainRelationships PMMessageChainRelationships = {
	.listing = @"listing",
	.messages = @"messages",
	.seller = @"seller",
};

const struct PMMessageChainFetchedProperties PMMessageChainFetchedProperties = {
};

@implementation PMMessageChainID
@end

@implementation _PMMessageChain

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"MessageChain" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"MessageChain";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"MessageChain" inManagedObjectContext:moc_];
}

- (PMMessageChainID*)objectID {
	return (PMMessageChainID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"inquirerIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inquirerId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"messageChainIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"messageChainId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"sellerIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sellerId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic inquirerId;



- (int32_t)inquirerIdValue {
	NSNumber *result = [self inquirerId];
	return [result intValue];
}

- (void)setInquirerIdValue:(int32_t)value_ {
	[self setInquirerId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveInquirerIdValue {
	NSNumber *result = [self primitiveInquirerId];
	return [result intValue];
}

- (void)setPrimitiveInquirerIdValue:(int32_t)value_ {
	[self setPrimitiveInquirerId:[NSNumber numberWithInt:value_]];
}





@dynamic messageChainId;



- (int32_t)messageChainIdValue {
	NSNumber *result = [self messageChainId];
	return [result intValue];
}

- (void)setMessageChainIdValue:(int32_t)value_ {
	[self setMessageChainId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMessageChainIdValue {
	NSNumber *result = [self primitiveMessageChainId];
	return [result intValue];
}

- (void)setPrimitiveMessageChainIdValue:(int32_t)value_ {
	[self setPrimitiveMessageChainId:[NSNumber numberWithInt:value_]];
}





@dynamic sellerId;



- (int32_t)sellerIdValue {
	NSNumber *result = [self sellerId];
	return [result intValue];
}

- (void)setSellerIdValue:(int32_t)value_ {
	[self setSellerId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSellerIdValue {
	NSNumber *result = [self primitiveSellerId];
	return [result intValue];
}

- (void)setPrimitiveSellerIdValue:(int32_t)value_ {
	[self setPrimitiveSellerId:[NSNumber numberWithInt:value_]];
}





@dynamic listing;

	

@dynamic messages;

	
- (NSMutableOrderedSet*)messagesSet {
	[self willAccessValueForKey:@"messages"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"messages"];
  
	[self didAccessValueForKey:@"messages"];
	return result;
}
	

@dynamic seller;

	






@end
