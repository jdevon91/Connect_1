//
//  CurrentMeterData.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2017-01-01.
//  Copyright © 2017 Jesse Budhlall. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class CurrentMeterData {
    var _Meter_ID: String!
    var _Timestamp: CVTimeStamp!
    var _Test_Number: Int!
    var _Poll_Freq: Int!
    var _Test_Control: Int!
    var _Current_WC: Float32!
    var _Current_GVF: Float32!
    var _Current_Oil_Rate: Float32!
    var _Current_Water_Rate: Float32!
    var _Current_Gas_Rate: Float32!
    var _Test_AVG_WC: Float32!
    var _Test_AVG_GVF: Float32!
    var _Test_Cummulative_Oil: Float32!
    var _Test_Cummulative_Water: Float32!
    var _Test_Cummulative_Gas: Float32!
    var _DP1: Float32!
    var _DP2: Float32!
    var _DP3: Float32!
    var _Pressure_1: Float32!
    var _Pressure_2: Float32!
    var _Temperature: Float32!
    var _USD_TT1: Float32!
    var _USD_TT2: Float32!
    var _USD_TT3: Float32!

    
    
    var Meter_ID: String {
        if _Meter_ID == nil {
            _Meter_ID = ""
        }
        return _Meter_ID
    }
    
    var Timestamp: CVTimeStamp {
        if _Timestamp == nil {
            //_Timestamp =
        }
        
        return _Timestamp
    }
    
    var Test_Number: Int {
        if _Test_Number == nil {
            _Test_Number = 0
        }
        return _Test_Number
    }
    
    var Poll_Freq: Int {
        if _Poll_Freq == nil {
            _Poll_Freq = 0
        }
        return _Poll_Freq
    }
    
    var Test_Control: Int {
        if _Test_Control == nil {
            _Test_Control = 0
        }
        return _Test_Control
    }
    
    var Current_WC: Float32 {
        if _Current_WC == nil {
            _Current_WC = 0
        }
        return _Current_WC
    }
    
    var Current_GVF: Float32 {
        if _Current_GVF == nil {
            _Current_GVF = 0
        }
        return _Current_GVF
    }
    
    var Current_Oil_Rate: Float32 {
        if _Current_Oil_Rate == nil {
            _Current_Oil_Rate = 0
        }
        return _Current_Oil_Rate
    }

    var Current_Water_Rate: Float32 {
        if _Current_Water_Rate == nil {
            _Current_Water_Rate = 0
        }
        return _Current_Water_Rate
    }
    
    var Current_Gas_Rate: Float32 {
        if _Current_Gas_Rate == nil {
            _Current_Gas_Rate = 0
        }
        return _Current_Gas_Rate
    }

    var Test_AVG_WC: Float32 {
        if _Test_AVG_WC == nil {
            _Test_AVG_WC = 0
        }
        return _Test_AVG_WC
    }

    var Test_AVG_GVF: Float32 {
        if _Test_AVG_GVF == nil {
            _Test_AVG_GVF = 0
        }
        return _Test_AVG_GVF
    }
    
    var Test_Cummulative_Oil: Float32 {
        if _Test_Cummulative_Oil == nil {
            _Test_Cummulative_Oil = 0
        }
        return _Test_Cummulative_Oil
    }
    
    var Test_Cummulative_Water: Float32 {
        if _Test_Cummulative_Water == nil {
            _Test_Cummulative_Water = 0
        }
        return _Test_Cummulative_Water
    }
    
    var Test_Cummulative_Gas: Float32 {
        if _Test_Cummulative_Gas == nil {
            _Test_Cummulative_Gas = 0
        }
        return _Test_Cummulative_Gas
    }
    
    var DP1: Float32 {
        if _DP1 == nil {
            _DP1 = 0
        }
        return _DP1
    }
    
    var DP2: Float32 {
        if _DP2 == nil {
            _DP2 = 0
        }
        return _DP2
    }
    
    var DP3: Float32 {
        if _DP3 == nil {
            _DP3 = 0
        }
        return _DP3
    }
    
    var Pressure_1: Float32 {
        if _Pressure_1 == nil {
            _Pressure_1 = 0
        }
        return _Pressure_1
    }
    
    var Pressure_2: Float32 {
        if _Pressure_2 == nil {
            _Pressure_2 = 0
        }
        return _Pressure_2
    }
    
    var Temperature: Float32 {
        if _Temperature == nil {
            _Temperature = 0
        }
        return _Temperature
    }
    
    var USD_TT1: Float32 {
        if _USD_TT1 == nil {
            _USD_TT1 = 0
        }
        return _USD_TT1
    }
    
    var USD_TT2: Float32 {
        if _USD_TT2 == nil {
            _USD_TT2 = 0
        }
        return _USD_TT2
    }
    
    var USD_TT3: Float32 {
        if _USD_TT3 == nil {
            _USD_TT3 = 0
        }
        return _USD_TT3
    }
    
    
    //function to pull meter data
    func downloadMeterDetails(completed: @escaping DownloadComplete) {
        //Download Current Meter Data
        
        let currentMeterURL = URL(string: CURRENT_METER_URL)!
        Alamofire.request(currentMeterURL).responseJSON{ response in
            let result = response.result
            print(response)
            }
        completed()
    }
}
