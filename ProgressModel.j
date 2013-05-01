
@implementation ProgressModel : CPObject
{
    CPString name @accessors;
    long     complete @accessors;
    long     request @accessors;
    long     failed @accessors;
    int      identifier @accessors;

}

-(id)initWithObject:(id)anObject
{
    self = [super init];
    if (self)
    {
        name = anObject.type;
        complete = anObject.complete;
        request = anObject.request;
        failed = anObject.failed;
        identifier = anObject.id;
    }
    return self;
}

-(void)update:(id)anObject
{
    name = anObject.type;
    complete = anObject.complete;
    request = anObject.request;
    failed = anObject.failed;
    identifier = anObject.id;
}

@end
