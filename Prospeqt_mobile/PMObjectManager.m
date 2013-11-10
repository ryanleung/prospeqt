//
//  PMObjectManager.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/6/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMObjectManager.h"
#import "PMManagedObjectStore.h"
#import "NSManagedObjectModel+PMDataStack.h"
#import "NSPersistentStoreCoordinator+PMDataStack.h"
#import "PMAPIEnvironment.h"

static NSString * const kPMAPIMappingPrimaryKey = @"PM_JSON_PRIMARY_KEY";
static NSString * const kPMAPIMappingUserInfoServerKey = @"PM_JSON_SERVER_KEY";
static NSString * const kPMAPIMappingIgnoreRelationshipKey = @"PM_JSON_IGNORE_RELATIONSHIP_KEY";

static PMObjectManager *pm_sharedObjectManager = nil;

@implementation PMObjectManager

+ (PMObjectManager *)objectManager
{
    return pm_sharedObjectManager;
}

+ (void)setObjectManager:(PMObjectManager *)objectManager
{
    pm_sharedObjectManager = objectManager;
}

#pragma mark - Life Cycle

- (id)initWithManagedObjectStore:(PMManagedObjectStore *)store httpClient:(AFHTTPClient *)httpClient
{
    self = [super initWithHTTPClient:httpClient];
    if (self) {
        RKLogConfigureByName("RestKit/*", RKLogLevelOff)
        RKLogConfigureByName("RestKit/Network", RKLogLevelTrace)
        RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace)
        RKLogConfigureByName("RestKit/CoreData", RKLogLevelOff)
        
        self.managedObjectStore = store;
        [self prepareDescriptorsWithMappings:[self mappingsFromModel:self.managedObjectStore.managedObjectModel]];
        [self.managedObjectStore createManagedObjectContexts];
        
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    }
    return self;
}

#pragma mark - Request and Responspe Descriptors

- (void)prepareDescriptorsWithMappings:(NSDictionary *)mappings
{
    [self prepareManagedResponseDescriptorsWithMappings:mappings];
    [self prepareResponseDescriptors];
    [self prepareRequestDescriptors];
}

- (void)prepareRequestDescriptors
{

}

- (void)prepareResponseDescriptors
{
    
}

- (void)prepareManagedResponseDescriptorsWithMappings:(NSDictionary *)mappings
{
    
}

#pragma mark - Mapping Provider Helpers

- (NSDictionary *)mappingsFromModel:(NSManagedObjectModel *)model
{
    NSMutableDictionary *entityMappings = [NSMutableDictionary dictionary];
    
    // Create mappings and map attributes
    for (NSEntityDescription *entity in [model entities]) {
        RKEntityMapping *entityMapping = [[RKEntityMapping alloc] initWithEntity:entity];
        [self mapAttributesInMapping:entityMapping];
        [entityMappings setObject:entityMapping forKey:entity.name];
    }
    
    // Now that they are all created, map relationships
    for (RKEntityMapping *entityMapping in [entityMappings allValues]) {
        [self mapRelationshipsInMapping:entityMapping mappings:entityMappings];
    }
    
    return entityMappings;
}

- (void)mapAttributesInMapping:(RKEntityMapping *)mapping
{
    for (NSAttributeDescription *attribute in [[mapping.entity attributesByName] allValues]) {
        NSDictionary *userInfo = attribute.userInfo;
        NSString *propertyName = attribute.name;
        NSString *serverKey = [userInfo objectForKey:kPMAPIMappingUserInfoServerKey] ?: propertyName;
        
        [mapping addAttributeMappingsFromDictionary:@{ serverKey : propertyName }];
        
        // check for primary key
        BOOL isPrimaryKey = [[userInfo objectForKey:kPMAPIMappingPrimaryKey] isEqualToString:@"YES"];
        if (isPrimaryKey) {
            mapping.identificationAttributes = @[ propertyName ];
        }
    }
}

- (void)mapRelationshipsInMapping:(RKEntityMapping *)mapping mappings:(NSDictionary *)entityMappings
{
    for (NSRelationshipDescription *relationship in [[mapping.entity relationshipsByName] allValues]) {
        NSDictionary *userInfo = relationship.userInfo;
        BOOL isIgnoredRelationship = [[userInfo objectForKey:kPMAPIMappingIgnoreRelationshipKey] isEqualToString:@"YES"];
        if (!isIgnoredRelationship) {
            NSString *relationName = relationship.name;
            NSString *serverKey = [userInfo objectForKey:kPMAPIMappingUserInfoServerKey] ?: relationName;
            NSString *relationEntityName = relationship.destinationEntity.name;
            
            RKEntityMapping *relatedEntityMapping = [entityMappings objectForKey:relationEntityName];
            
            RKRelationshipMapping *relationshipMapping = [RKRelationshipMapping relationshipMappingFromKeyPath:serverKey
                                                                                                     toKeyPath:relationName
                                                                                                   withMapping:relatedEntityMapping];
            [mapping addPropertyMapping:relationshipMapping];
        }
    }
}



@end
