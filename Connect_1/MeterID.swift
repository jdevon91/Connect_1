//
//  MeterID.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
import MapKit
import Alamofire
import SwiftyJSON


class MeterID: UIViewController, CLLocationManagerDelegate {

    let grabUserLat2 = Location.sharedInstance.latitude
    let grabUserLon2 = Location.sharedInstance.longitude
    var manager2 = CLLocationManager()
    var getFromConstants = Constants()
    var _meterIdVal = ""
    var _locationNameVal = ""
    var _latitudeVal = ""
    var _longitudeVal = ""
    var _ipAddressVal = ""
    var _portVal = ""
    var _slaveIdVal = ""
    var _carrierVal = ""
    var _pollFrequencyVal = ""
    var _TestControlVal = ""
    var meterLat:Double = 0.0
    var meterLong: Double = 0.0
    var myTimer3 = Timer()

    @IBOutlet weak var map2: MKMapView!
    @IBOutlet weak var meterId: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var ipAddress: UILabel!
    @IBOutlet weak var port: UILabel!
    @IBOutlet weak var slaveId: UILabel!
    @IBOutlet weak var carrier: UILabel!
    @IBOutlet weak var pollFreq: UILabel!
    @IBAction func connect(_ sender: Any) {}
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil) // kills the current view controller
        myTimer3.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager2.delegate = self
        manager2.desiredAccuracy = kCLLocationAccuracyBest
        manager2.startUpdatingLocation()
        myTimer3 = Timer.scheduledTimer(timeInterval: 1.0,target: self, selector: #selector(runTimedCode3),userInfo: nil, repeats: false)

        
    }

    //created a function to update the UI
    func updateLocationConfirmUi() {
        
        meterId.text = self._meterIdVal
        
        locationName.text = self._locationNameVal
        
        latitude.text = self._latitudeVal
        
        longitude.text = self._longitudeVal
        
        ipAddress.text = self._ipAddressVal
        
        port.text = self._portVal
        
        slaveId.text = self._slaveIdVal
        
        carrier.text = self._carrierVal
        
        pollFreq.text = self._pollFrequencyVal
        
        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //let span:MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(grabUserLat2!, grabUserLon2!)
        
        // let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        // map.setRegion(region, animated: true)
        
        self.map2.showsUserLocation = true
        
        let meterAnnotation = MKPointAnnotation()
        
        meterAnnotation.coordinate = CLLocationCoordinate2DMake(self.meterLat, self.meterLong)
        meterAnnotation.title = self._meterIdVal
        meterAnnotation.subtitle = self._locationNameVal
        map2.addAnnotation(meterAnnotation)
        
    }
    
    func downloadMeterPreviewData(completed: @escaping DownloadComplete) {
        Alamofire.request("http://connect.medeng.com/service.php").responseJSON{ response in
            let value = response.result.value
           
            //SwiftyJSON Magic - making the downloaded data use SwiftyJSON protocol
            let json = JSON(value!)
            
            //get values for meter confirmation UI
            self._meterIdVal = "\(json["database"][CURRENT_METER_INDEX]["Meter_ID"].stringValue)"
            self._locationNameVal = "\(json["database"][CURRENT_METER_INDEX]["Location_Name"].stringValue)"
            self._latitudeVal = "\(json["database"][CURRENT_METER_INDEX]["Latitude"].stringValue)"
            self._longitudeVal = "\(json["database"][CURRENT_METER_INDEX]["Longitude"].stringValue)"
            self._ipAddressVal = "\(json["database"][CURRENT_METER_INDEX]["IP_Address"].stringValue)"
            self._portVal = "\(json["database"][CURRENT_METER_INDEX]["Port"].stringValue)"
            self._slaveIdVal = "\(json["database"][CURRENT_METER_INDEX]["Slave_ID"].stringValue)"
            self._carrierVal = "\(json["database"][CURRENT_METER_INDEX]["Carrier"].stringValue)"
            self._pollFrequencyVal = "\(json["database"][CURRENT_METER_INDEX]["Poll_Freq"].stringValue)"
            self._TestControlVal = "\(json["database"][CURRENT_METER_INDEX]["Test_Control"].stringValue)"
            self.meterLat = NSString(string: json["database"][CURRENT_METER_INDEX]["Latitude"].stringValue).doubleValue
            self.meterLong = NSString(string: json["database"][CURRENT_METER_INDEX]["Longitude"].stringValue).doubleValue
            
            completed()
        }
        
        
    }

    func runTimedCode3(){
        
        self.downloadMeterPreviewData
            {
                
                self.updateLocationConfirmUi() // calling update UI function
                
        }
        
        
    }
}




































