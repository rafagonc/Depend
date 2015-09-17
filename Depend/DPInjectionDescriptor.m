//
//  DPClassInjectionDescriptor.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/16/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import "DPInjectionDescriptor.h"
#import "DPInjectionPropertyDescriptor.h"

@interface DPInjectionDescriptor ()

@property (nonatomic,strong) NSMutableArray *mProperties;

@end

@implementation DPInjectionDescriptor

#pragma mark - constructor
-(instancetype)initWithClass:(__unsafe_unretained Class)c {
    if (self = [super init]) {
        self.injectClass = c;
        self.mProperties = [[NSMutableArray alloc] init];
    } return self;
}

#pragma mark - getters
-(NSArray *)properties {
    return [self.mProperties copy];
}
-(NSArray *)propertiesNames {
    return [self.mProperties valueForKeyPath:@"@unionOfObjects.propertyName"];
}

#pragma mark - adding
-(void)addProperty:(objc_property_t)property {
    [self.mProperties addObject:[[DPInjectionPropertyDescriptor alloc] initWithProperty:property]];
}

@end
