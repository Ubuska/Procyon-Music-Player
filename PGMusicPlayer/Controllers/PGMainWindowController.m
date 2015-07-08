//
//  MainWindowController.m
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGMainWindowController.h"

@interface PGMainWindowController ()

@end

@implementation PGMainWindowController



- (void)windowDidLoad
{
    
    [super windowDidLoad];
    
    Application = (AppDelegate *)[NSApp delegate];
    
    self.Window.trafficLightButtonsLeftMargin = 7.0;
    self.Window.fullScreenButtonRightMargin = 7.0;
    self.Window.centerFullScreenButton = YES;
    self.Window.titleBarHeight = 60.0;
    
    self.Window.showsTitle = YES;
    
}


@end
