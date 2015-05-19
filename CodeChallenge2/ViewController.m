
#import "ViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *cities;
@property (weak, nonatomic) IBOutlet UITableView *citiesTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)loadInitialData {
    City *ny = [[City alloc] initWithName:@"New York"];
    ny.state = @"New York state";
    ny.cityImage = [UIImage imageNamed:@"ny"];
    ny.wikipediaURL = @"http://en.wikipedia.org/wiki/New_York_City";
    City *la = [[City alloc] initWithName:@"Los Angeles"];
    la.state = @"California state";
    la.cityImage = [UIImage imageNamed:@"la"];
    la.wikipediaURL = @"http://en.wikipedia.org/wiki/Los_Angeles";
    City *sanFrancisco = [[City alloc] initWithName:@"San Francisco"];
    sanFrancisco.state = @"California state";
    sanFrancisco.cityImage = [UIImage imageNamed:@"sanfran"];
    sanFrancisco.wikipediaURL = @"http://en.wikipedia.org/wiki/San_Francisco";
    City *buenosAires = [[City alloc] initWithName:@"Buenos Aires"];
    buenosAires.province = @"Buenos aires Province";
    buenosAires.cityImage = [UIImage imageNamed:@"bsas"];
    buenosAires.wikipediaURL = @"http://en.wikipedia.org/wiki/Buenos_Aires";
    self.cities = [NSMutableArray arrayWithObjects:ny, la, sanFrancisco, buenosAires, nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    City *city = self.cities[indexPath.row];
    cell.textLabel.text = city.name;
    if ([city.state isEqualToString:@""] || city.state == nil) {
        cell.detailTextLabel.text = city.province;
    }else{
        cell.detailTextLabel.text= city.state;
    }
    cell.imageView.image = city.cityImage;
    return cell;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [self.citiesTableView reloadData];
    }
}

-(IBAction) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.citiesTableView indexPathForSelectedRow];
    CityDetailViewController    *detailViewController = segue.destinationViewController;
    City *selectedCity = self.cities[indexPath.row];
    detailViewController.city = selectedCity;
}


@end
