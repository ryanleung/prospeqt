// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.h instead.

#import <CoreData/CoreData.h>


extern const struct PMUserAttributes {
	__unsafe_unretained NSString *avatarDataString;
	__unsafe_unretained NSString *avatarUrl;
	__unsafe_unretained NSString *bio;
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *location;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *userId;
} PMUserAttributes;

extern const struct PMUserRelationships {
	__unsafe_unretained NSString *listings;
	__unsafe_unretained NSString *messageChains;
} PMUserRelationships;

extern const struct PMUserFetchedProperties {
} PMUserFetchedProperties;

@class PMListing;
@class PMMessageChain;











@interface PMUserID : NSManagedObjectID {}
@end

@interface _PMUser : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMUserID*)objectID;





@property (nonatomic, strong) NSString* avatarDataString;



//- (BOOL)validateAvatarDataString:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* avatarUrl;



//- (BOOL)validateAvatarUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* bio;



//- (BOOL)validateBio:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* location;



//- (BOOL)validateLocation:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* rating;



@property int16_t ratingValue;
- (int16_t)ratingValue;
- (void)setRatingValue:(int16_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* userId;



@property int32_t userIdValue;
- (int32_t)userIdValue;
- (void)setUserIdValue:(int32_t)value_;

//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *listings;

- (NSMutableSet*)listingsSet;




@property (nonatomic, strong) NSOrderedSet *messageChains;

- (NSMutableOrderedSet*)messageChainsSet;





@end

@interface _PMUser (CoreDataGeneratedAccessors)

- (void)addListings:(NSSet*)value_;
- (void)removeListings:(NSSet*)value_;
- (void)addListingsObject:(PMListing*)value_;
- (void)removeListingsObject:(PMListing*)value_;

- (void)addMessageChains:(NSOrderedSet*)value_;
- (void)removeMessageChains:(NSOrderedSet*)value_;
- (void)addMessageChainsObject:(PMMessageChain*)value_;
- (void)removeMessageChainsObject:(PMMessageChain*)value_;

@end

@interface _PMUser (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAvatarDataString;
- (void)setPrimitiveAvatarDataString:(NSString*)value;




- (NSString*)primitiveAvatarUrl;
- (void)setPrimitiveAvatarUrl:(NSString*)value;




- (NSString*)primitiveBio;
- (void)setPrimitiveBio:(NSString*)value;




- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSString*)primitiveLocation;
- (void)setPrimitiveLocation:(NSString*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int16_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int16_t)value_;




- (NSNumber*)primitiveUserId;
- (void)setPrimitiveUserId:(NSNumber*)value;

- (int32_t)primitiveUserIdValue;
- (void)setPrimitiveUserIdValue:(int32_t)value_;





- (NSMutableSet*)primitiveListings;
- (void)setPrimitiveListings:(NSMutableSet*)value;



- (NSMutableOrderedSet*)primitiveMessageChains;
- (void)setPrimitiveMessageChains:(NSMutableOrderedSet*)value;


@end
