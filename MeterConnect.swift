//
//  MeterConnect.swift
//  Connect_1
//
//  Created by Jesse Budhlall on 2016-12-27.
//  Copyright © 2016 Jesse Budhlall. All rights reserved.
//
import Foundation
import UIKit
import Alamofire

class MeterConnect: UIViewController {
    @IBOutlet weak var meterName: UILabel!
    @IBAction func meterConnectBackButtonPressed(_ sender: Any) {

            dismiss(animated: true, completion: nil) // kills the current view controller
    }
    @IBOutlet weak var MeterID: UILabel!
   
    private var _currentMeter: String!//local variable for current meter
    var currentMeter_2: CurrentMeterData!
    
    // get - set for meter id handoff between views
    var currentMeter: String {
        get {
            return _currentMeter
        } set {
            _currentMeter = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
   
        currentMeter_2 = CurrentMeterData()
        currentMeter_2.downloadMeterDetails {
    self.updateMeterConnectUI() // calling update UI function
        }
        
        meterName.text = _currentMeter
        
    }
    //created a function to update the UI
    func updateMeterConnectUI() {
        MeterID.text = currentMeter_2.Meter_ID
    }

}


