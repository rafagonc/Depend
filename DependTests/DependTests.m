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

@interface DependTests : XCTestCase

@end

@implementation DependTests

-(void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

-(void)test {
    [[DPInjector alloc] init];
    NSArray *inject = [DPCache injectClasses];
    XCTAssertEqual(inject.count, 1);
}
-(void)testInjectedNil {
    EXInjectedClass * injected = [[EXInjectedClass alloc] init];
    XCTAssertNil(injected.object);
}


@end
