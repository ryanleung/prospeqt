// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMImage.m instead.

#import "_PMImage.h"

const struct PMImageAttributes PMImageAttributes = {
	.url = @"url",
};

const struct PMImageRelationships PMImageRelationships = {
};

const struct PMImageFetchedProperties PMImageFetchedProperties = {
};

@implementation PMImageID
@end

@implementation _PMImage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Image";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Image" inManagedObjectContext:moc_];
}

- (PMImageID*)objectID {
	return (PMImageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic url;











@end
