//
//  PGItem.h
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGItem : NSObject
{
    NSString* CoverPicURL;
    NSString* Name;
}

- (NSString*) GetCoverURL;
- (NSString*) GetName;

- (void) SetCoverURL:(NSString*)CoverURL;

@end
