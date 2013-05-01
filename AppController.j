/*
 * AppController.j
 * ProgressViewer
 *
 * Created by You on April 30, 2013.
 * Copyright 2013, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "ProgressModel.j"
@import "ProgressView.j"

@implementation AppController : CPObject
{
    @outlet CPWindow         theWindow;
    @outlet CPCollectionView progressCollection;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{

}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];

    // This is called when the application is done loading.
    console.log("Loading test objects");

    var testObjects = [
        [[ProgressModel alloc] initWithObject:{"id": 1, "type": "test", "complete": 1000, "request": 2000, "failed": 3}],
        [[ProgressModel alloc] initWithObject:{"id": 2, "type": "test 2", "complete": 500, "request": 2000, "failed": 6}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
        [[ProgressModel alloc] initWithObject:{"id": 4, "type": "test 4", "complete": 1200, "request": 2000, "failed": 12}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
        [[ProgressModel alloc] initWithObject:{"id": 3, "type": "test 3", "complete": 200, "request": 2000, "failed": 9}],
    ];

    console.log(testObjects);
    console.log(progressCollection);

    //debugger;
    [progressCollection setContent:testObjects];

    console.log("Set collection content");

}

@end
