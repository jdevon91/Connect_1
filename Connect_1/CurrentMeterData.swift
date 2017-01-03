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
    var _Timestamp: String!
    var _Test_ID: String!
    var _Poll_Freq: String!
    var _Test_Control: String!
    var _Current_WC: String!
    var _Current_GVF: String!
    var _Current_Oil_Rate: String!
    var _Current_Water_Rate: String!
    var _Current_Gas_Rate: String!
    var _Test_AVG_WC: String!
    var _Test_AVG_GVF: String!
    var _Test_Cummulative_Oil: String!
    var _Test_Cummulative_Water: String!
    var _Test_Cummulative_Gas: String!
    var _DP1: String!
    var _DP2: String!
    var _DP3: String!
    var _Pressure_1: String!
    var _Pressure_2: String!
    var _Temperature: String!
    var _USD_TT1: String!
    var _USD_TT2: String!
    var _USD_TT3: String!

    
    
    var Meter_ID: String {
        if _Meter_ID == nil {
            _Meter_ID = "Error"
        }
        return _Meter_ID
    }
    
    var Timestamp: String {
        if _Timestamp == nil {
            //_Timestamp =
        }
        
        return _Timestamp
    }
    
    var Test_ID: String {
        if _Test_ID == nil {
            _Test_ID = "Error"
        }
        return _Test_ID
    }
    
    var Poll_Freq: String {
        if _Poll_Freq == nil {
            _Poll_Freq = "Error"
        }
        return _Poll_Freq
    }
    
    var Test_Control: String {
        if _Test_Control == nil {
            _Test_Control = "Error"
        }
        return _Test_Control
    }
    
    var Current_WC: String {
        if _Current_WC == nil {
            _Current_WC = "Error"
        }
        return _Current_WC
    }
    
    var Current_GVF: String {
        if _Current_GVF == nil {
            _Current_GVF = "Error"
        }
        return _Current_GVF
    }
    
    var Current_Oil_Rate: String {
        if _Current_Oil_Rate == nil {
            _Current_Oil_Rate = "Error"
        }
        return _Current_Oil_Rate
    }

    var Current_Water_Rate: String {
        if _Current_Water_Rate == nil {
            _Current_Water_Rate = "Error"
        }
        return _Current_Water_Rate
    }
    
    var Current_Gas_Rate: String {
        if _Current_Gas_Rate == nil {
            _Current_Gas_Rate = "Error"
        }
        return _Current_Gas_Rate
    }

    var Test_AVG_WC: String {
        if _Test_AVG_WC == nil {
            _Test_AVG_WC = "Error"
        }
        return _Test_AVG_WC
    }

    var Test_AVG_GVF: String {
        if _Test_AVG_GVF == nil {
            _Test_AVG_GVF = "Error"
        }
        return _Test_AVG_GVF
    }
    
    var Test_Cummulative_Oil: String {
        if _Test_Cummulative_Oil == nil {
            _Test_Cummulative_Oil = "Error"
        }
        return _Test_Cummulative_Oil
    }
    
    var Test_Cummulative_Water: String {
        if _Test_Cummulative_Water == nil {
            _Test_Cummulative_Water = "Error"
        }
        return _Test_Cummulative_Water
    }
    
    var Test_Cummulative_Gas: String {
        if _Test_Cummulative_Gas == nil {
            _Test_Cummulative_Gas = "Error"
        }
        return _Test_Cummulative_Gas
    }
    
    var DP1: String {
        if _DP1 == nil {
            _DP1 = "Error"
        }
        return _DP1
    }
    
    var DP2: String {
        if _DP2 == nil {
            _DP2 = "Error"
        }
        return _DP2
    }
    
    var DP3: String {
        if _DP3 == nil {
            _DP3 = "Error"
        }
        return _DP3
    }
    
    var Pressure_1: String {
        if _Pressure_1 == nil {
            _Pressure_1 = "Error"
        }
        return _Pressure_1
    }
    
    var Pressure_2: String {
        if _Pressure_2 == nil {
            _Pressure_2 = "Error"
        }
        return _Pressure_2
    }
    
    var Temperature: String {
        if _Temperature == nil {
            _Temperature = "Error"
        }
        return _Temperature
    }
    
    var USD_TT1: String {
        if _USD_TT1 == nil {
            _USD_TT1 = "Error"
        }
        return _USD_TT1
    }
    
    var USD_TT2: String {
        if _USD_TT2 == nil {
            _USD_TT2 = "Error"
        }
        return _USD_TT2
    }
    
    var USD_TT3: String {
        if _USD_TT3 == nil {
            _USD_TT3 = "Error"
        }
        return _USD_TT3
    }
    
    
    //function to pull meter data
    func downloadMeterDetails(completed: @escaping DownloadComplete) {
        //Download Current Meter Data
        
        let currentMeterURL = URL(string: CURRENT_METER_URL)!
        Alamofire.request(currentMeterURL).responseJSON{ response in
            let result = response.result

            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let MId = dict["Meter_ID"] as? String {
                    self._Meter_ID = MId
                    print(self.Meter_ID)
                }
               
                if let t_stamp = dict["Timestamp"] as? String {
                    self._Timestamp = t_stamp
                    print(self.Timestamp)
                }
        
                if let t_Id = dict["Test_ID"] as? String {
                    self._Test_ID = t_Id
                    print(self.Test_ID)
                }
                
                if let p_freq = dict["Poll_Freq"] as? String {
                    self._Poll_Freq = p_freq
                    print(self.Poll_Freq)
                }
                
                if let t_con = dict["Test_Control"] as? String {
                    self._Test_Control = t_con
                    print(self.Test_Control)
                }
                
                if let c_WC = dict["Current_WC"] as? String {
                    self._Current_WC = c_WC
                    print(self.Current_WC)
                }
                
                if let c_GVF = dict["Current_GVF"] as? String {
                    self._Current_GVF = c_GVF
                    print(self.Current_GVF)
                }
                
                if let c_Or = dict["Current_Oil_Rate"] as? String {
                    self._Current_Oil_Rate = c_Or
                    print(self.Current_Oil_Rate)
                }
                
                if let c_Wr = dict["Current_Water_Rate"] as? String {
                    self._Current_Water_Rate = c_Wr
                    print(self.Current_Water_Rate)
                }
                
                if let c_Gr = dict["Current_Gas_Rate"] as? String {
                    self._Current_Gas_Rate = c_Gr
                    print(self.Current_Water_Rate)
                }
                
                if let T_Avr_Wc = dict["Test_Avg_WC"] as? String {
                    self._Test_AVG_WC = T_Avr_Wc
                    print(self.Test_AVG_WC)
                }
                
                if let T_Avr_GVF = dict["Test_Avg_GVF"] as? String {
                    self._Test_AVG_GVF = T_Avr_GVF
                    print(self.Test_AVG_GVF)
                }
                
                if let cum_oil = dict["Test_Cummulateive_Oil"] as? String {
                    self._Test_Cummulative_Oil = cum_oil
                    print(self.Test_Cummulative_Oil)
                }
                
                if let cum_water = dict["Test_Cummulative_Water"] as? String {
                    self._Test_Cummulative_Water = cum_water
                    print(self.Test_Cummulative_Water)
                }
                
                if let cum_gas = dict["Test_Cummulative_Gas"] as? String {
                    self._Test_Cummulative_Gas = cum_gas
                    print(self.Test_Cummulative_Gas)
                }
            }
            print(response)
            completed()
        }
    }
}
