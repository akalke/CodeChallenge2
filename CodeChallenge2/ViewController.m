//
//  ViewController.m
//  CodeChallenge2
//
//  Created by Amaeya Kalke on 10/10/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "ViewController.h"
#import "CItyViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeCities];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if(editingStyle == UITableViewCellEditingStyleDelete){
        [self.cityArray removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cityArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"CityCellID" forIndexPath:indexPath];

    City *city = [self.cityArray objectAtIndex:indexPath.row];
    cell.textLabel.text = city.cityName;
    cell.imageView.image = city.image;

    return cell;

}

-(void)initializeCities{
    City *cityOne = [[City alloc] init];
    cityOne.cityName = @"Chicago";
    cityOne.stateOrProvince = @"IL";
    cityOne.image = [UIImage imageNamed: @"Chicago"];
    City *cityTwo = [[City alloc] init];
    cityTwo.cityName = @"Boston";
    cityTwo.stateOrProvince = @"MA";
    City *cityThree =[[City alloc] init];
    cityThree.cityName = @"Seattle";
    cityThree.stateOrProvince = @"WA";
    City *cityFour = [[City alloc] init];
    cityFour.cityName = @"Austin";
    cityFour.stateOrProvince = @"TX";

    self.cityArray = [[NSMutableArray alloc] initWithObjects: cityOne, cityTwo, cityThree, cityFour, nil];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", segue.identifier);

    if([segue.identifier isEqualToString:@"cityDetailSegue"]){
        CItyViewController *cityVC = segue.destinationViewController;
        City *myCity = [self.cityArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        cityVC.city = myCity;
        cityVC.citiesArray = self.cityArray;
    }
}

@end
