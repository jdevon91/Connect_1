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

    //pulling from server using alamofire
    func downloadMeterlocation(completed: @escaping DownloadComplete) {
    Alamofire.request("http://connect.medeng.com/service.php").responseJSON{ response in
    let value = response.result.value
    //SwiftyJSON Magic - making the downloaded data use SwiftyJSON protocol
        let json = JSON(value!)
        
        var tracker = (json["database"].count)-1 //total for for loops
        var latDouble = [Double]() // latitude array
        var lonDouble = [Double]() //longitude array
        var dbCoordinates = [CLLocation]() // Coordinate array
        let userLocation = CLLocation (latitude: self.userLat!, longitude: self.userLon!)
        //let userLocation = CLLocation (latitude: 52.68, longitude: -113.9)
        var minIndex = 0
        
//parsing JSON for latitudes and longitudes, then converting them to data type Doubles
        for i in 0...tracker {

            latDouble.append(NSString(string: json["database"][i]["Latitude"].stringValue).doubleValue)
            lonDouble.append(NSString(string: json["database"][i]["Longitude"].stringValue).doubleValue)
            
            }
//passing Latitude and longitudes to CLLocation format and storing them in the dbCoordinates array
        for j in 0...tracker {
            
            let coord = CLLocation(latitude: latDouble[j], longitude: lonDouble[j])
    
            dbCoordinates.append(coord)
            
        }
        
        var closest = dbCoordinates[0]
        
        for k in 0...tracker {
            
            if dbCoordinates[k].distance(from: userLocation) < closest.distance(from: userLocation) {
                
                minIndex = k
                closest = dbCoordinates[k]
            }
        }

        print (userLocation)
        print(lonDouble)
        print(latDouble)
        print(dbCoordinates)
        print(minIndex+1)
        let callFromConstants2 = Constants()
        callFromConstants2.updateMeterUrl(meter_url: "\(minIndex+1)")
        Alamofire.request("http://connect.medeng.com/standby.php?meter=\(minIndex+1)")

        completed()
    }
    }
}

