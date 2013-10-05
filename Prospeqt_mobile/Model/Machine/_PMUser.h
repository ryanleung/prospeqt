// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.h instead.

#import <CoreData/CoreData.h>


extern const struct PMUserAttributes {
	__unsafe_unretained NSString *username;
} PMUserAttributes;

extern const struct PMUserRelationships {
} PMUserRelationships;

extern const struct PMUserFetchedProperties {
} PMUserFetchedProperties;




@interface PMUserID : NSManagedObjectID {}
@end

@interface _PMUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMUserID*)objectID;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;






@end

@interface _PMUser (CoreDataGeneratedAccessors)

@end

@interface _PMUser (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;




@end
