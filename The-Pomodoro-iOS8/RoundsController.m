//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"
#import "Timer.h"

@interface RoundsController ()
@property (strong, nonatomic) NSArray *roundTimes;

@end

@implementation RoundsController

+(instancetype)sharedInstance {
    static RoundsController *roundsController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        roundsController = [RoundsController new];
        
        
    });
    
    return roundsController;
}

//Set the minutes property using the roundTimes array and the currentRound as the index.
- (void) roundSelected
{
    [Timer sharedInstance].minutes = [[self roundTimes][self.currentRound] integerValue];
    [Timer sharedInstance].seconds = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundNotification object:nil];
}

- (NSArray *)roundTimes {
    
    return @[@25,@5,@25,@5,@25,@15];
    
}
@end
