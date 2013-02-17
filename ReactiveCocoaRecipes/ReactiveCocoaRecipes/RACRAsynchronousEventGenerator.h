//
//  RACRAsynchronousEventGenerator.h
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import <Foundation/Foundation.h>

// this guy is a simple event generator with intermediate steps.
@interface RACRAsynchronousEventGenerator : NSObject
-(id) initWithNumberOfEventsToGenerate:(NSUInteger) numberOfEventsToGenerate andDelayBetweenEvents:(NSTimeInterval) delay;
-(void) eventOccuredWithValue:(id) value;
-(void) errorOccuredWithValue:(NSError*) error;
-(void) completedWithValue:(id) value;
@end
