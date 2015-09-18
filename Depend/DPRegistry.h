//
//  DPRegistry.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  Singleton to hold all the implementation
 *  registrations.
 */
@interface DPRegistry : NSObject

#pragma mark - singleton
+(DPRegistry *)sharedRegistry;

#pragma mark - properties
/**
 *  All the implementation registrations:
 *  DPImplementationKey as the key and
 *  the implementation as value
 */
@property (nonatomic,readonly) NSDictionary *registrations;

#pragma mark - methods
/**
 *  The method responsible for registering an implementation
 *  the conforms to the protocol specified, this must be done in
 *  the application:didFinishLaunchingWithOptions: method. The implementation
 *  could be a class or a instance, if it is a class, the implementation method
 *  will instantiate with the default constructor [[(Class)imp alloc] init], if 
 *  it is a method
 */
-(void)registerImplementation:(id)imp forProtocol:(Protocol *)protocol context:(NSString *)context;

#pragma mark - retrieve
/**
 *  Method for retriving an instance that conforms with the protocol
 *  specified.
 */
-(id)implementationForProtocol:(NSString *)protocolName andContext:(NSString *)context;

@end
