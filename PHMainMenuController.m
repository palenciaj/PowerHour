#import "PHMainMenuController.h"
#import "PowerHourViewController.h"

@implementation PHMainMenuController

@synthesize playlistController;

- (IBAction)playButtonPressed:(id)sender {
	
	[playlistController queueWithSelection];
	
	PowerHourViewController *phViewController = [[PowerHourViewController alloc] initWithMediaPlayer:playlistController];
	phViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	phViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

	[self presentModalViewController:phViewController animated:YES];
	
	[phViewController release];
    
}

- (IBAction)play:(id)sender {
    
}

- (void)viewDidLoad {
	[super viewDidLoad];
	PowerHourMediaPlayerController *tableController = [[PowerHourMediaPlayerController alloc] initWithStyle:UITableViewStylePlain];
	self.playlistController = tableController;
	
	playlistTable.delegate = playlistController;
	playlistTable.dataSource = playlistController;
	
	playlistController.view = playlistTable;
	playlistController.tableView = playlistTable;
	
	[playlistTable reloadData];
	[tableController release];
}

@end
