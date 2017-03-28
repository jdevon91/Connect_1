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
    
    //Output Holders
    var meterIdHolder = ""
    var locationNameHolder = ""
    var latitudeHolder = ""
    var longitudeHolder = ""
    var ipAddressHolder = ""
    var portHolder = ""
    var slaveIdHolder = ""
    var carrierHolder = ""
    var pollFrequencyHolder = ""
    var testControlHolder = ""
   
    //Variable Labels
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    
    //Variable outputs
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
    @IBAction func connectConfirm(_ sender: Any) {}
    @IBAction func cancelConfirm(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        myTimer2.invalidate()
    }
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func indexChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            labelOne.text = "Meter ID:"
            labelTwo.text = "Location Name:"
            labelThree.text = "Latitude:"
            labelFour.text = "Longitude:"
            labelFive.text = ""
            meterIdConfirm.text = meterIdHolder
            locationNameConfirm.text = locationNameHolder
            latitudeConfirm.text = latitudeHolder
            longitudeConfirm.text = longitudeHolder
            ipAddressConfirm.text = ""

        case 1:
            labelOne.text = "IP Address:"
            labelTwo.text = "Port:"
            labelThree.text = "Slave ID:"
            labelFour.text = "Carrier:"
            labelFive.text = "Poll Frequency:"
            meterIdConfirm.text = ipAddressHolder
            locationNameConfirm.text = portHolder
            latitudeConfirm.text = slaveIdHolder
            longitudeConfirm.text = carrierHolder
            ipAddressConfirm.text = pollFrequencyHolder
            
        default:
            break
        }
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
    
    
//created a function to update the UI, update: changed to update holders which are then called while using the segmented control
    func updateLocationConfirmUi() {
     
    meterIdHolder = currentMeter3._meterIdVal
    locationNameHolder = currentMeter3._locationNameVal
    latitudeHolder = currentMeter3._latitudeVal
    longitudeHolder = currentMeter3._longitudeVal
    ipAddressHolder = currentMeter3._ipAddressVal
    portHolder = currentMeter3._portVal
    slaveIdHolder = currentMeter3._slaveIdVal
    carrierHolder = currentMeter3._carrierVal
    pollFrequencyHolder = currentMeter3._pollFrequencyVal
    testControlHolder = currentMeter3._TestControlVal
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
        
        self.currentMeter3.downloadMeterlocation {
            
            self.updateLocationConfirmUi() // calling update UI function
        }
    }

    }

