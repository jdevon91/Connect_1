//
//  Location.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-09.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}

