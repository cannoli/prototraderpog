//
//  GameManager.h
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PriceTable;
@interface GameManager : NSObject
{
    NSString* _curPort;
}
@property (nonatomic,retain) NSString* curPort;

- (PriceTable*) getPriceTableForCurPort;

// singleton
+ (GameManager*) getInstance;
+ (void) destroyInstance;

@end
