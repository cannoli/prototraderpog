//
//  TradeViewController.m
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import "TradeViewController.h"
#import "TradeMain.h"

@implementation TradeViewController
@synthesize navController = _navController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // set tab bar info
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        TradeMain* rootController = [[TradeMain alloc] initWithNibName:@"TradeMain" bundle:nil];
        [rootController setTitle:NSLocalizedString(@"Trade", @"Trade")];
        
        // add it to our navigation controller
        self.navController = [[[UINavigationController alloc] initWithRootViewController:rootController] autorelease];
        [self.navController setNavigationBarHidden:NO];
        [self.view addSubview:[[self navController]view]];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
