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

    CPTimer timer;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{

}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // This is called when the application is done loading.
    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:YES];
    var bounds = [progressCollection bounds]
    [progressCollection setMinItemSize:CGSizeMake(bounds.size.width - 20, 60)];
    [progressCollection setMaxItemSize:CGSizeMake(bounds.size.width - 20, 60)];

    [CPTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(refresh:) userInfo:nil repeats:YES];

}

- (void)refresh:(CPTimer)timer
{
    console.log("Requesting status update");
    // Request the status info
    var request = [CPURLRequest requestWithURL:"resources/testData.json"];
    var connection = [CPURLConnection connectionWithRequest:request delegate:self];
}

 - (void)connection:(CPURLConnection)connection didReceiveData:(CPString)data
{
    console.log("Got status update");

    var result = CPJSObjectCreateWithJSON(data);

    // Get the pipeline array out
    var pipes = result['pipeline'];

    var models = [];

    for(var i=0; i < pipes.length; i++) {
        // Build a ProgressModel from each structure
        var model = [[ProgressModel alloc] initWithObject:pipes[i]];
        models.push(model);
    }

    console.log("Updating views");
    [progressCollection setContent: models];
}



- (void)connection:(CPURLConnection)connection didFailWithError:(CPString)error
{
    //This method is called if the request fails for any reason.
    console.log("Error getting status update");

}

@end
