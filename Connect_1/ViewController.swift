//
//  ViewController.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBAction func connectToClosestMeter(_ sender: Any) {
        //download meter dictionary from http://connect.medeng.com/service.php
        let DistanceSortStart = DistanceSort()
        DistanceSortStart.downloadMeterlocation {}
    }
    @IBAction func meterIdButton(_ sender: Any) {
        //Create the alert controller.
        let alert = UIAlertController(title: "Meter ID", message: "Enter a Meter ID Number:", preferredStyle: .alert)
        
        //Adding the text field.
        alert.addTextField { (textField) in
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        //Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            let UserEnteredMeterID: String = textField.text!
            let callFromConstants = Constants()
            callFromConstants.updateMeterUrl(meter_url: UserEnteredMeterID)
            callFromConstants.updateMeterindex(meter_id: UserEnteredMeterID)
            Alamofire.request("http://connect.medeng.com/standby.php?meter=\(UserEnteredMeterID)")
            self.performSegue(withIdentifier: "meterid", sender: alert!.textFields)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
       // locationManager.startMonitoringSignificantLocationChanges()
        locationAuthStatus()
        
    }

func locationAuthStatus() {
    if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
       currentLocation = locationManager.location
       Location.sharedInstance.latitude = currentLocation.coordinate.latitude
       Location.sharedInstance.longitude = currentLocation.coordinate.longitude              }
     else {
       self.locationManager.requestWhenInUseAuthorization()
        self.locationAuthStatus()}
    }
}
