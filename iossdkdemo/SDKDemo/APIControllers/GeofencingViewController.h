//
//  GeofencingViewController.h
//  SDKDemoApp
//
//  Created by OnePoint Global on 06/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <OPGSDK/OPGGeoFencing.h>
#import <OPGSDK/OPGGeoFencingModel.h>
#import <OPGSDK/OPGSDK.h>
#import <OPGSDK/OPGSurvey.h>

@interface GeofencingViewController : UIViewController
@property(weak, nonatomic) IBOutlet UISwitch *switchControl;
@property(weak, nonatomic) IBOutlet UITableView* tableViewCustom;
@end
