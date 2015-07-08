//
//  PGMaxHeightView.m
//  PGMusicPlayer
//
//  Created by Peter on 08/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGMaxHeightView.h"

@implementation PGMaxHeightView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

/*
- (void)layout
{
    // Important. This lets the Auto Layout engine do its job.
    [super layout];
    
    // Now all subview frames are set according to their constraints.
    // We can freely reposition and/or resize any view here, even one
    // that has already been positioned with Auto Layout (that is not
    // recommended, though).
    
    // Here, we position and size a view we want to lay out manually.
    // Don't modify the frame directly because the view has a transform
    // applied.

    self.manualLayoutView.bounds = CGRectMake(...);
    self.manualLayoutView.center = CGPointMake(...);
    self.frame = CGRectMake(0,0,10,300);
}*/

- (void)resizeWithOldSuperviewSize:(NSSize)oldSize
{
    [super resizeSubviewsWithOldSize:oldSize];
    
   /*  NSWindow* Window = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
    
    NSRect f = self.frame;
    
    
    f.size.width = self.frame.size.width;
    f.origin = self.frame.origin;
    //f.origin.y = Window.frame.origin.y;
    //f.origin.y = Window.frame.origin.y;
    f.size.height = Window.frame.size.height;
    NSLog(@"Height = %f", Window.frame.size.height);
    for (NSView* vie in self.subviews)
    {
        NSRect f2 = vie.bounds;
        f2.origin.y = -vie.superview.bounds.origin.y;
        [vie setFrameOrigin:f2.origin];
    }
    [self setFrameSize:f.size];
    [self setFrameOrigin:f.origin];
    //...*/
}

@end
