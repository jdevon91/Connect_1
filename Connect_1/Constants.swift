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

var CURRENT_METER_URL = ""


class Constants{
    
    //let CURRENT_METER_URL = "http://connect.medeng.com/mostrecentrecord.php"

func updateMeterUrl(meter_url:String) -> String {
    CURRENT_METER_URL = "http://connect.medeng.com/mostrecentrecord2.php?meter=" + meter_url
    return CURRENT_METER_URL
}
    }

typealias DownloadComplete = () -> ()// type alias for the download complete call in CurrentMeterData

