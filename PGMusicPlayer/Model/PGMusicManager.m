//
//  PGMusicManager.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 06.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGMusicManager.h"

@implementation PGMusicManager

static PGMusicManager *sMySingleton = nil;

+ (instancetype)SharedInstance
{
    static PGMusicManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[PGMusicManager alloc] init];
        
        
        
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (void) Initialize
{
    _Tracks = [[NSMutableArray alloc] init];
    NSURL *Track01 = [[NSBundle mainBundle] URLForResource: @"Black Moon Empire" withExtension:@"mp3"];
    PGTrack* T1 = [PGTrack new];
    [T1 InitWithURL:Track01];
    [T1 SetCoverURL:@"http://i.imgur.com/HyBd9qP.png"];
    [_Tracks addObject:T1];
    
    NSURL *Track02 = [[NSBundle mainBundle] URLForResource: @"Nothing On My Back" withExtension:@"mp3"];
    PGTrack* T2 = [PGTrack new];
    [T2 InitWithURL:Track02];
    [T2 SetCoverURL:@"https://upload.wikimedia.org/wikipedia/ru/7/71/Sade_Promise_album_cover.jpg"];
    [_Tracks addObject:T2];
    
    NSURL *Track03 = [[NSBundle mainBundle] URLForResource: @"Motivation" withExtension:@"mp3"];
    PGTrack* T3 = [PGTrack new];
    [T3 InitWithURL:Track03];
    [T3 SetCoverURL:@"http://technicaldeathmetal.org/wp-content/uploads/2014/04/Cover3-300x300.jpg"];
    [_Tracks addObject:T3];
    
    NSURL *Track04 = [[NSBundle mainBundle] URLForResource: @"Summer" withExtension:@"mp3"];
    PGTrack* T4 = [PGTrack new];
    [T4 InitWithURL:Track04];
    [T4 SetCoverURL:@"http://x-mp-x.ru/wp-content/uploads/2014/07/Damian-Marley-Road-To-Zion-EFIX-XKAEM-Cover-300x300.jpg"];
    [_Tracks addObject:T4];
    
    NSURL *Track05 = [[NSBundle mainBundle] URLForResource: @"In Too Deep" withExtension:@"mp3"];
    PGTrack* T5 = [PGTrack new];
    [T5 InitWithURL:Track05];
    [T5 SetCoverURL:@"http://sound-space.org/wp-content/uploads/2009/03/cover1-300x300.jpg"];
    [_Tracks addObject:T5];
}

- (void) SetCurrentTrack:(PGTrack*)Track
{
    CurrentTrack = Track;
}

- (void) AddTrack:(PGTrack*)Track
{
    if (Track)
    {
        [_Tracks addObject:Track];
    }
}
- (void) RemoveTrack:(PGTrack*)Track
{
    if (Track)
    {
        [_Tracks removeObject:Track];
    }
}

- (PGTrack*) GetTrackByIndex:(NSInteger)Index
{
    if (_Tracks[Index])
    return _Tracks[Index];
    
    else return NULL;
}

- (NSInteger) GetTracksCount
{
    return [_Tracks count];
}

- (PGTrack*) GetNextTrack
{
    NSInteger CurrentTrackIndex = [_Tracks indexOfObject:CurrentTrack];
    
    if (_Tracks[CurrentTrackIndex + 1] != NULL)
    {
        return _Tracks [CurrentTrackIndex + 1];
    }
    
    return NULL;
}
- (PGTrack*) GetPreviousTrack
{
    NSInteger CurrentTrackIndex = [_Tracks indexOfObject:CurrentTrack];
    
    if (_Tracks[CurrentTrackIndex - 1] != NULL)
    {
        return _Tracks [CurrentTrackIndex - 1];
    }
    
    return NULL;
}

- (PGTrack*) GetCurrentTrack
{
    return CurrentTrack;
}

@end
