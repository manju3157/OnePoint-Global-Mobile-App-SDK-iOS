//
//  GeofencingViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 06/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class GeofencingViewController: UIViewController,OPGGeoFencingDelegate
{
    
    var geo : OPGGeoFencing!
    @IBOutlet weak var switchControl : UISwitch!
    var arrayLocations : NSMutableArray = []
    var surveyList : Array<Any> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let sdk = OPGSDK()
        var auth = OPGAuthenticate()
        
        do {
            auth =  try sdk.authenticate("USERNAME", password: "PASSWORD")
        } catch  {
            print("Authentication Error")
        }
        
        if (auth.isSuccess.intValue == 1 ) {
            print("Authentication Sucessful")
        }
        do {
            surveyList = try sdk.getUserSurveyList() as Array<Any>       // Getting list of Surveys assigned to user
        }
        catch{
            print("User Survey not available/working")         /* @"Error Occured. Contact Support!" */
            
        }
        self.geo = OPGGeoFencing.init(geoFencingSurveys: surveyList )
        self.geo.geoFencingDelegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchTapped(_ sender: AnyObject) {
        let custom : UISwitch = sender as! UISwitch
        if custom.isOn {
            self.geo.startGeoFencing()
        } else {
            self.geo.stopGeoFencing()
        }
    }
    
    func didEnterSurveyRegion(_ locations: [Any]!) {
        self.arrayLocations = NSMutableArray.init(array: locations)
        
        if self.arrayLocations.count > 0 {
            self.showAlert()
        }
    }
    
    func didExitSurveyRegion(_ locations: [Any]!) {
        
    }
    
    func showAlert() {
        if self.arrayLocations.count == 0 {
            return
        }
        let model : OPGGeoFencingModel = self.arrayLocations.firstObject as! OPGGeoFencingModel
        let alert : UIAlertController = UIAlertController.init(title: "OPGSDK", message: "Congratulations! You're at location \(model.address) and a survey available for u at this location", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            self.arrayLocations.removeObject(at: 0)
            self.showAlert()
        }))
        alert.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        present(alert, animated: true, completion: nil);
    }

}
