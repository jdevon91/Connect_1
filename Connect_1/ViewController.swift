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
        let DistanceSort2 = DistanceSort()
        DistanceSort2.downloadMeterlocation {}
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
        Location.sharedInstance.longitude = currentLocation.coordinate.longitude
        print(currentLocation.coordinate.latitude)
               }
     else {
        locationManager.requestWhenInUseAuthorization()
        locationAuthStatus()
    }
}
}
