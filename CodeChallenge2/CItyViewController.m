//
//  CItyViewController.m
//  CodeChallenge2
//
//  Created by Amaeya Kalke on 10/10/14.
//  Copyright (c) 2014 Amaeya Kalke. All rights reserved.
//

#import "CItyViewController.h"
#import "City.h"
#import "WebViewController.h"

@interface CItyViewController ()
@property (strong, nonatomic) IBOutlet UITextField *cityTextField;
@property (strong, nonatomic) IBOutlet UITextField *stateProvinceTextField;

@property (strong, nonatomic) IBOutlet UILabel *cityLabel;
@property (strong, nonatomic) IBOutlet UILabel *stateProvinceLabel;


@property (strong, nonatomic) IBOutlet UILabel *viewWikiLabel;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CItyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cityTextField.text = self.cityLabel.text  =self.city.cityName;
    self.stateProvinceTextField.text = self.stateProvinceLabel.text  =self.city.stateOrProvince;

    [self.cityTextField setHidden:YES];
    [self.stateProvinceTextField setHidden:YES];
    self.imageView.image = self.city.image;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    animated = NO;
    self.navigationItem.title = self.city.cityName;
}

- (IBAction)onEditButtonPress:(id)sender {
    if([[[sender titleLabel] text] isEqualToString:@"Edit"]){
        [sender setTitle:@"Done" forState: UIControlStateNormal];
        [self.cityTextField setHidden:NO];
        [self.cityLabel setHidden:YES];

        [self.stateProvinceTextField setHidden:NO];
        [self.stateProvinceLabel setHidden:YES];
    }
    else{
        [sender setTitle: @"Edit" forState: UIControlStateNormal];
        self.cityLabel.text = self.cityTextField.text;
        self.city.cityName = self.cityLabel.text;

        [self.cityTextField setHidden:YES];
        [self.cityLabel setHidden:NO];

        self.stateProvinceLabel.text = self.stateProvinceTextField.text;
        self.city.stateOrProvince = self.stateProvinceLabel.text;

        [self.stateProvinceTextField setHidden:YES];
        [self.stateProvinceLabel setHidden:NO];
}
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"%@", segue.identifier);

    if([segue.identifier isEqualToString:@"wikiModalSegue"]){
        WebViewController *webVC = segue.destinationViewController;
        webVC.cityNameWeb = self.cityLabel.text;
    }
}


- (IBAction)onViewTap:(UITapGestureRecognizer *)sender {
    NSLog(@"Tap");
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
