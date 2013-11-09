// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessage.h instead.

#import <CoreData/CoreData.h>


extern const struct PMMessageAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *inquirerId;
	__unsafe_unretained NSString *listingId;
	__unsafe_unretained NSString *messageId;
	__unsafe_unretained NSString *sellerId;
	__unsafe_unretained NSString *time;
	__unsafe_unretained NSString *type;
} PMMessageAttributes;

extern const struct PMMessageRelationships {
	__unsafe_unretained NSString *messageChain;
} PMMessageRelationships;

extern const struct PMMessageFetchedProperties {
} PMMessageFetchedProperties;

@class PMMessageChain;









@interface PMMessageID : NSManagedObjectID {}
@end

@interface _PMMessage : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMMessageID*)objectID;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* inquirerId;



@property int32_t inquirerIdValue;
- (int32_t)inquirerIdValue;
- (void)setInquirerIdValue:(int32_t)value_;

//- (BOOL)validateInquirerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* listingId;



@property int32_t listingIdValue;
- (int32_t)listingIdValue;
- (void)setListingIdValue:(int32_t)value_;

//- (BOOL)validateListingId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* messageId;



@property int32_t messageIdValue;
- (int32_t)messageIdValue;
- (void)setMessageIdValue:(int32_t)value_;

//- (BOOL)validateMessageId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sellerId;



@property int32_t sellerIdValue;
- (int32_t)sellerIdValue;
- (void)setSellerIdValue:(int32_t)value_;

//- (BOOL)validateSellerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* time;



//- (BOOL)validateTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) PMMessageChain *messageChain;

//- (BOOL)validateMessageChain:(id*)value_ error:(NSError**)error_;





@end

@interface _PMMessage (CoreDataGeneratedAccessors)

@end

@interface _PMMessage (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSNumber*)primitiveInquirerId;
- (void)setPrimitiveInquirerId:(NSNumber*)value;

- (int32_t)primitiveInquirerIdValue;
- (void)setPrimitiveInquirerIdValue:(int32_t)value_;




- (NSNumber*)primitiveListingId;
- (void)setPrimitiveListingId:(NSNumber*)value;

- (int32_t)primitiveListingIdValue;
- (void)setPrimitiveListingIdValue:(int32_t)value_;




- (NSNumber*)primitiveMessageId;
- (void)setPrimitiveMessageId:(NSNumber*)value;

- (int32_t)primitiveMessageIdValue;
- (void)setPrimitiveMessageIdValue:(int32_t)value_;




- (NSNumber*)primitiveSellerId;
- (void)setPrimitiveSellerId:(NSNumber*)value;

- (int32_t)primitiveSellerIdValue;
- (void)setPrimitiveSellerIdValue:(int32_t)value_;




- (NSDate*)primitiveTime;
- (void)setPrimitiveTime:(NSDate*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (PMMessageChain*)primitiveMessageChain;
- (void)setPrimitiveMessageChain:(PMMessageChain*)value;


@end
