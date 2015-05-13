//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"

@interface Timer()
@property (nonatomic) BOOL isOn;
@property (strong, nonatomic) NSDate *expirationDate;

@end

@implementation Timer


//decrease second void method


+ (instancetype)sharedInstance {
    
    static Timer *timer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timer = [Timer new];
        
        
        
        /*
        timer.minutes = 4;
        timer.seconds = 20;
         */
    });

    return timer;
}

-(void)startTimer {
    
    self.isOn = YES;
    
    NSTimeInterval timerLength = self.minutes *60 + self.seconds;
    self.expirationDate = [NSDate dateWithTimeIntervalSinceNow:timerLength];
    UILocalNotification *localNotification = [UILocalNotification new];
    
    if (localNotification) {
        localNotification.fireDate = self.expirationDate;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        localNotification.alertBody = @"Timer Finished.";
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
    
    
    [self checkActive];
   

}

-(void)endTimer {
    
    self.isOn = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotificiation object:self];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //Instructions unclear on sending TimerCompletionNotification
}

- (void)decreaseSecond
{
    //decrease one second from remaining time.
    
    if (self.seconds > 0) {
        self.seconds--;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:self];
    } else if(self.seconds == 0 && self.minutes > 0)
    {
        self.minutes--;
        self.seconds = 59;
        [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:self];
        
        
    } else {
        
        [self endTimer];
        
    }

}

- (void)checkActive
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    if(self.isOn == YES)
    {
        [self decreaseSecond];
        [self performSelector:@selector(checkActive) withObject:nil afterDelay:1.0];
    }
    
}

- (void)cancelTimer
{
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)prepareForBackground
{
    [[NSUserDefaults standardUserDefaults] setObject:self.expirationDate forKey:expirationDate];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loadFromBackground
{
    self.expirationDate = [[NSUserDefaults standardUserDefaults] objectForKey:expirationDate];
    NSTimeInterval seconds = [self.expirationDate timeIntervalSinceNow];
    
    self.minutes = seconds / 60;
    
    self.seconds = seconds - (self.minutes * 60);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
}

@end
