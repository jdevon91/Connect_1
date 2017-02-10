//
//  DistanceSort.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-09.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

class DistanceSort {
    
    let userLat = Location.sharedInstance.latitude
    let userLon = Location.sharedInstance.longitude
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


//pulling from server using alamofire
    func downloadMeterlocation(completed: @escaping DownloadComplete) {
        
    Alamofire.request("http://connect.medeng.com/service.php").responseJSON{ response in
    let value = response.result.value
        
//SwiftyJSON Magic - making the downloaded data use SwiftyJSON protocol
    let json = JSON(value!)
    let tracker = (json["database"].count)-1 //total for for loops
    var latDouble = [Double]() // latitude array
    var lonDouble = [Double]() //longitude array
    var dbCoordinates = [CLLocation]() // Coordinate array
    let userLocation = CLLocation (latitude: self.userLat!, longitude: self.userLon!)
    //let userLocation = CLLocation (latitude: 0, longitude: 0)
    var minIndex = 0
        
//parsing JSON for latitudes and longitudes, then converting them to data type Doubles
//passing Latitude and longitudes to CLLocation format and storing them in the dbCoordinates array

    for i in 0...tracker {

        latDouble.append(NSString(string: json["database"][i]["Latitude"].stringValue).doubleValue)
        lonDouble.append(NSString(string: json["database"][i]["Longitude"].stringValue).doubleValue)
            
        let coord = CLLocation(latitude: latDouble[i], longitude: lonDouble[i])
        dbCoordinates.append(coord)
        }
        
    latDouble.removeAll()
    lonDouble.removeAll()
        
    var closest = dbCoordinates[0]
        
    for j in 1...tracker {
            
        if dbCoordinates[j].distance(from: userLocation) < closest.distance(from: userLocation) {
                
            minIndex = j
            closest = dbCoordinates[j]
        }
    }
        
    let callFromConstants2 = Constants()
    callFromConstants2.updateMeterUrl(meter_url: "\(json["database"][minIndex]["Meter_ID"].stringValue)")
    Alamofire.request("http://connect.medeng.com/standby.php?meter=" + "\(json["database"][minIndex]["Meter_ID"].stringValue)")
        
    dbCoordinates.removeAll()
        
    //print("dbCoordinates: \(dbCoordinates)")
    //print("minIndex: \(minIndex)")
    //print("Tracker: \(tracker)")
    //print("latDouble: \(latDouble)")
    //print("lonDouble: \(lonDouble)")
        
//get values for meter confirmation UI
    self._meterIdVal = "\(json["database"][minIndex]["Meter_ID"].stringValue)"
    //print(self._meterIdVal)
    self._locationNameVal = "\(json["database"][minIndex]["Location_Name"].stringValue)"
    //print(self._locationNameVal)
    self._latitudeVal = "\(json["database"][minIndex]["Latitude"].stringValue)"
    self._longitudeVal = "\(json["database"][minIndex]["Longitude"].stringValue)"
    self._ipAddressVal = "\(json["database"][minIndex]["IP_Address"].stringValue)"
    self._portVal = "\(json["database"][minIndex]["Port"].stringValue)"
    self._slaveIdVal = "\(json["database"][minIndex]["Slave_ID"].stringValue)"
    self._carrierVal = "\(json["database"][minIndex]["Carrier"].stringValue)"
    self._pollFrequencyVal = "\(json["database"][minIndex]["Poll_Freq"].stringValue)"
    self._TestControlVal = "\(json["database"][minIndex]["Test_Control"].stringValue)"
    self.meterLat = NSString(string: json["database"][minIndex]["Latitude"].stringValue).doubleValue
    self.meterLong = NSString(string: json["database"][minIndex]["Longitude"].stringValue).doubleValue

    completed()
    }
        
    }
}

