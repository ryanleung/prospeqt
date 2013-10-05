// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to PMListing.h instead.

#import <CoreData/CoreData.h>


extern const struct PMListingAttributes {
	__unsafe_unretained NSString *info;
	__unsafe_unretained NSString *listingId;
	__unsafe_unretained NSString *picData;
	__unsafe_unretained NSString *picPath;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *smallPicData;
	__unsafe_unretained NSString *smallPicPath;
	__unsafe_unretained NSString *title;
} PMListingAttributes;

extern const struct PMListingRelationships {
} PMListingRelationships;

extern const struct PMListingFetchedProperties {
} PMListingFetchedProperties;











@interface PMListingID : NSManagedObjectID {}
@end

@interface _PMListing : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PMListingID*)objectID;





@property (nonatomic, strong) NSString* info;



//- (BOOL)validateInfo:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* listingId;



@property int32_t listingIdValue;
- (int32_t)listingIdValue;
- (void)setListingIdValue:(int32_t)value_;

//- (BOOL)validateListingId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* picData;



//- (BOOL)validatePicData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* picPath;



//- (BOOL)validatePicPath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* price;



@property float priceValue;
- (float)priceValue;
- (void)setPriceValue:(float)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* smallPicData;



//- (BOOL)validateSmallPicData:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* smallPicPath;



//- (BOOL)validateSmallPicPath:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _PMListing (CoreDataGeneratedAccessors)

@end

@interface _PMListing (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveInfo;
- (void)setPrimitiveInfo:(NSString*)value;




- (NSNumber*)primitiveListingId;
- (void)setPrimitiveListingId:(NSNumber*)value;

- (int32_t)primitiveListingIdValue;
- (void)setPrimitiveListingIdValue:(int32_t)value_;




- (NSData*)primitivePicData;
- (void)setPrimitivePicData:(NSData*)value;




- (NSString*)primitivePicPath;
- (void)setPrimitivePicPath:(NSString*)value;




- (NSNumber*)primitivePrice;
- (void)setPrimitivePrice:(NSNumber*)value;

- (float)primitivePriceValue;
- (void)setPrimitivePriceValue:(float)value_;




- (NSData*)primitiveSmallPicData;
- (void)setPrimitiveSmallPicData:(NSData*)value;




- (NSString*)primitiveSmallPicPath;
- (void)setPrimitiveSmallPicPath:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
