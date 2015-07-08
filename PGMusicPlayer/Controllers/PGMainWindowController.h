//
//  MainWindowController.h
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"
#import "INAppStoreWindow.h"

@interface PGMainWindowController : NSWindowController
{
    AppDelegate* Application;
}

@property IBOutlet INAppStoreWindow* Window;

@end
