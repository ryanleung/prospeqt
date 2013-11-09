// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.h instead.

#import <CoreData/CoreData.h>


extern const struct PMListingAttributes {
	__unsafe_unretained NSString *city;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *info;
	__unsafe_unretained NSString *listingId;
	__unsafe_unretained NSString *picData;
	__unsafe_unretained NSString *picUrl;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *smallPicData;
	__unsafe_unretained NSString *smallPicUrl;
	__unsafe_unretained NSString *sold;
	__unsafe_unretained NSString *state;
	__unsafe_unretained NSString *title;
} PMListingAttributes;

extern const struct PMListingRelationships {
	__unsafe_unretained NSString *user;
} PMListingRelationships;

extern const struct PMListingFetchedProperties {
} PMListingFetchedProperties;

@class PMUser;














@interface PMListingID : NSManagedObjectID {}
@end

@interface _PMListing : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMListingID*)objectID;





@property (nonatomic, strong) NSString* city;



//- (BOOL)validateCity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* info;



//- (BOOL)validateInfo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* listingId;



@property int32_t listingIdValue;
- (int32_t)listingIdValue;
- (void)setListingIdValue:(int32_t)value_;

//- (BOOL)validateListingId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* picData;



//- (BOOL)validatePicData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* picUrl;



//- (BOOL)validatePicUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* price;



//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* smallPicData;



//- (BOOL)validateSmallPicData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* smallPicUrl;



//- (BOOL)validateSmallPicUrl:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sold;



@property BOOL soldValue;
- (BOOL)soldValue;
- (void)setSoldValue:(BOOL)value_;

//- (BOOL)validateSold:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* state;



//- (BOOL)validateState:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) PMUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _PMListing (CoreDataGeneratedAccessors)

@end

@interface _PMListing (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCity;
- (void)setPrimitiveCity:(NSString*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveInfo;
- (void)setPrimitiveInfo:(NSString*)value;




- (NSNumber*)primitiveListingId;
- (void)setPrimitiveListingId:(NSNumber*)value;

- (int32_t)primitiveListingIdValue;
- (void)setPrimitiveListingIdValue:(int32_t)value_;




- (NSData*)primitivePicData;
- (void)setPrimitivePicData:(NSData*)value;




- (NSString*)primitivePicUrl;
- (void)setPrimitivePicUrl:(NSString*)value;




- (NSDecimalNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSDecimalNumber*)value;




- (NSData*)primitiveSmallPicData;
- (void)setPrimitiveSmallPicData:(NSData*)value;




- (NSString*)primitiveSmallPicUrl;
- (void)setPrimitiveSmallPicUrl:(NSString*)value;




- (NSNumber*)primitiveSold;
- (void)setPrimitiveSold:(NSNumber*)value;

- (BOOL)primitiveSoldValue;
- (void)setPrimitiveSoldValue:(BOOL)value_;




- (NSString*)primitiveState;
- (void)setPrimitiveState:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (PMUser*)primitiveUser;
- (void)setPrimitiveUser:(PMUser*)value;


@end
