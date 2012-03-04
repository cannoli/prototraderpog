//
//  PriceTable.m
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import "PriceTable.h"

@implementation PriceTable
@synthesize itemList = _itemList;

- (id) initFromPlistFile:(NSString *)plistFilename
{
    self = [super init];
    if(self)
    {
        NSString* path = [[NSBundle mainBundle] pathForResource:plistFilename ofType:@"plist"];
        NSDictionary* filedata = [NSDictionary dictionaryWithContentsOfFile:path];
        _itemList = [[NSArray arrayWithArray:[filedata objectForKey:@"PriceTable"]] retain];
    }
    return self;
}

- (void) dealloc
{
    [_itemList release];
    [super dealloc];
}


@end
