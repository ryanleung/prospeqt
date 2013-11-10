// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessage.h instead.

#import <CoreData/CoreData.h>


extern const struct PMMessageAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *messageId;
	__unsafe_unretained NSString *senderId;
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





@property (nonatomic, strong) NSNumber* messageId;



@property int32_t messageIdValue;
- (int32_t)messageIdValue;
- (void)setMessageIdValue:(int32_t)value_;

//- (BOOL)validateMessageId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* senderId;



@property int32_t senderIdValue;
- (int32_t)senderIdValue;
- (void)setSenderIdValue:(int32_t)value_;

//- (BOOL)validateSenderId:(id*)value_ error:(NSError**)error_;





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




- (NSNumber*)primitiveMessageId;
- (void)setPrimitiveMessageId:(NSNumber*)value;

- (int32_t)primitiveMessageIdValue;
- (void)setPrimitiveMessageIdValue:(int32_t)value_;




- (NSNumber*)primitiveSenderId;
- (void)setPrimitiveSenderId:(NSNumber*)value;

- (int32_t)primitiveSenderIdValue;
- (void)setPrimitiveSenderIdValue:(int32_t)value_;




- (NSDate*)primitiveTime;
- (void)setPrimitiveTime:(NSDate*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (PMMessageChain*)primitiveMessageChain;
- (void)setPrimitiveMessageChain:(PMMessageChain*)value;


@end
