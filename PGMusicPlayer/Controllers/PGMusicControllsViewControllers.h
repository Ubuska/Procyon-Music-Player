//
//  PGMusicControllsViewControllers.h
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "RMBlurredView.h"
#import "PGAsyncImageView.h"
#import "Protocols.h"

@interface PGMusicControllsViewControllers : NSViewController <UpdateViewProtocol>

@property (strong) IBOutlet NSView *ParentView;
@property (strong) IBOutlet RMBlurredView *BlurredBackground;

@property (strong) IBOutlet PGAsyncImageView* BackgroundImageView;
@property (strong) IBOutlet PGAsyncImageView* CoverImageView;

@property (strong) IBOutlet NSButton* PlayButton;
@property (strong) IBOutlet NSButton* StopButton;
@property (strong) IBOutlet NSButton* NextTrackButton;
@property (strong) IBOutlet NSButton* PreviousTrackButton;

@property (strong) IBOutlet NSSlider* VolumeSlider;
@property (strong) IBOutlet NSSlider* TrackSlider;
@property (strong) IBOutlet NSTextField* TrackStartTime;
@property (strong) IBOutlet NSTextField* TrackEndTime;

@property (strong) IBOutlet NSTextField* ArtistName;

@end
