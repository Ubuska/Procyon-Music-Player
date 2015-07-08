//
//  PGMusicManager.h
//  PGMusicPlayer
//
//  Created by Peter Gubin on 06.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGTrack.h"
#define MusicManager [PGMusicManager SharedInstance]

@interface PGMusicManager : NSObject
{
    PGTrack* CurrentTrack;
}

+ (PGMusicManager *) SharedInstance;

@property NSMutableArray* Tracks;

- (void) Initialize;

- (void) AddTrack:(PGTrack*)Track;
- (void) RemoveTrack:(PGTrack*)Track;
- (void) SetCurrentTrack:(PGTrack*)Track;

- (PGTrack*) GetTrackByIndex:(NSInteger)Index;
- (NSInteger) GetTracksCount;

- (PGTrack*) GetNextTrack;
- (PGTrack*) GetPreviousTrack;
- (PGTrack*) GetCurrentTrack;

@end
