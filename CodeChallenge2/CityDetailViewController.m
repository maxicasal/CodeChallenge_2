
#import "CityDetailViewController.h"
#import "WikipediaViewController.h"

@interface CityDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityStateLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property BOOL isEditing;
@property (weak, nonatomic) IBOutlet UITextField *cityNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityStateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cityNameLabel.text = self.city.name;
    if ([self hasStateValue]) {
    }else{
        self.stateLabel.text =@"City Province";
    }
    self.cityStateLabel.text = [self getStateOrProvince];
    self.cityImageView.image = self.city.cityImage;
    self.isEditing = NO;
    self.cityNameTextField.alpha = 0.0;
    self.cityStateTextField.alpha = 0.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)onEditButtonPressed:(id)sender {
    self.isEditing = !self.isEditing;
    
    if (self.isEditing) {
        self.cityNameTextField.alpha = 1.0;
        self.cityStateTextField.alpha = 1.0;
        self.cityNameTextField.text = self.city.name;
        self.cityStateTextField.text = [self getStateOrProvince];
    }else{
        self.cityNameTextField.alpha = 0.0;
        self.cityStateTextField.alpha = 0.0;
        self.cityNameLabel.text = self.cityNameTextField.text;
        self.cityStateLabel.text = self.cityStateTextField.text;
    }
}

- (IBAction)onWikiButtonPressed:(id)sender {
}

- (NSString *) getStateOrProvince{
    if ([self hasStateValue]) {
        return self.city.state;
    }else{
        return self.city.province;
    }
}

- (BOOL) hasStateValue{
    if (self.city.state == nil || [self.city.state isEqualToString:@""]) {
        return NO;
    }
    return YES;
}

-(IBAction) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WikipediaViewController *wikiVC = segue.destinationViewController;
    wikiVC.urlRequested = self.city.wikipediaURL;
}

-(IBAction) didTapWikipediaLabel:(UITapGestureRecognizer *)gesture{
    
}
@end
