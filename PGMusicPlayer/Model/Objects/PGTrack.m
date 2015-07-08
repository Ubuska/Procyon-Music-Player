//
//  PGTrack.m
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGTrack.h"

@implementation PGTrack

- (void) InitWithURL:(NSURL*)URL
{
    TrackURL = URL;
    NSString* LastPathName = [URL lastPathComponent];
    Name = [[LastPathName lastPathComponent] stringByDeletingPathExtension];
}

- (NSURL*) GetURL
{
    return TrackURL;
}



@end
