//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"

@interface RoundsController ()

@property (strong, nonatomic) NSArray *roundTimes;
@property (strong, nonatomic) NSArray *imageArray;

@end

@implementation RoundsController

+(RoundsController *)sharedInstance {
    static RoundsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RoundsController new];
        
    });
    
    return sharedInstance;
}

- (void)roundSelected
{
    [Timer sharedInstance].minutes = [[self roundTimes][self.currentRound] integerValue];
    [Timer sharedInstance].seconds = 0;
    
    //new alert that a newround has posted for anyone listening
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundNotification object:nil];
    
}

- (NSArray *)imageArray {
    return @[@"1", @"2", @"1", @"2", @"1", @"3"];
}

- (NSArray *)roundTimes {
    
    return @[@25,@5,@25,@5,@25,@15];
    
}

@end
