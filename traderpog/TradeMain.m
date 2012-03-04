//
//  TradeMain.m
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import "TradeMain.h"
#import "TradeManager.h"
#import "GameManager.h"
#import "PriceTable.h"

@implementation TradeMain

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)dealloc 
{
    [_tableView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [_tableView release];
    _tableView = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark UITableViewDataSource Methods 
- (UITableViewCell *)tableView:(UITableView *)tv
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = nil;
    static NSString *cellIdentifier = @"DockedPort";
    
    cell = [tv dequeueReusableCellWithIdentifier:cellIdentifier];
    if( nil == cell ) 
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	NSInteger numSections = 1;	
	return numSections;
}


- (NSInteger)tableView:(UITableView *)tv
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger numRows = 0;
	if(0 == section)
    {
        NSString* curPort = [[GameManager getInstance] curPort];
        PriceTable* priceTable = [[TradeManager getInstance] getPriceTableForPort:curPort];
        if(priceTable)
        {
            numRows = [[priceTable itemList] count];
        }
    }
    return numRows;
}

#pragma mark UITableViewDelegate Methods

- (void)tableView:(UITableView *)tv
didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{

}
/*
- (CGFloat)tableView:(UITableView *)tv heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
}
*/
@end
