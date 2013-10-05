// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.m instead.

#import "_PMListing.h"

const struct PMListingAttributes PMListingAttributes = {
	.info = @"info",
	.listingId = @"listingId",
	.picData = @"picData",
	.picPath = @"picPath",
	.price = @"price",
	.smallPicData = @"smallPicData",
	.smallPicPath = @"smallPicPath",
	.title = @"title",
};

const struct PMListingRelationships PMListingRelationships = {
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
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




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





@dynamic picData;






@dynamic picPath;






@dynamic price;



- (float)priceValue {
	NSNumber *result = [self price];
	return [result floatValue];
}

- (void)setPriceValue:(float)value_ {
	[self setPrice:[NSNumber numberWithFloat:value_]];
}

- (float)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result floatValue];
}

- (void)setPrimitivePriceValue:(float)value_ {
	[self setPrimitivePrice:[NSNumber numberWithFloat:value_]];
}





@dynamic smallPicData;






@dynamic smallPicPath;






@dynamic title;











@end
