// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessage.m instead.

#import "_PMMessage.h"

const struct PMMessageAttributes PMMessageAttributes = {
	.content = @"content",
	.messageId = @"messageId",
	.senderId = @"senderId",
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
	
	if ([key isEqualToString:@"messageIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"messageId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"senderIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"senderId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic content;






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





@dynamic senderId;



- (int32_t)senderIdValue {
	NSNumber *result = [self senderId];
	return [result intValue];
}

- (void)setSenderIdValue:(int32_t)value_ {
	[self setSenderId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveSenderIdValue {
	NSNumber *result = [self primitiveSenderId];
	return [result intValue];
}

- (void)setPrimitiveSenderIdValue:(int32_t)value_ {
	[self setPrimitiveSenderId:[NSNumber numberWithInt:value_]];
}





@dynamic time;






@dynamic type;






@dynamic messageChain;

	






@end
