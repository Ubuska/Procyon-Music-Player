//
//  PGColoredView.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 08.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGColoredView.h"

@implementation PGColoredView

- (void)drawRect:(NSRect)aRect
{
    NSColor *myColor = [NSColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:0.2f];
    [myColor set];
    NSRectFill([self bounds]);
}
@end
