//
//  PGMusicControllsViewControllers.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGMusicControllsViewControllers.h"
#import "PGMusicPlayer.h"


@interface PGMusicControllsViewControllers ()

@end

@implementation PGMusicControllsViewControllers


#pragma mark UpdateViewDelegate Methods:

- (void) UpdateView
{
    [_CoverImageView downloadImageFromURL:[[MusicPlayer GetCurrentTrack] GetCoverURL]];
    [_BackgroundImageView downloadImageFromURL:[[MusicPlayer GetCurrentTrack] GetCoverURL]];
    [_ArtistName setStringValue:[[MusicPlayer GetCurrentTrack] GetName]];
    
}


- (void)viewDidAppear
{
    [super viewDidAppear];
    
    
    MusicPlayer.UpdateViewDelegate = self;
    
    
    /* Now let's create two RMB/lurredViews on top of it. */
    
    _BlurredBackground = [[RMBlurredView alloc] initWithFrame:_ParentView.frame];
   // _view2 = [[RMBlurredView alloc] initWithFrame:NSMakeRect(0, 0, 450, 50)];
    
    
    
    
    
    //NSImage *imageFromBundle = [NSImage imageNamed:@"tumblr_n4rfhh04gE1s8uu30o1_1280.jpg"];
    
    _BackgroundImageView = [[PGAsyncImageView alloc] initWithFrame:_ParentView.frame];
    [self FlipImageVertically:_BackgroundImageView];
    [_BackgroundImageView rotateByAngle:180];
    //[_BackgroundImageView setImage: imageFromBundle];
    
    _BackgroundImageView.imageScaling = NSImageScaleAxesIndependently;
    
    [_BackgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_ParentView addSubview:_BackgroundImageView];
    
    

    /*
    NSDictionary *views = NSDictionaryOfVariableBindings(_BackgroundImageView);
    
    [_ParentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_BackgroundImageView]|"
                                             options:0
                                             metrics:nil
                                               views:views]];
    
    [_ParentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_BackgroundImageView]|"
                                             options:0
                                             metrics:nil
                                               views:views]];
    
    */
    //
    
    NSWindow* MainWindow = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
    //[MainWindow setContentView:_ParentView.superview];
    NSView *contentView = MainWindow.contentView;
    [_ParentView setTranslatesAutoresizingMaskIntoConstraints:NO];

    
   // [[self class] AddEdgeConstraint:NSLayoutAttributeLeft superview:contentView subview:_ParentView];
   // [[self class] AddEdgeConstraint:NSLayoutAttributeRight superview:contentView subview:_ParentView];
    //[[self class] AddEdgeConstraint:NSLayoutAttributeTop superview:contentView subview:_ParentView];
    
    
    /*
    [_ParentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_BackgroundImageView]|"
                                             options:0
                                             metrics:nil
                                               views:views]];
    */
  
    // Parent View
    /*NSDictionary *ParentViews = NSDictionaryOfVariableBindings(_ParentView);
    
    NSArray *VerticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|"
                                            options:0 metrics:nil views:ParentViews];
    
    [_ParentView addConstraints:VerticalConstraints];*/
    
   /* Set up the effect parameters. */
    [_BlurredBackground setBlurRadius:60.0]; // Hardly blurred
    [_BlurredBackground setSaturationFactor:2.0];
   // [_BlurredBackground setTintColor:[NSColor blackColor]];
    
    [_ParentView addSubview:_BlurredBackground];

    
    [_BlurredBackground setWantsLayer:YES];
    
    [_BlurredBackground addSubview: _PlayButton];
    [_BlurredBackground addSubview: _StopButton];
    [_BlurredBackground addSubview: _NextTrackButton];
    [_BlurredBackground addSubview: _PreviousTrackButton];
    [_BlurredBackground addSubview: _ArtistName];
    
    [_BlurredBackground addSubview: _VolumeSlider];
    [_BlurredBackground addSubview: _TrackSlider];
    [_BlurredBackground addSubview: _TrackStartTime];
    [_BlurredBackground addSubview: _TrackEndTime];
    
    [_BlurredBackground addSubview: _CoverImageView];

    //[_BackgroundImageView setHidden:YES];
    [_BackgroundImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    //[[self class] AddEdgeConstraint:NSLayoutAttributeTop superview:_ParentView subview:_BackgroundImageView];
    //[[self class] AddEdgeConstraint:NSLayoutAttributeBottom superview:_ParentView subview:_BackgroundImageView];
    // NSView* RootView = [_ParentView superview];
    /* NSDictionary *views2 = NSDictionaryOfVariableBindings(_BlurredBackground);
     [_ParentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_BlurredBackground]|"
     options:0
     metrics:nil
     views:views2]];*/
    
   /* NSDictionary *views3 = NSDictionaryOfVariableBindings(_CoverImageView);
    [_ParentView addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_CoverImageView]|"
                                             options:0
                                             metrics:nil
                                               views:views3]];*/
    
    [_ParentView setWantsLayer:YES];
    //[_NonBlurredImageView setWantsLayer:YES];
}

- (IBAction)OnPlayButtonPress:(id)sender;
{
    //[MusicPlayer PlayTrack:@"test"];
    NSLog(@"OnPlayButtonPress");
}

- (IBAction)OnNextButtonPress:(id)sender;
{
    [MusicPlayer NextTrack];
    NSLog(@"OnNextButtonPress");
}

- (IBAction)OnPreviousButtonPress:(id)sender;
{
    [MusicPlayer PreviousTrack];
    NSLog(@"OnPreviousButtonPress");
}

- (IBAction)OnStopButtonPress:(id)sender;
{
    [MusicPlayer StopTrack];
    NSLog(@"OnStopButtonPress");
    
    CGFloat Height = _ParentView.frame.size.height;
}

- (void)FlipImageVertically:(NSImageView*)imageView
{
   
}

+ (void)AddEdgeConstraint:(NSLayoutAttribute)edge superview:(NSView *)superview subview:(NSView *)subview
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:subview
                                                          attribute:edge
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superview
                                                          attribute:edge
                                                         multiplier:1
                                                           constant:0]];
}

@end
