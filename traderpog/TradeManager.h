//
//  TradeManager.h
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PriceTable;
@interface TradeManager : NSObject
{
    NSMutableDictionary* _portRegistry;
}

- (PriceTable*) getPriceTableForPort:(NSString*)portName;

// singleton
+ (TradeManager*) getInstance;
+ (void) destroyInstance;

@end
