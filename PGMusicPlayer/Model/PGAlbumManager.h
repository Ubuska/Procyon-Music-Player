//
//  PGAlbumManager.h
//  PGMusicPlayer
//
//  Created by Peter Gubin on 07.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGAlbum.h"
#define AlbumManager [PGAlbumManager SharedInstance]

@interface PGAlbumManager : NSObject
{
    NSMutableArray* Albums;
    PGAlbum* CurrentAlbum;
}

+ (PGAlbumManager *) SharedInstance;
- (void) Initialize;

- (NSInteger) GetAlbumsCount;
- (void) AddAlbum:(PGAlbum*)Album;

@end
