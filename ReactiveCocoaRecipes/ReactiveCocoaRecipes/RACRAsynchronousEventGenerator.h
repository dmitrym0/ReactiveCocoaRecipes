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
@property (nonatomic, copy) void (^next)(id value);
@property (nonatomic, copy) void (^error)(NSError *error);
@property (nonatomic, copy) void (^completed)(id value);


-(id) initWithNumberOfEventsToGenerate:(NSUInteger) numberOfEventsToGenerate andDelayBetweenEvents:(NSTimeInterval) delay;
@end
