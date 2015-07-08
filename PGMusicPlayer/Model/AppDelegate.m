//
//  AppDelegate.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "AppDelegate.h"
#import "INAppStoreWindow.h"
#import "PGMainWindowController.h"

#import "INAppStoreWindow.h"
#import "INWindowButton.h"
#import "PGAlbumManager.h"

@interface AppDelegate ()

@end

INAppStoreWindow* MainWindow;

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [AlbumManager Initialize];

    MainWindow = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
    MainWindow.showsBaselineSeparator = NO;
    MainWindow.trafficLightButtonsLeftMargin = 7.0;
    MainWindow.fullScreenButtonRightMargin = 7.0;
    MainWindow.centerFullScreenButton = YES;
    MainWindow.titleBarHeight = 40.0;
    MainWindow.titleBarGradient = [[NSGradient alloc] initWithColorsAndLocations:
                                   [NSColor colorWithWhite:0.2 alpha:1], 0,
                                   [NSColor colorWithWhite:0 alpha:0], 1, nil];
    MainWindow.inactiveTitleBarGradient = [[NSGradient alloc] initWithColorsAndLocations:
                                             [NSColor colorWithWhite:0.2 alpha:1], 0,
                                             [NSColor colorWithWhite:0 alpha:0], 1, nil];
    
   // [self setupCloseButton];
   // [self setupMinimizeButton];
   // [self setupZoomButton];
    
    
    //[self CreateWindowController];
    [_UpdateViewDelegate UpdateView];
    
    
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

- (void)CreateWindowController
{
    NSStoryboard *StoryBoard = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    PGMainWindowController* Controller = [StoryBoard instantiateControllerWithIdentifier:@"MainWindow"];
    [Controller showWindow:self];
}

- (void)setupCloseButton
{
    INWindowButton *closeButton = [INWindowButton windowButtonWithSize:NSMakeSize(14, 16) groupIdentifier:nil];
    closeButton.activeImage = [NSImage imageNamed:@"close-active-color.tiff"];
    closeButton.activeNotKeyWindowImage = [NSImage imageNamed:@"close-activenokey-color.tiff"];
    closeButton.inactiveImage = [NSImage imageNamed:@"close-inactive-disabled-color.tiff"];
    closeButton.pressedImage = [NSImage imageNamed:@"close-pd-color.tiff"];
    closeButton.rolloverImage = [NSImage imageNamed:@"close-rollover-color.tiff"];
    MainWindow.closeButton = closeButton;
}

- (void)setupMinimizeButton
{
    INWindowButton *button = [INWindowButton windowButtonWithSize:NSMakeSize(14, 16) groupIdentifier:nil];
    button.activeImage = [NSImage imageNamed:@"minimize-active-color.tiff"];
    button.activeNotKeyWindowImage = [NSImage imageNamed:@"minimize-activenokey-color.tiff"];
    button.inactiveImage = [NSImage imageNamed:@"minimize-inactive-disabled-color.tiff"];
    button.pressedImage = [NSImage imageNamed:@"minimize-pd-color.tiff"];
    button.rolloverImage = [NSImage imageNamed:@"minimize-rollover-color.tiff"];
    MainWindow.minimizeButton = button;
}

- (void)setupZoomButton
{
    INWindowButton *button = [INWindowButton windowButtonWithSize:NSMakeSize(14, 16) groupIdentifier:nil];
    button.activeImage = [NSImage imageNamed:@"zoom-active-color.tiff"];
    button.activeNotKeyWindowImage = [NSImage imageNamed:@"zoom-activenokey-color.tiff"];
    button.inactiveImage = [NSImage imageNamed:@"zoom-inactive-disabled-color.tiff"];
    button.pressedImage = [NSImage imageNamed:@"zoom-pd-color.tiff"];
    button.rolloverImage = [NSImage imageNamed:@"zoom-rollover-color.tiff"];
    MainWindow.zoomButton = button;
}

- (IBAction)showSheetAction:(id)sender
{
    /*[NSApp beginSheet:self.sheet modalForWindow:self.window
        modalDelegate:self didEndSelector:nil contextInfo:nil];
}

- (IBAction)doneSheetAction:(id)sender
{
    [self.sheet orderOut:nil];
    [NSApp endSheet:self.sheet];*/
}


@end
