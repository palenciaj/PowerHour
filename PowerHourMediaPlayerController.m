//
//  PowerHourMediaPlayerController.m
//  PowerHour
//
//  Created by Jamie Gull on 6/7/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PowerHourView.h"
#import "PowerHourMediaPlayerController.h"
#import <MediaPlayer/MPMediaPlaylist.h>



@implementation PowerHourMediaPlayerController
@synthesize delegate, phMediaPlayer;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
		selection = -1;
		everything = [[MPMediaQuery alloc] init]; 
		[everything setGroupingType: MPMediaGroupingPlaylist];
		allPlaylists = [[everything collections] retain];
		
		phPlayerController = [MPMusicPlayerController applicationMusicPlayer];
    }
    return self;
}

- (id)init {
	if (self = [super init]) {
		selection = -1;
		everything = [[MPMediaQuery alloc] init]; 
		[everything setGroupingType: MPMediaGroupingPlaylist];
		allPlaylists = [[everything collections] retain];
		
		phPlayerController = [MPMusicPlayerController applicationMusicPlayer];
	}
	return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [allPlaylists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"] autorelease];
    }
	
	MPMediaPlaylist *playlist = (MPMediaPlaylist *) [allPlaylists objectAtIndex:indexPath.row];

	cell.textLabel.text = [playlist valueForProperty: MPMediaPlaylistPropertyName];
	return cell;
	
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Playlists";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{	
	/*
	if (selection != -1)
	{
		NSIndexPath * prevSelection = [[NSIndexPath alloc] init];
		prevSelection.section = 1;
		prevSelection.row = 
		
		[tableView deselectRowAtIndexPath:];
	}*/
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"] autorelease];
    }
	
	cell.accessoryType = UITableViewCellAccessoryCheckmark;
	
	selection = indexPath.row;
}

- (void)tablewView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DefaultCell"] autorelease];
    }
	
	cell.accessoryType = UITableViewCellAccessoryNone;
}

/*
- (void)loadView {
	self.wantsFullScreenLayout = YES;
	
	PowerHourMediaPlayer *view = [[PowerHourMediaPlayer alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	
	view.phMediaPlayerController = self;
	phMediaPlayer = view;
	
}
 */

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;	
}

- (void)printPlaylists {
	for (MPMediaPlaylist *playlist in allPlaylists) {
		NSLog (@"%@",
			   [playlist valueForProperty: MPMediaPlaylistPropertyName]);
	}
}

- (void) queueWithSelection {
	[phPlayerController setQueueWithItemCollection:[allPlaylists objectAtIndex:selection]];
}



- (void) play {
	[phPlayerController play];
}

- (void) pause {
	[phPlayerController pause];
}

- (void) skip {
	[phPlayerController skipToNextItem];
}

- (void)dealloc {
	[allPlaylists release];
	[everything release];
    [super dealloc];
}

- (void) PowerHourMediaPlayerDidFinish:(PowerHourMediaPlayerController * )controller {
	
}

@end
