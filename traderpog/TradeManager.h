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
    NSMutableArray* _openPorts;
}
@property (nonatomic,retain) NSMutableArray* openPorts;

- (PriceTable*) getPriceTableForPort:(NSString*)portName;
- (NSString*) openPortAtIndex:(unsigned int)index;

// singleton
+ (TradeManager*) getInstance;
+ (void) destroyInstance;

@end
