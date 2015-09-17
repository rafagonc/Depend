//
//  DependTests.m
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DPCache.h"
#import "DPInjectionDescriptor.h"
#import "DPInjector.h"
#import "EXInjectedClass.h"
#import "DPRegistry.h"
#import "EXProtocol.h"
#import "EXProtocolImplementation.h"
#import "EXAnotherProtocolImplementation.h"
#import "EXInjectedClass.h"

@interface DependTests : XCTestCase {
    EXInjectedClass * injected;
    EXAnotherProtocolImplementation *implementation ;
}
@end

@implementation DependTests

-(void)setUp {
    [super setUp];
    [DPInjector inject];
    
    implementation = [[EXAnotherProtocolImplementation alloc] init];
    
    [[DPRegistry sharedRegistry] addImplementation:[EXProtocolImplementation class] forProtocol:@protocol(EXProtocol) context:nil];
    [[DPRegistry sharedRegistry] addImplementation:implementation forProtocol:@protocol(EXProtocol) context:@"another"];
    
    injected = [[EXInjectedClass alloc] init];
}

#pragma mark tests
-(void)testInjection {
    XCTAssertTrue([injected.object isKindOfClass:[EXProtocolImplementation class]]);
}
-(void)testInjectionWithContext {
    XCTAssertTrue([injected.anotherObject isKindOfClass:[EXAnotherProtocolImplementation class]]);
    XCTAssertEqual(implementation, injected.anotherObject);
}
-(void)testNilImplementationOnAddImplementation {
    XCTAssertThrows([[DPRegistry sharedRegistry] addImplementation:nil forProtocol:@protocol(EXProtocol) context:nil]);
}
-(void)testNilProtocolOnAddImplementation {
    XCTAssertThrows([[DPRegistry sharedRegistry] addImplementation:[EXProtocolImplementation class] forProtocol:nil context:nil]);
}

@end
