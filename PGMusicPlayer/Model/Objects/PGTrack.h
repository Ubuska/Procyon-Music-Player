//
//  PGTrack.h
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGItem.h"

@interface PGTrack : PGItem
{

    NSURL* TrackURL;

}

- (void) InitWithURL:(NSURL*)URL;
- (NSURL*) GetURL;


@end
