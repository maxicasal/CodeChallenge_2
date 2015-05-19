
#import "City.h"

@interface City()
@property (readwrite) NSString *name;
@end

@implementation City

-(instancetype) init{
    abort();  //Don't use this initializer
    return nil;
}

- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    if ([name isEqualToString:@""]) {
        [NSException raise: NSInvalidArgumentException format:@"Cities name must have a value"];
    }
    self.name = name;
    return self;
}


@end
