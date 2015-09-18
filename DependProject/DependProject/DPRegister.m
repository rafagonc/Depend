//
//  DPRegister.m
//  DependProject
//
//  Created by Rafael Gonzalves on 9/18/15.
//  Copyright (c) 2015 Rafael Gonzalves. All rights reserved.
//

#import "DPRegister.h"
#import "DPDatasourceProtocol.h"
#import "DPSecondDatasource.h"
#import "DPDatasource.h"
#import "Depend/DPRegistry.h"

@implementation DPRegister

+(void)registerImplementations {
    [[DPRegistry sharedRegistry] registerImplementation:[DPDatasource class] forProtocol:@protocol(DPDatasourceProtocol) context:nil];
    [[DPRegistry sharedRegistry] registerImplementation:[[DPSecondDatasource alloc] init] forProtocol:@protocol(DPDatasourceProtocol) context:@"second"];
}

@end
