//
//  RACRAsynchronousEventGenerator.m
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import "RACRAsynchronousEventGenerator.h"
@interface RACRAsynchronousEventGenerator ( )
@property (assign, nonatomic) NSUInteger numberOfEventsToGenerate;
@property (assign, nonatomic) NSIndexPath delay;
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) NSUInteger internalValue; // the value we'll return
@end


@implementation RACRAsynchronousEventGenerator

- (id)init
{
    return [self initWithNumberOfEventsToGenerate:3 andDelayBetweenEvents:1];
}
            
-(id) initWithNumberOfEventsToGenerate:(NSUInteger) numberOfEventsToGenerate andDelayBetweenEvents:(NSTimeInterval) delay {
    self = [super init];
    if (self) {
        _numberOfEventsToGenerate = numberOfEventsToGenerate;
        _delay = delay;
        _timer = [NSTimer timerWithTimeInterval:_delay
                                         target:self
                                       selector:@selector(timerFired)
                                       userInfo:nil
                                        repeats:YES];
    }
    return self;
    
}

-(void) timerFired
{
    self.numberOfEventsToGenerate--;
    self.internalValue++;
    
    NSString* value = [NSString stringWithFormat:@"%d", self.internalValue];
    
    if (self.numberOfEventsToGenerate == 0)
    {
        [self.timer invalidate];
        [self completedWithValue:value];
    } else {
        [self eventOccuredWithValue:value]
    }
}

-(void) eventOccuredWithValue:(id) value
{
    
}

-(void) errorOccuredWithValue:(NSError*) error
{
    
}

-(void) completedWithValue:(id) value
{
    
}
@end
