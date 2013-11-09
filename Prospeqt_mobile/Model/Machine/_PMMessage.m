// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessage.m instead.

#import "_PMMessage.h"

const struct PMMessageAttributes PMMessageAttributes = {
	.content = @"content",
	.inquirerId = @"inquirerId",
	.listingId = @"listingId",
	.messageId = @"messageId",
	.sellerId = @"sellerId",
	.time = @"time",
	.type = @"type",
};

const struct PMMessageRelationships PMMessageRelationships = {
	.messageChain = @"messageChain",
};

const struct PMMessageFetchedProperties PMMessageFetchedProperties = {
};

@implementation PMMessageID
@end

@implementation _PMMessage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Message";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Message" inManagedObjectContext:moc_];
}

- (PMMessageID*)objectID {
	return (PMMessageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"inquirerIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inquirerId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"listingIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"listingId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"messageIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"messageId"];
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




@dynamic content;






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





@dynamic messageId;



- (int32_t)messageIdValue {
	NSNumber *result = [self messageId];
	return [result intValue];
}

- (void)setMessageIdValue:(int32_t)value_ {
	[self setMessageId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMessageIdValue {
	NSNumber *result = [self primitiveMessageId];
	return [result intValue];
}

- (void)setPrimitiveMessageIdValue:(int32_t)value_ {
	[self setPrimitiveMessageId:[NSNumber numberWithInt:value_]];
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





@dynamic time;






@dynamic type;






@dynamic messageChain;

	






@end
