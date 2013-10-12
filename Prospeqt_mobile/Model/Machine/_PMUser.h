// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.h instead.

#import <CoreData/CoreData.h>


extern const struct PMUserAttributes {
	__unsafe_unretained NSString *username;
} PMUserAttributes;

extern const struct PMUserRelationships {
	__unsafe_unretained NSString *listings;
} PMUserRelationships;

extern const struct PMUserFetchedProperties {
} PMUserFetchedProperties;

@class PMListing;



@interface PMUserID : NSManagedObjectID {}
@end

@interface _PMUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMUserID*)objectID;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *listings;

- (NSMutableSet*)listingsSet;





@end

@interface _PMUser (CoreDataGeneratedAccessors)

- (void)addListings:(NSSet*)value_;
- (void)removeListings:(NSSet*)value_;
- (void)addListingsObject:(PMListing*)value_;
- (void)removeListingsObject:(PMListing*)value_;

@end

@interface _PMUser (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;





- (NSMutableSet*)primitiveListings;
- (void)setPrimitiveListings:(NSMutableSet*)value;


@end
