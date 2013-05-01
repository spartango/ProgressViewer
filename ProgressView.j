@import <AppKit/CPView.j>
@import "ProgressModel.j"

@implementation ProgressView : CPView
{
    @outlet CPTextField pipeLabel;
    @outlet CPTextField failedLabel;
    @outlet CPTextField completeLabel;
    @outlet CPTextField requestLabel;

    @outlet CPProgressIndicator progressIndicator;
}

- (void)setRepresentedObject:(id)anObject
{
    //[self setBackgroundColor:[CPColor redColor]];
    //[self setBounds:CGRectMake(0, 0, 400, 60)];
    console.log("Loading "+self+" from "+anObject);
    if(anObject) {
        // The object represented will be a ProgressModel
        [pipeLabel setStringValue: [anObject name]];

        // Set the various numeric status values
        [failedLabel setStringValue: [anObject failed]];
        [completeLabel setStringValue: [anObject complete]];
        [requestLabel setStringValue: [anObject request]];

        // Progress bar max, min and progress
        [progressIndicator setMaxValue: [anObject request]];
        [progressIndicator setIndeterminate:NO];
        [progressIndicator setDoubleValue: [anObject complete]];
        console.log("Loaded object");
    }
}

-(id)initWithCoder:(CPCoder)aCoder
{
    self = [super initWithCoder:aCoder];

    if (self) {
        pipeLabel = [aCoder decodeObjectForKey:"ProgressViewPipeLabel"];
        failedLabel = [aCoder decodeObjectForKey:"ProgressViewFailedLabel"];
        completeLabel = [aCoder decodeObjectForKey:"ProgressViewCompleteLabel"];
        requestLabel = [aCoder decodeObjectForKey:"ProgressViewRequestLabel"];
        progressIndicator = [aCoder decodeObjectForKey:"ProgressViewProgressIndicator"];
    }
    return self;
}

-(void)encodeWithCoder:(CPCoder)aCoder
{
    [super encodeWithCoder:aCoder];

    [aCoder encodeObject:pipeLabel forKey:"ProgressViewPipeLabel"];
    [aCoder encodeObject:failedLabel forKey:"ProgressViewFailedLabel"];
    [aCoder encodeObject:completeLabel forKey:"ProgressViewCompleteLabel"];
    [aCoder encodeObject:requestLabel forKey:"ProgressViewRequestLabel"];
    [aCoder encodeObject:progressIndicator forKey:"ProgressViewProgressIndicator"];

}
@end
