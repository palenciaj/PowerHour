//
//  PowerHourMediaPlayerController.h
//  PowerHour
//
//  Created by Jamie Gull on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PowerHourMediaPlayer.h"
#import <MediaPlayer/MPMediaQuery.h>
#import <MediaPlayer/MPMusicPlayerController.h>
#import <MediaPlayer/MPMediaItem.h>
#import <MediaPlayer/MPMediaItemCollection.h>
#import <MediaPlayer/MPMediaPlaylist.h>

@protocol PowerHourMediaPlayerDelegate;

@interface PowerHourMediaPlayerController : UITableViewController {
	PowerHourMediaPlayer *phMediaPlayer;
	id <PowerHourMediaPlayerDelegate> delegate;
	MPMusicPlayerController *phPlayerController;
	MPMediaQuery *everything;
	NSArray *allPlaylists;
	int selection;
}

@property (nonatomic, assign) id <PowerHourMediaPlayerDelegate> delegate;
@property (nonatomic, retain) PowerHourMediaPlayer *phMediaPlayer;

-(void) queueWithSelection;
-(void) play;
-(void) pause;
-(void) skip;

@end

@protocol PowerHourMediaPlayerDelegate
- (void) PowerHourMediaPlayerDidFinish:(PowerHourMediaPlayerController * )controller;
@end