// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMImage.h instead.

#import <CoreData/CoreData.h>


extern const struct PMImageAttributes {
	__unsafe_unretained NSString *url;
} PMImageAttributes;

extern const struct PMImageRelationships {
} PMImageRelationships;

extern const struct PMImageFetchedProperties {
} PMImageFetchedProperties;




@interface PMImageID : NSManagedObjectID {}
@end

@interface _PMImage : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMImageID*)objectID;





@property (nonatomic, strong) NSString* url;



//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;






@end

@interface _PMImage (CoreDataGeneratedAccessors)

@end

@interface _PMImage (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;




@end
