//
//  PowerHourViewController.h
//  PowerHour
//
//  Created by Jose on 4/27/09.
//  Copyright IMT 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PowerHourMediaPlayerController.h"
#import <MediaPlayer/MPMediaPlaylist.h>

@class PowerHourView;
#define FREQ 60.0

@interface PowerHourViewController : UIViewController <PowerHourMediaPlayerDelegate> {
	PowerHourView *powerhourView;
	PowerHourMediaPlayerController *phMediaPlayer;
	int count;
	
	int shotNumber;
}

@property (nonatomic, assign) IBOutlet PowerHourView *powerhourView;
@property (nonatomic, retain) PowerHourMediaPlayerController *phMediaPlayer;

-(PowerHourViewController *) initWithMediaPlayer:(PowerHourMediaPlayerController *)mediaPlayer;

@end

