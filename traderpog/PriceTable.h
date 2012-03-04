//
//  PriceTable.h
//  traderpog
//
//  Created by Shu Chiun Cheah on 3/3/12.
//  Copyright (c) 2012 GeoloPigs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PriceTable : NSObject
{
    NSMutableArray* _itemList;
}
@property (nonatomic,retain) NSMutableArray* itemList;

- (id) initFromPlistFile:(NSString*)plistFilename;
@end
