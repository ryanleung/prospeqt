// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessageChain.h instead.

#import <CoreData/CoreData.h>


extern const struct PMMessageChainAttributes {
	__unsafe_unretained NSString *dirty;
	__unsafe_unretained NSString *inquirerId;
	__unsafe_unretained NSString *lastUpdated;
	__unsafe_unretained NSString *messageChainId;
} PMMessageChainAttributes;

extern const struct PMMessageChainRelationships {
	__unsafe_unretained NSString *listing;
	__unsafe_unretained NSString *messages;
	__unsafe_unretained NSString *seller;
} PMMessageChainRelationships;

extern const struct PMMessageChainFetchedProperties {
} PMMessageChainFetchedProperties;

@class PMListing;
@class PMMessage;
@class PMUser;






@interface PMMessageChainID : NSManagedObjectID {}
@end

@interface _PMMessageChain : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMMessageChainID*)objectID;





@property (nonatomic, strong) NSNumber* dirty;



@property BOOL dirtyValue;
- (BOOL)dirtyValue;
- (void)setDirtyValue:(BOOL)value_;

//- (BOOL)validateDirty:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* inquirerId;



@property int32_t inquirerIdValue;
- (int32_t)inquirerIdValue;
- (void)setInquirerIdValue:(int32_t)value_;

//- (BOOL)validateInquirerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* lastUpdated;



//- (BOOL)validateLastUpdated:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* messageChainId;



@property int32_t messageChainIdValue;
- (int32_t)messageChainIdValue;
- (void)setMessageChainIdValue:(int32_t)value_;

//- (BOOL)validateMessageChainId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) PMListing *listing;

//- (BOOL)validateListing:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *messages;

- (NSMutableSet*)messagesSet;




@property (nonatomic, strong) PMUser *seller;

//- (BOOL)validateSeller:(id*)value_ error:(NSError**)error_;





@end

@interface _PMMessageChain (CoreDataGeneratedAccessors)

- (void)addMessages:(NSSet*)value_;
- (void)removeMessages:(NSSet*)value_;
- (void)addMessagesObject:(PMMessage*)value_;
- (void)removeMessagesObject:(PMMessage*)value_;

@end

@interface _PMMessageChain (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveDirty;
- (void)setPrimitiveDirty:(NSNumber*)value;

- (BOOL)primitiveDirtyValue;
- (void)setPrimitiveDirtyValue:(BOOL)value_;




- (NSNumber*)primitiveInquirerId;
- (void)setPrimitiveInquirerId:(NSNumber*)value;

- (int32_t)primitiveInquirerIdValue;
- (void)setPrimitiveInquirerIdValue:(int32_t)value_;




- (NSDate*)primitiveLastUpdated;
- (void)setPrimitiveLastUpdated:(NSDate*)value;




- (NSNumber*)primitiveMessageChainId;
- (void)setPrimitiveMessageChainId:(NSNumber*)value;

- (int32_t)primitiveMessageChainIdValue;
- (void)setPrimitiveMessageChainIdValue:(int32_t)value_;





- (PMListing*)primitiveListing;
- (void)setPrimitiveListing:(PMListing*)value;



- (NSMutableSet*)primitiveMessages;
- (void)setPrimitiveMessages:(NSMutableSet*)value;



- (PMUser*)primitiveSeller;
- (void)setPrimitiveSeller:(PMUser*)value;


@end
