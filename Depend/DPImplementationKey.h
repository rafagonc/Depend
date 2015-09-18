//
//  DPImplementation.h
//  Depend
//
//  Created by Rafael Gonzalves on 9/17/15.
//  Copyright (c) 2015 Rafael Gonçalves. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  The custom dictionary key to find
 *  the implementations.
 *  TODO: isEqual: better implementation
 */
@interface DPImplementationKey : NSObject <NSCopying>

#pragma mark - constructor
/**
 *  Constructor receiving the info that
 *  describes an injection
 */
-(instancetype)initWithProtocolName:(NSString *)protocolName andContext:(NSString *)context;

#pragma mark - properties
/**
 *  Context specified after the _ (underline) in the
 *  injection setter declaration.
 */
@property (nonatomic,  copy, readonly) NSString * context;
/**
 *  The protocol name that the implementation
 *  class conforms to.
 */
@property (nonatomic,strong, readonly) NSString * protocolName;



@end
