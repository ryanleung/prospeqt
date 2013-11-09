// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMUser.h instead.

#import <CoreData/CoreData.h>


extern const struct PMUserAttributes {
	__unsafe_unretained NSString *avatarData;
	__unsafe_unretained NSString *avatarUrl;
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *info;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *state;
	__unsafe_unretained NSString *userId;
	__unsafe_unretained NSString *username;
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





@property (nonatomic, strong) NSData* avatarData;



//- (BOOL)validateAvatarData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* avatarUrl;



//- (BOOL)validateAvatarUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* city;



//- (BOOL)validateCity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* info;



//- (BOOL)validateInfo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* rating;



@property int16_t ratingValue;
- (int16_t)ratingValue;
- (void)setRatingValue:(int16_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* state;



//- (BOOL)validateState:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* userId;



@property int32_t userIdValue;
- (int32_t)userIdValue;
- (void)setUserIdValue:(int32_t)value_;

//- (BOOL)validateUserId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* username;



//- (BOOL)validateUsername:(id*)value_ error:(NSError**)error_;





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


- (NSData*)primitiveAvatarData;
- (void)setPrimitiveAvatarData:(NSData*)value;




- (NSString*)primitiveAvatarUrl;
- (void)setPrimitiveAvatarUrl:(NSString*)value;




- (NSString*)primitiveCity;
- (void)setPrimitiveCity:(NSString*)value;




- (NSString*)primitiveInfo;
- (void)setPrimitiveInfo:(NSString*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int16_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int16_t)value_;




- (NSString*)primitiveState;
- (void)setPrimitiveState:(NSString*)value;




- (NSNumber*)primitiveUserId;
- (void)setPrimitiveUserId:(NSNumber*)value;

- (int32_t)primitiveUserIdValue;
- (void)setPrimitiveUserIdValue:(int32_t)value_;




- (NSString*)primitiveUsername;
- (void)setPrimitiveUsername:(NSString*)value;





- (NSMutableSet*)primitiveListings;
- (void)setPrimitiveListings:(NSMutableSet*)value;



- (NSMutableOrderedSet*)primitiveMessageChains;
- (void)setPrimitiveMessageChains:(NSMutableOrderedSet*)value;


@end
