// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.m instead.

#import "_PMListing.h"

const struct PMListingAttributes PMListingAttributes = {
	.category = @"category",
	.city = @"city",
	.date = @"date",
	.info = @"info",
	.listingId = @"listingId",
	.picData1 = @"picData1",
	.picData2 = @"picData2",
	.picData3 = @"picData3",
	.picData4 = @"picData4",
	.picUrls = @"picUrls",
	.postCraigslist = @"postCraigslist",
	.postFacebook = @"postFacebook",
	.postFreeForSale = @"postFreeForSale",
	.price = @"price",
	.sold = @"sold",
	.state = @"state",
	.title = @"title",
};

const struct PMListingRelationships PMListingRelationships = {
	.messageChains = @"messageChains",
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
	if ([key isEqualToString:@"postCraigslistValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"postCraigslist"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"postFacebookValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"postFacebook"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"postFreeForSaleValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"postFreeForSale"];
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




@dynamic category;






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





@dynamic picData1;






@dynamic picData2;






@dynamic picData3;






@dynamic picData4;






@dynamic picUrls;






@dynamic postCraigslist;



- (BOOL)postCraigslistValue {
	NSNumber *result = [self postCraigslist];
	return [result boolValue];
}

- (void)setPostCraigslistValue:(BOOL)value_ {
	[self setPostCraigslist:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePostCraigslistValue {
	NSNumber *result = [self primitivePostCraigslist];
	return [result boolValue];
}

- (void)setPrimitivePostCraigslistValue:(BOOL)value_ {
	[self setPrimitivePostCraigslist:[NSNumber numberWithBool:value_]];
}





@dynamic postFacebook;



- (BOOL)postFacebookValue {
	NSNumber *result = [self postFacebook];
	return [result boolValue];
}

- (void)setPostFacebookValue:(BOOL)value_ {
	[self setPostFacebook:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePostFacebookValue {
	NSNumber *result = [self primitivePostFacebook];
	return [result boolValue];
}

- (void)setPrimitivePostFacebookValue:(BOOL)value_ {
	[self setPrimitivePostFacebook:[NSNumber numberWithBool:value_]];
}





@dynamic postFreeForSale;



- (BOOL)postFreeForSaleValue {
	NSNumber *result = [self postFreeForSale];
	return [result boolValue];
}

- (void)setPostFreeForSaleValue:(BOOL)value_ {
	[self setPostFreeForSale:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitivePostFreeForSaleValue {
	NSNumber *result = [self primitivePostFreeForSale];
	return [result boolValue];
}

- (void)setPrimitivePostFreeForSaleValue:(BOOL)value_ {
	[self setPrimitivePostFreeForSale:[NSNumber numberWithBool:value_]];
}





@dynamic price;






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






@dynamic messageChains;

	
- (NSMutableSet*)messageChainsSet {
	[self willAccessValueForKey:@"messageChains"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"messageChains"];
  
	[self didAccessValueForKey:@"messageChains"];
	return result;
}
	

@dynamic user;

	






@end
