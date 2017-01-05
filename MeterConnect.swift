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
    @IBOutlet weak var Timestamp: UILabel!
    @IBOutlet weak var TestNumber: UILabel!
    @IBOutlet weak var PollFrequency: UILabel!
    @IBOutlet weak var TestControlStatus: UILabel!
    @IBOutlet weak var WaterCut: UILabel!
    @IBOutlet weak var GVF: UILabel!
    @IBOutlet weak var CurrentOilRate: UILabel!
    @IBOutlet weak var CurrentWaterRate: UILabel!
    @IBOutlet weak var CurrentGasRate: UILabel!
    @IBOutlet weak var Test_AVG_WC: UILabel!
    @IBOutlet weak var Test_AVG_GVF: UILabel!
    @IBOutlet weak var Cum_Oil: UILabel!
    @IBOutlet weak var Cum_Water: UILabel!
    @IBOutlet weak var Cum_Gas: UILabel!
    @IBAction func NewTestButton(_ sender: Any) {
        //passing meter ID to a string then passing the string through segue, this is also just segue control
        let LabelMeterID: String = MeterID.text!
        performSegue(withIdentifier: "toTestController", sender: LabelMeterID)

    }
    @IBAction func stopTestButton(_ sender: Any) {
        Alamofire.request("http://connect.medeng.com/endtest.php/?testid=\(TestNumber.text!)", method: .get)// get request to stop test.
    }
   
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
        
        currentMeter_2 = CurrentMeterData()//init class
        //using the timer fucntion to loop call
        Timer.scheduledTimer(withTimeInterval: 1.0,repeats: true) {
            timer in
            
            self.currentMeter_2.downloadMeterDetails {
            self.updateMeterConnectUI() // calling update UI function
                
            }

        }
                    meterName.text = _currentMeter
    }
    //created a function to update the UI
    func updateMeterConnectUI() {
        
        MeterID.text = currentMeter_2.Meter_ID
        
        Timestamp.text = currentMeter_2.Timestamp
        
        TestNumber.text = currentMeter_2.Test_ID
        
        PollFrequency.text = currentMeter_2.Poll_Freq
        
        TestControlStatus.text = currentMeter_2.Test_Control
        
        WaterCut.text = currentMeter_2.Current_WC
        
        GVF.text = currentMeter_2.Current_GVF
        
        CurrentOilRate.text = currentMeter_2.Current_Oil_Rate
        
        CurrentWaterRate.text = currentMeter_2.Current_Water_Rate
        
        CurrentGasRate.text = currentMeter_2.Current_Gas_Rate
        
        Test_AVG_WC.text = currentMeter_2.Test_AVG_WC
        
        Test_AVG_GVF.text = currentMeter_2.Test_AVG_GVF
        
        Cum_Oil.text = currentMeter_2.Test_Cummulative_Oil
        
        Cum_Water.text = currentMeter_2.Test_Cummulative_Water
        
        Cum_Gas.text = currentMeter_2.Test_Cummulative_Gas
        
    }

}


