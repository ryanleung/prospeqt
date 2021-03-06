// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.h instead.

#import <CoreData/CoreData.h>


extern const struct PMListingAttributes {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *date;
	__unsafe_unretained NSString *info;
	__unsafe_unretained NSString *listingId;
	__unsafe_unretained NSString *locality;
	__unsafe_unretained NSString *postCraigslist;
	__unsafe_unretained NSString *postFacebook;
	__unsafe_unretained NSString *postFreeForSale;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *region;
	__unsafe_unretained NSString *sold;
	__unsafe_unretained NSString *title;
} PMListingAttributes;

extern const struct PMListingRelationships {
	__unsafe_unretained NSString *images;
	__unsafe_unretained NSString *messageChains;
	__unsafe_unretained NSString *user;
} PMListingRelationships;

extern const struct PMListingFetchedProperties {
} PMListingFetchedProperties;

@class PMImage;
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





@property (nonatomic, strong) NSString* locality;



//- (BOOL)validateLocality:(id*)value_ error:(NSError**)error_;





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





@property (nonatomic, strong) NSString* region;



//- (BOOL)validateRegion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sold;



@property BOOL soldValue;
- (BOOL)soldValue;
- (void)setSoldValue:(BOOL)value_;

//- (BOOL)validateSold:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSOrderedSet *images;

- (NSMutableOrderedSet*)imagesSet;




@property (nonatomic, strong) NSSet *messageChains;

- (NSMutableSet*)messageChainsSet;




@property (nonatomic, strong) PMUser *user;

//- (BOOL)validateUser:(id*)value_ error:(NSError**)error_;





@end

@interface _PMListing (CoreDataGeneratedAccessors)

- (void)addImages:(NSOrderedSet*)value_;
- (void)removeImages:(NSOrderedSet*)value_;
- (void)addImagesObject:(PMImage*)value_;
- (void)removeImagesObject:(PMImage*)value_;

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




- (NSString*)primitiveLocality;
- (void)setPrimitiveLocality:(NSString*)value;




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




- (NSString*)primitiveRegion;
- (void)setPrimitiveRegion:(NSString*)value;




- (NSNumber*)primitiveSold;
- (void)setPrimitiveSold:(NSNumber*)value;

- (BOOL)primitiveSoldValue;
- (void)setPrimitiveSoldValue:(BOOL)value_;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (NSMutableOrderedSet*)primitiveImages;
- (void)setPrimitiveImages:(NSMutableOrderedSet*)value;



- (NSMutableSet*)primitiveMessageChains;
- (void)setPrimitiveMessageChains:(NSMutableSet*)value;



- (PMUser*)primitiveUser;
- (void)setPrimitiveUser:(PMUser*)value;


@end
