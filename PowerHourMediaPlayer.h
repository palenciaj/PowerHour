//
//  PowerHourMediaPlayer.h
//  PowerHour
//
//  Created by Jamie Gull on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PowerHourMediaPlayerController;

@interface PowerHourMediaPlayer : UIView {
	PowerHourMediaPlayerController *phMediaPlayerController;
}

@property (nonatomic, assign) IBOutlet PowerHourMediaPlayerController *phMediaPlayerController;

@end
