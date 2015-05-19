
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject
@property (readonly) NSString *name;
@property NSString *state;
@property NSString *province;
@property UIImage *cityImage;
@property NSString *wikipediaURL;


- (instancetype) initWithName: (NSString*) name;
@end
