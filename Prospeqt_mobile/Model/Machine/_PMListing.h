// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.h instead.

#import <CoreData/CoreData.h>


extern const struct PMListingAttributes {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *info;
	__unsafe_unretained NSString *listingId;
	__unsafe_unretained NSString *picData1;
	__unsafe_unretained NSString *picData2;
	__unsafe_unretained NSString *picData3;
	__unsafe_unretained NSString *picData4;
	__unsafe_unretained NSString *picUrls;
	__unsafe_unretained NSString *postCraigslist;
	__unsafe_unretained NSString *postFacebook;
	__unsafe_unretained NSString *postFreeForSale;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *sold;
	__unsafe_unretained NSString *title;
} PMListingAttributes;

extern const struct PMListingRelationships {
	__unsafe_unretained NSString *messageChains;
	__unsafe_unretained NSString *user;
} PMListingRelationships;

extern const struct PMListingFetchedProperties {
} PMListingFetchedProperties;

@class PMMessageChain;
@class PMUser;

















@interface PMListingID : NSManagedObjectID {}
@end

@interface _PMListing : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMListingID*)objectID;





@property (nonatomic, strong) NSString* category;



//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* date;



//- (BOOL)validateDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* info;



//- (BOOL)validateInfo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* listingId;



@property int32_t listingIdValue;
- (int32_t)listingIdValue;
- (void)setListingIdValue:(int32_t)value_;

//- (BOOL)validateListingId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* picData1;



//- (BOOL)validatePicData1:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* picData2;



//- (BOOL)validatePicData2:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* picData3;



//- (BOOL)validatePicData3:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* picData4;



//- (BOOL)validatePicData4:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* picUrls;



//- (BOOL)validatePicUrls:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* postCraigslist;



@property BOOL postCraigslistValue;
- (BOOL)postCraigslistValue;
- (void)setPostCraigslistValue:(BOOL)value_;

//- (BOOL)validatePostCraigslist:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* postFacebook;



@property BOOL postFacebookValue;
- (BOOL)postFacebookValue;
- (void)setPostFacebookValue:(BOOL)value_;

//- (BOOL)validatePostFacebook:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* postFreeForSale;



@property BOOL postFreeForSaleValue;
- (BOOL)postFreeForSaleValue;
- (void)setPostFreeForSaleValue:(BOOL)value_;

//- (BOOL)validatePostFreeForSale:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* price;



//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sold;



@property BOOL soldValue;
- (BOOL)soldValue;
- (void)setSoldValue:(BOOL)value_;

//- (BOOL)validateSold:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *messageChains;

- (NSMutableSet*)messageChainsSet;




@property (nonatomic, strong) PMUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _PMListing (CoreDataGeneratedAccessors)

- (void)addMessageChains:(NSSet*)value_;
- (void)removeMessageChains:(NSSet*)value_;
- (void)addMessageChainsObject:(PMMessageChain*)value_;
- (void)removeMessageChainsObject:(PMMessageChain*)value_;

@end

@interface _PMListing (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;




- (NSDate*)primitiveDate;
- (void)setPrimitiveDate:(NSDate*)value;




- (NSString*)primitiveInfo;
- (void)setPrimitiveInfo:(NSString*)value;




- (NSNumber*)primitiveListingId;
- (void)setPrimitiveListingId:(NSNumber*)value;

- (int32_t)primitiveListingIdValue;
- (void)setPrimitiveListingIdValue:(int32_t)value_;




- (NSData*)primitivePicData1;
- (void)setPrimitivePicData1:(NSData*)value;




- (NSData*)primitivePicData2;
- (void)setPrimitivePicData2:(NSData*)value;




- (NSData*)primitivePicData3;
- (void)setPrimitivePicData3:(NSData*)value;




- (NSData*)primitivePicData4;
- (void)setPrimitivePicData4:(NSData*)value;




- (NSString*)primitivePicUrls;
- (void)setPrimitivePicUrls:(NSString*)value;




- (NSNumber*)primitivePostCraigslist;
- (void)setPrimitivePostCraigslist:(NSNumber*)value;

- (BOOL)primitivePostCraigslistValue;
- (void)setPrimitivePostCraigslistValue:(BOOL)value_;




- (NSNumber*)primitivePostFacebook;
- (void)setPrimitivePostFacebook:(NSNumber*)value;

- (BOOL)primitivePostFacebookValue;
- (void)setPrimitivePostFacebookValue:(BOOL)value_;




- (NSNumber*)primitivePostFreeForSale;
- (void)setPrimitivePostFreeForSale:(NSNumber*)value;

- (BOOL)primitivePostFreeForSaleValue;
- (void)setPrimitivePostFreeForSaleValue:(BOOL)value_;




- (NSDecimalNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSDecimalNumber*)value;




- (NSNumber*)primitiveSold;
- (void)setPrimitiveSold:(NSNumber*)value;

- (BOOL)primitiveSoldValue;
- (void)setPrimitiveSoldValue:(BOOL)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (NSMutableSet*)primitiveMessageChains;
- (void)setPrimitiveMessageChains:(NSMutableSet*)value;



- (PMUser*)primitiveUser;
- (void)setPrimitiveUser:(PMUser*)value;


@end
