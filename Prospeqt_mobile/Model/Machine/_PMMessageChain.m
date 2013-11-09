// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessageChain.m instead.

#import "_PMMessageChain.h"

const struct PMMessageChainAttributes PMMessageChainAttributes = {
	.dirty = @"dirty",
	.lastUpdated = @"lastUpdated",
	.messageChainId = @"messageChainId",
};

const struct PMMessageChainRelationships PMMessageChainRelationships = {
	.inquirer = @"inquirer",
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
	
	if ([key isEqualToString:@"dirtyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dirty"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"messageChainIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"messageChainId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic dirty;



- (BOOL)dirtyValue {
	NSNumber *result = [self dirty];
	return [result boolValue];
}

- (void)setDirtyValue:(BOOL)value_ {
	[self setDirty:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveDirtyValue {
	NSNumber *result = [self primitiveDirty];
	return [result boolValue];
}

- (void)setPrimitiveDirtyValue:(BOOL)value_ {
	[self setPrimitiveDirty:[NSNumber numberWithBool:value_]];
}





@dynamic lastUpdated;






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





@dynamic inquirer;

	

@dynamic listing;

	

@dynamic messages;

	
- (NSMutableSet*)messagesSet {
	[self willAccessValueForKey:@"messages"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"messages"];
  
	[self didAccessValueForKey:@"messages"];
	return result;
}
	

@dynamic seller;

	






@end
