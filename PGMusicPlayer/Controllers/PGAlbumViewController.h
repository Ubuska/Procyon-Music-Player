//
//  PGAlbumViewController.h
//  PGMusicPlayer
//
//  Created by Peter Gubin on 07.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PGAlbumViewController : NSViewController <NSCollectionViewDelegate>

@property (assign) IBOutlet NSArrayController* ArrayController;
@property (assign) IBOutlet NSCollectionView* CollectionView;



@end
