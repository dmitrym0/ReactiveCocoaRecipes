//
//  RACRAsynchronousEventGenerator.h
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import <Foundation/Foundation.h>

// this guy is a simple event generator.
//
//
@interface RACRAsynchronousEventGenerator : NSObject
// this block gets called when the generator generates an event
@property (nonatomic, copy) void (^next)(id value);
// this block gets called when the generator completes
@property (nonatomic, copy) void (^completed)(id value);
@property (nonatomic, copy) void (^error)(NSError *error);

-(id) initWithNumberOfEventsToGenerate:(NSUInteger) numberOfEventsToGenerate andDelayBetweenEvents:(NSTimeInterval) delay;
@end
