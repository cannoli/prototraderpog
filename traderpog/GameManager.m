//
//  GameManager.m
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import "GameManager.h"
#import "TradePorts.h"
#import "TradeManager.h"
#import "PriceTable.h"

@implementation GameManager
@synthesize curPort = _curPort;

#pragma mark - init/shutdown
- (id) init
{
    self = [super init];
    if(self)
    {
        _curPort = kSanPan;
    }
    return self;
}

- (void) dealloc
{
    [super dealloc];
}

#pragma mark - queries

- (PriceTable*) getPriceTableForCurPort
{
    PriceTable* result = [[TradeManager getInstance] getPriceTableForPort:_curPort];
    return result;
}

#pragma mark - Singleton
static GameManager *singleton = nil;

+ (GameManager*) getInstance
{
	@synchronized(self)
	{
		if (!singleton)
		{
			singleton = [[[GameManager alloc] init] retain];
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
