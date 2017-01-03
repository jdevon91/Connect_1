//
//  Constants.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-01.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

    
let LATITUDE = "lat="
let LONGITUDE = "&lon="

typealias DownloadComplete = () -> ()// type alias for the download complete call in CurrentMeterData

let CURRENT_METER_URL = "http://connect.medeng.com/mostrecentrecord2.php?meter=1"

//let CURRENT_METER_URL = "http://connect.medeng.com/mostrecentrecord.php"

