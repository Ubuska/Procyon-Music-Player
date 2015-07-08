//
//  PGItem.m
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGItem.h"

@implementation PGItem

- (NSString*) GetName
{
    return Name;
}

- (NSString*) GetCoverURL
{
    return CoverPicURL;
}

- (void) SetCoverURL:(NSString*)CoverURL
{
    CoverPicURL = CoverURL;
}

@end
