//
//  PGSplitView.m
//  PGMusicPlayer
//
//  Created by Peter on 07/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGSplitView.h"

@implementation PGSplitView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (NSColor*)dividerColor
{
    return (self.DividerColor == nil) ? [super dividerColor] : self.DividerColor;
}

@end
