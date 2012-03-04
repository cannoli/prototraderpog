//
//  TradeManager.m
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import "TradeManager.h"
#import "PriceTable.h"

@interface TradeManager (PrivateMethods)
- (void) setupPortRegistry;
- (void) loadPriceTableForPortName:(NSString*)name;
@end

@implementation TradeManager

#pragma mark - init/shutdown
- (id) init
{
    self = [super init];
    if(self)
    {
        _portRegistry = [[NSMutableDictionary dictionary] retain];
        [self setupPortRegistry];
    }
    return self;
}

- (void) dealloc
{
    [_portRegistry release];
    [super dealloc];
}

- (void) loadPriceTableForPortName:(NSString*)name
{
    PriceTable* newTable = [[PriceTable alloc] initFromPlistFile:name];
    [_portRegistry setObject:newTable forKey:name];
    [newTable release];
}

- (void) setupPortRegistry
{
    [self loadPriceTableForPortName:@"Ponghai"];
    [self loadPriceTableForPortName:@"SanPan"];
}

#pragma mark - queries
- (PriceTable*) getPriceTableForPort:(NSString *)portName
{
    PriceTable* result = [_portRegistry objectForKey:portName];
    return result;
}


#pragma mark - Singleton
static TradeManager *singleton = nil;

+ (TradeManager*) getInstance
{
	@synchronized(self)
	{
		if (!singleton)
		{
			singleton = [[[TradeManager alloc] init] retain];
		}
	}
	return singleton;
}

+ (void) destroyInstance
{
	@synchronized(self)
	{
		[singleton release];
		singleton = nil;
	}
}


@end
