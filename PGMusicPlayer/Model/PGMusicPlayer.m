//
//  PGMusicPlayer.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGMusicPlayer.h"
#import "PGMusicManager.h"

@implementation PGMusicPlayer

static PGMusicPlayer *sMySingleton = nil;

+ (instancetype)SharedInstance
{
    static PGMusicPlayer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PGMusicPlayer alloc] init];
        
        
        
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void) PlayTrack:(PGTrack*) Track
{
    
    AudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[Track GetURL] error:nil];
    [AudioPlayer prepareToPlay];
    
    if ([AudioPlayer isPlaying])
    {
        [AudioPlayer pause];
    }
    else
    {
        [AudioPlayer play];
    }
    [MusicManager SetCurrentTrack:Track];
    [_UpdateViewDelegate UpdateView];
    
}

- (void) NextTrack
{
    PGTrack* NextTrack = [MusicManager GetNextTrack];
    if (NextTrack != NULL)
    {
        [self PlayTrack:NextTrack];
    }
}
- (void) PreviousTrack
{
    PGTrack* PreviousTrack = [MusicManager GetPreviousTrack];
    if (PreviousTrack != NULL)
    {
        [self PlayTrack:PreviousTrack];
    }
}
- (void) StopTrack
{
    if ([AudioPlayer isPlaying])
    {
        [AudioPlayer stop];
    }
}

- (PGTrack*) GetCurrentTrack
{
    return [MusicManager GetCurrentTrack];
}

@end
