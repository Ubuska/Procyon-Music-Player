//
//  PGAlbumViewController.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 07.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "PGAlbumViewController.h"
#import "AppDelegate.h"

#import "PGAlbum.h"
#import "PGAlbumManager.h"

@interface PGAlbumViewController ()

@end

@implementation PGAlbumViewController

#pragma mark NSCollectionView Delegate Methods



- (void)viewDidLoad
{
    [super viewDidLoad];
    //AppDelegate* Application = (AppDelegate *)[NSApp delegate];

    
    NSCollectionViewItem* AlbumItem = [self.storyboard instantiateControllerWithIdentifier:@"AlbumItem"];
    [_CollectionView setItemPrototype:AlbumItem];
    
    NSMutableDictionary *value = [[NSMutableDictionary alloc] init];
    // Add some values to the dictionary
    // which match up to the NSTableView bindings
    [value setObject:[NSNumber numberWithInt:0] forKey:@"id"];
    [value setObject:[NSString stringWithFormat:@"test"] forKey:@"name"];
    
    for (int i=0; i < 30; i++)
    {
        PGAlbum* Album = [PGAlbum new];
        
        [AlbumManager AddAlbum:Album];
        [_ArrayController addObject:Album];
    }
    
    //[self.ArrayController rearrangeObjects];
    [_ArrayController addObject:value];
 
    //[_CollectionView relo];
    // Do view setup here.
}

@end
