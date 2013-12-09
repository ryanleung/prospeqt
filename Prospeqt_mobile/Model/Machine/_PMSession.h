// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMSession.h instead.

#import <CoreData/CoreData.h>


extern const struct PMSessionAttributes {
	__unsafe_unretained NSString *apiToken;
} PMSessionAttributes;

extern const struct PMSessionRelationships {
} PMSessionRelationships;

extern const struct PMSessionFetchedProperties {
} PMSessionFetchedProperties;




@interface PMSessionID : NSManagedObjectID {}
@end

@interface _PMSession : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMSessionID*)objectID;





@property (nonatomic, strong) NSString* apiToken;



//- (BOOL)validateApiToken:(id*)value_ error:(NSError**)error_;






@end

@interface _PMSession (CoreDataGeneratedAccessors)

@end

@interface _PMSession (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveApiToken;
- (void)setPrimitiveApiToken:(NSString*)value;




@end
