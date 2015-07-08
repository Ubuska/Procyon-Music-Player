//
//  PGSplitViewController.m
//  PGMusicPlayer
//
//  Created by Peter on 08/07/15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGSplitViewController.h"

@interface PGSplitViewController ()

@end

@implementation PGSplitViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSWindow* MainWindow = [[[NSApplication sharedApplication] windows] objectAtIndex:0];
    [MainWindow setContentView:self.view];
    
    // Do view setup here.
}

@end
