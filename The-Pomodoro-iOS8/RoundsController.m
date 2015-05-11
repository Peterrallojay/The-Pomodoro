//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"

@implementation RoundsController

+(instancetype)roundsController {
    static RoundsController *roundsController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        roundsController = [RoundsController new];
        
        
    });
    
    return roundsController;
}



- (NSArray *)roundTimes {
    
    return @[@25,@5,@25,@5,@25,@15];
    
}
@end
