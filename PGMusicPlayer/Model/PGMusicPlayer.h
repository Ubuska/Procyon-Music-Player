//
//  PGMusicPlayer.h
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "PGTrack.h"
#import "Protocols.h"

#define MusicPlayer [PGMusicPlayer SharedInstance]


@interface PGMusicPlayer : NSObject

{
    AVAudioPlayer* AudioPlayer;
    NSMutableArray* Tracks;
}

+ (PGMusicPlayer *) SharedInstance;


- (void) PlayTrack:(PGTrack*) Track;

- (void) NextTrack;
- (void) PreviousTrack;
- (void) StopTrack;

- (PGTrack*) GetCurrentTrack;

@property id<UpdateViewProtocol> UpdateViewDelegate;

@end
