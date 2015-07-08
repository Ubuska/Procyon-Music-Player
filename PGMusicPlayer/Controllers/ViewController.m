//
//  ViewController.m
//  PGMusicPlayer
//
//  Created by Peter Gubin on 05.07.15.
//  Copyright (c) 2015 Peter Gubin. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

#import "PGMusicPlayer.h"
#import "PGMusicManager.h"



@implementation ViewController

AppDelegate* Application;



- (void)viewDidLoad
{
    [super viewDidLoad];
    Application = (AppDelegate *)[NSApp delegate] ;
   
    
    NSSplitViewController* SplitController = (NSSplitViewController*) self.parentViewController;
    //[SplitController ];
    //INAppStoreWindow *aWindow = [self.view window];
   // aWindow.titleBarHeight = 60.0;
    
    [_TableView setTarget:self];
    [_TableView setDoubleAction:@selector(RowDoubleClick:)];
    
    // Drag'n'drop
    [_TableView registerForDraggedTypes:[NSArray arrayWithObject:(NSString*)kUTTypeFileURL]];
    
   

    
    Application.UpdateViewDelegate = self;
    [MusicManager Initialize];
}




- (void) UpdateView
{
    [_TableView reloadData];
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (void) RowDoubleClick:(id)object
{
    NSInteger RowNumber = [_TableView clickedRow];
    [MusicPlayer PlayTrack:[MusicManager GetTrackByIndex:RowNumber]];
    //if (Tracks)[self PlayTrack:[Tracks objectAtIndex:RowNumber]];
}

#pragma mark - Table View Delegate Methods

- (NSInteger) numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [MusicManager GetTracksCount];
}

- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex
{

    return @"Test";
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row
{
    NSTableCellView *result = [tableView makeViewWithIdentifier:@"Name" owner:self];
    
    //Item *item = [self.items objectAtIndex:row];
    //result.imageView.image = item.itemIcon;
    //result.textField.stringValue = [MusicManager GetTrackByIndex:row];
    result.textField.stringValue = [[MusicManager GetTrackByIndex:row] GetName];
    return result;
}


- (NSDragOperation)tableView:(NSTableView *)aTableView validateDrop:(id < NSDraggingInfo >)info proposedRow:(NSInteger)row proposedDropOperation:(NSTableViewDropOperation)operation
{
    //get the file URLs from the pasteboard
   //NSPasteboard* pb = info.draggingPasteboard;
    
    //list the file type UTIs we want to accept
    //NSArray* acceptedTypes = [NSArray arrayWithObject:(NSString*)kUTTypeMP3];
    
    /*NSArray* urls = [pb readObjectsForClasses:[NSArray arrayWithObject:[NSURL class]]
                                      options:[NSDictionary dictionaryWithObjectsAndKeys:
                                               [NSNumber numberWithBool:YES],NSPasteboardURLReadingFileURLsOnlyKey,
                                               acceptedTypes, NSPasteboardURLReadingContentsConformToTypesKey,
                                               nil]];
    */
    //only allow drag if there is exactly one file
   // if(urls.count != 1)
      //  return NSDragOperationNone;
    
    return NSDragOperationCopy;
}


- (BOOL)tableView:(NSTableView *)aTableView acceptDrop:(id <NSDraggingInfo>)info
              row:(NSInteger)row dropOperation:(NSTableViewDropOperation)operation
{
    NSPasteboard* pboard = [info draggingPasteboard];
   
    NSArray *classes = [NSArray arrayWithObject:[NSURL class]];
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:
                             [NSNumber numberWithBool:YES] forKey:NSPasteboardURLReadingFileURLsOnlyKey];
    
    NSArray *FileURLs = [pboard readObjectsForClasses:classes options:options];
    
    
    
    //NSData* rowData = [pboard dataForType:NSPasteboardTypeSound];
    //NSIndexSet* rowIndexes = [NSKeyedUnarchiver unarchiveObjectWithData:rowData];
    //NSInteger dragRow = [rowIndexes firstIndex];
    
    for (NSURL* CurrentFileURL in FileURLs)
    {
        PGTrack* NewTrack = [PGTrack new];
        [NewTrack InitWithURL:CurrentFileURL];
        [MusicManager AddTrack:NewTrack];
    }
    
    [self.TableView reloadData];
    
    return YES;
}

@end
