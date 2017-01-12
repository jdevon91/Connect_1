//
//  UserLocationConfirm.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-10.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Alamofire

class UserLocationConfirm: UIViewController, CLLocationManagerDelegate {
    
    let grabUserLat = Location.sharedInstance.latitude
    let grabUserLon = Location.sharedInstance.longitude
    var manager = CLLocationManager()
    var currentMeter3: DistanceSort!
    var myTimer2 = Timer()


    
    @IBOutlet weak var meterIdConfirm: UILabel!
    @IBOutlet weak var locationNameConfirm: UILabel!
    @IBOutlet weak var latitudeConfirm: UILabel!
    @IBOutlet weak var longitudeConfirm: UILabel!
    @IBOutlet weak var ipAddressConfirm: UILabel!
    @IBOutlet weak var portConfirm: UILabel!
    @IBOutlet weak var slaveIdConfirm: UILabel!
    @IBOutlet weak var carrierConfirm: UILabel!
    @IBOutlet weak var pollFrequencyConfirm: UILabel!
    @IBOutlet weak var testControlConfirm: UILabel!
    @IBAction func connectConfirm(_ sender: Any) {
        
    }
    @IBAction func cancelConfirm(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        myTimer2.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
        
        currentMeter3 = DistanceSort()
        //using the timer fucntion to loop call
        myTimer2 = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(runTimedCode2),userInfo: nil, repeats: false)

    }
    @IBOutlet weak var map: MKMapView!
    
    //created a function to update the UI
    func updateLocationConfirmUi() {
        
    meterIdConfirm.text = currentMeter3._meterIdVal
        
    locationNameConfirm.text = currentMeter3._locationNameVal
    
    latitudeConfirm.text = currentMeter3._latitudeVal
        
    longitudeConfirm.text = currentMeter3._longitudeVal
        
    ipAddressConfirm.text = currentMeter3._ipAddressVal
      
    portConfirm.text = currentMeter3._portVal
        
    slaveIdConfirm.text = currentMeter3._slaveIdVal
        
    carrierConfirm.text = currentMeter3._carrierVal
        
    pollFrequencyConfirm.text = currentMeter3._pollFrequencyVal
        
    testControlConfirm.text = currentMeter3._TestControlVal
        
  }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //let span:MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(grabUserLat!, grabUserLon!)
        
       // let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
       // map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
        
        let meterAnnotation = MKPointAnnotation()
        
        meterAnnotation.coordinate = CLLocationCoordinate2DMake(currentMeter3!.meterLat, currentMeter3!.meterLong)
        meterAnnotation.title = currentMeter3._meterIdVal
        meterAnnotation.subtitle = currentMeter3._locationNameVal
        map.addAnnotation(meterAnnotation)
    
    }
    func runTimedCode2(){
        
        self.currentMeter3.downloadMeterlocation
            {
                
                self.updateLocationConfirmUi() // calling update UI function
                
        }
        
        
    }

    }

