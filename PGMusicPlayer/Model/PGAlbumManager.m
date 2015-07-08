//
//  PGAlbumManager.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 07.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGAlbumManager.h"

@implementation PGAlbumManager

static PGAlbumManager *sMySingleton = nil;

+ (instancetype)SharedInstance
{
    static PGAlbumManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PGAlbumManager alloc] init];

        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void) Initialize
{
    Albums = [[NSMutableArray alloc] init];
}

- (NSInteger) GetAlbumsCount
{
    return [Albums count];
}
- (void) AddAlbum:(PGAlbum*)Album
{
    [Albums addObject:Album];
}

@end
