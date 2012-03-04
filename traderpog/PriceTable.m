//
//  PriceTable.m
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import "PriceTable.h"

static NSString* kIdentifier = @"Indetifier";
static NSString* kPrice = @"Price";

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

#pragma mark - queries
- (NSString*) identifierAtIndex:(unsigned int)index
{
    NSString* result = nil;
    if(index < [_itemList count])
    {
        result = [[_itemList objectAtIndex:index] objectForKey:kIdentifier];
    }
    return result;
}

- (unsigned int) priceAtIndex:(unsigned int)index
{
    unsigned int result = 0;
    if(index < [_itemList count])
    {
        result = [[[_itemList objectAtIndex:index] objectForKey:kPrice] unsignedIntValue];
    }
    return result;
}

@end
