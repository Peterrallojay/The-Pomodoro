//
//  RoundsController.h
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Timer.h"

@interface RoundsController : NSObject

@property (strong, nonatomic, readonly) NSArray *roundTimes;
@property (strong, nonatomic, readonly) NSArray *imageArray;

@property (nonatomic) NSInteger currentRound;

+ (instancetype)sharedInstance;

- (void)roundSelected;

@end
