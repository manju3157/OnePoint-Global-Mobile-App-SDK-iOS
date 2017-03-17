//
//  GeofencingViewController.m
//  SDKDemoApp
//
//  Created by OnePoint Global on 06/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

#import "GeofencingViewController.h"

@interface GeofencingViewController ()<OPGGeoFencingDelegate,UITableViewDelegate,UITableViewDataSource> {
    OPGGeoFencing* geo;
    NSMutableArray* arrayLocations;
    NSArray *enabledSurveys;
    NSArray* surveyList;
}
@end

@implementation GeofencingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSError* error;
    OPGSDK* sdk = [OPGSDK new];
    OPGAuthenticate* authenticate = [sdk authenticate:@"USERNAME" password:@"PASSWORD" error:&error];
    
    if ([authenticate.isSuccess  isEqual: @1]) {
        NSLog(@"Authentication Success");
    } else {
        NSLog(@"%@", authenticate.statusMessage);
    }
    surveyList = [sdk getUserSurveyList:&error];
    geo = [[OPGGeoFencing alloc] initWithGeoFencingSurveys:surveyList];
    geo.geoFencingDelegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchTapped:(id)sender {
    UISwitch* customSwitch = (UISwitch*)sender;
    if (customSwitch.isOn) {
        [geo startGeoFencing];
        
    } else if (!customSwitch.isOn ) {
        [geo stopGeoFencing];
        
    }
}

- (void)showAlert{
    if ([arrayLocations count] == 0) {
        return;
    }
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"OPGSDK"
                                 message:[NSString stringWithFormat:@"Congratulations! You're at location %@ and a survey available for u at this location",[[arrayLocations firstObject] address]]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action) {
                                   [arrayLocations removeObjectAtIndex:0];
                                   [self performSelector:@selector(showAlert) withObject:nil afterDelay:0.0];
                                   
                               }];
    UIAlertAction* takeSurveyButton = [UIAlertAction
                                       actionWithTitle:@"TakeSurvey"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action) {
                                       }];
    
    [alert addAction:okButton];
    [alert addAction:takeSurveyButton];
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)didEnterSurveyRegion:(NSArray *)locations {
    NSLog(@"Entered locations %@",locations);
    arrayLocations = [NSMutableArray arrayWithArray:locations];
    
    NSMutableArray* surveys = [NSMutableArray new];
    
    if ([locations count] > 0) {
        [self showAlert];
    }
    
    for (OPGGeoFencingModel* model in locations) {
        [surveys addObject:model.surveyName];
    }
    
    NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:surveys];
    enabledSurveys = [orderedSet array];
    
}

-(void)didExitSurveyRegion:(NSArray *)locations {
    NSLog(@"Exited locations %@",locations);
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  surveyList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customCell"];
    }
    OPGSurvey* survey = [surveyList objectAtIndex:indexPath.row];
    cell.textLabel.text = survey.surveyName;
    return cell;
}


@end
