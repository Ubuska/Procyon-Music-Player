//
//  PGTrack.m
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGTrack.h"
#import <AVFoundation/AVFoundation.h>
#import "AppKit/NSBitmapImageRep.h"
#import "AppKit/NSImage.h"

@implementation PGTrack

- (void) InitWithURL:(NSURL*)URL
{
    TrackURL = URL;
    NSString* LastPathName = [URL lastPathComponent];
    Name = [[LastPathName lastPathComponent] stringByDeletingPathExtension];
    
    [self GetCoverImage];
}

- (NSURL*) GetURL
{
    return TrackURL;
}

- (void) GetCoverImage
{
    AVAsset* Asset;
    Asset = [AVURLAsset URLAssetWithURL:TrackURL options:nil];

    for (NSString *format in [Asset availableMetadataFormats])
    {
        for (AVMetadataItem *item in [Asset metadataForFormat:format])
        {
            if ([[item commonKey] isEqualToString:@"title"])
            {
                NSString* Test = (NSString*)[item value];
                //musicItem.strSongTitle = (NSString *)[item value];
            }
            if ([[item commonKey] isEqualToString:@"artist"])
            {
                NSString* Test = (NSString*)[item value];
                //musicItem.strArtistName = (NSString *)[item value];
            }
            if ([[item commonKey] isEqualToString:@"albumName"])
            {
                NSString* Test = (NSString*)[item value];
                //musicItem.strAlbumName = (NSString *)[item value];
            }
            if ([[item commonKey] isEqualToString:@"artwork"])
            {
                NSArray *keys = [NSArray arrayWithObjects:@"commonMetadata", nil];
                [Asset loadValuesAsynchronouslyForKeys:keys completionHandler:^{
                    NSArray *artworks = [AVMetadataItem metadataItemsFromArray:Asset.commonMetadata
                                                                       withKey:AVMetadataCommonKeyArtwork
                                                                      keySpace:AVMetadataKeySpaceCommon];
                    /*
                    for (AVMetadataItem *item in artworks)
                    {
                        if ([item.keySpace isEqualToString:AVMetadataKeySpaceID3])
                        {
                            NSData *Data = [item.value copyWithZone:nil];
                            NSImage* im = [[NSImage alloc] initWithData:(NSData *)Data];
                            
                            NSBitmapImageRep * ImageRep = [NSBitmapImageRep imageRepWithData:Data];
                            NSSize ImageSize = NSMakeSize(CGImageGetWidth([ImageRep CGImage]), CGImageGetHeight([ImageRep CGImage]));
                            NSImage* Image = [[NSImage alloc] initWithSize:ImageSize];
                            [Image addRepresentation:ImageRep];
                            //self.currentSongArtwork = [UIImage imageWithData:[d objectForKey:@"data"]];
                        }
                        else if ([item.keySpace isEqualToString:AVMetadataKeySpaceiTunes])
                        {
                            //self.currentSongArtwork = [UIImage imageWithData:[item.value copyWithZone:nil]];
                        }
                    }*/
                    }];
            }
        }
    }
}


@end
