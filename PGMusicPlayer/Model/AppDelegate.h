//
//  AppDelegate.h
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Protocols.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property id <UpdateViewProtocol> UpdateViewDelegate;
@end

