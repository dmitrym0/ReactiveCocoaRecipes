//
//  RACRScenarioRunner.m
//  ReactiveCocoaRecipes
//
//  Created by Dmitry M on 2013-02-17.
//  Copyright (c) 2013 Dmitry M. All rights reserved.
//

#import "RACRScenarioRunner.h"
#import "RACRAsyncEventGeneratorDemo.h"

@implementation RACRScenarioRunner

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [[[RACRAsyncEventGeneratorDemo alloc] init] run];
    
    //[[NSApplication sharedApplication] terminate:self];
}

@end
