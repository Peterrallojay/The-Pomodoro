//
//  DefaultAppearance.m
//  The-Pomodoro-iOS8
//
//  Created by Peter Woodrow on 5/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DefaultAppearance.h"
@import UIKit;

@implementation DefaultAppearance

+ (void)defaultAppearance
{
    [[UINavigationBar appearance] setBackgroundColor:[UIColor purpleColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaNeue" size:15.0f], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"HelveticaBold" size:20.0f], NSFontAttributeName, nil] forState:UIControlStateHighlighted];

    
}

@end
