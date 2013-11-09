// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMMessage.h instead.

#import <CoreData/CoreData.h>


extern const struct PMMessageAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *messageId;
	__unsafe_unretained NSString *timeDate;
	__unsafe_unretained NSString *type;
} PMMessageAttributes;

extern const struct PMMessageRelationships {
	__unsafe_unretained NSString *inquirer;
	__unsafe_unretained NSString *messageChain;
	__unsafe_unretained NSString *seller;
} PMMessageRelationships;

extern const struct PMMessageFetchedProperties {
} PMMessageFetchedProperties;

@class PMUser;
@class PMMessageChain;
@class PMUser;






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





@property (nonatomic, strong) NSDate* timeDate;



//- (BOOL)validateTimeDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) PMUser *inquirer;

//- (BOOL)validateInquirer:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) PMMessageChain *messageChain;

//- (BOOL)validateMessageChain:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) PMUser *seller;

//- (BOOL)validateSeller:(id*)value_ error:(NSError**)error_;





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




- (NSDate*)primitiveTimeDate;
- (void)setPrimitiveTimeDate:(NSDate*)value;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;





- (PMUser*)primitiveInquirer;
- (void)setPrimitiveInquirer:(PMUser*)value;



- (PMMessageChain*)primitiveMessageChain;
- (void)setPrimitiveMessageChain:(PMMessageChain*)value;



- (PMUser*)primitiveSeller;
- (void)setPrimitiveSeller:(PMUser*)value;


@end
